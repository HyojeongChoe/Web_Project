20240110 

첫 회의
회원가입/로그인 필수로 있어야함

1. 병원 간편예약  - 예약 / 예약조회, 취소 / 의료진검색 / 진료과검색

2.쇼핑몰  - 회원가입/ 로그인/ 게시판 /장바구니/ 마이페이지 / 결제기능


3. 반려동물 돌봄(채택)  - 
메인홈/ 

서비스/ 제공할 서비스 목록 만들고 , 예약버튼 누르면 예약페이지로 이동 (날짜선택, 시간선택, 예약) 
여러 날 예약기능은 천천히 생각해보기.. -> DB...? 

어바웃/ 사진..넣기;.. .. 소개 (전문분야)

콘택트/ 이름, 이메일, 주소, 메시지 보내면 관리자한테 연락해줌
관리자페이지 or 게시판 생성 지도 api 연동. 지도 띄워줌

로그인/ 로그인이랑 회원가입 페이지 구현 ->DB연동



차트시각화 : 매출액, 예약건수, 계절별 

참고템플릿 - https://ko.wix.com/website/templates/html/business/pets-animals

-----------------------------------------------------------
20240111 회의

필요한 DB테이블

- USER 테이블(
 NAME VARCHAR(50)	
 ID VARCHAR(50)   	-> primary key
 PW VARCHAR(50)
 EMAIL VARCHAR(50)
 ADDRESS VARCHAR(50)
 BIRTH VARCHAR(50)
 PET(50)
)

- ADMIN 테이블(
 ID VARCHAR(50)
 PW VARCHAR(50)

)
