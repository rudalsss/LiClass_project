# 🪴 LiClass(라이클래스)
Like(좋아하다) + Class(클래스 취미활동)
<br><br>
: 오프라인 원데이 클래스를 비롯한 취미 프로그램들이 활성화될 수 있는 온라인 플랫폼을 기획해보았습니다.
<br><br>

## 📍 서비스 소개 및 기획의도

취미/자기 계발 분야에 대한 현대인들의 관심은 지속적으로 높아지고 있지만 자신만의 관심사를 충족하는 적절한 취미활동에 대한 정보수집, 동기부여는 여전히 부족한 상황입니다. 원데이클래스, 취미공유활동 기획자의 입장에서도 자신의 프로그램들을 홍보하고 활성화할 기회가 부족한 상황입니다. 이들을 연결하여 소통을 활성해줄 수 있는 **온라인 플랫폼** 이라는 해답을 찾게 되어 이를 만들어보기로 하였습니다.

- 원데이 클래스 정보를 주제별, 지역별, 강사별로 제공하여 충분한 정보를 제공하고 참여의지를 독려하도록 합니다.
- 온라인 예약, 온라인 결제 시스템을 구축하여 사용자가 편리하고 빠른 이용을 즐길 수 있도록 합니다.
- 시스템 관리자에게 플랫폼 사용자, 트래픽, 매출 정보를 다방면에서 통계분석하여 제공하여 효율적인 운영환경을 제공하고자 합니다.

<br/>

## 📍 프로젝트 소개
#### ✅ 프로젝트 기간
2023.02.21 ~ 2023.04.12
#### ✅ 프로젝트 팀원
<img width="600" src="https://github.com/user-attachments/assets/7b956686-1dc7-4760-9242-779d6d72a17b"/>

|name|position|
|------|---|
|김은아| 로그인, 마이페이지 기능 |
|전웅배| 사용자 클래스 결제 |
|정소영| 홍보게시판 |
|이경민| 관리자 클래스 등록, 사용자 클래스 예약 |
|임지민| 디자인, 후기게시판 |
|문민섭| 관리자 트래픽 통계 |

#### ✅ 개발일정 및 진행과정
<img width="600" src="https://github.com/user-attachments/assets/3a7377c0-e0b7-4714-910a-ffe212b67243"/>

#### ✅ 이외 참고자료
<li> 프로젝트 기획서 : <a href="https://github.com/rudalsss/LiClass_project/blob/main/LiClass%20%EC%B5%9C%EC%A2%85%20%EC%82%B0%EC%B6%9C%EB%AC%BC/1.%EC%A3%BC%EC%A0%9C%20%EB%B0%8F%20%EB%AA%A9%EC%A0%81%20-%20LiClass_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EA%B8%B0%ED%9A%8D%EC%84%9C.pdf"> LiClass 프로젝트의 주제와 목적</a></li>
<li> 요구분석 명세서 : <a href="https://github.com/rudalsss/LiClass_project/blob/main/LiClass%20%EC%B5%9C%EC%A2%85%20%EC%82%B0%EC%B6%9C%EB%AC%BC/2.%EC%9A%94%EA%B5%AC%EB%B6%84%EC%84%9D%20-%20LiClass_%EC%9A%94%EA%B5%AC%EB%B6%84%EC%84%9D%EB%AA%85%EC%84%B8%EC%84%9C.pdf"> LiClass 프로젝트 요구분석 명세서 </a></li>
<li> 요구분석 정의서 : <a href="LiClass 최종 산출물/2.요구분석 - LiClass_요구분석정의서.pdf"> LiClass 프로젝트 요구분석 정의 </a></li>
<li> 유스케이스 기술서 : <a href="LiClass 최종 산출물/5.유스케이스 및 기술서 - LiClass 유스케이스.pdf"> [ UseCase ] LiClass 프로젝트 유스케이스 및 기술서 </a></li>
<li> 유저 스토리보드 : <a href="LiClass 최종 산출물/8.스토리보드 - LiClass_스토리보드.pdf"> [ StoryBoard ] LiClass 프로젝트 유저 스토리보드 </a></li>
<li> 테스트 시나리오 보고서 : <a href="LiClass 최종 산출물/11.테스트 시나리오 - LiClas_테스트 시나리오.pdf"> [ Scenario test ] LiClass 프로젝트 시나리오 테스트 검증 </a></li>
<br><br><br>

## 📍 개발환경 및 기술
<img width="600" alt="image" src="https://github.com/user-attachments/assets/991cbdca-12c7-4bd0-9224-d456d3ee8f72"><br>

- OS : Windows 10
- DBMS : Oracle Database Express Edition (XE) Release 18.4.0.0.0 (18c)
- 개발도구 : SpringToolSuite4-4.17.2.RELEASE/ JDK 17 /GitHub
- 웹서버 : Apache Tomcat 9.0.71
- 데이터베이스 툴 및 모델링 : Oracle SQL Developer
- UML : diagrams.net
- 개발 언어 : JAVA / JSP / JSTL / JavaScript / JQUERY / HTML5 / CSS3 / SQL
- View Tool : Chrome, 익스플로러
- API : 포트원 결제/환불API,카카오 로그인/맵/카카오톡공유API,네이버 로그인/블로그공유API,SNS 공유 API(트위터,페이스북)

<br><br>

## 📍 주요 기능

#### ☑️ 마이페이지 기능 ( 김은아 )

일반사용자는 라이클래스 플랫폼에 카카오계정, 네이버계정 등을 통해 가입할 수 있다. <br>
회원가입한 사용자들에게 자신의 관심사와 지난 수강활동들을 지속적으로 관리할 수 있도록 하는 기능들을 제공한다.

<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/2ab1f396-86c0-4f4c-98e4-e4fc59c75f95">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/caaf3da5-f824-4052-8d14-ed8b8c5e7409">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/74a702e3-b5b9-40f3-9e6c-3d15d7b1fa7e">

#### ☑️ 클래스 예약 및 등록 ( 이경민 )

일반사용자는 이용가능한 클래스를 조회할 수 있고 날짜, 시간에 따른 클래스 하위의 회차단위로 인원수, 가격에 따라 예약을 진행할 수 있다. <br>
관리자는 이용가능한 클래스와 하위단위인 회차를 등록할 수 있다. 자신의 클래스를 홍보할 수 있는 사진, 동영상 등의 멀티미디어 컨텐츠를 게시할 수 있다.

<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/97f3bffb-2ab2-4d79-b4b5-7f19c7cdc031">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/5e2d3ca5-3552-4641-8cfd-c76baa49b64e">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/7bd4a179-109a-4199-bf1d-67c30a9a8245">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/368dea9e-204e-4348-b551-7ad3794ab122">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/2744c25f-cb53-4b81-afd7-02c57828448e">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/1f53a4ef-a0c1-4ce7-bbe2-33083dcb551c">

#### ☑️ 클래스 예약내역 결제( 전웅배 )

일반사용자는 예약한 내역의 금액을 결제할 수 있다. 이때 적립포인트나 쿠폰등을 활용할 수 있으며 환불규정에 따라 결제취소도 가능하다.

<img height="200" width="400" width="400" alt="image" src="https://github.com/user-attachments/assets/007ad928-63a6-41b3-93b9-983155b8fc36">
<img height="200" width="400" width="400" alt="image" src="https://github.com/user-attachments/assets/581e8886-256b-4f58-8a08-35aa4916df37">
<img height="200" width="400" width="400" alt="image" src="https://github.com/user-attachments/assets/f748df65-35fc-4d6a-976e-c061179318d7">


#### ☑️ 클래스 이용후기작성, 홍보글 작성, Q&A 작성 ( 임지민, 정소영 )

일반사용자는 클래스 수강을 예약하는 메인기능 이외에도 이용후기를 작성하고 Q&A로 문의사항을 남길 수 있다.<br>
관리자는 자신의 활동, 클래스 공간, 클래스 작품등을 홍보할 수 있다.

<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/b1ff0092-8c31-4127-8ba4-de3742ef1dbe">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/e2b7d73a-19b4-449e-8280-02532b07313b">


#### ☑️ 회원관리 및 통계, 매출통계, 예약통계 ( 문민섭 )

관리자는 플랫폼 회원들의 활동, 상태등을 관리할 수 있다. 접속 트래픽과 유입경로등을 확인할 수 있다. <br>
클래스를 운영자는 예약현황을 확인하고 결제로 이어진 매출현황에 대한 통계정보를 열람할 수 있다.

<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/49a292f8-2ec4-40e6-96e7-a8b19a601399">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/496a10d6-523f-4fed-9d96-e2ed7f47fe78">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/2345e22d-6eac-42b6-a07b-4e189b1f27aa">
<img height="200" width="400" alt="image" src="https://github.com/user-attachments/assets/dab9a47c-2950-43e6-9969-05f9668ed402">


#### ☑️ 사용자 사이트맵 & 관리자 사이트맵
<img height="300" width="600" src="https://github.com/user-attachments/assets/afc6cf1e-8eaf-46a0-97ac-544cf6ce427a">
<img height="300" width="600" src="https://github.com/user-attachments/assets/42afb25d-200e-4311-bb52-0efc6e4b6914">
<br><br><br>

## 📍시연 영상

<li><a href="LiClass 최종 산출물/12. 최종발표/회원결제서비스관련시연영상.mp4"> 예약및 결제시연 </a></li>
<li><a href="LiClass 최종 산출물/12. 최종발표/로그인 시연.mp4"> 회원가입 & 로그인 시연 </a></li>

