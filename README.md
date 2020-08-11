# GreetingApp with CI/CD

Includes a simple dotnetcore 3.1 application with all configurations required for CI/CD pipeline. [CircleCI](.circleci/config.yml) used to automate the pipeline. There are two different jobs: 
- Building and publishing **docker image**
- Deploying application with **HELM** to k8s cluster 


- CI Step
  - Related files can be found in ci folder
  - Builds the dotnet application and runs the tests in the docker container 
  - **Multi-stage build** is used to create secure and small runtime container
  - Container runs with **non-root user** due to provide least privilege principle
  - Pushes the image to the dockerhub repository with the latest tag 
  - dockerhub credentials provided with Environment Variables via CircleCI 

- CD Step 
  - Related file can be found in cd folder
  - **Helm Chart** created for the app 
  - Deployment managed by HELM 
  - KUBECONFIG is provided as encoded base64 format with Environment Variables via CircleCI but there is a formatting error.