# FROM node:12.22.3

# 이미지 내에서 명령어를 실행할(현 위치로 잡을) 디렉토리 설정
# WORKDIR /home/node/app

# 프로젝트의 모든 파일을 WORKDIR(/app)로 복사한다.
# COPY package*.json ./

# 이미지를 생성하는 과정에서 실행할 명령어 ( 컨테이너 실행전 )
# RUN npm install

# 컨테이너 실행시 실행할 명령어, ( 위 WORKDIR 위치에서 실행할 명령어 ), ( 컨테이너가 만들어져 가동될 때 기본적으로 바로 실행되는 명령 )
# CMD ["npm", "run", "start:dev"]

# 해당 포트로 실행
# EXPOSE 3000
# 이미지 생성 명령어 ( 현 파일과 같은 디렉토리에서 )
# docker build -t (이미지명) .

# 컨테이너 생성 & 실행 명령어
# docker run --name (컨테이너명) -v $(pwd):/home/node/app -p 8080:8080 (이미지명)

# Step 1
## base image for Step 1: Node 10
FROM node:12 AS builder
WORKDIR /app
## 프로젝트의 모든 파일을 WORKDIR(/app)로 복사한다
COPY . .
## Nest.js project를 build 한다
RUN npm install
RUN npm run build


# Step 2
## base image for Step 2: Node 10-alpine(light weight)
FROM node:12-alpine
WORKDIR /app
## Step 1의 builder에서 build된 프로젝트를 가져온다
COPY --from=builder /app ./
## application 실행
CMD ["npm", "run", "start:prod"]