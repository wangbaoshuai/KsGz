package com.exam.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.exam.biz.CardBiz;
import com.exam.biz.DoneBiz;
import com.exam.biz.ErrorBiz;
import com.exam.biz.GradeBiz;
import com.exam.biz.QuestionBiz;
import com.exam.entity.Card;
import com.exam.entity.Done;
import com.exam.entity.Error;
import com.exam.entity.Grade;
import com.exam.entity.Question;
import com.exam.entity.Student;
import com.exam.entity.Subject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Mulquestion entity. @author MyEclipse Persistence Tools
 */

public class CardAction extends ActionSupport {
	private GradeBiz gradebiz;
	private CardBiz cardbiz;
	private QuestionBiz quebiz;
	private ErrorBiz errorbiz;
	private DoneBiz donebiz;

	private Subject subject;
	private Card card;
	private Integer nextqno;
	private Integer time;
	private Grade grade;
	private Integer pid;
	// 结果
	private Integer total;
	private Integer right;
	private Integer wrong;
	// 下载
	private String fileName;
	private InputStream inputStream;

	// 下载BySUb
	public String down() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");

			List<Question> qlist = quebiz
					.findQuestionBySubject(subject.getId());
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('抱歉，所选题库为空，敬请期待！');</script>");
				return "error";
			}
			if (stu.getScore() == null || stu.getScore() < 100) {
				session.put("ts",
						"<script>alert('抱歉，您的积分不足100，每日签到、到社区发帖或回复都可以获得相应的积分哦！');</script>");
				return "error";
			}
			int num = 1;
			String qtotal = "";
			for (Question q : qlist) {
				String qstr = num + "、";
				// 单选
				if (q.getQuetype().getId() == 1) {
					qstr += q.getQtitle() + "\r\n";
					qstr += "A、" + q.getOptiona() + "\r\n";
					qstr += "B、" + q.getOptionb() + "\r\n";
					qstr += "C" + q.getOptionc() + "\r\n";
					qstr += "D、" + q.getOptiond() + "\r\n";
					qstr += "答案：" + q.getResult() + "\r\n";
					qstr += "解析：" + q.getAnalysis() + "\r\n";
				}
				// 多选
				if (q.getQuetype().getId() == 2) {
					qstr += q.getQtitle() + "\r\n";
					qstr += "A、" + q.getOptiona() + "\r\n";
					qstr += "B、" + q.getOptionb() + "\r\n";
					qstr += "C" + q.getOptionc() + "\r\n";
					qstr += "D、" + q.getOptiond() + "\r\n";
					qstr += "答案：" + q.getResult() + "\r\n";
					qstr += "解析：" + q.getAnalysis() + "\r\n";
				}
				// 判断
				if (q.getQuetype().getId() == 3) {
					qstr += q.getQtitle() + "\r\n";
					qstr += "答案：" + q.getResult() + "\r\n";
					qstr += "解析：" + q.getAnalysis() + "\r\n";
				}
				qtotal += qstr;
				num++;
			}
			// 输出流
			String path = ServletActionContext.getRequest().getRealPath(
					"/XLS/" + stu.getId() + "_" + subject.getId() + ".txt");
			OutputStream os = new FileOutputStream(path);
			byte[] get = qtotal.getBytes();
			os.write(get);
			os.flush();
			os.close();
			fileName = stu.getId() + "_" + subject.getId() + ".txt";
			path = ServletActionContext.getRequest().getRealPath(
					"/XLS/" + fileName);
			inputStream = new FileInputStream(path);
			// 扣积分
			stu.setScore(stu.getScore() - 100);
			session.put("user", stu);
			return "down_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 查找一次成绩报告
	public String find() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			grade = gradebiz.findGradeById(grade.getId());
			total = cardList.size();
			right = 0;
			wrong = 0;
			for (Card c : cardList) {
				if ("T".equals(c.getResult())) {
					right++;
				}
				if ("F".equals(c.getResult())) {
					wrong++;
				}
				if (c.getResult() == null)
					wrong++;
			}
			session.put("cardList", cardList);
			return "find_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// submit
	public String submit() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");

			grade = gradebiz.findGradeById(card.getGrade().getId());
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			total = cardList.size();
			right = 0;
			wrong = 0;
			for (Card c : cardList) {
				if ("T".equals(c.getResult())) {
					right++;
					// grade.setScore(grade.getScore()+c.getScore());
				}
				if ("F".equals(c.getResult())) {
					wrong++;
					// 添加错题表

					// 判断是否已经有
					if (errorbiz.findErrorByQidAndStu(c.getQuestion().getId(),
							stu) == null) {
						Error e = new Error();
						e.setGrade(grade);
						e.setQuestion(c.getQuestion());
						e.setQuetype(c.getQuetype());
						e.setStudent(stu);
						errorbiz.addError(e);
					}
				}
				if (c.getResult() == null)
					wrong++;
			}
			grade.setScore(Integer.valueOf((right * 100 / total)));
			gradebiz.updateGrade(grade);
			// 更新
			session.put("cardList", cardList);
			return "submit_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 随机测试
	public String add() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			List<Question> qlist = quebiz
					.findQuestionBySubject(subject.getId());
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('抱歉，所选题库为空，敬请期待！');</script>");
				return "error";
			}
			// 如果题数小于10，全部显示/否则随机抽10题
			if (qlist.size() <= 10) {
				addBySub();

			} else {
				// 随机抽10题
				Random r = new Random();
				Set<Integer> set = new HashSet<Integer>();
				// 测试10道题
				while (set.size() < 10) {
					set.add(r.nextInt(qlist.size()));
				}
				// 新建grade;
				Grade g = new Grade();
				g.setTime(new Date());
				g.setStudent(stu);
				g.setSubject(subject);
				g.setScore(0);
				g.setType("随机练习");
				gradebiz.addGrade(g);
				Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
				// 加题
				Iterator<Integer> num = set.iterator();
				int qno = 1;
				while (num.hasNext()) {
					Card c = new Card();
					c.setGrade(grade);
					c.setQuestion(qlist.get(num.next()));
					c.setScore(0);
					c.setQno(qno);
					cardbiz.addCard(c);
					qno++;
				}
				// 显示第一题
				card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
				List<Card> cardList = cardbiz.findCardByGid(grade.getId());
				session.put("cardList", cardList);
			}
			// 时间
			time = 1800;
			return "add_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 易错题
	public String addyicuo() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			List<Integer> elist = errorbiz.findErrorBySub(subject.getId());
			session.put("elist", elist);
			// 易错的题
			List<Question> qlist = new ArrayList<Question>();
			for (Integer qid : elist) {
				qlist.add(quebiz.findQuestionById(qid));
			}
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('抱歉，所选题库为空，敬请期待！');</script>");
				return "error";
			}

			// 新建grade;
			Grade g = new Grade();
			g.setTime(new Date());
			g.setStudent(stu);
			g.setSubject(subject);
			g.setScore(0);
			g.setType("易错题练习");
			gradebiz.addGrade(g);
			Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
			// 加题
			int qno = 1;
			for (Question q : qlist) {
				Card c = new Card();
				c.setGrade(grade);
				c.setQuestion(q);
				c.setScore(0);
				c.setQno(qno);
				cardbiz.addCard(c);
				qno++;
			}
			// 显示第一题
			card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			session.put("cardList", cardList);
			// 时间
			time = 1800;
			return "add_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 测试全部
	public String addBySub() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			List<Question> qlist = quebiz
					.findQuestionBySubject(subject.getId());
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('抱歉，所选题库为空，敬请期待！');</script>");
				return "error";
			}
			// 新建grade;
			Grade g = new Grade();
			g.setTime(new Date());
			g.setStudent(stu);
			g.setSubject(subject);
			g.setScore(0);
			g.setType("强化练习");
			gradebiz.addGrade(g);
			Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
			// 加题
			int qno = 1;
			for (Question q : qlist) {
				Card c = new Card();
				c.setGrade(grade);
				c.setQuestion(q);
				c.setScore(0);
				c.setQno(qno);
				cardbiz.addCard(c);
				qno++;
			}
			// 显示第一题
			card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			session.put("cardList", cardList);
			// 时间
			time = 36000;
			return "addBySub_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 练习BY知识点
	public String addByPoint() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			List<Question> qlist = quebiz.findQuestionByPoint(pid);
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('抱歉，所选题库为空，敬请期待！');</script>");
				return "error";
			}
			// 新建grade;
			Grade g = new Grade();
			g.setTime(new Date());
			g.setStudent(stu);
			g.setSubject(subject);
			g.setScore(0);
			g.setType("强化练习");
			gradebiz.addGrade(g);
			Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
			// 加题
			int qno = 1;
			for (Question q : qlist) {
				Card c = new Card();
				c.setGrade(grade);
				c.setQuestion(q);
				c.setScore(0);
				c.setQno(qno);
				cardbiz.addCard(c);
				qno++;
			}
			// 显示第一题
			card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			session.put("cardList", cardList);
			// 时间
			time = 36000;
			return "addByPoint_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 练错题bySubject
	public String addByErrorAndSub() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			List<Error> elist = errorbiz.findErrorBySubidAndUser(
					subject.getId(), stu);
			if (elist.size() < 1) {
				session.put("ts", "<script>alert('您该科目不存在错题！赶紧去练练哦');</script>");
				return "error";
			}
			// 新建grade;
			Grade g = new Grade();
			g.setTime(new Date());
			g.setStudent(stu);
			g.setSubject(subject);
			g.setScore(0);
			g.setType("错题练习");
			gradebiz.addGrade(g);
			Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
			// 加题
			int qno = 1;
			for (Error e : elist) {
				Card c = new Card();
				c.setGrade(grade);
				c.setQuestion(e.getQuestion());
				c.setScore(0);
				c.setQno(qno);
				cardbiz.addCard(c);
				qno++;
			}
			// 显示第一题
			card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			session.put("cardList", cardList);
			// 时间
			time = 36000;
			return "addByErrorAndSub_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	// 随机测试undo未做过的BYsubject
	public String addByUndoAndSub() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			// 获得所有的BySub
			List<Question> qlist = quebiz
					.findQuestionBySubject(subject.getId());
			// 获得做过的所有的BySub
			List<Done> donelist = donebiz.findDoneByStuAndSub(stu, subject);
			List<Question> dqlist = new ArrayList<Question>();
			for (Done d : donelist) {
				dqlist.add(d.getQuestion());
			}
			// 去除
			qlist.removeAll(dqlist);
			if (qlist.size() < 1) {
				session.put("ts", "<script>alert('恭喜您！该科目所有题都已练过');</script>");
				return "error";
			}
			// 新建grade;
			Grade g = new Grade();
			g.setTime(new Date());
			g.setStudent(stu);
			g.setSubject(subject);
			g.setScore(0);
			g.setType("未做题练习");
			gradebiz.addGrade(g);
			Grade grade = gradebiz.findAllGradeByStu(stu).get(0);
			// 加题
			int qno = 1;
			for (Question q : qlist) {
				Card c = new Card();
				c.setGrade(grade);
				c.setQuestion(q);
				c.setScore(0);
				c.setQno(qno);
				cardbiz.addCard(c);
				qno++;
			}
			// 显示第一题
			card = cardbiz.findCardByGidAndQno(grade.getId(), 1);
			List<Card> cardList = cardbiz.findCardByGid(grade.getId());
			session.put("cardList", cardList);
			// 时间
			time = 36000;
			return "addByUndoAndSub_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	public String update() throws Exception {
		try {
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			Student stu = (Student) session.get("user");
			Card c = cardbiz.findCardById(card.getId());
			c.setUanswer(card.getUanswer());
			// 判断成绩
			if (c.getQuestion().getResult().equals(card.getUanswer())) {
				c.setResult("T");// 用户答案是否正确
				c.setScore(10);
				// 如果用户答对，把错题库里的错的删了
				Error e = errorbiz.findErrorByQidAndStu(
						c.getQuestion().getId(), stu);
				if (e != null) {
					errorbiz.deleteErrorById(e);
				}
			} else {
				c.setResult("F");
			}
			// 判断加入是否做过
			Done d = donebiz.findDoneByQid(c.getQuestion().getId());
			if (d == null) {
				Done done = new Done();
				done.setQuestion(c.getQuestion());
				done.setStudent(stu);
				donebiz.addDone(done);
			}

			// 更改+答案
			cardbiz.updateCard(c);
			// 提交整个
			if (nextqno == -1) {
				submit();
				return "submit_success";
			}
			// 更新
			card = cardbiz
					.findCardByGidAndQno(card.getGrade().getId(), nextqno);
			List<Card> cardList = cardbiz
					.findCardByGid(card.getGrade().getId());
			session.put("cardList", cardList);
			System.out.println("更新了！！！！！！！！！！！！！！！！");
			// 时间

			return "update_success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exception";
	}

	public GradeBiz getGradebiz() {
		return gradebiz;
	}

	public void setGradebiz(GradeBiz gradebiz) {
		this.gradebiz = gradebiz;
	}

	public CardBiz getCardbiz() {
		return cardbiz;
	}

	public void setCardbiz(CardBiz cardbiz) {
		this.cardbiz = cardbiz;
	}

	public QuestionBiz getQuebiz() {
		return quebiz;
	}

	public void setQuebiz(QuestionBiz quebiz) {
		this.quebiz = quebiz;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public Integer getNextqno() {
		return nextqno;
	}

	public void setNextqno(Integer nextqno) {
		this.nextqno = nextqno;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public ErrorBiz getErrorbiz() {
		return errorbiz;
	}

	public void setErrorbiz(ErrorBiz errorbiz) {
		this.errorbiz = errorbiz;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getRight() {
		return right;
	}

	public void setRight(Integer right) {
		this.right = right;
	}

	public Integer getWrong() {
		return wrong;
	}

	public void setWrong(Integer wrong) {
		this.wrong = wrong;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public DoneBiz getDonebiz() {
		return donebiz;
	}

	public void setDonebiz(DoneBiz donebiz) {
		this.donebiz = donebiz;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getInputStream() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}