FROM node:12.22.3

# 이미지를 생성하는 과정에서 실행할 명령어 ( 컨테이너 실행전 )
RUN npm install

# 이미지 내에서 명령어를 실행할(현 위치로 잡을) 디렉토리 설정
WORKDIR /home/node/app

# 컨테이너 실행시 실행할 명령어, ( 위 WORKDIR 위치에서 실행할 명령어 ), ( 컨테이너가 만들어져 가동될 때 기본적으로 바로 실행되는 명령 )
CMD ["http-server", "-p", "8080", "./public"]

# 이미지 생성 명령어 ( 현 파일과 같은 디렉토리에서 )
# docker build -t (이미지명) .

# 컨테이너 생성 & 실행 명령어
# docker run --name (컨테이너명) -v $(pwd):/home/node/app -p 8080:8080 (이미지명)