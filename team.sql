alter table card
   drop constraint FK_CARD_REFERENCE_QUESTION;

alter table card
   drop constraint FK_CARD_REFERENCE_GRADE;

alter table card
   drop constraint FK_CARD_REFERENCE_QUETYPE;

alter table collect
   drop constraint FK_COLLECT_REFERENCE_QUETYPE;

alter table collect
   drop constraint FK_COLLECT_REFERENCE_STUDENT;

alter table collect
   drop constraint FK_COLLECT_REFERENCE_QUESTION;

alter table done
   drop constraint FK_DONE_REFERENCE_STUDENT;

alter table done
   drop constraint FK_DONE_REFERENCE_QUESTION;

alter table error
   drop constraint FK_ERROR_REFERENCE_QUESTION;

alter table error
   drop constraint FK_ERROR_REFERENCE_STUDENT;

alter table error
   drop constraint FK_ERROR_REFERENCE_GRADE;

alter table error
   drop constraint FK_ERROR_REFERENCE_QUETYPE;

alter table examdate
   drop constraint FK_EXAMDATE_REFERENCE_SUBJECT;

alter table forum
   drop constraint FK_FORUM_REFERENCE_STUDENT;

alter table forum
   drop constraint FK_FORUM_REFERENCE_ADMIN;

alter table grade
   drop constraint FK_GRADE_REFERENCE_SUBJECT;

alter table grade
   drop constraint FK_GRADE_REFERENCE_STUDENT;

alter table new
   drop constraint FK_NEW_REFERENCE_ADMIN;

alter table note
   drop constraint FK_NOTE_REFERENCE_STUDENT;

alter table note
   drop constraint FK_NOTE_REFERENCE_QUETYPE;

alter table note
   drop constraint FK_NOTE_REFERENCE_QUESTION;

alter table point
   drop constraint FK_POINT_REFERENCE_SUBJECT;

alter table qprelation
   drop constraint FK_QPRELATI_REFERENCE_QUESTION;

alter table qprelation
   drop constraint FK_QPRELATI_REFERENCE_POINT;

alter table question
   drop constraint FK_QUESTION_REFERENCE_SUBJECT;

alter table question
   drop constraint FK_QUESTION_REFERENCE_QUETYPE;

alter table reply
   drop constraint FK_REPLY_REFERENCE_STUDENT;

alter table reply
   drop constraint FK_REPLY_REFERENCE_FORUM;

alter table reply
   drop constraint FK_REPLY_REFERENCE_ADMIN;

alter table sign
   drop constraint FK_SIGN_REFERENCE_STUDENT;

alter table vcomment
   drop constraint FK_VCOMMENT_REFERENCE_STUDENT;

alter table vcomment
   drop constraint FK_VCOMMENT_REFERENCE_VEDIO;

alter table vedio
   drop constraint FK_VEDIO_REFERENCE_SUBJECT;

alter table vedio
   drop constraint FK_VEDIO_REFERENCE_ADMIN;

alter table vedio
   drop constraint FK_VEDIO_REFERENCE_STUDENT;

drop table admin cascade constraints;

drop table card cascade constraints;

drop table collect cascade constraints;

drop table done cascade constraints;

drop table error cascade constraints;

drop table examdate cascade constraints;

drop table forum cascade constraints;

drop table grade cascade constraints;

drop table new cascade constraints;

drop table note cascade constraints;

drop table point cascade constraints;

drop table qprelation cascade constraints;

drop table question cascade constraints;

drop table quetype cascade constraints;

drop table reply cascade constraints;

drop table sign cascade constraints;

drop table student cascade constraints;

drop table subject cascade constraints;

drop table vcomment cascade constraints;

drop table vedio cascade constraints;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin 
(
   id                   number(8)            not null,
   aname                NVARCHAR2(50),
   type                 NVARCHAR2(2),
   loginname            NVARCHAR2(12),
   loginpass            NVARCHAR2(16),
   Email                NVARCHAR2(28),
   phone                NVARCHAR2(11),
   power                NVARCHAR2(100),
   constraint PK_ADMIN primary key (id)
);

/*==============================================================*/
/* Table: card                                                  */
/*==============================================================*/
create table card 
(
   id                   number(8)            not null,
   qtid                 number(8),
   uanswer              NVARCHAR2(10),
   result               NVARCHAR2(10),
   score                number(8),
   qid                  number(8),
   gid                  number(8),
   qno                  number(8),
   constraint PK_CARD primary key (id)
);

/*==============================================================*/
/* Table: collect                                               */
/*==============================================================*/
create table collect 
(
   id                   number(8)            not null,
   stuid                number(8)            not null,
   qtid                 number(8),
   qid                  number(8)            not null,
   constraint PK_COLLECT primary key (id)
);

/*==============================================================*/
/* Table: done                                                  */
/*==============================================================*/
create table done 
(
   id                   number(8)            not null,
   stuid                number(8),
   qid                  number(8),
   constraint PK_DONE primary key (id)
);

/*==============================================================*/
/* Table: error                                                 */
/*==============================================================*/
create table error 
(
   id                   number(8)            not null,
   qtid                 number(8),
   stuid                number(8)            not null,
   qid                  number(8)            not null,
   gid                  number(8),
   constraint PK_ERROR primary key (id)
);

/*==============================================================*/
/* Table: examdate                                              */
/*==============================================================*/
create table examdate 
(
   id                   number(8)            not null,
   edate                date,
   subid                number(8),
   constraint PK_EXAMDATE primary key (id)
);

/*==============================================================*/
/* Table: forum                                                 */
/*==============================================================*/
create table forum 
(
   fid                  number(8)            not null,
   ftitle               nvarchar2(100),
   fcontent             nvarchar2(2000),
   stuid                number(8),
   image                nvarchar2(500),
   fdate                date,
   aid                  number(8),
   constraint PK_FORUM primary key (fid)
);

/*==============================================================*/
/* Table: grade                                                 */
/*==============================================================*/
create table grade 
(
   id                   number(8)            not null,
   stuid                number(8),
   subid                number(8),
   score                number(8),
   time                 date,
   type                 NVARCHAR2(20),
   constraint PK_GRADE primary key (id)
);

/*==============================================================*/
/* Table: new                                                   */
/*==============================================================*/
create table new 
(
   nid                  NUMBER(8)            not null,
   ntitle               NVARCHAR2(100),
   ncontent             NVARCHAR2(2000),
   nimage               NVARCHAR2(500),
   ndate                DATE,
   aid                  NUMBER(8),
   constraint PK_NEW primary key (nid)
);

/*==============================================================*/
/* Table: note                                                  */
/*==============================================================*/
create table note 
(
   id                   number(8)            not null,
   stuid                number(8),
   qtid                 number(8),
   time                 date,
   ncontent             NVARCHAR2(1000),
   qid                  number(8),
   constraint PK_NOTE primary key (id)
);

/*==============================================================*/
/* Table: point                                                 */
/*==============================================================*/
create table point 
(
   id                   NUMBER(8)            not null,
   pname                NVARCHAR2(20),
   pex                  NVARCHAR2(200),
   subid                NUMBER(8),
   constraint PK_POINT primary key (id)
);

/*==============================================================*/
/* Table: qprelation                                            */
/*==============================================================*/
create table qprelation 
(
   pid                  number(8)            not null,
   qid                  number(8)            not null,
   constraint PK_QPRELATION primary key (pid, qid)
);

/*==============================================================*/
/* Table: question                                              */
/*==============================================================*/
create table question 
(
   id                   NUMBER(8)            not null,
   subid                NUMBER(8),
   qtid                 NUMBER(8),
   qtitle               NVARCHAR2(200),
   optiona              NVARCHAR2(100),
   optionb              NVARCHAR2(100),
   optionc              NVARCHAR2(100),
   optiond              NVARCHAR2(100),
   result               NVARCHAR2(100),
   knowpint             NVARCHAR2(100),
   difficulty           NUMBER(8),
   image                NVARCHAR2(500),
   analysis             NVARCHAR2(1000),
   constraint PK_QUESTION primary key (id)
);

/*==============================================================*/
/* Table: quetype                                               */
/*==============================================================*/
create table quetype 
(
   id                   number(8)            not null,
   tname                varchar2(20),
   constraint PK_QUETYPE primary key (id)
);

/*==============================================================*/
/* Table: reply                                                 */
/*==============================================================*/
create table reply 
(
   rid                   number(8)           not null,
   rcontent             nvarchar2(2000),
   stuid                 number(8),
   fid                   number(8),
   image                nvarchar2(500),
   rdate                date,
   aid                  number(8),
   constraint PK_REPLY primary key (rid)
);

/*==============================================================*/
/* Table: sign                                                  */
/*==============================================================*/
create table sign 
(
   id                   number(8)            not null,
   time                 date,
   stuid                number(8),
   constraint PK_SIGN primary key (id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student 
(
   id                   number(8)            not null,
   uname                NVARCHAR2(50),
   type                 NVARCHAR2(2),
   loginname            NVARCHAR2(12),
   loginpass            NVARCHAR2(16),
   Email                NVARCHAR2(28),
   phone                NVARCHAR2(11),
   image                NVARCHAR2(500),
   status               NVARCHAR2(2),
   score                number(8),
   constraint PK_STUDENT primary key (id)
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject 
(
   id                    number(8)           not null,
   sname                nvarchar2(20),
   sdetail              nvarchar2(1000),
   constraint PK_SUBJECT primary key (id)
);

/*==============================================================*/
/* Table: vcomment                                              */
/*==============================================================*/
create table vcomment 
(
   id                   number(8)            not null,
   content              nvarchar2(1000),
   time                 date,
   stuid                number(8),
   vid                  number(8),
   constraint PK_VCOMMENT primary key (id)
);

/*==============================================================*/
/* Table: vedio                                                 */
/*==============================================================*/
create table vedio 
(
   id                   number(8)            not null,
   subid                number(8),
   vname                NVARCHAR2(200),
   time                 date,
   vfile                NVARCHAR2(500),
   vex                  NVARCHAR2(1000),
   aid                  number(8),
   image                NVARCHAR2(500),
   status               NVARCHAR2(20),
   stuid                number(8),
   constraint PK_VEDIO primary key (id)
);

alter table card
   add constraint FK_CARD_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table card
   add constraint FK_CARD_REFERENCE_GRADE foreign key (gid)
      references grade (id);

alter table card
   add constraint FK_CARD_REFERENCE_QUETYPE foreign key (qtid)
      references quetype (id);

alter table collect
   add constraint FK_COLLECT_REFERENCE_QUETYPE foreign key (qtid)
      references quetype (id);

alter table collect
   add constraint FK_COLLECT_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table collect
   add constraint FK_COLLECT_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table done
   add constraint FK_DONE_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table done
   add constraint FK_DONE_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table error
   add constraint FK_ERROR_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table error
   add constraint FK_ERROR_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table error
   add constraint FK_ERROR_REFERENCE_GRADE foreign key (gid)
      references grade (id);

alter table error
   add constraint FK_ERROR_REFERENCE_QUETYPE foreign key (qtid)
      references quetype (id);

alter table examdate
   add constraint FK_EXAMDATE_REFERENCE_SUBJECT foreign key (subid)
      references subject (id);

alter table forum
   add constraint FK_FORUM_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table forum
   add constraint FK_FORUM_REFERENCE_ADMIN foreign key (aid)
      references admin (id);

alter table grade
   add constraint FK_GRADE_REFERENCE_SUBJECT foreign key (subid)
      references subject (id);

alter table grade
   add constraint FK_GRADE_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table new
   add constraint FK_NEW_REFERENCE_ADMIN foreign key (aid)
      references admin (id);

alter table note
   add constraint FK_NOTE_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table note
   add constraint FK_NOTE_REFERENCE_QUETYPE foreign key (qtid)
      references quetype (id);

alter table note
   add constraint FK_NOTE_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table point
   add constraint FK_POINT_REFERENCE_SUBJECT foreign key (subid)
      references subject (id);

alter table qprelation
   add constraint FK_QPRELATI_REFERENCE_QUESTION foreign key (qid)
      references question (id);

alter table qprelation
   add constraint FK_QPRELATI_REFERENCE_POINT foreign key (pid)
      references point (id);

alter table question
   add constraint FK_QUESTION_REFERENCE_SUBJECT foreign key (subid)
      references subject (id);

alter table question
   add constraint FK_QUESTION_REFERENCE_QUETYPE foreign key (qtid)
      references quetype (id);

alter table reply
   add constraint FK_REPLY_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table reply
   add constraint FK_REPLY_REFERENCE_FORUM foreign key (fid)
      references forum (fid);

alter table reply
   add constraint FK_REPLY_REFERENCE_ADMIN foreign key (aid)
      references admin (id);

alter table sign
   add constraint FK_SIGN_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table vcomment
   add constraint FK_VCOMMENT_REFERENCE_STUDENT foreign key (stuid)
      references student (id);

alter table vcomment
   add constraint FK_VCOMMENT_REFERENCE_VEDIO foreign key (vid)
      references vedio (id);

alter table vedio
   add constraint FK_VEDIO_REFERENCE_SUBJECT foreign key (subid)
      references subject (id);

alter table vedio
   add constraint FK_VEDIO_REFERENCE_ADMIN foreign key (aid)
      references admin (id);

alter table vedio
   add constraint FK_VEDIO_REFERENCE_STUDENT foreign key (stuid)
      references student (id);



--����

drop sequence seq_stu ;
drop sequence seq_reply ;
drop sequence seq_new ;
drop sequence seq_admin ;
drop sequence seq_sub ;
drop sequence seq_grade ;
drop sequence seq_forum ;
drop sequence seq_collect ;
drop sequence seq_note ;
drop sequence seq_que ;
drop sequence seq_qtype ;
drop sequence seq_error ;
drop sequence seq_random ;
drop sequence seq_point;
drop sequence seq_edate;
drop sequence seq_card;
drop sequence seq_video; 
drop sequence seq_done;
drop sequence seq_vcomment;
drop sequence seq_sign;
--ADD
create sequence seq_stu start with 0 increment by 1 minvalue 0;
create sequence seq_reply start with 0 increment by 1 minvalue 0;
create sequence seq_new start with 0 increment by 1 minvalue 0;
create sequence seq_admin start with 0 increment by 1 minvalue 0;
create sequence seq_sub start with 0 increment by 1 minvalue 0;
create sequence seq_grade start with 0 increment by 1 minvalue 0;
create sequence seq_forum start with 0 increment by 1 minvalue 0;
create sequence seq_collect start with 0 increment by 1 minvalue 0;
create sequence seq_note start with 0 increment by 1 minvalue 0;
create sequence seq_que start with 0 increment by 1 minvalue 0;
create sequence seq_qtype start with 0 increment by 1 minvalue 0;
create sequence seq_error start with 0 increment by 1 minvalue 0;
create sequence seq_random start with 0 increment by 1 minvalue 0;
create sequence seq_point start with 0 increment by 1 minvalue 0;
create sequence seq_edate start with 0 increment by 1 minvalue 0;
create sequence seq_card start with 0 increment by 1 minvalue 0;
create sequence seq_video start with 0 increment by 1 minvalue 0;
create sequence seq_done start with 0 increment by 1 minvalue 0;
create sequence seq_vcomment start with 0 increment by 1 minvalue 0;
create sequence seq_sign start with 0 increment by 1 minvalue 0;
---��������
--admin
insert into admin values(seq_admin.nextval,'����','2','admin1','123456','www.@126.com','13835618410','�û�����,��������,��Ƶ����,��Ŀ����,���ڹ���,֪ʶ�����,���Ź���');
insert into admin values(seq_admin.nextval,'���ܹ�','2','admin','123123','www.@163.com','13888881000','�û�����,��������,������,��Ƶ����,��Ŀ����,���ڹ���,֪ʶ�����,���Ź���');
insert into admin values(seq_admin.nextval,'С��','2','admin2','123456','www.@qq.com','01058855789','������,��Ƶ����,��Ŀ����,���ڹ���,֪ʶ�����,���Ź���');
--student
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'�','1','lihua','123456','@163.com','1555555','s1.jpg','1');
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'����','1','lisi','123456','@163.com','1555555','s2.jpg','1');
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'����','1','wangwu','123456','@163.com','1555555','s3.jpg','1');

---new
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'�������ҵ�Сѧ��ʦ ��ѧ��д��ʫ���������','������ʶ�������֣���־�����˼��飬�������ٶ���ǣ��ɹ����ڲ���ʱ��������ʫ���ٹ����ͳ���Сѧ���꼶7��������ﺣ��д��ѧ�����������ĩ���ȫ��42��ѧ��ÿ���˶��������Լ��ġ�ʫ�����1��12�յļҳ����ϣ��ﺣ�ཫ�����Щ���﷢��ѧ���ҳ���
���ﺣ����ѧ�����ص��ƽʱ�ı��֣�������Ϣʱ���ÿ������д��һ��ʫ����д��һ�����磬�����30��ѧ����������翪ʼд��ʱ��;���û�� �ˡ������ǣ��ﺣ���ָ�ÿ��ѧ��д���˲�һ���ġ�ʫ�����42��ѧ��ÿ���˵Ķ���һ������Щ���ｫ����1��12�յļҳ����Ϸ����ҳ���ѧ������������ ����Ȧ�ķ��ת�����ܶ�ҳ��Ѿ���ǰ�õ������ϲѶ��

���������ﺣ��ֻ��34�꣬ȴ�Ѿ����˲�С�ĳɼ���2015�꣬ȫ����������ѧϰ������ٹ�����ѧУ��Ļ���ﺣ����Ϊ����֮һ�μӣ�2016�꣬�ڶ�����������ѧϰ���ô����ں��ھ��У��ﺣ�����ƾ����ʫ�衢�����ѧ���õ����صȽ���

��������ʦ������Ȧ������ˢ�������вţ���д����ã��������ҵ�ϥ�ǣ�','n1.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017�����߿�������˵�������� ��������΢��','������������Ժ���ս��ܣ�2017��߿�����������˵�������ڽ��ճ��棬��½����������ѧ�����С������������߿�������ꡱ�ġ�����˵�����������Ӣ��ѧ���ޱ仯�⣬����ѧ�Ʋο���������滻��˳�����������ѧ�ƵĿ���������΢����

�������ġ�����˵�����У���¼���ֵ�12���Ž�������ѧ���Ļ�����ƪĿ�У���6�����µģ��ֱ�Ϊ����¥�Ρ����ź������߳ǡ������ҡ���ƽ�������硷�������뺣���������뿼����������ķ�Χ��Ϊ�����������ο����⣬���ֶԾ����Ķ����������ݡ�����⡣����֮һ����ѡ�á���¥�Ρ��д��԰ʫ������ݣ���ѡ�������ʽ����ѧ���Ըö������⡣

����������������Ժ�����˱�ʾ�����Ķԡ������Ķ����������ݽ�����ϸ�������������Ķ������������ѧ����������������ͼ�ֵ��ǿ��ͨ����Ʒ��������ա����ܽ�����ݡ�����������Ҫ��ϵ����������ۡ�����Ŀ�����ڴٽ�ѧ�������Ķ���������������ѧ��������������������Ķ����������������Ķ�����ķ������Ӷ����Ӿ����Ķ�Ǳ��Ĭ�������ã���ѧ���γ���ȷ��ֵ�ۣ�Ϊ����չ�������õľ�����ӡ�','n2.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'Ӣ���ر�40���ѧλ��թ��վ �������ƴ�ѧѧλ','��Ӣ���㲥��˾1��3����Ϣ��Ӣ����ǰ�ر���40�����ѧλ��թ��վ����Щ��վ����Ӣ�����ƴ�ѧ������ѧλ�����ṩû���Ͽɶȵ�Զ�̽�����Ӣ���ߵȽ���ѧλ�������(Hedd)Ŀǰ�ѷ�����90������Ƶ���թ������

����Hedd�ĸߵȽ�����������Jayne Rowley�ƣ�ȥ��9�¹ر���4��ð�ƴ�ѧ��3����թ��վ������һ���ٴ�ѧ��Stafford University�����Ƿ�Ч˹�����¿���ѧ(Staffordshire University)��ð�ƴ�ѧ������һЩð�ƴ�ѧֱ���������ƴ�ѧ�����֣���Surrey�ȡ����⣬��eBay�ϻ�����������˹�ش�ѧ�����ƴ�ѧ�ļ�ѧλ��

����Ӣ��������2015��6�������������ð�ƴ�ѧ����ѧλ��թ��վ��Rowley��ʾ����Ӣ�������£�������ѧ����Ҫ������Ӧ�ı�׼���õ�����󳼵���׼��Ŀǰ��Hedd�Ѿ�Ҫ���ҵ����Ҫ�����Ϲ����Լ�ѧλ֤�����Ƭ������Υ����Ա�л��ɳá�

����Ӣ�������������˱�ʾ��ѧλ��թ����ѧ����ӦƸ�߶����ż�������Ӱ�죬�����Ѿ���ȡ�����ԵĴ�ʩ�������ЩΥ����Ա��','n3.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2016ȫ���������ѧ���а��ڵ��ĸ�У�ϰ�','�Ϻ������12��8����ʽ������2016��ȫ��������Ժϵѧ���������ҹ��ڵع���4����У�ϰ��Ϻ�����ѧԺ���������ѧԺ����ȫ��150ǿ����Ϊ����ȫ��������ߵ�������Ժϵ��

���������ȫ��������Ժϵѧ��������������Ƴ����׸�ȫ��ר����Ժϵ�������������������������������ֵ�ר�Ƹ�У�ıȽ϶���ͬ��ԺУ֮����С������ȫ��������Ժϵѧ�����������Դ��Ʊ���������Ľ��ޣ�ɨ����ȫ��ѧ���������ȵ�����ԺУ�Լ�����������Ժϵ���ۺ��Ը�У�����ÿ͹�ָ��͵��������ݶ�������ͬһ��׼�½�����������

�����ڽ���������У��Ĵ����ǵϿϴ�ѧ�ġ��˶���Ӫ����ѧѧԺ��ƾ����׿Խ�Ŀ�������Ӱ�����͸�ˮƽ�ɹ�������ժ�������һ�Ĺ�ڡ�Ӣ�����򱤴�ѧ�ġ��������˶��뽡����ѧ��ѧԺ�������Ͽ������ɴ�ѧ�����ױ��Ƿ�У���ġ��˶���ѧϵ/�Ƶꡢ��������������ϵ/�������˶�ѵ��ϵ����������ڶ��͵�������

����ȫ��ʮǿ��У�У��ۺ��Դ�ѧ������Ժϵռ�˽ϴ���أ�ר��������ԺУ�������ڵ�4����Ų������ѧԺ�͵�10���Ŀ�¡������ѧ���Ĵ����ǵ�������Ժϵ����������ӱ����������ǰ�����о��������Ĵ����Ǹ�У��

����2016�����ȫ��������Ժϵѧ����������ʮǿ

����2016���� ѧУ ����Ժϵ ����

����1 �Ͽϴ�ѧ �˶���Ӫ����ѧѧԺ �Ĵ�����

����2 ���򱤴�ѧ �������˶��뽡����ѧѧԺ Ӣ��

����3 �Ͽ������ɴ�ѧ-���ױ��� �˶���ѧϵ/�Ƶꡢ���ۺ���������ϵ/�������˶�ѵ��ϵ ����

����4 Ų������ѧԺ Ų������ѧԺ Ų��

����5 ��ʿ����ѧ �����˶���Ӫ����ѧѧԺ �Ĵ�����

����6 ������Լ��Ħ��˹��ѧ �������˶���ѧѧԺ Ӣ��

����7 �ϵ����ѧ �˶���ѧ���ٴ�������ѧϵ ����

����8 ³���ѧ��������� �˶��뿵��ѧԺ ����ʱ

����9 ���ش�ѧ �˶����˶���ѧϵ ����ʱ

����10 ��¡������ѧ ��¡������ѧ �¹�

����2016�����ȫ��������Ժϵѧ�������У�ȫ����37������300����У��������Ժϵ����������������15��Ϊר����������У����Χȫ��300ǿ���ۺ��Դ�ѧ������Ժϵ�����˶�ϵ������ѧԺ���������˶���ѧѧԺ���������˶���ѧϵ�������˶�ѧԺ���������˶���ѧѧԺ�ȡ�

����������ԣ�ŷ�޸�У���������������ԣ�ŷ��������Ժϵ��11������ȫ��ǰ20������47����Χȫ���ǿ���ܼƹ���143��������Ժϵ����ȫ��300ǿ����̫����������Ժϵ�ϰ�ȫ��ǰ20����������Խ�����ޣ��ﵽ5�������޵���������Χȫ��������Ժϵ��ǿ��У�����ϳ�����̫����������ƾ����64�����ϰ��У��������Ϊȫ��������������ʵ����ǿ�Ĺ��ҡ�

����2016�����ȫ��������Ժϵѧ�������У��ҹ��ڵع���4����У�ϰ��Ϻ�����ѧԺ���������ѧԺһ����Χ�����101-150��������������ѧ�ͱ�����ѧ���˶�ҽѧ�о������������201-300�������ڵ�������ѧ�о�����δ�������������������չ�������׶Σ��Ϻ�����ѧԺ���������ѧԺ�ͱ���������ѧ�ڹ��ʺ������ı����ϱ��ֳ��ʣ�չʾ���ҹ�������Ժϵ������У֮���Ծ��ѧ����������й��ʺ�����

����2016�����ȫ��������Ժϵѧ������-�й��ڵ��ϰ��У

����2016���� ѧУ ����Ժϵ ����

����101-150 �Ϻ�����ѧԺ �Ϻ�����ѧԺ �й�

����101-150 �������ѧԺ �������ѧԺ �й�

����201-300 ����������ѧ ����������ѧ �й�

����201-300 ������ѧ �˶�ҽѧ�о��� �й�

�����ҹ���̨��������8����У�ϰ�����������õ���������Ĵ�ѧ���˶���ѧ������ϵ��̨��������ѧ��������У�����������101-150��֮�䡣

����2016�����ȫ��������Ժϵѧ������-�й���̨�����ϰ��У

����2016���� ѧУ ����Ժϵ ����

����101-150 ������Ĵ�ѧ �˶���ѧ������ϵ �й����

����101-150 ̨��������ѧ ̨��������ѧ �й�̨��

����151-200 ��۽����ѧ ����ϵ �й����

����151-200 ��۽���ѧԺ ����������ϵ �й����

����201-300 ̨����ѧ �˶�ѧԺ �й�̨��

����201-300 ̨��ɹ���ѧ �����������������о��� �й�̨��

����201-300 ̨����������ѧԺ ̨����������ѧԺ �й�̨��

����201-300 ̨��ʦ����ѧ ����ѧԺ �й�̨��',null,sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'׷�ٺ����ڹ��ڸ�У�ν̵���Щ�������¡�','11��28�գ����й����걨�������ܿ����ǡ�һλ���顰�ཷ��������һ�ģ�������һλ���������ʦ��һ���ڸ�У�ν�ʱ���������֡������¡��������Уʦ���Ĺ㷺��ע��

�����й����걨���������߼���ͨ�����鷢�֣����ٸ�У��ʦ���й����Ƶľ��������ٴ�ѧ��Ҳ��ʾ����ѧ�ּ���Ϊ�صĴ�ѧ�����У��ܶ�ѧ������ʦ��Ϊѧ�ּ���һ��ָ�Ӱ����µġ�ľż�������ò�����һЩ�Լ���ϲ�������顣Ҳ��ʦ����ӳ����ѧ������ữ������Ϊ������᲻����������У԰�Ľ����

������ѧ�ּ�������ʦ����ϵ��ָ�Ӱ�

�����й����걨������ѧ����΢�Ź��ںš����������һ����Ϊ����Уʦ����ϵΪ�Ρ��޽⡯���ĵ��飬��200�����Ѳ���ͶƱ��ͶƱ�����ʾ��47%��������Ϊ����ѧ����Ҫ�ع��䱾�����������ӡ���22%��������Ϊ�ϴ�ѧʱ������ϣ���и���ʦԼ���Լ�����12%�����ѱ�ʾ�����ڵĸ�У��ʦҲ�����⡱��

�������ѡ���ī����ʾ������ѧ��;�ҵע���ڼ��㣬Ϊ�˽�������Ϊ��ѧ�������ǲ��ò�ѡ����ָߵ���ʦ����ʵ�Ҳ�û�з��ִ�ѧ�����������������ڡ���ʦ��ã�������ֺγ����ǣ��ҳ����룬����Сѧ��֪ʶ�ܼ������£���ѧ��֪ʶ�������������ѧ������ѧϰ�Ľ��ȴ���翼ǰˢ�ص�ˢ��������Ч�����Ǵ�ѧ�ı�����Ҳ���ҵı�������Ϊһ��985��У��ѧ������û�ие���ѧ�����ҵ�ѧϰ���֣���Ҫ������ѧ����

���������ѱ�ʾ����ữ�Ĵ�ѧ����ӭ��ѧ������ʦ��ʵ���϶��ǡ�ѧ�ּ��������µġ���·������Ϊ�����ޡ������ѱ�ʾ�����Ҿ������ڴ�ѧ���Ѽ����֤�鿴��̫��Ҫ�ˣ����ԲŻ��кܶ���·��û���˻��������Ƿ�����ѧ�����ſΣ�����ֻ�����Ƿ�ϰ������ʦҪ�����ص㡣��

�������������һ������ʦ�������ѡ�C��硱��Ϊ����ֻ�ڽ������Ҫ���ϸ񣬶�����ѧ��ѧϰ�Ĺ����и�����������ǡ����ƽ�ѧ��������ʦ��ѧ���Ǻ��Ѹ��ܵ���ʦ�����ĵġ�ƽ������ô��ѧ������������ʱ����ѧ��ƽ����ѧϰ̬�ȣ������ڽ�������ϸ�Ҫ�����ʦ������ѧ�����еġ���

�����Դˣ����ѡ��ࡱ��ʾ����ѧ���������Ҫ��ҵ�ģ�����ҵҪ���ɼ��뽱ѧ�𣬡���ѧ��ܶ���ʦ�����ֱ�׼����һ�£��е����е��ɡ�Ϊ���Լ��ܹ��и��ߵľ�ҵƽ̨������ѡ���ָߵ���ʦ�ð�����

������ʦ�����Ҫƽ����������ʵ

�����������Զԡ�ֻ�ܾ�����Ϊ���������������ѡ���һλ��У��ʦ�ڿ������ĺ�������ʾ����ȷ�����ٸ�У��ʦ���ڡ���ô������һ������ʦ����һ����е����Ρ�

�������ѡ�����������ʾ������ĸ����ӣ���ʦ����ͽ���Ҿ��ô�ѧ���б�Ҫ�ϸ�Ҫ��ѧ����������Ϊ�˴��˳ɲţ������ǽ���Ϊ��һ����ƾ����У��ѧ���Ĺ�����Ҫ��һ�����ƣ��Ͻ��ϳ�����ѧһ�������У������Ǹо���ѧ�������ˣ�����һ����ƾ��ȴû�����ʵѧ����

�������ѡ�nu nu��˵������ʦ��û�д������ڵĴ�ѧѧ���ձ鲻�У�̫���˼����������Ȳ��븶��̫�࣬�����ø�ҫ�۵ķ�����Ϊ���С�������·�������̫���������ˡ���ѧ�ɼ����ð���ʲô������Ӧʲô���������ȣ�������Ҷ����ȿ����ĸ���ʦ���ָߡ����Բο��������ң�ǰ�ٷ�֮�������ĸ������Σ���ٷ�֮��Ϊ�����񣬱������ޣ�������Ҿͻ�ú�ѧϰ�������ǻ������ˡ���

��������ʦ��һ��������ȷ��ѡ�����ڴ�ѧ���ġ������ų⡱�£��ܶ��У��ʦҲ�ھ���������⡣���ѡ�С��Ů�����ӻ���˵������ʦȷʵ���кܶ��ջ񣬵��ʹӷ�����˵���Լ���ʦ�ϣ����ķֵͣ����˵���ʦ���ָߣ���ĳЩӲ��ָ���£����ǻ��ѧ������Щ�����㡯�ġ���

������ˣ��в��ٸ�У��ʦ��ʾ�������Ŀ���ʵ�����ǡ��������ʵ����ײ�����ܶ��ѧ�����Ƕ��µľ������� �������������ڴ�ѧ��ӳ�䡱���������άϵʦ����ϵ�������ѱ�ʾ��������ȱʧ�����۲��������������࣬��ʦ���ְҵ�Ǹ����Ļ�����������������ɣ���',null,sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'�������´�ѧ������Ӣ��BBC ʵϰ�����','��һվ��������߽�����λ������˹�ص��������´�ѧ��Manchester University of Salford����

�����������´�ѧ��һ����Χ�Ѻá����ش��µĹ����о��ʹ�ѧ����18,485��ѧ���������ڰ��������ϵ���Ұ֮�ϣ�ռ��60ӢĶ��24��ƽ���ף���
�������´�ѧ�Ľ�ѧ¥�������´�ѧ�Ľ�ѧ¥������һ����������
�������´�ѧ�Ľ�ѧ¥Զ���������´�ѧ�Ľ�ѧ¥Զ��
�������´�ѧ��ѧ¥ǰ����ˮ���������´�ѧ��ѧ¥ǰ����ˮ��

������������ý���������´�ѧ��ǿ��רҵ

����У����ϵ���� �д���ʵϰʵ������

������������ý�����רҵ���������´�ѧ��ǿ��רҵ������ѧУ�뱾����ҵ��ϵ���ܣ�������ҵ��Ҫ����ָ����ѧ������ѧ�����γ̼���ʵ���ԡ�һ���棬Ϊѧ����������ҵѧϰ�ṩ�����Ļ��ᣬ��һ���棬����ҵ�о���Ŀ����ѧУ����ѧ��������������֪ʶ���־߱�ʵ�ʲ���������

������ˮ¥̨�ȵ��£�У��λ��Ӣ��ý��� ��BBC��ITV���ڶ���

�����������´�ѧ��ȫӢ��Ψһһ����Ӣ��ý���(MediaCityUK)ӵ��У���Ĵ�ѧ����Ӣ��ý�����Ӣ��ý�塢���뼰�����ҵ���ģ�Ҳ��Ӣ����ߴ��µķ�չ��Ŀ֮һ��ͬʱ�˵�����Ӣ���㲥��˾��BBC����Ӣ����������̨��ITV����Ҫ���ŵ����ڵء�

�����������´�ѧ��Ӣ��ý����ڿ�������ʮ���ű����Լ��о����γ̡��������´�ѧ����Ƭ�ҡ��ݲ����Լ����������ʩ��������ҵ��׼�����䱸��������ҵҪ�󣬿���δ�����¿Ƽ��ӹ졣ѧУ��Ŀ����������ѧ���ڿγ�֮�нӴ�����������ҵ�����ɵģ������򱨣��Խ���ʵս������','n5.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'�׶ع���ѧԺ��Ӣ������ϴ�ѧ֮һ ��������ǰ20','Ӣ������ϵ�������ѧ֮һ �ش��׶�������

�����׶ع���ѧԺ����1829�꣬��Ӣ������ϵ�������ѧ֮һ�������ڽ��š�ţ�򡣵ش��׶������ģ����׶ص��������ġ�����������಻Զ������λ����Խ����Ҳ���׶ش�ѧ�Ĵ�УѧԺ��ѧԺ����5��У����3��ҽԺ������Լ26,500��ѧ����2016�꽫����ó����ؿγ̣��������ʹ����ƿγ̡����������˶ʿ�γ̣�����ѧԺ������µ�ά��У������פ��ʲ���ã���һ������ѧԱ�Ĺ���������','n6.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017�꽭����¼7649������Ա 12�տ�ʼ����','2017�꽭��ʡ����Ա��¼��ʽ�������������磬ʡί��֯����ʡ��������ʡ����Ա�����Ͼ��е����ŷ������ϴ�����Ϣ��2017��ȫʡ�ƻ���¼7649������Ա�Ͳ��չ���λ������Ա����ȥ������261�ˣ����״��ó�29��ְλ������¼�м��ˡ������𣬿�¼ְλ�������Ϲ�����1��12�տ�ʼ���������깫��Ա��¼��Ҫ������仯��

�����仯һ����ȥ�����¼261��

����2017��ȫʡ�ƻ���¼7649������Ա�Ͳ��չ���λ������Ա����ȥ������261�ˡ����У�ʡ������243�����м�����1000�����أ��С�����������3648�������򣨽ֵ�������1991����ʡ���´�ֱ�������767��������ͳ�ƽ�����ʡ����¼�������֣����꽭�ռƻ���¼����Ա����ֻ�Ե���2013���7662�ˡ�

������������¼�ƻ����ӣ���Ҫ��3��ԭ�򡣡�ʡ����Ա�ֿ���¼�ô�����������˵�����ȣ�ȥ����ͨ��������һ���ι�����λ�����൥λ���ڹ�����Ա���������ϴ���Σ�һЩ��λ��Ȼ��Ա��������Ա��������Ŀǰ��ְ��Ա�Ѿ���������ʵ������������Ҫ������ѪҺ��������������������صĻ����λ����������ͬʱһЩ����������һ����е�������˶�������Ա��¼�ƻ��������ĸ���ɺ����»ָ���¼��

�����仯����29��ְλ�״ζ�����¼�м���

�����м������Ϊ����Ա�����Σ����Ҳ������ǽ���������������и���ĵ�λ��м��˳������š��˴�ʡ�������仯�ǣ�������ʡ�״ο�չ������¼�м��˹�����ȫʡ��������29��ְλ�ƻ���������в����˷��ĵڶ������л����񹲺͹��м���֤�����ҷ���ְλҪ��Ĳм���𡢵ȼ�����Ա����¼����һ�����ϲм��˾�ҵȨ�����ƽ���ʡ�м��˰�������ҵ������

�����仯�������ʱ���24Сʱ����48Сʱ

����Ϊȷ�����ϱ����ʸ���˹���������������¼���ظ��ӿ͹ۡ�������׼ȷ�ؿ�չ�ʸ���ˣ����꽫��¼������˹���ʱ���������24Сʱ�ӳ���48Сʱ������ʡ��������ʱ��һֱ������1��18�գ���ֻ����1��16��16��00֮ǰ�������ϱ���������ȷ�����ʸ����δͨ��ʱ�л���ı�����ְλ��������ԱӦ����ѡ��ְλ�������ϱ�����','n7.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'ѧУ��ֹѧ�����󣺴�ѧ��ʦ����ò��û��ص�','�人���̿Ƽ�ѧԺ�����Ž����߷ò�ͬ��У����ͬרҵ��100��ѧ�������ʾ���顣�����ʾ��75%��ѧ����Ϊ��ʦӦ�û��ص㡣������Ϊ�����ص����ø�ϰ����Ч����������ԣ�������֪ʶ���Ա���õر������ַ��������ѧ��ȴ˵����ֻҪƽʱ�������Σ���Ȼ����������Щ���ص��ˡ���

����������ѧ��ѧԺ��������Ρ�����ѧϵ�������쿡��˵�����Ѽ��10���ꡰ�����ص㡱�ˡ�������΢��ɹ������ѧ���ſ���ĩ�ĳɵĹҿ��ʣ���ѧ�����ں䡱����ʦ����ö����쿡�����ʾ������ǰ���ص�ֻ�ܻ�������Ư���ĳɼ�����������֤ʵѧ������ʵˮƽ����ˣ���һ�㲻���ѧ�����ص㡣��һ���棬����ѧУ������ģ�����Щƽʱ�Ͽ������ͬѧҲ����ƽ����һ���棬Ҳ��ϣ��ѧ������ƽʱע��ѧϰ�ͻ��ۣ�������ĩ��ʱ����š���

������Ȼ��Ҳ����ʦ��ʾ����������ص㣬��ĩѧ���������۾ͺ��ѿ��������ִ�����ҿƵ��������ʦѹ��Ҳ�ܴ�

������β��ܼ���ѧ���ԡ����ص㡱�������أ��е���ʦ�뵽���¿��˷�ʽ��������ѧ��������ӿ�ѧѧԺ�Ľ�ʦ����ƽ��ȡ����ĩ�����ѿ��ðᵽʵ���ң�������֪ʶ��Ϊ����ר�⣬ͨ��ƽ�����顢���ԡ����ʡ���ҵ�ȷ�ʽ������ѧ��������ѧ�����ڡ���ǰͶ�����Ľ�������','new9.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017�й���������ǿ��ѧ���а�','�ĸ���������2017��ȫ����ǿ�Ĵ�ѧ������ࣿ�������й�У�ѻ�����2017�й���ѧ�����о����桷���·���2017�й���������ѧ�ۺϾ��������а񣬱��������ա��Ϻ��������͹㶫����ǰ5ǿ��������ѧ(������,רҵ����)���廪��ѧ(������,רҵ����)���人��ѧ(������,רҵ����)�۾�2017�й���ѧ���а�ǰ3�ף�ȫ��16����211���̸�У����ȫ����ǿ������ʦ����ѧ�����ڴ�ѧ��ɽ����ѧ�۾�2017�й���211���̴�ѧ���а�ǰ3����ֵ�ù�ע���ǣ��㶫ʡ��˫һ�������辭��ͻ��250������ȫ������ݸ��ѧԺ����37.5�ڳ����Ӯ�ҡ�������У��ȫ�����ظߵȽ���������������ȫ����29���ط�������У����ȫ����ǿ���½������ɹš����ݡ����Ϻ����ĵȵ����޸�У����ȫ����ǿ���޳���211���̡����ָ������غ��ຣ�޸�У����ȫ��ǰ200ǿ��','new10.jpg',sysdate,2);
--forum����
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'�����桿�˺ŷ��Ա����ظ����޷�����뿴����','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
3,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'�����顿���ɰɰ�������ǩ����¥','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
2,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'���������ҹ�ͬ�ļ�԰���ط��ɷ��棬��������Э��','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
1,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'�ڰ�������ʽ���������ڲ����������ˢ�ظ������ᱻ����Ŷ','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
3,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'����˫����ͭ�����彨��������壬������Ѫ','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
2,sysdate);
--�ظ�
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',3,1,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',1,2,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',2,3,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'ͬ��',1,1,sysdate);


------���ͱ�------
insert into quetype(id , tname) values(seq_qtype.nextval , '��ѡ��');
insert into quetype(id , tname) values(seq_qtype.nextval , '��ѡ��');
insert into quetype(id , tname) values(seq_qtype.nextval , '�ж���');


------��Ŀ��------
insert into subject(id , sname) values(seq_sub.nextval , '���п���'); 
insert into subject(id , sname) values(seq_sub.nextval , '�ļ�����'); 
insert into subject(id , sname) values(seq_sub.nextval , '�������������'); 
---����ʱ��---
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-12-23','yyyy-mm-dd'),1);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-06-18','yyyy-mm-dd'),2);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-12-15','yyyy-mm-dd'),2);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-08-21','yyyy-mm-dd'),3);
--��
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'����ʷ��չ�ĽǶȿ����ʱ��������������������ǲ����ݽ��ͱ仯�ģ������ʱ���������������λ���ʱ���������ʽ�� ','�����ʱ������� ','˽���ʱ������� ','˽�˹ɷ��ʱ������� ','¢���ʱ�˽�������� ','A ','���⿼���֪ʶ�����ʱ���������ʽ',1,null,'�ڶ��������ս���ʱ����������Ʒ������µı仯������ǹ����ʱ���������ʽ�γɲ�������Ҫ���ã������ʱ����������𲢳�Ϊ��������λ���ʱ���������ʽ�����Դ�ѡA');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'���л����񹲺͹�������������������ɣ����ҹ������������嵽�������Ĺ���ʱ�ڡ���һʱ�ڣ����徭����������弯�徭�ù�����ʽ�� ','˽���ʱ����徭�� ','��Ӫ����','�����羭��','�����ʱ����徭��','C','���⿼����������������ж�ũҵ���ֹ�ҵ�ĸ�����ʽ',4,null,'���徭��ָ�ľ���ũҵ���ֹ�ҵ����ũҵ���ֹ�ҵ��ȡ���Ǻ����羭�õĹ�����ʽ���������ʱ����幤��ҵ��ȡ���ǹ����ʱ����徭�á����Ա�����ȷ����C��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'2016���ǡ�ʮ���塱�滮����֮�꣬Ҳ���ƽ�������ṹ�Ըĸ�Ĺ���֮�꣬�ƽ�������ṹ�Ըĸ�����Ӧ�ҹ����÷�չ�³�̬���ش���ߣ������Ŀ����()','��߹�������������Ҫ ','�ӿ�����ְ��ת�� ','��۸񡢲�˰�����ڡ��籣����������Ըĸ� ','�ƽ���ȥ���ܡ�ȥ��桢���ɱ������̰塱','A','�ƽ���ṹ�Ըĸ����Ӧ�����쾭�÷�չ�³�̬���ش���',4,null,'��ǰ�ͽ��һ��ʱ�ڣ��ҹ����÷�չ���ٵ����⣬�������������඼�У���ì�ܵ���Ҫ�����ڹ����ࡣ����Ѹ��ƹ�����ṹ��Ϊ��������ʵ���ɵ�ˮƽ����ƽ�����ˮƽ����ƽ��Ծ���������ξ���ѧ�Ƕȿ���������ṹ�Ըĸ�ĸ�������ʹ�ҹ������������������������������������������͸��Ի��������Ļ�����̬������Ҫ���Ӷ�ʵ�������������Ŀ�ġ���ˣ�������ȷ��ӦѡA�');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'Э���ƽ����ĸ�ȫ�桱ս�Բ��֣��ǵ�ʮ�˴������������ʵ�֡�����һ���ꡱ�ܶ�Ŀ�꣬ʵ���л�����ΰ���˵��й��ε�ս�Ը߶ȣ�ͳ����ڹ���������֣������ҹ���չ������ȷ�����ι������·��ԡ��ڡ��ĸ�ȫ�桱ս�Բ��־��������λ���ǣ��� ','ȫ����ĸ� ','ȫ�潨��С����� ','ȫ�������ι� ','ȫ������ε� ','B ','����ʮ�˴����������γ��ˡ�ȫ�潨��С����ᡢȫ����ĸȫ�������ι���ȫ������ε����ġ��ĸ�ȫ�桱��ս�Բ���',5,null,'��ȫ�潨��С����ᡱս�Բ��־��������λ���������ǵ�ȷ���ĵ�һ���ܶ�Ŀ�꣬Ҳ��ʵ���л�����ΰ���˵Ĺؼ�һ�������Ա���ѡB�ȫ�潨��С����ᡱ����������ȫ�涼��Χ����һĿ���ս�Ծٴ롣');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'���Ź�ҵ�������򻯵������ƽ�������ũ��ת���ũ��ҵ���ҹ�ũ��������ת���������ձ飬ũҵ��Ӫ��ʽ������̱仯������2016��6��ȫ����ͥ�а���Ӫ���������ת�ѳ���30%����ת����4��6��Ķ����ǰΪ���ӵ�����سа���ӪȨ���˲����ֵأ��ֵص�����û����ӦȨ����һͻ�����⣬�ҹ����ũ��ĸ﷽�������ش��ƶȴ����ǣ��� ','ʵ��ũ����������Ȩ���а�Ȩ����ӪȨ���� ','ʵ��ũ�弯�徭Ӫ�Խ����õ����� ','ʵ��ũ���ͥ�����а������� ','ʵ��ũ����ر����ƶ� ','A','�ĸ￪��֮������ũ��ʵ�м�ͥ�����а�������',1,null,'����������Ȩ�ͳа���ӪȨ���裬����Ȩ�鼯�壬�а���ӪȨ��ũ��������ص���������ũ������ԣ���Ч������±����⣬ũ��ĸ�ȡ���ش�ɹ����ֽ׶��ũ�������ƶȸĸ˳Ӧũ�������سа�Ȩ����ת���ؾ�ӪȨ����Ը�������سа���ӪȨ��Ϊ�а�Ȩ�;�ӪȨ��ʵ������Ȩ���а�Ȩ����ӪȨ���ò��У������ƽ�ũҵ�ִ������Ǽ̼�ͥ�����а������ƺ�ũ��ĸ���һ�ش��ƶȴ��¡�����Ȩ���á���ũ�������Ӫ�ƶȵ��������ƺͷ�չ����ˣ�������ȷ��ѡA�ʵ��ũ����������Ȩ���а�Ȩ����ӪȨ���á��� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'�۹����������й�������Ŀ����Ҫ�Ϸ��й��������й���1895���й��ڼ���ս����ս�ܺ���ǿ�����˹Ϸ��й��Ŀ񳱣��⼯�б����ڣ���','������ȫ�������ֱ�ӿ��ƺ�ͳ�ε����','����������ͻ���������Χ','����ʱ��������й�������ҵ������¢�ϵ�λ','����ռ�й����ڹ���չ����ʳ�й��߽�����','B','�۹�������ǿ���й�������͹Ϸֵ�ͼı����1894�����ռ���ս��������ﵽ�߳�',2,null,'�����������Լ����ǩ���������̼��˵۹�������ǿ�Ϸ��й�������Ұ�ģ�����������ǿ�����й���ì�ܡ���������¹��������滹�ɣ�Ҫ������й�������Ϊ���ꡣ�ɴˣ��¡���Ӣ�������յȹ���1898����1899�꾺��������ͻ���������Χ�������˹Ϸ��й��ſ񳱡���ˣ������ѡB��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'��һ�������ս���¹�ս�ܡ�1918��12�£��¶����ڡ�ÿ�����ۡ���ķ�������˵��ս����ǡ�����սʤǿȨ��������������ͳ����ѷ���������������һ���ˡ���Ȼ���¶�����1919��5��4�ճ���ġ�ÿ�����ۡ��ϵ�һƬ��������д����ʲô����ʲô���ú�ƽ��ʲô����ѷ��ͳʮ�������ԣ����������ʲ�ֵ�Ŀջ��������³¶�����ʶ�����仯��ֱ��ԭ���ǣ���','������Ը�����ڻ�������Ȩ','�ձ��Ե���ս������ɽ��','�ն������ϳ���ǰͬ�й�ǩ����һ�в�ƽ����Լ','�й��ڰ���ͻ��ϵ��⽻ʧ��','D','���⿼����������˶��ı�����',3,null,'����г¶��㹥�������Ǽٹ������ҽ��ǰ��ġ�����սʤǿȨ�������ԣ������ǰ���ͻ����й��⽻��ʧ�ܣ�������Ϊ�׵���ǿҪ�й��ں�Լ��ǩ�ֳ����ձ���ɽ���ൺ����ĺϷ����� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'ĳ�������빩ů���󳣳�����������һ�����ִ��������ȵ���ů�����������ͻ�ɢȥ���٣��Ӹõ����ϳ�ʱ������ݱ仯������������Ŭ����������Ⱦ���ŷ������ڳ����ߵͣ�����ĳЩʱ�Σ���������������Ⱦָ����Ѹ������������"����"�����ֿ���"ì��"������͹���˴�����Ⱦ���ε�һ���ص㣺���æ����Ҫ������Ŭ�����Ǹ�����"��Ŭ��"��"���æ"֮��Ĺ�ϵ�����Ǵ��������ܶ��ԺͿ͹۹���֮���֤��ϵ����ʾ�ǣ�','��������ʶ��˼�������տ͹۹��ɵĸ���ǰ�� ','����ʳ��Ŀ͹۹�������ȷ���������ܶ��Ե�ǰ�� ','��ʶ��ǿ͹۹������������ܶ�����ͳһ�Ļ���','��δ��ʶ��������Ȼ���ɶ��˵�ʵ�������������Ҫ������ ','B','�����ܶ��ԺͿ͹۹��ɵı�֤��ϵ',2,NULL,'���ؿ͹۹�������ȷ���������ܶ��Ե�ǰ�ᣬ����ֻ������ʶ�����տ͹۹��ɵĻ����ϣ����ܴﵽ��ʶ����͸��������Ŀ�ġ�A��C��������D���������⣬���Դ�ѡB��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'������Ϊ����Ȼ�˵���ʶ�ǶԿ͹��ⲿ����ķ�ӳ����ô������ġ�����������ʶ���Ƕ��������������ʵ���ڵķ�ӳ�����ֹ���������� ','����ʶ���������ʵĲ���','�������ʶ���ܶ�����','��Ϊ��ʶ�ǶԴ��ڵ�ֱ�ӷ�ӳ','������������ʶ��Ȼ�ݻ��Ľ׶�','C','���⿼���֪ʶ������ʶ��',2,null,'������ġ�����������ʶ�Ƕ��ⲿ�����������ӳ������Ŀ�еĹ�����Ϊ������ġ�����������ʶ�Ƕ��ⲿ��������ʵ���ڵķ�ӳ�����ַ�ӳ��ֱ�ӵķ�ӳ�������Ĺ����Ǵ���ģ����Դ�ѡC��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'ĳ��ҵͶ����������������һ���������ķѵ��������ϼ�ֵΪ15��Ԫ��֧�������˵Ĺ���Ϊ5��Ԫ���ٶ��г���ƽ������Ϊ10%����ô�������ɾ��������£��������������۸���','20��5��Ԫ','20��Ԫ','21��5��Ԫ','22��Ԫ','D','���⿼���֪ʶ���������۸�',3,null,'������ó��������ʱ�cΪ15��Ԫ���ɱ��ʱ�vΪ5��Ԫ��ƽ����������ʣ���ֵ��ȫ��Ԥ���ʱ��ı��ʣ���˵ó�ʣ���ֵm��2��Ԫ���������۸�=c+v+m=15+5+2=22�����Դ�ѡD��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'��һ�������ս���¹�ս�ܡ�1918��12�£��¶����ڡ�ÿ�����ۡ���ķ�������˵��ս����ǡ�����սʤǿȨ��������������ͳ����ѷ���������������һ���ˡ���Ȼ���¶�����1919��5��4�ճ���ġ�ÿ�����ۡ��ϵ�һƬ��������д����ʲô����ʲô���ú�ƽ��ʲô����ѷ��ͳʮ�������ԣ����������ʲ�ֵ�Ŀջ��������³¶�����ʶ�����仯��ֱ��ԭ���ǣ���','������Ը�����ڻ�������Ȩ','�ձ��Ե���ս������ɽ��','�ն������ϳ���ǰͬ�й�ǩ����һ�в�ƽ����Լ','�й��ڰ���ͻ��ϵ��⽻ʧ��','D','���⿼����������˶��ı�����',5,null,'����г¶��㹥�������Ǽٹ������ҽ��ǰ��ġ�����սʤǿȨ�������ԣ������ǰ���ͻ����й��⽻��ʧ�ܣ�������Ϊ�׵���ǿҪ�й��ں�Լ��ǩ�ֳ����ձ���ɽ���ൺ����ĺϷ����� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'ë��˼�������˼�����й����ĵ�һ�����۳ɹ��������й������ͽ����ʵ�������γɺͷ�չ�����ģ������ظ���ս�����ںͿ���ս��ʱ�ڣ�ë��˼��õ��෽��չ�����ﵽ���죬���־�ǣ��� ','˼�����ι������Ļ��������۵�ϵͳ���','��������������۵�ϵͳ����','��������ר�����۵���������','ũ���Χ���к���װ����Ȩ���۵Ŀ�ѧ����','B','���⿼�����������������������Ĺ���',4,null,'����2017������֪ʶ�㣬���������ע����������֪ʶ��Ӧ����ѡ������');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'1947��6�µף������й�����ľ��ߺͲ��������С���Сƽ����Ľ���³ԥҰս��������ʵʩ����ͻ�ƣ�ǧ��Ծ�����ɽ�����㡢��ԣָ�ӵĻ���Ұս������Ϊ��·��ͦ��³ԥ����������١�л����ָ�ӵĽ���³ԥҰս��һ·Ϊ��·��ͦ��ԥ���������������໥��Ӱ���������ƣ���ʹ���񵳴��ڱ�����λ����˵������','�����ž����������Ѿ��������񵳾���','�����ž���·��������Ļ�ɴ˽ҿ�','�����ž�ͬ���񵳾��ӽ���ս�ԶԾ���ʱ���Ѿ�����','�����ž�����ս����ֽ׶�','B','���⿼����Ƕ��ڽ��ս�����̵��˽�',2,null,'���ս����Ϊս�Է�����ս�Խ�����ս�Ծ�ս�����׶Σ�ѹ��û��ս����ֽ׶Σ������ų�Dѡ�������ս�Է���ת��ս�Խ�������·�����������Ϊ��־,ս�Ծ�սʱ�Զɽ�ս�ۡ�����ս�ۺͻ���ս��Ϊ��־������Cѡ���ų������ڽ�����ʱ�������ž���������û�г������񵳾��ӡ�');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'��������֪����к���־���л�ͳһ�壬��������һ������֪������ȷ���Ķ�ĳ��˼�����������Ų��ɲ��������е�����̬�Ⱥ;���״̬������������׷������Ŀ���ǿ������������ҵ�ĳɰܣ������в�ͬ�Ĳ�κ����ͣ����У��� ','�߲�ε���������Ͳ�ε�����','�Ͳ�ε����������һ���˵Ļ�������','��ͬ��ỷ�����������������ʼ��һ��','��������û�п�ѧ��ǿ�ѧ֮��','A','����',4,null,'���Ų�ͬ�Ĳ�κ����ͣ��߲�ε���������ŵͲ�ε�����Ͳ�ε���������ڸ߲�ε������ѡA ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'���������ļ�ֵ��Ϊ����ȷ����ʵ��������ֵ�ṩ�˻�����ѭ��������ֵ������Ҫ�ǿ�һ���˵�������Ƿ�������Ŀ͹۹��ɣ������۵ĸ����߶��� ','��ʷ��׼','���ñ�׼','���α�׼','�Ļ���׼','A','������ֵ���۵ĸ����߶�',4,null,'�ǿ�һ���˵�������Ƿ������ᷢչ�Ŀ͹۹��ɣ��Ƿ�ͨ��ʵ���ٽ�����ʷ�Ľ������ʴ���A��ʷ��׼��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'��΢���ķŴ������ͳ����������������������ϸ������֪Ҳ��֮��̺�ȫ�档20������Ҷ����ѧ��������X���߾���ѧ������DNA��˫�����ṹ��������Ĺ۲켫�޴���ϸ���ṹ�����˷��ӽṹ���ҹ���ѧ���ǵ���Ҫ���гɹ���������ĸ߷ֱ����ά�ṹ�ı���Ҳվ��һ��ĬĬ���ŵ�Ӣ�ۡ����䶳������΢�������������ѧ�����е����ñ������� ','̽��δ֪����Ŀ�ѧʵ���������������ʵ���','ʵ��������Ϳ������������н�ϵͳ���ܹ��໥����','������ʶˮƽ�������ʵ�������Ľ�����ֱ�ӵĹ�ϵ','���塢������н������л�ͳһ���ɵ�ʵ���Ļ����ṹ','BCD','ʵ��',2,null,'����У�������ֲ��ϸ���ķ��ֻ���DNA�ķ��֣����ǽ�������΢��ʵ�ֵģ����ԣ�ʵ��������Ϳ������������н�ϵͳ���ܹ��໥���ã�Ҳ˵��������ʶˮƽ�������ʵ�������Ľ�����ֱ�ӵĹ�ϵ������ѧ�ķ�չʷ��Ҳ˵��ʵ�������һ�������塢�н�Ϳ���Ϊ�����ǼܵĶ�̬�ķ�չϵͳ��ѡ��A˵��������������ʵ���������������ʵ�������ˣ��������ȷ����ѡ��BCD��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'Ψ��ʷ���ڼ������Ⱥ������ʷ�Ĵ�������һ����ǰ���£��߶����Ӹ�������ʷ�ϵ����á���ʷ������һ����ʷ�¼�����Ҫ�����ߡ���֯�쵼�߻�˼�����ۡ���ѧ�Ļ�����Ҫ����������й�����ʷ�������õ���ȷ��ʶ�� ','��ʷ�������ʷ��չ�����ö��ǻ�����','��ʷ����������ǻۡ��Ը�����ض������̷���Ӱ��','���н����������ʷ���������ܹ����ȷ��ֻ������ʷ�������µ���ʷ����','��ʷ�������۷���ʲô������ʷ���ö����ܾ����͸ı���ʷ��չ���ܽ��̺��ܷ���','BCD','��ʷ�����Ӱ��',3,null,'��ʷ��������������������ǻۡ��Ը�����ض����ľ�����̲���һ���Ļ���ٻ��ӻ���Ӱ�죬����ʷ����ı䲻����ʷ��չ�Ļ������򣬾��н����������ʷ���������ܹ����ֻ������ʷ�����е��µ���ʷ������ʷ���ﰴ���������ʿ��Է�Ϊ�ܳ�����ͷ���������нܳ��������ʷ��չ���ƶ����ã�����ѡ��A˵��������ˣ��������ȷ����ѡ��BCD��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'���˼ָ������ν�ʱ�ԭʼ����ֻ�����������ߺ��������Ϸ������ʷ���̡�����������Ա���Ϊ��ԭʼ�ġ�����Ϊ���γ��ʱ�����֮����Ӧ��������ʽ��ǰʷ���ʱ�ԭʼ���۵���Ҫ;���У��� ','�ñ����ֶΰ���ũ������ ','�ð����ֶ�եȡʣ���ֵ ','��Ұ���ֶν���ֳ���Ӷ�','���ʱ��ֶλ�ȡ�г�����','AC','�ʱ�ԭʼ����',5,null,'��������������������룬�����ʱ�Ѹ�ټ��������������е���ʷ���̡��ʱ�ԭʼ������Ҫ��ͨ������;�����еģ�һ���ñ����ֶΰ���ũ������أ������ñ����ֶ��Ӷ���ҲƸ�����ˣ��������ȷ����ѡ��AC��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'���������������¿Ƽ������Ͳ�ҵ�����Ľ���㣬�Ի����˼���Ϊ����ĿƼ���ҵ��չʮ��Ѹ�١������������������еĹ㷺ʹ�ã�ʹ�ʱ��л����ɲ�����ߡ�Ȼ������һ��������ԣ��ʱ��л����ɵ����ʵ������ ','���ʱ��ı��Ծ�����','�����˵���־Ϊת�Ƶ�һ������ ','��������Թ�ʣ�˿ڵ�һ����Ҫԭ��','һ����������Ƹ�������ƶ���ĸ���;��','ABC','���ʱ��������������У��ʱ��л����ɳ��ֲ���������ƣ��������ʱ�����׷��ʣ���ֵ�ı��Ծ�����',2,null,'�ʱ���ͨ���ʱ����ۺ��ʱ���������������ģ��ʹ�ʱ��л����ɲ�����ߡ��ʱ��л�������ߣ��ɱ��ʱ���������٣��ʱ����Ͷ���������������Եؼ��٣�����Ͳ��ɱ������ɴ�������ʧҵ���γ���Թ�ʣ�˿ڡ�ѡ��D˵��������ˣ��������ȷ����ѡ��ABC��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'1921��3�£����������ٿ�ʮ�󣬾�����սʱ�����������߹��ȵ��¾������ߡ���ʵʩ�¾��������ڼ䣬��������ά�������ν�����������������̵�����˼�����������ྫ�ٵ������������ݰ��� ','���������ʱ������������������','�ѽ������������Ϊһ������̽��������ʵ���Ĺ���','�Ѵ�����չ������������Ͷ������ʷ�����Ҫ��λ','������־��óɷֲ��棬����������Ʒ�����Һ��г���չ����','ABCD','�ڶ������������ȡ��ʤ���ĳ���',5,null,'�ر���ʵ���¾��������ڼ䣬��������ά�������ν�����������������̵�����˼�����������ྫ�ٵ��������ѽ������������Ϊһ������̽��������ʵ���Ĺ��̡��Ѵ�����չ������������Ͷ������ʷ�����Ҫ��λ���ڶ��־��óɷֲ���������£�������Ʒ�����Һ��г���չ���á������ʱ����壬����������塣��ˣ�ѡ��ABCD����ȷ��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'��һ��һ·������������������Ѿ���100������Һ͹�����֯�������У��ҹ�ͬ����30�������ǩ�𹲽�����Э�飬��20������ҿ�չ�˹��ʲ��ܺ�����һ����Ӱ�����ı�־����Ŀ����ء���ֹ2016��7�£��ҹ��ԡ�һ��һ·����ع��ҵ�Ͷ���ۼ��Ѵ�511����Ԫ��ռͬ�ڶ���ֱ��Ͷ���ܶ��12%�������߹�����ǩ�а����̺�ͬ1��25��ݣ��ۼƺ�ͬ��2790����Ԫ���ҹ��ƽ���һ��һ·������ּ�� ','ͳ����ڹ����������','���쿪�š����ݡ����⡢�ջݵ����򾭼ú����ܹ�','�ٽ����߸�����ͬ����','̽�����ʺ�����ȫ��������ģʽ','ABCD','һ��һ·',3,null,'�ҹ����ƽ���һ��һ·������Ĺ����У�����һ�֡�������¡��Ĵ���󻳣����һ����������ͨ��������������������һ�֡����š��������й�������ԣ������ɣ�������ȷ��ӦѡABCD�� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'2016��7������������½���ɳ������������פ���ؽ����ֳ����飬������һ���µ���������籩���������飬�ӻ�������ǣͷ���������������Բ���ҵΪ��ת��Ϊ ���鶽���٣��Զ���Ϊ�����������ҹ��������ģʽ���ش����������̬�����ƶ���ϵ����Ҫ�ٴ롣�����������鹤������������ ','������������г��Ĺ�ϵ','ǿ���쵼���κͼ������','��ʵ����������������','�����쵼�ɲ�Ŀ�����ο����ƶ�','ABCD','�ҹ�����һ���µ���������籩',3,null,'�ӻ�������ǣͷ���������������Բ���ҵΪ��ת��Ϊ���鶽���٣��Զ���Ϊ������������A����������г��Ĺ�ϵ�������������鹤��������������ʵ���������������Σ�Ҳ������ǿ���쵼���κͼල���Σ�ͬʱҲ�������쵼�ɲ�Ŀ�����ο����ƶȡ���˱�����ȷ����ABCD ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'����ʮ�˽�����ȫ����������¡�Э������ɫ�����š��������·�չ����Ѵ�����Ϊ���췢չ�ĵ�һ����������һ�·�չ����Ѵ�����Ϊ���췢չ�ĵ�һ����������һ�·�չ�����ָ���£�2016��5�µ�����͹���Ժ�䲼�ˡ����Ҵ���������չս�Ը�Ҫ�����Ѵ�����Ϊ���췢չ�ĵ�һ������ ','�������緢չ���̺��ܽ����Ǹĸ￪��ʵ���ó��Ľ���','���쾭�÷�չ�³�̬�ĸ���֮��','������г��������Ҫ��','��ߺ��ľ������ı�Ȼѡ��','ABD','���⿼�����ʵʩ����������չս�Ե�����',3,null,'��ô��ȷѡ������֮����������ϵ��������г����봴��������չս�ԵĹ�ϵ�������Բ�ѡ����������ѡ�����ȷ��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'���൳���������������ǵ���������ͳ���������ƣ�Ҳ��ȫ������ε��Ļ���������ʮ�˽�����ȫ������ͨ���ˡ������������µ����������������׼�򡷺͡��й����������ڼල��������������������¼�ǿ�͹淶���������������Ҫ������Ҫ������ ','������ǿ������������������ԡ�ʱ���ԡ�ԭ���Ժ�ս����','������ߵ����쵼ˮƽ��ִ��ˮƽ����ǿ�ܸ�����͵�����������','������ǿ�����Ҿ������������ơ����Ҹ��¡������������','����ά��������Ȩ������֤�����Ž�ͳһ�����ֵ����Ƚ��Ժʹ�����','ABCD','���⿼����ʮ�˽�����ȫ��ı���',3,null,'���������¼�ǿ�͹淶���������������Ҫ���漰��ABCDȫѡ�� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'�ڰ�ֳ��ذ�⽨���������£��й��������ڶ����Ļ�������������������������ʱ�-�۹�������ǿͬ�й��������ù�ϵ������Ϊ���ƶ��й����õķ�չ������Ϊ�˿����й��ľ��á���ǿ�����й����õķ�ʽ�У�','���й������������������ѧ','�����й��Ĺ�˰����˰','���й���������','�����й��Ľ�ͨ����ҵ','BCD','���⿼������ǿ�����й����õķ�ʽ',4,null,'�����漰�����Ǿ��÷��档BCD���Ǿ��÷���Ĵ�ʩ��A���Ǿ��÷��棬���Ļ����棬�����ų������������ѡ���ȷ����BCD��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'����ɽ������ΰ�������Ӣ�ۡ�ΰ��İ��������ߡ��й�����������ΰ��������һ���Ը���Ϊ���Σ���־�ȹ�����Ϊ�й����������˱��ʷ��Ĺ��ס�����ɽ������ΰ������� ','�쵼����������','���½������������岢�������������������ũ����������','���������Ʒ��������ͳ��ΪĿ��ı���ս��','�ᶨά�����������ƶȺ͹�������ͳһ ','ABD','���⿼���������ɽ����Ϊ�л������ΰ���ס�',1,null,'����ϰ��ƽ��������ɽ����150���꣬����ABD��������ȷѡ�����ս����1926��-1927�꣬������ɽ����1925��ֲ���ھ������ˣ����Բ���ѡC��');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'1978��12��18�յ�22�գ�����ʮһ������ȫ���ڱ����ٿ����������Ҫ������ȷ����ȫ�������ص�ת�Ƶ���������ִ����������������ȫ�������й���������������ʷ�Ͼ�����Զ�����ΰ��ת�ۡ�ȫ������˷��顰���˰�����굳�͹��ҹ������ǻ���ǰ���ľ��棬��־���й������� ','����ȷ�������˼�����˼��·�ߡ�����·�ߡ���֯·��','�γ����Ե�СƽΪ���ĵĵ��������쵼����','��ʼ����˼�롢���Ρ���֯�������ȫ�沦�ҷ���','�⿪���������ĸ￪�ŵ���Ļ ','ABCD','���⿼�����ʮһ������ȫ������壬',1,null,'����ʷ�ٵ�ʮ�¸ĸ￪������������ִ����������ʱ�ڣ�ABCD������ȷ�𰸡� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'�ҹ������Ļ����ƾõ���ʷ�ʹ��У��ݡ�˵�Ľ��֡����ͣ������С������Ĺ����ǡ���������������Ҳ��ƽ֮��ˮ����ˮ��ӥ�����Դ���ֱ��ȥ֮����ȥ�����ڹŴ�����������Ҫ����Ϊ���̡������ɡ������̡�������¾������֮�⣬Ҳ�й淶֮�⣻��ӥ��Ҳ�ơ�������������еĶ����ޣ��������������ƶ��Ƿ���ֱ���������ϱ������ڴ�ͳ�Ļ������ǶԷ��ɵ����������� ','���������˾�Ȩ���ڵ�˼��','���ɾ����������ϵĵ�λ','���ɸ����Ź�ƽ��ˮ��������ʥ���������','���ɼ����ųͶ����ơ��������ļ�ֵ׷��','CD','���ɵ�����',5,null,'����У����̡�����¾���淶֮�⣬˵�����ɼ����ųͶ����ơ��������ļ�ֵ׷������У��������������ƶ��Ƿ���ֱ�����ޣ�˵�����ɸ����Ź�ƽ�������ʥ���̡��й��⽨����ǵ��͵�����˼ά������Ϊ��ߵ�Ȩ���Ǹ��˶����Ƿ��ɣ����ԣ�ѡ��B����ѡ��A�������޹ء���ˣ��������ȷ����CD�� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'���������еĸ���Ȩ��������Ȩ��������ͻ�������⣬����ѧ�����������˿��飬������Ϣ������Ҫ�����֡����Խ��Ȩ����ͻҪ����ȷ����ʶ����Ȼÿ���˶������¸���Ȩ�������ɣ���ҲҪ��������Ȩ����������Ϊ ','��������Ȩ������һ�������Ҳ��һ���������','��������Ȩ���ǹ�����ʶ����Ҫ����','Ȩ��ʵ�ֵ����ڶ��������Ǳ˴�֮��Ը���Ȩ�����໥����','����������Ȩ�����Ϳ���ɥʧ�Լ���Ȩ��','ABCD','��Ȼÿ���˶�����ʹ����Ȩ��������',2,null,'��ҲҪ�������˵�Ȩ������ΪȨ��ʵ�ֵ����ڶ��������Ǳ˴�֮��Ը���Ȩ�����໥���أ���ͬ��Ȩ����������������������Ȩ��ʵ�ֵı�֤��ֻ����������Ȩ��,ÿ��Ȩ���˲���������ò�����ʵ������Ȩ������������Ȩ���ǹ���Ȩ����ʶ����Ҫ���ݣ���������Ȩ������һ�������Ҳ��һ���������ÿ��������Ȩ����ʵ�ֶ���Ҫ���˵�Э������Ҫ���˵����أ������κ�����Ȩ�����޷�ʵ�֣�����������Ȩ�����ͻ�ɥʧ�Լ���Ȩ������ˣ��������ȷ����ѡ��ABCD�� ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'�й������ž�ս�����������2016��2��1���ڱ���¡�ؾ��С��й���������ǡ�������ϯ�������ί��ϯϰ��ƽ�򶫲�ս�����ϲ�ս��������ս��������ս�����в�ս��������첢����ѵ��������ս�����齨ս��������սָ�ӻ�����','�����Ҿ�������ս��ϵ����ʷ�Է�չ','Ϊʵ���й���ǿ����������ս�Ծ���','��ǿ���ʾ��º����뽻�����ش���','ȫ��ʵʩ�ĸ�ǿ��ս�Եı�־�Ծٴ�','ABD','2016��2��1�գ��й������ž�ս����������ڱ�����һ��¥¡�ؾ���',3,null,'�й���������ǡ�������ϯ�������ί��ϯ ϰ��ƽ�򶫲�ս�����ϲ�ս��������ս��������ս�����в�ս��������첢����ѵ�ǿ����������ս�����ϲ�ս��������ս��������ս�����в�ս�����齨ս��������սָ�ӻ������ǵ�����������ί����ʵ���й���ǿ���������� ս�Ծ��ߣ���ȫ��ʵʩ�ĸ�ǿ��ս�Եı�־�Ծٴ룬�ǹ����Ҿ�������ս��ϵ����ʷ�Խ�չ����ȷ���Ҿ��ܴ��̡���ʤ�̣���Чά�����Ұ�ȫ�������ش����Զ�����塣C���ʽ������������齨ս��������սָ�ӻ����ĳ����㡣�ʣ�����ѡABD��');

------��ѡ���------
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 1 , 1 , '��������������һ��Ԣ�ԣ���һ�����˵����˼�ȥ���ͣ����Ӳ�û��ζ�������˾͸������˵��Ρ�����������Ժ�ζ���ü��ˣ����˾��룺����֮��������������Ϊ�����Σ���һ�����������������Ӹ���������Ǹ��Ӻóԣ����ؼ��Ժ�����һ���ηŽ��������ֿ����̣�����Ԣ�Ը����ǵ���ʾ��' ,
'������������������﷢���ʵı仯' , '����ʶ�ʹ�������ʱҪ�����ʶȵ�ԭ��' , '������ķ�չ������Ҫʱʱע����������ҷ�' , '������ͨ��һЩ�����ȥ��ʶĳ������ı���' , 'B' , '��ʶ�ʹ�������Ҫ���ʵ�' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 1 , 1 , '��һ�ֹ۵���Ϊ�������ɲ����ڻ����а�����Ȼ���ɶ���������������֪��Щ���ɣ��Ӷ��ܹ��мƻ���ʹ��Ȼ����Ϊһ����Ŀ�ķ��񡱡�����һ�ֹ۵���Ϊ���������ɡ����������ǡ����ԡ�����ˡ����ɡ����ڡ����ԡ��������ԡ����������������������ֹ������ɵĹ۵㣺ǰ���ǣ�   ���Ĺ۵㣬�����ǣ�   ���Ĺ۵�' ,
'Ψ���֤��/Ψ��־��' , '��еΨ������/Ψ������' , '��ʷΨ������/��ʷΨ������' , '����Ψ������/Ψ���֤��' , 'A' , 'Ψ���֤��˵�ľ����������Ψ���֤��˵�ľ����������Ψ���֤��˵�ľ����������' , 2 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 2 , 1 , 'With the _______of Mary, all the girl students are eager to go to the party.' , 
'exhibition' , 'exception' , 'except' , 'reception' , 'B' , 'except���÷�except���÷���except���÷���except���÷�except���÷���except���÷���except���÷���' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 2 , 1 , 'This river is so big that it is impossible to build a _______ under it without modern technology.' , 
'canal' , 'tunnel' , 'channel' , 'cable' , 'B' , 'tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�tunnel���÷�' , 2 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 3 , 1 , '��������ͼ�д��м�ͷ���߶α�ʾ����' ,
'ͼԪ��ϵ' , ' ������ ' , '������' , '���ù�ϵ ' , 'C' , '��������ͼ�д��м�ͷ���߶α�ʾ���ǿ�����,��������ͼ�д��м�ͷ���߶α�ʾ���ǿ�����,��������ͼ�д��м�ͷ���߶α�ʾ���ǿ�����,��������ͼ�д��м�ͷ���߶α�ʾ���ǿ�����,' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 3 , 1 , '�ṹ��������ƵĻ���ԭ�򲻰���' ,
'��̬��' , '�Զ�����' , 'ģ�黯' , '����' , 'A' , '�ṹ��������ƵĻ���ԭ�򲻰�����̬��,�ṹ��������ƵĻ���ԭ�򲻰�����̬��,�ṹ��������ƵĻ���ԭ�򲻰�����̬��,�ṹ��������ƵĻ���ԭ�򲻰�����̬��,�ṹ��������ƵĻ���ԭ�򲻰�����̬��' , 2 , null);
------��ѡ���------
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 2 , '��΢��Ӱ��һ��ʹ������������΢����һ���������޷�����ı걾�ļ�����������ǧƪһ�ɵ�ϸɳ������΢���£�ȴ�ǡ�һɳһ���硱���еľ�Ө��͸��ʯ���еĽ���ִ�����ɣ���ʹ��˾�ռ��ߵĲ������Σ�����΢����Ҳ��չ�������������������һ�档��΢���µġ�һɳһ���硱����' ,
'�κ����ﶼ�������޶���������' , '����ı����������ǵ���ʶ�仯���ı�' , '�����ܹ�͸���Ը����������ʶ���ﵽ����������İ���' , '���ǿ���ͨ�������ʹ�ù���������Կ͹��������ʶ' , 'ACD' , 
'�κ����ﶼ���ǲ���ģ��κ����ﶼ���ǲ���ģ��κ����ﶼ���ǲ���ģ��κ����ﶼ���ǲ���ģ��κ����ﶼ���ǲ���ģ����κ����ﶼ���ǲ����' , 1 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 2 , '�Ƴ�ʫ�������顶��������ҹ���У����������������ѣ���������ֻ���ơ�����ʫ�̺���ʱ��һά�Ե���������ʫ�����̺���ͬ�������' , 
'����̶Ӱ�����ƣ��ﻻ���Ƽ�����' , '��������ֱ���ۣ�Ī���޻�����֦' , '�ڷ���֪��ѧ�磬���׷��ڶ����' , 'Ϫ�Ƴ����ճ���ɽ����������¥' , 'ABC' , 
'ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼�����ԣ�ʫ����˼������ʫ����˼�����ԣ�ʫ����˼������' , 2 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 2 , 'What are the several steps of Savings deposits? ' ,
'open an account' , 'deposit money' , 'transfer money' , 'settlement' , 'AB' , 'several steps,several steps,several steps,several stepsseveral steps,several stepsseveral steps,' ,1 ,null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 2 , 'Bank is internal audit departments () periodically review the rating system and its banking operations, the prosecution trial included____.' , 
' Operation of the credit sector. ' , ' Probability of default.' , 'LGD(loss given default). ' , 'Default risk exposure. ' , 'ABCD' , 'periodically review,periodically reviewperiodically review,periodically review,periodically ' , 2 ,null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 2 , '�����û���ʶ�������кϷ����ǣ�����' ,
'return ' , 'f2_G3' , 'A3-3' , 'abc' , 'BD' , 'AC����ȷ��AC����ȷAC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ��AC����ȷ' , 1 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 2 , '������������ȷ���ǣ�����' , 'һ��CԴ�������һ�������������' , 'һ��CԴ����������һ��main()����' , 'CԴ����Ļ�����ɵ�λ�Ǻ���' , '��CԴ�����У�ע��˵��ֻ��λ��һ���������' , 
'ABC' , 'D����ȷ��D����ȷ��D����ȷD����ȷD����ȷ��D����ȷ��D����ȷ��D����ȷD����ȷD����ȷD����ȷD����ȷD����ȷD����ȷ��' , 2 , null);
------�ж����------
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 3 , '�������������ҹ����ú���ᷢչ���ֳ�һϵ���µĽ׶������������ǣ���Щ�µĽ׶��������ĳ��ֲ�û�иı��ҹ��Դ��������������׶���һ������ʵ������������������׶��ǳ�������׶���ͳһ�Ķ�̬��չ����' , 
'T' , '��������׶���ͳһ�Ķ�̬��չ���̣���������׶���ͳһ�Ķ�̬��չ���̳�������׶���ͳһ�Ķ�̬��չ���̳�������׶���ͳһ�Ķ�̬��չ���̡�' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 3 , '����������������ʮ������ͨ��ʵ���������������ƶȣ�����������������ƶ������ԣ���ӷ�����򿪷ţ�����ƶ�ʵ������ʷ�ԵĿ�Խ����������أ�����ȶ������÷�չ���������ơ���̬��ã�������ɼ�׿Խ��ʵ��֤�����������������ƶ����ʺ���������ص㣬�����й���ɫ��һ����������ƶȣ������������εĺ����Ǳ����������嵱���������������屾�ط������Ȩ��' ,
'T' , '�����������嵱���������������屾�ط������Ȩ�������������嵱���������������屾�ط������Ȩ�������������嵱���������������屾�ط������Ȩ��' , 2 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 3 , 'In all G-10 countries, the minimum ratios for Tier 1 and Total capital are 6% and 10%, respectively.' , 
'F' , 'In all G-10 countries, the minimum ratios for Tier 1 and Total capital are 6% and 20%, respectively.' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 3 , 'The Basel I minimum Tier 1 and Tier 2 capital ratios are each 4%. ' ,
'F' , 'The Basel I minimum Tier 1 and Tier 2 capital ratios are each 20%.' , 2 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 3 , 'Word2010�������ĳ����ʽ�����޸ģ��ɵ������ѡ��еġ�������ʽ����ť��' , '��' , 
'����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ������Ǵ�ģ�����Ǵ������Ǵ�ģ�����Ǵ������Ǵ��' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 3 , 'ͼƬ���ü��󣬱��ü��Ĳ�������ΪͼƬ�ļ���һ���ֱ��������ĵ��С�' , '��' , '����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ�ģ�����Ǵ������Ǵ�ģ�����Ǵ������Ǵ�ģ�����Ǵ������Ǵ��' , 2 ,null);


--֪ʶ��--
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '�ߵ���ѧ1' , '֪ʶ��1������' ,1);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '����' , '֪ʶ��2������' ,1);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '�﷨' , '֪ʶ��3������' ,2);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '����Ӿ�' , '֪ʶ��4������' ,2);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, 'word����' , '֪ʶ��5������' ,3);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, 'VC++' , '֪ʶ��6������' ,3);
--֪ʶ������Զ�

insert into qprelation(pid , qid) values(2, 1);
insert into qprelation(pid , qid) values(1, 2);
insert into qprelation(pid , qid) values(2, 3);
insert into qprelation(pid , qid) values(2, 4);
insert into qprelation(pid , qid) values(2, 5);
insert into qprelation(pid , qid) values(1, 6);
insert into qprelation(pid , qid) values(2, 7);
insert into qprelation(pid , qid) values(2, 8);
---forum---
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'�����桿�˺ŷ��Ա����ظ����޷�����뿴����','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
3,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'�����顿���ɰɰ�������ǩ����¥','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
1,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'���������ҹ�ͬ�ļ�԰���ط��ɷ��棬��������Э��','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
null,1,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'�ڰ�������ʽ���������ڲ����������ˢ�ظ������ᱻ����Ŷ','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
3,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'����˫����ͭ�����彨��������壬������Ѫ','Ҫ�а�·�߾��ľ��񣬼���������һ�־��磬��·�߾���һ�־��񡣼�ֵ��ף������ģ���ֵ��ף����ǳɹ���',
null,2,sysdate);
---reply
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',1,null,1,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',2,null,2,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'��ǯ����',null,2,3,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'ͬ��',3,null,1,sysdate);
commit;
select * from admin;
select *from student;
select *from grade;
select * from quetype;
select * from question;
select * from card;
select * from new;
select * from point;
select * from student;
select * from admin;
select * from vedio;
