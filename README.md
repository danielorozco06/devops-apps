# Base application
> An Angular + Node/Express + MongoDB + Bootstrap Simple CRUD.
This code will add, upadate and delete data to mongodb using express rest APIS and frontend through Angular.

### Architecture

![architecture](/images/architecture.png "Architecture")

### Prerequisites

```
- Git
- Docker CLI
- Docker compose V2
- Docker compose CLI
- AWS account
```
**Note**: watch the next repository https://github.com/danielorozco06/installations

## Local
### Setup
1. Clone or download this repository
2. Enable base URI with localhost in file `frontend/src/app/user.service.ts`
   ![baseURI](/images/baseURI.png "baseURI")
### Run
1. Start docker sevice: `sudo service docker start`
2. Select local context: `docker context use default`
3. Build images: `docker compose build`
4. Execute containers: `docker compose up`

### To add user
http://localhost:4200/user/create

### To edit and delete user
http://localhost:4200/user

### Screens

![add](/images/add.png "Add")
![list](/images/list.png "List")

## AWS ECS directly
### Setup
1. Clone or download this repository
2. Enable base URI with loadBalancerDNS in file `frontend/src/app/user.service.ts`
   ![baseURI-LB](/images/baseURI-LB.png "baseURI-LB")

### Run
1. Start docker sevice: `sudo service docker start`
2. Create context to deploy on AWS ECS: `docker context create ecs myecscontext`
3. Select local context: `docker context use myecscontext`
4. Build images: `docker compose build`
5. Execute containers: `docker compose up`
    ![deployECS](/images/deployECS.png "deployECS")

### To add user
http://loadBalancerDNS:4200/user/create

### To edit and delete user
http://loadBalancerDNS:4200/user

## AWS ECS using pipelines with GitHub Actions
### Setup
1. Clone or download this repository
2. Enable base URI with loadBalancerDNS in file `frontend/src/app/user.service.ts`
   ![baseURI-LB](/images/baseURI-LB.png "baseURI-LB")

### AWS ECS DEV account
1. Create a feature branch with name structure `feature/branchName`
2. Create and commit changes needed 
3. Publish the feature branch: `git push -u origin feature/branchName`
4. A GitHub action workflow starts to create image, publish in Docker Hub (image tag DEV) and deploy on AWS account (DEV). Workflow in file `.github/workflows/pipeline_CICD_Dev.yml`

### AWS ECS DEV account
1. Create a Pull Request on GitHub to merge `feature/branchName` to `trunk`
2. A GitHub action workflow starts to create image, publish in Docker Hub (image tag PDN) and deploy on AWS account (PDN). Workflow in file `.github/workflows/pipeline_CICD_Pdn.yml`

### To add user
http://loadBalancerDNS:4200/user/create

### To edit and delete user
http://loadBalancerDNS:4200/user