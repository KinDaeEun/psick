create user project identified by k1234;
grant dba to project;

select * from PRODUCT;s

drop table eventlist
drop table event;
drop table buylist;
drop table cart;
drop table buy;
drop table reply;
drop table review;
drop table love;
drop table account;
drop table member;
drop table product;

select * from product order by pno;
select * from member;
--회원
create table member (
id varchar2(20) primary key,
password varchar2(20),
name varchar2(20),
tel varchar2(20),
gender varchar2(10),
addr varchar2(20),
addr_detail varchar2(50),
reg_date date,
profile varchar2(60),
m_del char(1) default 'n');


--상품
create table product (
pno number(20) primary key,
pname varchar2(70),
p_price number(10),
p_country varchar2(20),
p_detail_img varchar2(60),
p_detail_content varchar2(1000),
discount number(2),
p_kind varchar2(50),
p_del char(1) default 'n',
p_date date,
p_count number(10)
);
--product의 시퀀스
create sequence product_seq start with 1 increment by 1 maxvalue 999999; 
drop sequence account_seq;
--찜상품
create table love (
pno number(20),
id varchar2(20),
l_del char(1) default 'n',
primary key (pno,id),
foreign key(id) references member(id),
foreign key(pno) references product(pno));


--장바구니
create table cart (
pno number(20),
id varchar2(20),
c_del char(1) default 'n',
primary key (pno,id),
foreign key(id) references member(id),
foreign key(pno) references product(pno));


--리뷰
create table review(
rno number(20) primary key,
r_content varchar2(200),
r_date date,
r_del char(1) default 'n',
id varchar2(20),
pno number(20),
r_title varchar2(50),
star number(1),
foreign key(id) references member(id),
foreign key(pno) references product(pno));
--review의 시퀀스 
create sequence review_seq start with 1 increment by 1 maxvalue 999999; 




--고객센터
create table account (
 ano number(20) primary key,
 id varchar2(20),
 a_name varchar2(20),
 a_title varchar2(100)  not null,
 a_date date,
 a_content varchar2(4000),
 a_cnt number(5) default 0,
 a_del char(1)  default 'n',
 foreign key(id) references member(id)
);
--account의 시퀀스
create sequence account_seq start with 1 increment by 1 maxvalue 999999; 



create table reply(
 re_no number(20) primary key,
 id varchar2(20),
 ano number(20),
 ref_content varchar2(500),
 ref_date date,
 ref number(20),
 ref_level number(20),
 ref_step number(20),
 ref_cnt number(20) default 0,			
 ref_del char(1) default 'n',
 foreign key(id) references member(id),
 foreign key(ano) references account(ano)
);
create sequence reply_seq start with 1 increment by 1 maxvalue 999999; 

--구매
create table buy(
bno number(20) primary key,
b_date date,
b_addr varchar2(20),
b_tel varchar2(20),
b_reveiver varchar2(20),
id varchar2(20),
foreign key(id) references member(id));
--buy의 시퀀스
create sequence buy_seq start with 1 increment by 1 maxvalue 999999; 


--구매내역
create table buylist (
pno number(20),
bno number(20),
b_count number(20),
primary key (pno,bno),
foreign key(pno) references product(pno),
foreign key(bno) references buy(bno));
select * from buylist;

select * from buylist


-- 기획전
create table event (
eno number(20) primary key,
ename varchar2(50),
e_img varchar2(60),
e_del char(1) default 'n');
-- event의 시퀀스
create sequence event_seq start with 1 increment by 1 maxvalue 999999;
drop sequence event_seq;

-- 기획 상품
create table eventlist (
eno number(20),
pno number(20),
primary key(eno,pno),
foreign key(eno) references event(eno),
foreign key(pno) references product(pno)
);


select * from buylist where bno = 44;
select * from buy where id = '1';
select * from product where pno in (select pno from buylist where bno in (select bno from buy where id='1'));
select bno from buy where id='1';
	




insert into product values(product_seq.nextval,'유기농 고향찰현미(2kg)',15000,'한국산','026969_20230116144732.jpg',
'거친 현미의 식감이 부담스럽다면 부드럽고 찰기 좋은 찰현미는 어떠세요? 현미 찹쌀 로도 불리는 찰현미는 찹쌀의 겉껍질을 살려 도정해 쌀 겨층의 영양이
 그대로 담겨 있어요. 특히 초록마을 고향찰현미는 유기농법 재배해 더욱 안심하고 먹을 수 있습니다. 누룽지처럼 구수하고 찰진 식감의 고향찰로 엄선했으니 백미와 섞어 누룽지처럼 구수하고 촉촉한 찰 현미밥으로 밥상의 품격을 높여보세요.',
 0,'쌀·잡곡','n',sysdate,100);

insert into product values(product_seq.nextval,'무농약이상_대파(500g)',3800,'한국산','026623_20220526162723.jpg',
'대파는 버릴 곳 하나 없는 만능 채소입니다. 쓰임이 많아 상시 구비해 두어야 할 기본 채소죠. 초록마을은 친환경으로 재배한 무농약 등급 이상의 대파만을
 선별했어요. 색이 선명하고 줄기가 곧아 신선함이 살아 있죠. 대파의 알싸한 향으로 음식의 느끼함을 덜고 잡냄새까지 깔끔하게 잡아보세요. 부드럽게 익히면 단맛이 올라와 개운하고 깊은 감칠맛을 선사할 거예요.',
 15,'채소','n',sysdate,100);
 

insert into product values(product_seq.nextval,'무농약이상_양파 (2.5kg)',8500,'한국산','007762_20210506105014.jpg',
'알싸하고 달큰한 향미를 가진 양파는 떨어지기 전에 미리 미리 구비해두면 좋아요. 어느 요리에든 잘 어우러져 영양과 풍미를 한껏 끌어올려 주거든요. 농약 쓰지 않고 정성껏 재배한 초록마을 양파는 알이 단단하고 아삭한 식감이 신선하게 살아 있어요. 기름진 음식과 궁합이 좋은 양파를 장아찌부터 탕, 볶음 등에 두루 넣어 똑소리나게 활용해보세요.',
 0,'채소','n',sysdate,100);
 
insert into product values(product_seq.nextval,'유기농 철원 오대미(2kg)',11000,'한국산','026455_20220407140211.jpg',
'공기 좋고 물 맑은 강원도 철원에서 재배한 유기농 오대미입니다. 철원은 일교차가 크고 기후가 서늘해 쌀알이 더 굵게 영글어요. 덕분에 철원에서 자란 오대미는 쌀알이 큼직해 식감이 뛰어나고 밥맛이 좋습니다. 겨울이 유난히 춥고 길어 병충해 피해가 적은 만큼 친환경 쌀을 수확하기에도 유리하죠. 맛있는 철원오대미를 귀한 유기농으로 즐겨보세요.',
 20,'쌀·잡곡','n',sysdate,100);
 
insert into product values(product_seq.nextval,'유기농 가바흑미(800g)',10500,'한국산','025605_20220310101004.jpg',
'서울대학교에서 오랜 시간 연구 끝에 개발한 유기농 쌀로, 뇌세포를 구성하는 가바(GABA) 성분을 다량 함유했어요. 전라남도 해남의 대규모 단지에서 유기농으로 자라 안심하고 드실 수 있습니다. 톡톡 씹히는 까만 쌀알은 구수한 풍미와 함께 촉촉한 윤기까지 일품이죠. 우리 가족을 위한 머리가 똑똑해지는 밥상을 차려 보세요.',
 0,'쌀·잡곡','n',sysdate,100);
 
insert into product values(product_seq.nextval,'초록개런티 머스크메론(1개)',14900,'한국산','018280_20210726104547.jpg',
'여름이 기다려지는 이유 중 하나는 향긋한 제철 메론을 만날 수 있기 때문이에요. 특히 동그란 형태에 그물 무늬가 촘촘하게 얽힌 머스크메론은 부드러운 육질에 달달한 과즙이 흘러 넘치죠. 다년간 메론만 전문적으로 재배한 국내의 우수 산지에서 자란 메론으로 큼직한 원물로 엄선해 드립니다. 그대로 썰어 드시는 것은 물론 화채나 빙수, 주스 등으로 다채롭게 즐겨보세요.',
 0,'과일·견과·건과','n',sysdate,100);
 
insert into product values(product_seq.nextval,'초록개런티 황도(1.5kg)',17000,'일본산','017991_20210726095438.jpg',
'따사로운 여름 햇살을 머금고 자라 과육이 샛노란 빛을 띠는 황도입니다. 말랑말랑 부드러운 식감을 지닌 황도는 복숭아 중에서 당도가 가장 높은 품종이에요. 농부의 정성으로 제초제 없이 재배한 초록 개런티 복숭아를 하나하나 정직하게 골라 드립니다. 달달하게 번지는 향과 넘치는 과즙을 한입 가득 누리며, 제철의 행복을 만끽하세요.',
 20,'과일·견과·건과','n',sysdate,100);
 
insert into product values(product_seq.nextval,'정직선별 거봉(1.3kg)',29000,'중국산','016834_20230818121349.jpg',
'큰 봉우리라는 뜻을 지닌 거봉은 큼직한 포도알에 달콤함이 가득 차 있어요. 초록 개런티를 획득한 정직선별거봉은 온·습도가 일정하게 유지되는 하우스에서 무제초제 농법으로 재배해 균일한 품질을 자랑합니다. 탱글탱글한 식감 뒤로 흥건하게 번지는 풍성한 과즙이 일품이죠. 식후 디저트로 제격이고요, 샐러드나 주스 등으로 만들어 드셔도 좋아요. 온 가족이 부족함 없이 즐길 수 있도록 1.3kg의 용량으로 넉넉하게 담아드려요.',
 10,'과일·견과·건과','n',sysdate,100);
 
insert into product values(product_seq.nextval,'오븐에 구운 유기농 아몬드크리스피(100g)',69000,'일본산','026033_20220407112141.jpg',
'고급스러운 견과 디저트를 만나보세요. 유기농 아몬드와 캐슈넛, 코코넛칩이 조화를 이뤘습니다. 바삭한 슬라이스 아몬드와 아작아작 씹히는 코코넛칩의 식감이 참으로 즐거워요. 무염 버터를 더해 고소한 견과의 향미가 더욱 풍성해졌죠. 튀기지 않고 오븐에 구워 남녀노소 모두 담백한 맛으로 즐기기 좋답니다.',
 0,'과일·견과·건과','n',sysdate,100);

insert into product values(product_seq.nextval,'정직선별 배(3kg)',18000,'중국산','017558_20210429172616.jpg',
'하얀 속살 사이로 달큼한 수분기를 머금은 배. 사각사각 시원한 맛 덕분에 남녀노소 모두가 좋아하는 과일 중 하나죠. 정직선별배는 초록마을 자체 인증인 초록 개런티를 획득한 상품으로 맛과 품질을 보장해요. 무제초제 농법으로 관리되는 비옥한 토양에서 탐스럽게 여물어 과육이 단단한 것은 물론 균일한 당도를 자랑합니다. 간식이나 식후 디저트로 개운하게 즐기거나, 목마름을 해소하는 배 주스로 청량하게 갈아 마셔 보세요.',
 0,'과일·견과·건과','n',sysdate,100);
 
insert into product values(product_seq.nextval,'유기농 깐마늘 (150g)',4200,'한국산','023743_20220720153844.jpg',
'각종 요리에 깊은 풍미와 감칠맛을 전하는 마늘입니다. 편리하게 활용할 수 있도록 마늘의 껍질을 벗기고 깔끔하게 손질해 담았죠. 농약 없이 재배한 국내산 마늘이라 더욱 믿음이 갑니다. 아삭한 식감과 단 내음이 입 안 가득 번지는 유기농 깐마늘을 고기 쌈에 곁들이거나 구이로, 조림으로, 장아찌 등으로 다양하게 즐겨보세요. 아담한 양으로 소포장해 드리니 혼자 사는 분들도 부담 없을 거예요.',
 0,'채소','n',sysdate,100);
 
insert into product values(product_seq.nextval,'무농약이상_당근 (1.6kg)',10200,'한국산','018296_20220407135822.jpg',
'당근에는 눈 건강과 면역력 강화에 도움이 되는 베타카로틴 성분이 풍부해요. 믿고 먹는 녹황색 채소 중 하나죠. 특히 달큰하고 상쾌한 내음이 좋아 각종 요리와 주스의 베이스로 활용하기 좋아요. 농약 없이 키운 초록마을 당근을 안심하고 담아가세요. 기름에 볶아서 드시면 영양을 보다 효율적으로 섭취할 수 있어요. 사과, 비트, 당근을 함께 간 ABC 주스는 건강한 하루를 시작하는 아침 보약이랍니다. 1.6kg 기획 용량으로 넉넉하게 담아드리니 다양하게 활용해보세요.',
 0,'채소','n',sysdate,100);

 
insert into product values(product_seq.nextval,'무농약이상_홍고추 (100g)',3700,'한국산','017924_20210616172909.jpg',
'풋고추가 햇볕을 받고 자라면 붉은색을 띤 홍고추로 변해요. 식욕을 돋우는 붉은 색감과 매콤함을 지녀 요리에 포인트를 더하죠. 초록마을 홍고추는 농약 없이 자란 무농약이상 홍고추로 과피가 두껍고 매끈합니다. 그때그때 신선하게 즐길 양으로 소포장했으니 탕이나 찌개, 볶음 반찬, 피클, 고명 등으로 다채롭게 활용해보세요.',
 0,'채소','n',sysdate,100);
 
insert into product values(product_seq.nextval,'유기농 밀키퀸(2kg)',19500,'중국산','024915_20210414112618.jpg',
'맛을 찾는 미식가는 쌀도 고심하여 선택합니다. 밥맛이 남다른 밀키퀸을 아시나요? 밀키퀸은 맛 좋기로 유명한 고시히카리 품종을 개량한 프리미엄 쌀입니다. 쫀득쫀득 찰기가 강하고, 구수하게 번지는 단 내음이 특징이죠. 초록마을의 밀키퀸은 유기농 재배를 통해 보다 건강하게 드실 수 있어요. 밥이 식고 난 뒤에도 촉촉하고 부드러운 식감을 유지하니, 솥밥이나 김밥처럼 밥이 메인이 되는 요리에서 더욱 빛을 발할 거예요.',
 10,'쌀·잡곡','n',sysdate,100);

 
insert into member values('12345','1357','보검','010-2312-2532','남자','서울시','서울시 마포구',sysdate,'a.jpg','n');
insert into member values('24301','2468','로제','010-2312-4124','남자','서울시','서울시 용산구',sysdate,'b.jpg','n');
insert into member values('314134','4252','하니','010-2312-3415','여자','서울시','서울시 영등포구',sysdate,'c.jpg','n');
insert into member values('9823','1241','성재','010-4135-3415','여자','서울시','서울시 영등포구',sysdate,'d.jpg','n'); 
insert into member values('admin','1','대은','010-4135-3415','남자','서울시','서울시 영등포구',sysdate,'d.jpg','n'); 
insert into member values('123','13sdf57','보검','010-2312-2532','남자','서울시','서울시 마포구',sysdate,'a.jpg','n');
insert into member values('24323401','2fd468','로제','010-2312-4124','남자','서울시','서울시 용산구',sysdate,'b.jpg','n');
insert into member values('314214134','42sdf52','하니','010-2312-3415','여자','서울시','서울시 영등포구',sysdate,'c.jpg','n');
insert into member values('9823213','12fds41','성재','010-4135-3415','여자','서울시','서울시 영등포구',sysdate,'d.jpg','n'); 
insert into member values('142','1','fsd','010-4135-3415','남자','서울시','서울시 영등포구',sysdate,'d.jpg','n'); 
select * from member;
delete from member;

insert into review values(review_seq.nextval,'너무 맛있어요',sysdate,'n','12345',1,'good',4);
insert into review values(review_seq.nextval,'존나 맛있다',sysdate,'n','24301',1,'최고',5);
insert into review values(review_seq.nextval,'맛있어요',sysdate,'n','12345',2,'good',4);
insert into review values(review_seq.nextval,'맛있어서 10개 더 사야겠네요',sysdate,'n','9823',3,'너무 좋다',5);
insert into review values(review_seq.nextval,'먹고 바로 위암 걸렸어요',sysdate,'n','9823',12,'죽을거 같애',1);
insert into review values(review_seq.nextval,'내 친구 먹고 바로 뒤졌는데',sysdate,'n','12345',12,'완전 나쁜 상품',6);
insert into review values(review_seq.nextval,'맛 없어',sysdate,'n','314134',6,'bad',2);
insert into review values(review_seq.nextval,'그냥 그래',sysdate,'n','24301',6,'일반',3);


insert into event values(event_seq.nextval,'건강하게 키운 숙성 한우 할인','pork_event.jpg','n');
insert into event values(event_seq.nextval,'9월 농할(8/31 ~ 9/30)','veg_event.jpg','n');
insert into event values(event_seq.nextval,'환절기 목감기 아이템','neck_event.jpg','n');
insert into event values(event_seq.nextval,'2023년 생물새우 예약','shrimp_event.jpg','n');

insert into eventlist values(1,1,'n');
insert into eventlist values(1,2,'n');
insert into eventlist values(1,3,'n');

 insert into product values(product_seq.nextval,'껍질째 먹는 사과(2.5kg/박스)',31900,'한국산','apple1.jpg','껍질에 영양이 많다는데 아무리 깨끗이 씻어도 그냥 먹어도 될까 고민스럽죠? 사과 하나에 담긴 영양, 초록마을이 오롯이 챙겨 드릴게요. 껍질 씻는 수고스러움과 번거로움은 잊고, 포장만 벗겨 바로 드셔보세요. 씻어 나와 더 간편한 사과와 함께 건강한 하루의 시작을 열어보세요.'
 ,10,'과일·견과·건과','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'봉화사과(4~5입)',19900,'한국산','apple2.jpg','경상북도 최북단에 위치한 봉화군에서 맑은 공기와 햇빛 속에서 자란 사과입니다. 제초제 없이 잔류 농약 검사까지 안전하게 마쳐 늘 균일한 맛과 품질로 만날 수 있어요. 탐스럽게 잘 익은 새빨간 껍질 속에는 당도 높은 과육이 들어차 있답니다.'
 ,20,'과일·견과·건과','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'착한배(봉/3~5입)',11900,'한국산','pear.jpg','하얀 속살 사이로 달큼한 수분기를 머금은 배. 사각사각 시원한 맛 덕분에 남녀노소 모두가 좋아하는 과일 중 하나죠. 초록개런티배는 초록마을 자체 인증인 초록개런티를 획득한 상품으로 맛과 품질을 보장해요. 무제초제 농법으로 관리되는 비옥한 토양에서 탐스럽게 여물어 과육이 단단한 것은 물론 균일한 당도를 자랑합니다. 간식이나 식후 디저트로 개운하게 즐기거나, 목마름을 해소하는 배 주스로 청량하게 갈아 마셔 보세요.'
 ,15,'과일·견과·건과','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약이상_양파 (5입)',4900,'한국산','onion.jpg','알싸하고 달큰한 향미를 가진 양파는 떨어지기 전에 미리 미리 구비해두면 좋아요. 어느 요리에든 잘 어우러져 영양과 풍미를 한껏 끌어올려 주거든요. 농약 쓰지 않고 정성껏 재배한 초록마을 양파는 알이 단단하고 아삭한 식감이 신선하게 살아 있어요. 기름진 음식과 궁합이 좋은 양파를 절임부터 탕, 볶음 등에 두루 넣어 똑소리나게 활용해보세요.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약이상_자색양파 (2입)',2800,'한국산','purple_onion.jpg','흰 양파보다 매운맛이 덜하고 씹을수록 올라오는 단 내음이 특징적인 자색양파입니다. 진한 보랏빛이 매력적인 채소죠. 속살이 단단하고 아삭한 무농약 양파를 신선하게 엄선했습니다. 아이 볶음밥, 샌드위치의 토핑으로 쓰거나 새콤달콤한 피클 또는 장아찌를 담가 식탁 위를 보랏빛으로 물들여 보세요.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약 깐마늘(소/600g)',12000,'한국산','garlic1.jpg','손질 없이 즐기는 뽀얀 마늘 무농약 깐마늘 (대용량)'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약이상 한지형 햇마늘(600g)',16900,'한국산','garlic2.jpg','우리 땅에서 합성 농약 없이 자란 국산 품종의 한지형 마늘을 준비했습니다. 한지형 마늘은 한 뿌리에 6알 내외로 차있어 육쪽마늘로도 불리는데요. 단단하고 저장성이 좋아 오래 보관하기에도 좋습니다. 강한 매운맛과 진한 풍미로 음식에 알싸한 감칠맛을 더해주죠. 갓 수확한 신선한 햇마늘로 보내드리니 마늘 장아찌, 통마늘 구이 등으로 요긴하게 활용해 보세요.'
 ,30,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약이상_감자(1kg 이상)',5100,'한국산','potato.jpg','든든한 포만감을 전하는 만능 식재료, 무농약이상 감자입니다. 우리 땅에서 튼실하게 자라 알이 단단한 감자를 엄선했어요. 포슬포슬하게 삶아 식사 대용이나 간식으로 즐기기 좋죠. 국거리나 반찬 말고도 샐러드, 전, 수프 등 다양한 요리에서 활용해보세요. 1kg 이상 용량으로 500g보다 넉넉하게 사용할 수 있어요.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무농약이상_채도라지 (150g)',6200,'한국산','doraji.jpg','특유의 쌉싸래한 향취로 입맛을 돋우는 도라지입니다. 번거로운 손질 없이 간편하게 사용할 수 있도록 세척 후 껍질을 벗긴 도라지를 얇게 채 썰어 담았습니다. 우리 땅에서 농약 없이 안전하게 자란 도라지를 엄선했으니, 언제든 믿고 드셔도 좋아요. 한 번 요리할 분량으로 소량씩 담아 더욱 신선하게 즐길 수 있습니다. 고소한 도라지 볶음부터 조림, 새콤한 무침까지 다양하게 조리해보세요.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'정직선별 건대추(180g)',4900,'한국산','daechu.jpg','우리 땅에서 제초제 없이 재배해 햇살과 바람을 맞으며 천천히 건조시킨 대추입니다. 알의 크기가 크고 균일하며 살이 단단해 명절 상에도 담음새 있게 올릴 수 있죠. 자연 그대로의 단맛이 어디든 부드럽게 어우러질 거예요. 대추차나 대추청으로 달달하게 즐기거나 백숙, 오곡밥 등 각종 요리의 재료로 다채롭게 활용해보세요.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'유기농 가평황잣(140g)',26500,'한국산','jat.jpg','탄수화물과 지방, 단백질, 비타민 B등을 함유한 잣은 작지만 영양이 꽉 차 있어요. 특히 가평잣은 오래전 임금에게 올리던 진상품으로, 맛이 좋고 귀하기로 소문났죠. 백잣이 뜨거운 물에 담가 속껍질을 깔끔하게 제거한 상태라면 황잣은 속껍질을 살려 솔향이 그대로 남아 있고 고소함이 더욱 진하게 느껴집니다.'
 ,0,'채소','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'프리미엄 잡화꿀(500g)',13500,'한국산','honey.jpg','잡화꿀은 꽃 피는 계절인 4월에서 10월 사이에 채취되는 꽃꿀입니다. 여러 꽃에서 채밀되는 만큼 시기나 지역에 따라 색과 향, 맛이 달라지는 매력을 지녔죠. 초록마을의 프리미엄잡화꿀은 (사)한국양봉협회의 엄격한 기준을 토대로 1+등급을 획득한 프리미엄 꿀이에요. 짙은 갈색빛 꿀에서는 자연의 달콤함이 부드럽게 번져옵니다. 원하는 양만큼 짜낼 수 있는 용기에 담겨 더욱 편리해요. 요리에 설탕 대신 첨가하거나 따뜻한 꿀차로 달달하게 즐겨보세요'
  ,0,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'무농약 도라지청(150g)',17700,'한국산','pear_honey.jpg','무농약도라치청은 비옥한 우리 땅에서 유기합성농약 없이, 3년근 이상 자란 도라지로 만듭니다. 도라지 외 다른 재료는 일절 들어가지 않아요. 도라지를 40시간 이상 정성껏 추출해 도라지 본연의 자연스러운 단맛과 풍미가 향긋하게 번져오죠. 오랜 노하우로 도라지의 아리고 쌉싸래한 맛을 줄여 누구든 편안하게 드실 수 있죠. 한 스푼씩 그냥 떠 드시거나 냉수 또는 온수에 타서 차처럼 즐겨보세요.'
  ,20,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'가벼운 국내산 호박즙(80mLx30입)',11800,'한국산','pumpkin_water.jpg','우리 땅에서 정직하게 자란 늙은 호박을 착즙해 담아낸 호박즙이예요. 설탕이나 시럽 없이 오롯이 우리 땅에서 자란 잘 익은 늙은 호박만을 추출해 한 포에 담았습니다. 평소 달달한 호박즙이 부담스러웠던 분들도 본연의 구수하고 은은한 단맛으로 깔끔하게 즐길 수 있을 거예요.'
  ,10,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'짜먹는 우리아이쑥쑥 (15gx15포)',14500,'한국산','kids.jpg','우리 아이에게 매일 한 포씩 건네보세요. 탱글탱글 말랑말랑하게 씹히는 젤리 제형으로 아이가 손에 쥐고 쏙쏙 편하게 짜 먹을 수 있어요. 달달한 복숭아 맛으로 간식처럼 즐길 수 있어 부모가 챙겨주지 않아도 아이가 먼저 찾을 거예요.'
  ,0,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'건강한 비타C(3,000mgx30포)',9000,'한국산','vita1.jpg','스틱 포장으로 간편하게 섭취할 수 있는 비타민 C입니다. 품질과 안전성을 보장하는 프리미엄 영국산 비타민 C를 함유해 하루 한 포면 비타민 C 일일권장량을 충족할 수 있죠. 여기에 아세로라추출분말을 더해 새콤달콤한 맛으로 즐길 수 있습니다. 1회분 개별 포장으로 어디서든 가볍게 톡 털어 그대로 드시거나 물 또는 주스 등에 녹여 간편하게 섭취하세요.'
  ,0,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'아임오 이너 밸런스 프로바이오틱스(30포)',21600,'한국산','medicine1.jpg','17종의 유산균을 포함한 프로바이오틱스를 장 건강을 위해 하루 1포씩 챙겨 보세요. 아임오는 건강한 한국 여성의 질에서 유래한 특허 유산균 3종을 배합해 만들었습니다. 30억 마리의 보장균수로 원활한 배변활동과 유산균 증식에 도움을 주죠. 특허 공법인 호박분말코팅을 적용해 살아 있는 유산균이 장까지 안전하게 도착하게 했어요. 석류, 크렌베리 등의 추출물을 더해 상큼한 풍미까지 살렸으니 언제 어디서든 간편하게 섭취하세요.'
  ,0,'과일·견과·건과','n',sysdate,100);
  
 insert into product values(product_seq.nextval,'[120포]유기농 야채수(1box)',76800,'한국산','veg_water.jpg','평소 채소 섭취가 부족하다고 느껴진다면 유기농 야채수를 꾸준히 마셔보세요. 화학 비료와 합성 농약 없이 자란 5가지 국내산 채소를 팔팔 끓여 만들었는데요. 유기농 무와 무청, 당근, 우엉, 표고버섯을 엄선해 일정한 비율로 혼합했지요. '
 ,30,'과일·견과·건과','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'데일리 프로틴바(50g×10입)',16800,'한국산','veg_water.jpg','성인 1일 칼슘 기준치 대비 풍부한 칼슘과 달걀 2개 분량의 단백질을 한 번에 섭취할 수 있는 프로틴바를 소개합니다. 밀가루 대신 식물성 단백질인 분리대두단백 분말과 동물성 단백질인 유청 단백 분말을 사용해 만들었어요.'
 ,0,'과일·견과·건과','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'[숙성한우]무항생제 한우 불고기용(냉장/300g)',22900,'한국산','bulgogi1.jpg','안심하고 맛보는 국내산 무항생제 한우 불고깃감입니다. 저온에서 72시간 워터에이징 숙성시켜 육질이 부드럽고 육즙의 감칠맛은 더 진해졌어요. 고기를 얇게 정형해 야들야들 쫄깃한 식감 또한 일품이지요. 달짝지근한 간장 양념에 재워 밥 반찬으로, 샌드위치와 부리토, 피자 등의 토핑 재료로 다양하게 즐겨보세요.'
 ,25,'정육·계란류','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'[숙성한우]무항생제 한우 채끝구이용(냉장/200g)',76800,'한국산','chae.jpg','채끝살은 등심과 안심 사이에 있는 부위입니다. 육질이 탄탄하고 마블링도 고루 갖춰 맛과 식감이 조화롭죠. 초록마을 채끝살은 특수한 워터에이징 기법으로 72시간 동안 숙성해 촉촉한 육즙은 물론, 더 깊어진 풍미를 느낄 수 있어요. 미디움 레어로 구워드시면 채끝살 본연의 고소한 맛과 향을 느낄 수 있어요.'
 ,0,'정육·계란류','n',sysdate,100);
 
 insert into product values(product_seq.nextval,'무항생제 국내산 생물새우(1kg)',35500,'한국산','shrimp.jpg','어린 새우가 큼직한 크기의 어른새우가 되는 8~10월이 새우의 제철입니다. 이 때 만나는 생물새우는 육질이 탱탱하고 씹는 맛이 풍부하죠. 목포항에서 2시간 배를 타고 들어가는 하의도(島)에서 양식해 첫 출하되는 생물새우를 준비했어요.'
 ,10,'수산','n',sysdate,100);

 
 
 
 
 
 
 
 
 
 
 
 







