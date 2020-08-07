FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

COPY /ci /ci
COPY /GreetingApp.sln .
COPY /test /test
COPY /src /src

RUN ["sh", "./ci/build.sh", "Release"]
RUN ["sh", "./ci/test.sh", "Release"]

WORKDIR /src/Greeting.Api

RUN ["dotnet", "publish", "--configuration", "Release", "--no-build", "--no-restore", "-v", "m", "-o", "../../artifacts"]

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 as runtime-env

ARG container
ARG imagetag

ENV CONTAINER_NAME=${container:-"local"}
ENV IMAGE_TAG=${imagetag:-"local"}

WORKDIR /app

COPY --from=build-env /artifacts .

ADD /ci/docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

RUN groupadd -r greeting && useradd -r -s /bin/false -g greeting greeting
RUN chown -R greeting:greeting /app
USER greeting

ENV ASPNETCORE_URLS=http://*:11130
EXPOSE 11130

ENTRYPOINT ["bash", "docker-entrypoint.sh"]
