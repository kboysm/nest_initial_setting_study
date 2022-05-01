## docker

```
개발 환경 셋팅을 도커 허브에 저장하고 필요할 때마다 독립된 공간으로 얼마든지 여러개를 만들어서 사용할 수 있다.
서버를 셋팅하고 트래픽이 증가하여 같은 서버를 여러대를 설치할 때 똑같은 환경 설정을 반복해야한다. 하지만 도커를 사용하여 서버 셋팅을을 저장하고 간단한 명령으로 얼마든지 서버를 늘릴 수 있다.
또한 도커는 각각을 다른 실행 환경에서 실행할 수 있다.
```

- 먼저 각 요소들이 설치된 모습을 이미지란 형태로 저장한다.
- 이미지로 저장된 항목들이 함께 연결돼서 동작하도록 설정된 상태를 명령어 텍스트나 문서 형태로 저장할 수 있다.
- 도커는 이것들을 컴퓨터에 바로 설치하지 않고 각각을 '컨테이너'라 불리는 독립된 가상 공간을 만들어내서 복원한다.
- 도커는 실행 환경만 독립적으로 돌리는 거라서 컴퓨터에 직접 요소들을 설치한 경우와 별 차이 없는 성능을 낼 수 있다.
- 가상 컴퓨팅보다 훨씬 가볍고 빠르게 설치하고 실행할 수 있다.
- 서버에 무엇인가 잘못되서 고쳐야하는 경우 또는 일부를 업그레이드 해야하는 경우 요소들을 정지하고 지우거나 새로 다운받을 필요없이 컨테이너를 통째로 교채한 후 실행하기만 하면 된다.
- docker의 이미지란 리눅스컴퓨터의 특정 상태를 캡쳐해서 박제해 놓은것을 말한다.
- docker의 경우 필요한 이미지가 내 로컬 컴퓨터에 존재하지 않으면 도커허브에서 해당 이미지를 다운받는다.
- 도커 이미지-> 컨테이너를 찍어내는 틀, 무한 생산이 가능한 컨테이너 조립키트로 생각하자.

```
docker run -it node
-it: 컨테이너를 연 다음 그 환경 안에서 cli를 사용한다라는 의미, ( 컨테이너를 만든 다음 그 안에 있는 근무자랑 창문을 통해서 대화하겠다. )
```

```
docker images
-> 로컬 컴퓨터에 저장된 이미지 목록을 보여준다.
```

```
docker ps
-> 로컬에 존재하는 컨테이너 목록(실행중인)을 볼 수 있다.
-a : 작업중이 아닌 중지된 컨테이너 목록도 보인다.
```

```
docker exec -it (컨테이너명) bash
-> 도커 컨테이너의 os에 bash쉘 상태로 접속할 수 있다.
-> 여기서 알 수 있는건 어떤 os에서 도커를 실행해도 리눅스 가상환경의 형태로 실행된다.
```

### 보다 섬세한 컨테이너 활용을 위해서 Dockerfile이 사용된다.

-> Dockerfile은 나만의 이미지를 만들기 위한 설계도이다.

```
docker build -t (이미지명) .
-> 이미지명 뒤에 도커파일의 상대결로를 명시해줘야 하나 파일명이 Dockerfile일 경우 따로 명시할 필요가 없다.
```

```
docker run --name (컨테이너명) -v $(pwd):/home/node/app -p 8080:8080 (이미지명)
-> 컨테이너명은 생성될 컨테이너의 이름이다.
-> -v은 volumn의 약자로 도커에서 볼륨이란, 컨테이너와 특정 필드를 공유하는 것을 말한다.
->$(pwd):/home/node/app에 생성한다는 의미
-> -p는 포트를 의미
-> 8080:8080은 컨테이너의 포트와 컴퓨터의 포트를 연결한다는 의미, ( 컨테이너포트:컴퓨터의포트 )
-> 마지막으로는 컨테이너로 실행할 이미지명을 넣어주는것
```
