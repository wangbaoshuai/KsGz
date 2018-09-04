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



--序列

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
---插入数据
--admin
insert into admin values(seq_admin.nextval,'张三','2','admin1','123456','www.@126.com','13835618410','用户管理,社区管理,视频管理,科目管理,日期管理,知识点管理,新闻管理');
insert into admin values(seq_admin.nextval,'王总管','2','admin','123123','www.@163.com','13888881000','用户管理,社区管理,题库管理,视频管理,科目管理,日期管理,知识点管理,新闻管理');
insert into admin values(seq_admin.nextval,'小李','2','admin2','123456','www.@qq.com','01058855789','题库管理,视频管理,科目管理,日期管理,知识点管理,新闻管理');
--student
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'李华','1','lihua','123456','@163.com','1555555','s1.jpg','1');
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'李四','1','lisi','123456','@163.com','1555555','s2.jpg','1');
insert into student(id,uname,type,loginname,loginpass,Email,phone,image,status) values(seq_stu.nextval,'王五','1','wangwu','123456','@163.com','1555555','s3.jpg','1');

---new
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'厉害了我的小学老师 给学生写“诗评语”不重样','“发奋识遍天下字，立志读尽人间书，昱玮年少多才智，成功就在不久时。”这首诗是寿光世纪初级小学三年级7班班主任孙海燕写给学生黄昱玮的期末评语。全班42名学生每个人都有属于自己的“诗评语”，1月12日的家长会上，孙海燕将会把这些评语发给学生家长。
　孙海燕结合学生的特点和平时的表现，利用休息时间给每个孩子写了一首诗，“写了一个上午，完成了30个学生的评语，下午开始写的时候就觉得没词 了。”但是，孙海燕坚持给每个学生写出了不一样的“诗评语”，42个学生每个人的都不一样。这些评语将会在1月12日的家长会上发给家长和学生，但是由于 朋友圈的疯狂转发，很多家长已经提前得到了这个喜讯。

　　如今的孙海燕只有34岁，却已经有了不小的成绩。2015年，全国语文主题学习年会在寿光世纪学校开幕，孙海燕作为代表之一参加；2016年，第二届语文主题学习课堂大赛在海口举行，孙海燕更是凭借着诗歌、儿歌教学，拿到了特等奖。

　　孙老师的朋友圈被评论刷屏：好有才，字写得真好，请收下我的膝盖！','n1.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017北京高考《考试说明》将出 部分内容微调','北京教育考试院昨日介绍，2017年高考北京卷《考试说明》将于近日出版，并陆续发到高三学生手中。可视作北京高考“风向标”的《考试说明》，今年除英语学科无变化外，其他学科参考样题均有替换或顺序调整，部分学科的考查内容有微调。

　　语文《考试说明》中，附录部分的12部古今中外文学和文化经典篇目中，有6部是新的，分别为《红楼梦》《呐喊》《边城》《红岩》《平凡的世界》《老人与海》，均纳入考生必须作答的范围。为此新增三道参考样题，体现对经典阅读“考查内容”的理解。样题之一便是选用《红楼梦》中大观园诗社的内容，以选择题的形式考查学生对该段落的理解。

　　北京教育考试院负责人表示，语文对“经典阅读”考查内容进行了细化，是立足于阅读经典对提升中学生语文素养的意义和价值，强调通读作品“整体把握”，能结合内容“理解分析”，要联系生活“感悟评价”，其目的在于促进学生真正阅读经典名著，鼓励学生多读经典名著，提升阅读经典能力，掌握阅读经典的方法，从而发挥经典阅读潜移默化的作用，让学生形成正确价值观，为终身发展打下良好的精神底子。','n2.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'英国关闭40多个学位欺诈网站 售卖名牌大学学位','据英国广播公司1月3日消息，英国日前关闭了40多个假学位欺诈网站。这些网站利用英国名牌大学售卖假学位，或提供没有认可度的远程教育。英国高等教育学位检验机构(Hedd)目前已发现有90多家类似的欺诈机构。

　　Hedd的高等教育服务主管Jayne Rowley称，去年9月关闭了4所冒牌大学及3个欺诈网站。其中一所假大学是Stafford University，这是仿效斯塔福德郡大学(Staffordshire University)的冒牌大学。还有一些冒牌大学直接利用名牌大学的名字，如Surrey等。此外，在eBay上还有售卖曼彻斯特大学等名牌大学的假学位。

　　英国政府在2015年6月宣布严厉打击冒牌大学及假学位欺诈网站。Rowley表示，在英国法律下，成立大学必须要符合相应的标准并得到国务大臣的批准。目前，Hedd已经要求毕业生不要在网上公开自己学位证书的照片，以免违法人员有机可趁。

　　英国教育部发言人表示，学位欺诈对于学生及应聘者都有着极大不良的影响，政府已经采取决定性的措施来打击这些违法人员。','n3.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2016全球体育类大学排行榜：内地四高校上榜','上海软科于12月8日正式发布了2016年全球体育类院系学术排名，我国内地共有4所高校上榜，上海体育学院与天津体育学院进入全球150强，成为国内全球排名最高的体育类院系。

　　“软科全球体育类院系学术排名”是软科推出的首个全球专门类院系排名。长期以来，体育、艺术、音乐等专科高校的比较多在同类院校之间进行。“软科全球体育类院系学术排名”尝试打破被排名对象的界限，扫描了全球学术表现领先的体育院校以及设有体育类院系的综合性高校，利用客观指标和第三方数据对它们在同一标准下进行了排名。

　　在今年的排名中，澳大利亚迪肯大学的“运动与营养科学学院”凭借其卓越的科研总体影响力和高水平成果数量，摘得世界第一的桂冠。英国拉夫堡大学的“体育、运动与健康科学”学院与美国南卡罗来纳大学（哥伦比亚分校）的“运动科学系/酒店、零售与体育管理系/体育与运动训练系”分列世界第二和第三名。

　　全球十强高校中，综合性大学的体育院系占了较大比重，专门类体育院校则有排在第4名的挪威体育学院和第10名的科隆体育大学。澳大利亚的体育类院系在排名中脱颖而出，世界前五名中就有两所澳大利亚高校。

　　2016年软科全球体育类院系学术排名世界十强

　　2016排名 学校 体育院系 国家

　　1 迪肯大学 运动与营养科学学院 澳大利亚

　　2 拉夫堡大学 体育、运动与健康科学学院 英国

　　3 南卡罗来纳大学-哥伦比亚 运动科学系/酒店、零售和体育管理系/体育与运动训练系 美国

　　4 挪威体育学院 挪威体育学院 挪威

　　5 昆士兰大学 人体运动与营养科学学院 澳大利亚

　　6 利物浦约翰摩尔斯大学 体育与运动科学学院 英国

　　7 南丹麦大学 运动科学与临床生物力学系 丹麦

　　8 鲁汶大学（佛兰德语） 运动与康复学院 比利时

　　9 根特大学 运动与运动科学系 比利时

　　10 科隆体育大学 科隆体育大学 德国

　　2016年软科全球体育类院系学术排名中，全球共有37个国家300所高校的体育类院系榜上有名，其中有15所为专门类体育高校。入围全球300强的综合性大学体育类院系包括运动系、体育学院、体育与运动科学学院、健康与运动科学系、人体运动学院、健康与运动科学学院等。

　　总体而言，欧洲高校在排名中优势明显，欧洲体育类院系有11所跻身全球前20名，有47所入围全球百强，总计共有143所体育类院系进入全球300强。亚太地区体育类院系上榜全球前20名的数量超越了美洲，达到5所；美洲地区则在入围全球体育类院系百强高校数量上超过亚太地区。美国凭借多达64所的上榜高校数量，成为全球体育科研总体实力最强的国家。

　　2016年软科全球体育类院系学术排名中，我国内地共有4所高校上榜，上海体育学院与天津体育学院一举入围世界第101-150名，北京体育大学和北京大学的运动医学研究所排在世界第201-300名。国内的体育科学研究方兴未艾，体育科研正在蓬勃发展的上升阶段，上海体育学院、天津体育学院和北京体育大学在国际合作论文比例上表现出彩，展示了我国体育类院系与国外高校之间活跃的学术交流与科研国际合作。

　　2016年软科全球体育类院系学术排名-中国内地上榜高校

　　2016排名 学校 体育院系 国家

　　101-150 上海体育学院 上海体育学院 中国

　　101-150 天津体育学院 天津体育学院 中国

　　201-300 北京体育大学 北京体育大学 中国

　　201-300 北京大学 运动医学研究所 中国

　　我国港台地区共有8所高校上榜，排名表现最好的是香港中文大学的运动科学与体育系和台湾体育大学，两所高校均排在世界第101-150名之间。

　　2016年软科全球体育类院系学术排名-中国港台地区上榜高校

　　2016排名 学校 体育院系 国家

　　101-150 香港中文大学 运动科学与体育系 中国香港

　　101-150 台湾体育大学 台湾体育大学 中国台湾

　　151-200 香港浸会大学 体育系 中国香港

　　151-200 香港教育学院 健康与体育系 中国香港

　　201-300 台北大学 运动学院 中国台湾

　　201-300 台湾成功大学 体育，健康与休闲研究所 中国台湾

　　201-300 台北市立体育学院 台北市立体育学院 中国台湾

　　201-300 台湾师范大学 体育学院 中国台湾',null,sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'追踪海归在国内高校任教的那些“奇葩事”','11月28日，《中国青年报》教育周刊刊登《一位海归“青椒”的困惑》一文，讲述了一位海归青年教师在一国内高校任教时经历的种种“奇葩事”，引起高校师生的广泛关注。

　　中国青年报·中青在线记者通过调查发现，不少高校教师都有过类似的经历；不少大学生也表示，在学分绩点为重的大学生活中，很多学生和老师成为学分绩这一“指挥棒”下的“木偶”，不得不做出一些自己不喜欢的事情。也有师生反映，大学生“社会化”的行为正是社会不良风气传入校园的结果。

　　“学分绩”成了师生关系的指挥棒

　　中国青年报教育科学部的微信公众号“长大大”做了一项名为“高校师生关系为何‘无解’”的调查，近200名网友参与投票。投票结果显示：47%的网友认为“大学还是要回归其本来单纯的样子”，22%的网友认为上大学时“还是希望有个严师约束自己”，12%的网友表示“现在的高校老师也很奇葩”。

　　网友“淡墨”表示：“奖学金和就业注重于绩点，为了将来，作为大学生，我们不得不选择给分高的老师，其实我并没有发现大学教育的真正意义所在。老师迷茫，我们又何尝不是？我常在想，高中小学的知识能记忆犹新，大学的知识看完就忘。整个学期认真学习的结果却不如考前刷重点刷历年题有效。这是大学的悲哀，也是我的悲哀。身为一个985高校的学生，并没有感到大学带给我的学习快乐，主要都是自学。”

　　有网友表示，社会化的大学生与迎合学生的老师，实际上都是“学分绩”背景下的“套路”。名为“贾艳”的网友表示：“我觉得现在大学生把绩点和证书看的太重要了，所以才会有很多套路。没有人会在意你是否认真学了这门课，人们只看你是否复习到了老师要考的重点。”

　　对于如何做一名“严师”，网友“C泽虹”认为：“只在结果上面要求严格，而不在学生学习的过程中给予帮助、解忧、改善教学方法的老师，学生是很难感受到老师的用心的。平常不怎么跟学生交流，不及时纠正学生平常的学习态度，反而在结果上面严格要求的老师，是让学生反感的。”

　　对此，网友“燕”表示，大学生到最后还是要就业的，而就业要看成绩与奖学金，“大学里很多老师的评分标准并不一致，有的严有的松。为了自己能够有更高的就业平台，明显选择打分高的老师好啊”。

　　严师与否，需要平衡理想与现实

　　“无言以对。只能尽力而为。工作，工作而已。”一位高校教师在看过此文后这样表示。的确，不少高校教师对于“怎么做才算一个好老师”这一问题感到无奈。

　　网友“杨亚龙”表示：“慈母多败子，严师出高徒，我觉得大学很有必要严格要求学生，教育是为了促人成才，而不是仅仅为了一张文凭。高校对学生的管理需要进一步完善，严进严出。大学一步步扩招，反倒是感觉大学生泛滥了，空有一张文凭，却没有真才实学。”

　　网友“nu nu”说：“老师并没有错，是现在的大学学风普遍不行，太多人急功近利，既不想付出太多，又想拿个耀眼的分数。为保研、出国铺路，身边有太多这样的人。大学成绩不该按照什么分数对应什么绩点来评比，这样大家都会先考虑哪个老师给分高。可以参考其他国家，前百分之几属于哪个分数段，后百分之几为不及格，必须重修，这样大家就会好好学习，而不是混混而已了。”

　　“严师”一定就是正确的选择吗？在大学生的“集体排斥”下，很多高校教师也在纠结这个问题。网友“小美女爱栀子花”说：“严师确实会有很多收获，但就从分数来说，自己老师严，给的分低，别人的老师给分高，在某些硬性指标下，还是会给学生带来些‘不便’的。”

　　因此，有不少高校教师表示，这样的苦恼实际上是“理想和现实的碰撞”，很多和学生斗智斗勇的经历则是 “不良社会风气在大学的映射”。对于如何维系师生关系，有网友表示，“信仰缺失，三观不正的人日益增多，老师这个职业是个良心活儿，但求问心无愧吧！”',null,sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'索尔福德大学：毗邻英国BBC 实习机会多','第一站，带大家走进的是位于曼彻斯特的索尔福德大学（Manchester University of Salford）。

　　索尔福德大学是一所氛围友好、开拓创新的公立研究型大学，有18,485名学生，坐落于艾威尔河畔的绿野之上，占地60英亩（24万平方米）。
索尔福德大学的教学楼索尔福德大学的教学楼，其中一处正在修缮
索尔福德大学的教学楼远景索尔福德大学的教学楼远景
索尔福德大学教学楼前的喷水池索尔福德大学教学楼前的喷水池

　　艺术、传媒是索尔福德大学的强势专业

　　校企联系紧密 有大量实习实践机会

　　艺术、传媒方向的专业是索尔福德大学的强势专业，而且学校与本土企业联系紧密，并以企业的要求来指导教学、引导学生，课程极具实用性。一方面，为学生到外面企业学习提供大量的机会，另一方面，把企业研究项目引进学校。让学生既能掌握理论知识，又具备实际操作能力。

　　近水楼台先得月：校区位于英国媒体城 与BBC、ITV毗邻而居

　　索尔福德大学是全英国唯一一所在英国媒体城(MediaCityUK)拥有校区的大学——英国媒体城是英国媒体、数码及创意产业中心，也是英国最具创新的发展项目之一，同时此地正是英国广播公司（BBC）及英国独立电视台（ITV）主要部门的所在地。

　　索尔福德大学在英国媒体城内开设了三十多门本科以及研究生课程。索尔福德大学的制片室、演播室以及数码基础设施均根据行业标准进行配备，符合行业要求，可与未来创新科技接轨。学校的目标是让所有学生在课程之中接触（由我们商业伙伴分派的）工作简报，以进行实战演练。','n5.jpg',sysdate,1);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'伦敦国王学院：英国最古老大学之一 世界排名前20','英国最古老的四所大学之一 地处伦敦市中心

　　伦敦国王学院建于1829年，是英国最古老的四所大学之一，仅次于剑桥、牛津。地处伦敦市中心，与伦敦的政治中心、金融中心相距不远，地理位置优越。它也是伦敦大学的创校学院，学院下设5个校区及3所医院，现有约26,500名学生。2016年将增设贸易相关课程，包括国际管理本科课程、银行与金融硕士课程；此外学院将新设奥德维奇校区，入驻布什大厦，进一步提升学员的国际声誉。','n6.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017年江苏招录7649名公务员 12日开始报名','2017年江苏省公务员招录正式启动。昨天上午，省委组织部、省人社厅和省公务员局联合举行的新闻发布会上传出消息，2017年全省计划考录7649名公务员和参照管理单位工作人员，比去年增加261人，并首次拿出29个职位定向招录残疾人。今天起，考录职位表将在网上公布，1月12日开始报名。今年公务员招录主要有三大变化。

　　变化一：比去年多招录261人

　　2017年全省计划考录7649名公务员和参照管理单位工作人员，比去年增加261人。其中，省级机关243名、市级机关1000名、县（市、区）级机关3648名、乡镇（街道）机关1991名、省以下垂直管理机构767名。记者统计近年来省考招录人数发现，今年江苏计划招录公务员人数只略低于2013年的7662人。

　　“今年招录计划增加，主要有3个原因。”省公务员局考试录用处处长季铭华说，首先，去年新通过审批的一批参公管理单位，这类单位对于工作人员的需求量较大；其次，一些单位自然减员，出现人员负增长，目前在职人员已经不能满足实际需求，迫切需要“新鲜血液”；第三，面向乡镇机关的基层岗位增加人数，同时一些地区区划上一年进行调整，因此冻结了人员招录计划。调整改革完成后，重新恢复招录。

　　变化二：29个职位首次定向招录残疾人

　　残疾人想成为公务员不是梦，而且不仅仅是进入残联工作，将有更多的单位向残疾人敞开大门。此次省考的最大变化是，今年我省首次开展定向招录残疾人工作。全省共编制了29个职位计划，面向持有残联核发的第二代《中华人民共和国残疾人证》，且符合职位要求的残疾类别、等级的人员定向考录，进一步保障残疾人就业权利，推进我省残疾人按比例就业工作。

　　变化三：审核时间从24小时延至48小时

　　为确保网上报名资格审核工作质量，便于招录机关更加客观、公正、准确地开展资格审核，今年将招录机关审核工作时间从以往的24小时延长至48小时。尽管省公考报名时间一直持续到1月18日，但只有在1月16日16∶00之前进行网上报名，才能确保在资格审核未通过时有机会改报其他职位，报考人员应尽早选择职位并在网上报名。','n7.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'学校禁止学生请求：大学老师纠结该不该划重点','武汉工程科技学院记者团近日走访不同高校、不同专业的100名学生进行问卷调查。结果显示，75%的学生认为老师应该划重点。他们认为，划重点能让复习更高效、更有针对性，是梳理知识点以便更好地备考。持反对意见的学生却说：“只要平时认真听课，自然就能区分哪些是重点了。”

　　湖北大学商学院优秀班主任、经济学系副教授徐俊武说，他已坚持10多年“不划重点”了。他曾在微博晒出经济学两门课期末四成的挂科率，遭学生“炮轰”：老师，你好毒。徐俊武昨表示，考试前划重点只能换来看似漂亮的成绩单，并不能证实学生的真实水平。因此，他一般不会跟学生划重点。“一方面，这是学校不允许的，对那些平时上课认真的同学也不公平；另一方面，也是希望学生能在平时注重学习和积累，而不期末临时抱佛脚。”

　　当然，也有老师表示，如果不划重点，期末学生给的评价就很难看；若出现大面积挂科的情况，老师压力也很大。

　　如何才能减少学生对“划重点”的依赖呢？有的老师想到创新考核方式。湖北大学物理与电子科学学院的教师沈谅平就取消期末考，把课堂搬到实验室，把理论知识分为若干专题，通过平常考查、测试、提问、作业等方式来考查学生，不让学生存在“考前投机”的侥幸心理。','new9.jpg',sysdate,2);
insert into new(nid,ntitle,ncontent,nimage,ndate,aid)values(seq_new.nextval,'2017中国各地区百强大学排行榜','哪个地区跻身2017年全国百强的大学数量最多？艾瑞深中国校友会网《2017中国大学评价研究报告》最新发布2017中国各地区大学综合竞争力排行榜，北京、江苏、上海、湖北和广东名列前5强。北京大学(分数线,专业设置)、清华大学(分数线,专业设置)和武汉大学(分数线,专业设置)雄居2017中国大学排行榜前3甲，全国16所非211工程高校跻身全国百强，福建师范大学、深圳大学和山西大学雄居2017中国非211工程大学排行榜前3名。值得关注的是，广东省“双一流”建设经费突破250亿领跑全国，东莞理工学院豪揽37.5亿成最大赢家。部属高校是全国各地高等教育的中流砥柱，全国仅29所地方所属高校跻身全国百强，新疆、内蒙古、贵州、海南和宁夏等地区无高校跻身全国百强，剔除“211工程”相关指标后，西藏和青海无高校跻身全国前200强。','new10.jpg',sysdate,2);
--forum贴主
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'【公告】账号发言被隐藏改密无法解封请看这里','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
3,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'【倡议】贴吧吧吧友自律签到大楼','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
2,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'社区，你我共同的家园遵守法律法规，遵守贴吧协议','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
1,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'在版面屠版式发贴或者在不相干主题下刷回复，都会被处理哦','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
3,sysdate);
insert into forum(fid,ftitle,fcontent,stuid,fdate)values(seq_forum.nextval,'关于双浦镇铜鉴湖村建设美丽乡村，心在流血','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
2,sysdate);
--回复
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',3,1,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',1,2,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',2,3,sysdate);
insert into reply(rid,rcontent,stuid,fid,rdate)values(seq_reply.nextval,'同意',1,1,sysdate);


------题型表------
insert into quetype(id , tname) values(seq_qtype.nextval , '单选题');
insert into quetype(id , tname) values(seq_qtype.nextval , '多选题');
insert into quetype(id , tname) values(seq_qtype.nextval , '判断题');


------科目表------
insert into subject(id , sname) values(seq_sub.nextval , '考研考试'); 
insert into subject(id , sname) values(seq_sub.nextval , '四级考试'); 
insert into subject(id , sname) values(seq_sub.nextval , '计算机二级考试'); 
---考试时间---
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-12-23','yyyy-mm-dd'),1);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-06-18','yyyy-mm-dd'),2);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-12-15','yyyy-mm-dd'),2);
insert into examdate(id,edate,subid) values(seq_edate.nextval,to_date('2017-08-21','yyyy-mm-dd'),3);
--题
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'从历史发展的角度看，资本主义生产资料所有制是不断演进和变化的，当今资本主义社会居主导地位的资本所有制形式是 ','法人资本所有制 ','私人资本所有制 ','私人股份资本所有制 ','垄断资本私人所有制 ','A ','此题考查的知识点是资本所有制形式',1,null,'第二次世界大战后，资本主义所有制发生了新的变化，这就是国家资本所有制形式形成并发挥重要作用，法人资本所有制崛起并成为居主导地位的资本所有制形式，所以答案选A');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'从中华人民共和国成立到社会主义改造完成，是我国从新民主主义到社会主义的过渡时期。这一时期，个体经济向社会主义集体经济过渡形式是 ','私人资本主义经济 ','国营经济','合作社经济','国家资本主义经济','C','本题考查的是社会主义改造中对农业和手工业的改造形式',4,null,'个体经济指的就是农业和手工业，对农业和手工业采取的是合作社经济的过渡形式。而对于资本主义工商业采取的是国家资本主义经济。所以本题正确答案是C。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'2016年是“十三五”规划开局之年，也是推进供给侧结构性改革的攻坚之年，推进供给侧结构性改革是适应我国经济发展新常态的重大决策，其根本目的是()','提高供给质量满足需要 ','加快政府职能转变 ','深化价格、财税、金融、社保等领域基础性改革 ','推进“去产能、去库存、降成本、补短板”','A','推进侧结构性改革，是适应和引领经济发展新常态的重大创新',4,null,'当前和今后一个时期，我国经济发展面临的问题，供给和需求两侧都有，但矛盾的主要方面在供给侧。必须把改善供给侧结构作为主攻方向，实现由低水平供需平衡向高水平供需平衡跃升。从政治经济学角度看，供给侧结构性改革的根本，是使我国供给能力更好满足广大人民日益增长、不断升级和个性化的物质文化和生态环境需要，从而实现社会主义生产目的。因此，本题正确答案应选A项。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'协调推进“四个全面”战略布局，是党十八大以来党中央从实现“两个一百年”奋斗目标，实现中华民族伟大复兴的中国梦的战略高度，统筹国内国际两个大局，把握我国发展新特征确定的治国理论新方略。在“四个全面”战略布局居于引领地位的是（） ','全面深化改革 ','全面建成小康社会 ','全面依法治国 ','全面从严治党 ','B ','党的十八大以来，逐步形成了“全面建成小康社会、全面深化改革、全面依法治国、全面从严治党”的“四个全面”的战略布局',5,null,'“全面建成小康社会”战略布局居于引领地位，它是我们党确定的第一个奋斗目标，也是实现中华民族伟大复兴的关键一步。所以本题选B项“全面建成小康社会”。其余三个全面都是围绕这一目标的战略举措。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'随着工业化、城镇化的深入推进，大量农民转向非农产业，我国农村土地流转现象日益普遍，农业经营方式发生深刻变化，截至2016年6月全国家庭承包经营耕地面积流转已超过30%，流转土地4．6亿亩。当前为解决拥有土地承包经营权的人不再种地，种地的人又没有相应权利这一突出问题，我国在深化农村改革方面做出重大制度创新是（） ','实行农村土地所有权、承包权、经营权分量 ','实行农村集体经营性建设用地入市 ','实行农村家庭联产承包责任制 ','实行农村耕地保护制度 ','A','改革开放之初，在农村实行家庭联产承包责任制',1,null,'将土地所有权和承包经营权分设，所有权归集体，承包经营权归农户，极大地调动了亿万农民积极性，有效解决了温饱问题，农村改革取得重大成果。现阶段深化农村土地制度改革，顺应农民保留土地承包权、流转土地经营权的意愿，将土地承包经营权分为承包权和经营权，实行所有权、承包权、经营权分置并行，着力推进农业现代化，是继家庭联产承包责任制后农村改革又一重大制度创新。“三权分置”是农村基本经营制度的自我完善和发展。因此，本题正确答案选A项“实现农村土地所有权、承包权、经营权分置”。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'帝国主义侵略中国的最终目的是要瓜分中国，灭亡中国。1895年中国在甲午战争中战败后，列强掀起了瓜分中国的狂潮，这集中表现在（）','设立完全由外国人直接控制和统治的租界','竞相租借港湾和划分势力范围','外国资本主义在中国近代工业中争夺垄断地位','从侵占中国边邻国发展到蚕食中国边疆地区','B','帝国主义列强对中国的争夺和瓜分的图谋，在1894年中日甲午战争爆发后达到高潮',2,null,'《中日马关条约》的签定，更大大刺激了帝国主义列强瓜分中国领土的野心，并激化了列强争夺中国的矛盾。俄国法国德国三国干涉还辽，要求租借中国港湾作为报酬。由此，德、俄、英、法、日等国于1898年至1899年竞相租借港湾和划分势力范围，掀起了瓜分中国才狂潮。因此，本题答案选B。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'第一次世界大战，德国战败。1918年12月，陈独秀在《每周评论》里的发刊词中说大战结果是“公理战胜强权”，并把美国总统威尔逊称作“现在世界第一好人”，然而陈独秀在1919年5月4日出版的《每周评论》上的一片文章中又写到“什么公理，什么永久和平，什么威尔逊总统十四条宣言，都成了疑问不值的空话。”导致陈独秀认识发生变化的直接原因是（）','美国不愿放弃在华种种特权','日本对德宣战，出兵山东','苏俄宣布废除以前同中国签订的一切不平等条约','中国在巴黎和会上的外交失败','D','本题考查的是五四运动的背景。',3,null,'题干中陈独秀攻击美国是假公理，并且结合前面的“公理战胜强权”很明显，讲的是巴黎和会上中国外交的失败，以美国为首的列强要中国在合约上签字承认日本在山东青岛问题的合法化。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'某地区进入供暖季后常出现雾霾，而一旦出现大风天气或等到春暖花开后雾霾就会散去减少，从该地区较长时间的数据变化看，经过人们努力治霾，污染物排放总量在持续走低，但在某些时段，环境空气质量污染指数会迅速攀升，甚至"爆表"，这种看似"矛盾"的现象凸显了大气污染防治的一个特点：天帮忙很重要，但人努力才是根本。"人努力"与"天帮忙"之间的关系对我们处理主观能动性和客观规律之间辩证关系的启示是：','人类有意识的思想活动是掌握客观规律的根本前提 ','尊重食物的客观规律是正确发挥主观能动性的前提 ','认识活动是客观规律性与主观能动性相统一的基础','尚未认识的外在自然规律对人的实践活动起着至关重要的作用 ','B','主观能动性和客观规律的辩证关系',2,NULL,'尊重客观规律是正确发挥主观能动性的前提，人们只有在认识和掌握客观规律的基础上，才能达到认识世界和改造世界的目的。A、C表述有误，D不符合题意，所以答案选B。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'有人认为，既然人的意识是对客观外部世界的反映，那么人脑里的“鬼”、“神”意识就是对外在世界鬼、神真实存在的反映。这种观念错误在于 ','把意识看成是物质的产物','夸大了意识的能动作用','认为意识是对存在的直接反映','混淆了人类意识自然演化的阶段','C','此题考查的知识点是意识观',2,null,'人脑里的“鬼”、“神”意识是对外部世界的歪曲反映，而题目中的观念认为人脑里的“鬼”、“神”意识是对外部世界上真实存在的反映，这种反映是直接的反映，这样的观念是错误的，所以答案选C。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'某企业投资汽车生产。生产一辆汽车所耗费的生产资料价值为15万元，支付给工人的工资为5万元，假定市场的平均利润为10%，那么，在自由竞争条件下，该汽车的生产价格是','20．5万元','20万元','21．5万元','22万元','D','此题考查的知识点是生产价格',3,null,'从题意得出，不变资本c为15万元，可变资本v为5万元，平均利润率是剩余价值和全部预付资本的比率，因此得出剩余价值m是2万元，故生产价格=c+v+m=15+5+2=22，所以答案选D。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'第一次世界大战，德国战败。1918年12月，陈独秀在《每周评论》里的发刊词中说大战结果是“公理战胜强权”，并把美国总统威尔逊称作“现在世界第一好人”，然而陈独秀在1919年5月4日出版的《每周评论》上的一片文章中又写到“什么公理，什么永久和平，什么威尔逊总统十四条宣言，都成了疑问不值的空话。”导致陈独秀认识发生变化的直接原因是（）','美国不愿放弃在华种种特权','日本对德宣战，出兵山东','苏俄宣布废除以前同中国签订的一切不平等条约','中国在巴黎和会上的外交失败','D','本题考查的是五四运动的背景。',5,null,'题干中陈独秀攻击美国是假公理，并且结合前面的“公理战胜强权”很明显，讲的是巴黎和会上中国外交的失败，以美国为首的列强要中国在合约上签字承认日本在山东青岛问题的合法化。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'毛泽东思想是马克思主义中国化的第一大理论成果，是在中国革命和建设的实践中逐步形成和发展起来的，在土地革命战争后期和抗日战争时期，毛泽东思想得到多方面展开而达到成熟，其标志是（） ','思想政治工作和文化工作理论的系统提出','新民主主义的理论的系统阐明','人民民主专政理论的完整论述','农村包围城市和武装夺政权理论的科学概括','B','本题考查的是新民主主义理论提出的过程',4,null,'属于2017年新增知识点，考生如果关注过今年新增知识点应该能选出来。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'1947年6月底，根据中共中央的决策和部署，刘伯承、邓小平率领的晋冀鲁豫野战军主力，实施中央突破，千里跃进大别山；陈毅、粟裕指挥的华东野战军主力为东路，挺进鲁豫皖地区；陈赓、谢富治指挥的晋冀鲁豫野战军一路为西路，挺进豫西。三大主力军相互侧影，机动歼破，迫使国民党处于被动地位。这说明（）','人民解放军在数量上已经超过国民党军队','人民解放军线路进攻的序幕由此揭开','人民解放军同国民党军队进行战略对决的时机已经成熟','人民解放军进入战略相持阶段','B','本题考查的是对于解放战争过程的了解',2,null,'解放战争分为战略防御，战略进攻和战略决战三个阶段，压根没有战略相持阶段，所以排除D选项。其中由战略防御转入战略进攻以三路大军发动进攻为标志,战略决战时以渡江战役、辽沈战役和淮海战役为标志，所以C选项排除。而在进攻的时候，人民解放军的数量并没有超过国民党军队。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'信念是认知、情感和意志的有机统一体，是人们在一定的认知基础上确立的对某种思想或者事物坚信不疑并身体力行的心理态度和精神状态。信念是人们追求理想目标的强大动力，决定事业的成败，信念有不同的层次和类型，其中（） ','高层次的信念决定低层次的信念','低层次的信念代表了一个人的基本信仰','相同社会环境中生活的人们信念始终一致','各种信念没有科学与非科学之分','A','信念',4,null,'有着不同的层次和类型，高层次的信念决定着低层次的信念，低层次的信念服从于高层次的信念，故选A ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,1,'社会主义核心价值观为人们确定和实现人生价值提供了基本遵循。人生价值评价主要是看一个人的人生活动是否符合社会的客观规律，其评价的根本尺度是 ','历史标准','经济标准','政治标准','文化标准','A','人生价值评价的根本尺度',4,null,'是看一个人的人生活动是否符合社会发展的客观规律，是否通过实践促进了历史的进步，故答案是A历史标准。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'显微镜的放大能力和成像质量不断提升，人类对细胞的认知也随之深刻和全面。20世纪中叶，科学家们利用X射线晶体学发现了DNA（双螺旋结构），人类的观察极限从亚细胞结构推向了分子结构。我国科学家们的重要科研成果：剪接体的高分辨别三维结构的背后，也站着一个默默无闻的英雄——冷冻电子显微镜。显在生物科学发现中的作用表明（） ','探索未知世界的科学实验是人类最基本的实践活动','实践的主体和客体正是依靠中介系统才能够相互作用','人类认识水平的提高与实践条件的进步有直接的关系','主体、客体和中介三者有机统一构成的实践的基本结构','BCD','实践',2,null,'题干中，无论是植物细胞的发现还是DNA的发现，都是借助于显微镜实现的，所以，实践的主体和客体正是依靠中介系统才能够相互作用，也说明人类认识水平的提高与实践条件的进步有直接的关系；生物学的发展史，也说明实践活动就是一个以主体、中介和客体为基本骨架的动态的发展系统。选项A说法错误，物质生产实践是人类最基本的实践活动。因此，本题的正确答案是选项BCD。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'唯物史观在坚持人民群众是历史的创造者这一基本前提下，高度重视个人在历史上的作用。历史人物是一定历史事件的主要倡导者、组织领导者或思想理论、科学文化的重要代表人物。下列关于历史人物作用的正确认识是 ','历史人物对历史发展的作用都是积极的','历史人物会因其智慧、性格等因素对社会过程发生影响','具有进步意义的历史人物往往能够首先发现或提出历史进程中新的历史任务','历史人物无论发挥什么样的历史作用都不能决定和改变历史发展的总进程和总方向','BCD','历史人物的影响',3,null,'历史人物往往会因其自身的智慧、性格等因素对社会的具体进程产生一定的或加速或延缓的影响，但历史人物改变不了历史发展的基本方向，具有进步意义的历史人物往往能够发现或提出历史进程中的新的历史任务。历史人物按其作用性质可以分为杰出人物和反面人物，其中杰出人物对历史发展起推动作用，所以选项A说法错误。因此，本题的正确答案是选项BCD。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'马克思指出，所谓资本原始积累只不过是生产者和生产资料分离的历史过程。这个过程所以表现为“原始的”，因为它形成资本及与之相适应的生产方式的前史。资本原始积累的主要途径有（） ','用暴力手段剥夺农民土地 ','用剥削手段榨取剩余价值 ','用野蛮手段进行殖民掠夺','用资本手段获取市场暴力','AC','资本原始积累',5,null,'生产者与生产资料相分离，货币资本迅速集中于少数人手中的历史过程。资本原始积累主要是通过两个途径进行的：一是用暴力手段剥夺农民的土地；二是用暴力手段掠夺货币财富。因此，本题的正确答案是选项AC。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'当今世界正处在新科技革命和产业革命的交汇点，以机器人技术为代表的科技产业发展十分迅速。机器人在生产过程中的广泛使用，使资本有机构成不断提高。然而，就一般意义而言，资本有机构成的提高实际上是 ','由资本的本性决定的','不以人的意志为转移的一般趋势 ','社会产生相对过剩人口的一个重要原因','一个社会增长财富和消除贫困的根本途径','ABC','在资本主义生产过程中，资本有机构成呈现不断提高趋势，这是由资本无限追逐剩余价值的本性决定的',2,null,'资本家通过资本积聚和资本集中扩大生产规模，使资本有机构成不断提高。资本有机构成提高，可变资本相对量减少，资本对劳动力的需求日益相对地减少，结果就不可避免地造成大批工人失业，形成相对过剩人口。选项D说法错误，因此，本题的正确答案是选项ABC。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'1921年3月，俄工（布）召开十大，决定从战时共产主义政策过度到新经济政策。在实施新经济政策期间，列宁对苏维埃俄国如何建设社会主义进行了深刻的理论思考，提出了许多精辟的论述，其内容包括 ','可以利用资本主义来建设社会主义','把建设社会主义作为一个长期探索、不断实践的过程','把大力发展生产力、提高劳动生产率放在首要地位','允许多种经济成分并存，可以利用商品、货币和市场发展经济','ABCD','在俄国社会主义革命取得胜利的初期',5,null,'特别是实行新经济政策期间，列宁对苏维埃俄国如何建设社会主义进行了深刻的理论思考，提出了许多精辟的论述。把建设社会主义作为一个长期探索、不断实践的过程。把大力发展生产力、提高劳动生产率放在首要地位。在多种经济成分并存的条件下，利用商品、货币和市场发展经济。利用资本主义，建设社会主义。因此，选项ABCD都正确。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'“一带一路”倡议提出三年来，已经有100多个国家和国际组织参与其中，我国同沿线30多个国家签署共建合作协议，与20多个国家开展了国际产能合作，一批有影响力的标志性项目逐步落地。截止2016年7月，我国对“一带一路”相关国家的投资累计已达511亿美元，占同期对外直接投资总额的12%；与沿线国家新签承包工程合同1．25万份，累计合同额2790亿美元。我国推进“一带一路”建设旨在 ','统筹国内国际两个大局','打造开放、包容、均衡、普惠的区域经济合作架构','促进沿线各国共同繁荣','探索国际合作及全球治理新模式','ABCD','一带一路',3,null,'我国在推进“一带一路”建设的过程中，表达出一种“兼济天下”的大国襟怀，搭建起一座“心灵相通”的世界桥梁，传输着一种“开放、共享”的中国理念。所以，结合题干，本题正确答案应选ABCD。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'2016年7月以来，中央陆续派出环保督查组进驻各地进行现场督查，掀起了一场新的污治问责风暴。环保督查，从环保部门牵头到中央主导，从以查企业为主转变为 “查督并举，以督政为主”，这是我国环境监管模式的重大变革和完善生态文明制度体系的重要举措。建立环保督查工作机制有利于 ','处理好政府与市场的关系','强化领导责任和监管责任','落实环境保护主体责任','完善领导干部目标责任考核制度','ABCD','我国掀起一场新的治污问责风暴',3,null,'从环保部门牵头到中央主导，从以查企业为主转变为“查督并举，以督政为主”，体现了A项处理政府与市场的关系；建立环保督查工作机制有利于落实环境保护主体责任；也有利于强化领导责任和监督责任；同时也完善了领导干部目标责任考核制度。因此本题正确答案是ABCD ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'党的十八届五中全会提出“创新、协调、绿色、开放、共享”的新发展理念，把创新作为引领发展的第一动力。在这一新发展理念，把创新作为引领发展的第一动力。在这一新发展理念的指导下，2016年5月党中央和国务院颁布了《国家创新驱动发展战略纲要》。把创新作为引领发展的第一动力是 ','分析世界发展历程和总结我们改革开放实践得出的结论','引领经济发展新常态的根本之策','构建和谐社会的内在要求','提高核心竞争力的必然选择','ABD','本题考查的是实施创新驱动发展战略的意义',3,null,'那么正确选项和题干之间存在因果关系，这个题和谐社会与创新驱动发展战略的关系不大，所以不选。其他几个选项都是正确答案');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'严肃党内政治生活是我们党的优良传统和政治优势，也是全面从严治党的基础。党的十八届六中全会审议通过了《关于新形势下党内政治生活的若干准则》和《中国共产党党内监督条例》，提出了新形势下加强和规范党内政治生活的新要求，其主要内容是 ','着力增强党内政治生活的政治性、时代性、原则性和战斗性','着力提高党的领导水平和执政水平，增强拒腐防变和抵御风险能力','着力增强党自我净化、自我完善、自我革新、自我提高能力','着力维护党中央权威，保证党的团结统一、保持党的先进性和纯洁性','ABCD','本题考查是十八届六中全会的报告',3,null,'在新形势下加强和规范党内政治生活的新要求涉及到ABCD全选。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'在半殖民地半封建社会的条件下，中国不可能在独立的基础上与外国发生经济往来，资本-帝国主义列强同中国发生经济关系，不是为了推动中国经济的发展，而是为了控制中国的经济。列强控制中国经济的方式有：','在中国设立出版机构宣传西学','控制中国的关税和盐税','在中国设立银行','控制中国的交通运输业','BCD','本题考查是列强控制中国经济的方式',4,null,'所以涉及到的是经济方面。BCD都是经济方面的措施，A不是经济方面，是文化方面，所以排除不符合题意的选项，正确答案是BCD。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'孙中山先生是伟大的民族英雄、伟大的爱国主义者、中国民主革命的伟大先驱，一生以革命为己任，立志救国救民，为中国民族作出了彪炳史册的贡献。孙中山先生的伟大表现在 ','领导了辛亥革命','重新解释了三民主义并提出了联俄、联共、扶助农工三大政策','发动了以推翻北洋军阀统治为目标的北伐战争','坚定维护民主共和制度和国家完整统一 ','ABD','本题考查的是孙中山先生为中华民族的伟大贡献。',1,null,'出自习近平纪念孙中山诞辰150周年，以下ABD均属于正确选项，北伐战争是1926年-1927年，而孙中山先生1925年植树节就逝世了，所以不能选C。');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'1978年12月18日到22日，党的十一届三中全会在北京召开。会议的主要任务是确定把全党工作重点转移到社会主义现代化建设上来。这次全会是新中国成立以来党的历史上具有深远意义的伟大转折。全会结束了粉碎“四人帮”后两年党和国家工作在徘徊中前进的局面，标志着中国共产党 ','重新确立了马克思主义的思想路线、政治路线、组织路线','形成了以邓小平为核心的党的中央领导集体','开始了在思想、政治、组织等领域的全面拨乱反正','解开了社会主义改革开放的序幕 ','ABCD','本题考查的是十一届三中全会的意义，',1,null,'属于史纲第十章改革开放与社会主义现代化建设的新时期，ABCD均是正确答案。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'我国法律文化有悠久的历史和传承，据《说文解字》阐释，汉语中“法”的古体是“灋”。“灋，刑也，平之如水，从水；鹰，所以触不直者去之，从去。”在古代，“法”主要表现为“刑”或“刑律”，“刑”既有刑戮、罚罪之意，也有规范之意；“鹰”也称“獬豸”，是神话中的独角兽，它公正不阿，善断是非曲直。上述材料表明，在传统文化中人们对法律的理解和诉求是 ','法律体现了君权神授的思想','法律具有至高无上的地位','法律富含着公平如水、正义神圣的深刻意蕴','法律寄托着惩恶扬善、匡扶正义的价值追求','CD','法律的意义',5,null,'题干中，“刑”有刑戮、规范之意，说明法律寄托着惩恶扬善、匡扶正义的价值追求；题干中，代表公正不阿、善断是非曲直的神兽，说明法律富含着公平正义的神圣意蕴。中国封建社会是典型的人治思维，它认为最高的权威是个人而不是法律，所以，选项B错误。选项A与题意无关。因此，本题的正确答案是CD。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'公共生活中的个人权利与他人权利发生冲突在所难免，比如学生宿舍里有人看书，有人休息，有人要听音乐……对解决权利冲突要有正确的认识，虽然每个人都有刑事个人权利的自由，但也要尊重他人权利。这是因为 ','尊重他人权利即是一项法律义务，也是一项道德义务','尊重他人权利是公民意识的重要内容','权利实现的内在动力是人们彼此之间对各自权利的相互尊重','不尊重他人权利，就可能丧失自己的权利','ABCD','虽然每个人都有行使个人权利的自由',2,null,'但也要尊重他人的权利，因为权利实现的内在动力是人们彼此之间对各自权利的相互尊重，认同是权利产生的条件，尊重则是权利实现的保证，只有尊重他人权利,每个权利人才能真正获得并最终实现自我权利；尊重他人权利是公民权利意识的重要内容；尊重他人权利既是一项法律义务，也是一项道德义务，每个人自我权利的实现都需要他人的协助，需要他人的尊重，否则，任何自我权利都无法实现；不尊重他人权利，就会丧失自己的权利。因此，本题的正确答案是选项ABCD。 ');
insert into question(id,subid,qtid,qtitle,optiona,optionb,optionc,optiond,result,knowpint,difficulty,image,analysis)values(seq_que.nextval,1,2,'中国人民解放军战区成立大会于2016年2月1日在北京隆重举行。中共中央总书记、国家主席、中央军委主席习近平向东部战区、南部战区、西部战区、北部战区、中部战区授予军旗并发布训令。建立五大战区及组建战区联合作战指挥机构是','构建我军联合作战体系的历史性发展','为实现中国梦强军梦作出的战略决策','加强国际军事合作与交流的重大步骤','全面实施改革强军战略的标志性举措','ABD','2016年2月1日，中国人民解放军战区成立大会在北京八一大楼隆重举行',3,null,'中共中央总书记、国家主席、中央军委主席 习近平向东部战区、南部战区、西部战区、北部战区、中部战区授予军旗并发布训令，强调建立东部战区、南部战区、西部战区、北部战区、中部战区，组建战区联合作战指挥机构，是党中央和中央军委着眼实现中国梦强军梦作出的 战略决策，是全面实施改革强军战略的标志性举措，是构建我军联合作战体系的历史性进展，对确保我军能打仗、打胜仗，有效维护国家安全，具有重大而深远的意义。C国际交流不是我们组建战区联合作战指挥机构的出发点。故，本题选ABD。');

------单选题表------
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 1 , 1 , '《百喻经》中有一则寓言，有一个愚人到别人家去做客，他嫌菜没有味道，主人就给他加了点盐。菜里加了盐以后，味道好极了，愚人就想：“菜之所以鲜美，是因为有了盐，加一点点就如此鲜美，如果加更多的盐岂不是更加好吃？”回家以后，他把一把盐放进嘴里，结果又苦又咸，这则寓言给我们的启示是' ,
'持续的量变会引起事物发生质的变化' , '在认识和处理问题时要掌握适度的原则' , '在事物的发展过程中要时时注意事物的自我否定' , '不可能通过一些现象而去认识某个事物的本质' , 'B' , '认识和处理事务要是适当' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 1 , 1 , '有一种观点认为，“自由不在于幻想中摆脱自然规律而独立，而在于认知这些规律，从而能够有计划地使自然规律为一定的目的服务”。还有一种观点认为，“‘自由’倒过来就是‘由自’，因此‘自由’等于‘由自’，‘由自’即是随心所欲”，这两种关于自由的观点：前者是（   ）的观点，后者是（   ）的观点' ,
'唯物辩证法/唯意志论' , '机械唯物主义/唯心主义' , '历史唯心主义/历史唯物主义' , '主观唯心主义/唯物辩证法' , 'A' , '唯物辩证法说的就是这个道理，唯物辩证法说的就是这个道理，唯物辩证法说的就是这个道理，' , 2 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 2 , 1 , 'With the _______of Mary, all the girl students are eager to go to the party.' , 
'exhibition' , 'exception' , 'except' , 'reception' , 'B' , 'except的用法except的用法，except的用法，except的用法except的用法，except的用法，except的用法，' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 2 , 1 , 'This river is so big that it is impossible to build a _______ under it without modern technology.' , 
'canal' , 'tunnel' , 'channel' , 'cable' , 'B' , 'tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法tunnel的用法' , 2 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 3 , 1 , '程序流程图中带有箭头的线段表示的是' ,
'图元关系' , ' 数据流 ' , '控制流' , '调用关系 ' , 'C' , '程序流程图中带有箭头的线段表示的是控制流,程序流程图中带有箭头的线段表示的是控制流,程序流程图中带有箭头的线段表示的是控制流,程序流程图中带有箭头的线段表示的是控制流,' , 1 , null);
insert into question  (id , subid , qtid ,  qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image  ) 
values(seq_que.nextval , 3 , 1 , '结构化程序设计的基本原则不包括' ,
'多态性' , '自顶向下' , '模块化' , '逐步求精' , 'A' , '结构化程序设计的基本原则不包括多态性,结构化程序设计的基本原则不包括多态性,结构化程序设计的基本原则不包括多态性,结构化程序设计的基本原则不包括多态性,结构化程序设计的基本原则不包括多态性' , 2 , null);
------多选题表------
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 2 , '显微摄影是一门使用照相拍摄显微镜下一般用肉眼无法看清的标本的技术。肉眼中千篇一律的细沙，在显微镜下，却是“一沙一世界”，有的晶莹剔透像宝石，有的金黄酥脆像饼干，即使是司空见惯的柴米油盐，在显微镜下也会展现神奇而充满魅力的另一面。显微镜下的“一沙一世界”表明' ,
'任何事物都具有无限多样的属性' , '事物的本质随着人们的认识变化而改变' , '人们能够透过对个别事物的认识而达到对世界整体的把握' , '人们可以通过制造和使用工具日益深化对客观世界的认识' , 'ACD' , 
'任何事物都不是不变的，任何事物都不是不变的，任何事物都不是不变的，任何事物都不是不变的，任何事物都不是不变的，，任何事物都不是不变的' , 1 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 2 , '唐朝诗人张若虚《春江花月夜》中，“人生代代无穷已，江月年年只相似”两句诗蕴含着时间一维性的哲理，下列诗句中蕴含相同哲理的是' , 
'闲云潭影日悠悠，物换星移几度秋' , '花开堪折直须折，莫待无花空折枝' , '黑发不知勤学早，白首方悔读书迟' , '溪云初起日沉阁，山雨欲来风满楼' , 'ABC' , 
'诗的意思很明显，诗的意思很明显，诗的意思很明显，诗的意思很明显，诗的意思很明显，诗的意思很明显，诗的意思很明显，诗的意思很明显诗的意思很明显，诗的意思很明显' , 2 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 2 , 'What are the several steps of Savings deposits? ' ,
'open an account' , 'deposit money' , 'transfer money' , 'settlement' , 'AB' , 'several steps,several steps,several steps,several stepsseveral steps,several stepsseveral steps,' ,1 ,null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 2 , 'Bank is internal audit departments () periodically review the rating system and its banking operations, the prosecution trial included____.' , 
' Operation of the credit sector. ' , ' Probability of default.' , 'LGD(loss given default). ' , 'Default risk exposure. ' , 'ABCD' , 'periodically review,periodically reviewperiodically review,periodically review,periodically ' , 2 ,null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 2 , '以下用户标识符，其中合法的是（）。' ,
'return ' , 'f2_G3' , 'A3-3' , 'abc' , 'BD' , 'AC不正确，AC不正确AC不正确，AC不正确，AC不正确，AC不正确，AC不正确，AC不正确，AC不正确，AC不正确，AC不正确，AC不正确' , 1 , null);
insert into question (id , subid , qtid , qtitle , optiona , optionb , optionc , optiond , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 2 , '以下叙述中正确的是（）。' , '一个C源程序可由一个或多个函数组成' , '一个C源程序必须包含一个main()函数' , 'C源程序的基本组成单位是函数' , '在C源程序中，注释说明只能位于一条语句的最后' , 
'ABC' , 'D不正确，D不正确，D不正确D不正确D不正确，D不正确，D不正确，D不正确D不正确D不正确D不正确D不正确D不正确D不正确，' , 2 , null);
------判断题表------
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 3 , '新世纪以来，我国经济和社会发展呈现出一系列新的阶段性特征，但是，这些新的阶段性特征的出现并没有改变我国仍处于社会主义初级阶段这一基本事实，这表明社会主义初级阶段是长期性与阶段性统一的动态发展过程' , 
'T' , '长期性与阶段性统一的动态发展过程，长期性与阶段性统一的动态发展过程长期性与阶段性统一的动态发展过程长期性与阶段性统一的动态发展过程。' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 1 , 3 , '西藏自治区成立五十年来，通过实行民族区域自治制度，从落后走向进步、从贫穷走向富裕、从封闭走向开放，社会制度实现了历史性的跨越，今天的西藏，社会稳定、经济发展、民生改善、生态向好，各方面成绩卓越，实践证明，民族区域自治制度是适合民族地区特点，具有中国特色的一项基本政治制度，民族区域自治的核心是保障少数民族当家作主、管理本民族本地方事务的权利' ,
'T' , '保障少数民族当家作主、管理本民族本地方事务的权利保障少数民族当家作主、管理本民族本地方事务的权利保障少数民族当家作主、管理本民族本地方事务的权利' , 2 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 3 , 'In all G-10 countries, the minimum ratios for Tier 1 and Total capital are 6% and 10%, respectively.' , 
'F' , 'In all G-10 countries, the minimum ratios for Tier 1 and Total capital are 6% and 20%, respectively.' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 2 , 3 , 'The Basel I minimum Tier 1 and Tier 2 capital ratios are each 4%. ' ,
'F' , 'The Basel I minimum Tier 1 and Tier 2 capital ratios are each 20%.' , 2 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 3 , 'Word2010中如需对某个样式进行修改，可点击插入选项卡中的“更改样式”按钮。' , '错' , 
'这个是错的，这个是错的，这个是错的，这个是错的，这个是错的，这个是错的，这个是错的这个是错的，这个是错的这个是错的，这个是错的这个是错的' , 1 , null);
insert into question (id , subid , qtid , qtitle , result , knowpint , difficulty , image )
values(seq_que.nextval , 3 , 3 , '图片被裁剪后，被裁剪的部分仍作为图片文件的一部分被保存在文档中。' , '错' , '这个是错的，这个是错的，这个是错的，这个是错的，这个是错的，这个是错的，这个是错的这个是错的，这个是错的这个是错的，这个是错的这个是错的' , 2 ,null);


--知识点--
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '高等数学1' , '知识点1的描述' ,1);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '政治' , '知识点2的描述' ,1);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '语法' , '知识点3的描述' ,2);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, '宾语从句' , '知识点4的描述' ,2);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, 'word操作' , '知识点5的描述' ,3);
insert into point(id , pname , pex , subid  )values(seq_point.nextval, 'VC++' , '知识点6的描述' ,3);
--知识点和题多对多

insert into qprelation(pid , qid) values(2, 1);
insert into qprelation(pid , qid) values(1, 2);
insert into qprelation(pid , qid) values(2, 3);
insert into qprelation(pid , qid) values(2, 4);
insert into qprelation(pid , qid) values(2, 5);
insert into qprelation(pid , qid) values(1, 6);
insert into qprelation(pid , qid) values(2, 7);
insert into qprelation(pid , qid) values(2, 8);
---forum---
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'【公告】账号发言被隐藏改密无法解封请看这里','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
3,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'【倡议】贴吧吧吧友自律签到大楼','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
1,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'社区，你我共同的家园遵守法律法规，遵守贴吧协议','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
null,1,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'在版面屠版式发贴或者在不相干主题下刷回复，都会被处理哦','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
3,null,sysdate);
insert into forum(fid,ftitle,fcontent,aid,stuid,fdate)values(seq_forum.nextval,'关于双浦镇铜鉴湖村建设美丽乡村，心在流血','要有把路走绝的精神，激流勇退是一种境界，把路走绝是一种精神。坚持到底，不会错的；坚持到底，就是成功！',
null,2,sysdate);
---reply
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',1,null,1,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',2,null,2,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'火钳留名',null,2,3,sysdate);
insert into reply(rid,rcontent,aid,stuid,fid,rdate)values(seq_reply.nextval,'同意',3,null,1,sysdate);
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
