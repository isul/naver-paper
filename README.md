클리앙 알뜰구매 페이지에 있는 네이버 페이 링크를 자동 클릭하는 이미지로, 아래 링크에 있는 소스를 조금 수정해서 만들었습니다.  
https://github.com/stateofai/naver-paper  

#**사용법**
    
**1. 네이버 로그인 전용 아이디 생성(아래 링크 참고)**
  - https://help.naver.com/service/5640/contents/10219?lang=ko
  - https://help.naver.com/service/5640/contents/8584?lang=ko

**2. docker-compose.yml 생성**  
  docker-compose.yml 파일을 아래와 같이 만들고, 네이버 로그인 전용 아이디 생성에서 만든 NAVER_ID와 NAVER_PASSWORD의 값을 수정
```dockerfile
version: '3'
services:
  naver-pay-picker:
    container_name: naver-pay-picker
    image: isul/naver-pay-picker:v1.0
    volumes:
      - ./data:/data
    environment:
      - NAVER_ID=네이버아이디
      - NAVER_PASSWORD=네이버암호
```
컨테이너는 실행 후 자동 종료됩니다. 만약 디버깅, 소스코드를 수정하여 테스트하는 등의 목적으로 링크 클릭 완료 후에도 컨테이너를 그대로 유지하고자할 경우에는 환경변수 DEBUG=true을 추가하면 됩니다.

**3. data 폴더 생성**  
  docker-compose.yml이 존재하는 경로에 data 폴더를 생성합니다.

**4. 실행**  
  아래 명령을 내리면 링크가 자동 클릭됩니다. 아래 명령을 스케줄러에 등록하여 주기적으로 호출하면 됩니다.
```console
docker-compose up
```
