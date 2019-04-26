package controller;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import po.*;
import service.QuestionsService;
import service.ResultService;
import service.StudentService;
import service.TaotiService;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ExamController {
	@Autowired
	private TaotiService taotiService;
	
	@Autowired
	private QuestionsService questionsService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ResultService resultService;
	
	@RequestMapping("/toExam.action")
	public String toExam() throws Exception{
		return "/exam";
	}
	
	@RequestMapping("/toExamPage.action")
	public ModelAndView toExamPage(Integer lessonid) throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		List<Taoti> list = taotiService.findListByLessonid(lessonid);//通过lessonid找到对应套题类，主要需要id
		List<QuestionsCustom> list2 = null;
		if (list.size()>0) {
			Integer length=list.size();
			Integer index=(int) (Math.random()*(length-1));
			Taoti taoti=list.get(index);
			if(taoti.getId().equals(6)){
				list2 = questionsService.findListByTaotiid(taoti.getId());//通过套题id在question表中随机选取100道
			}
			if(taoti.getId().equals(8)){
				list2 = questionsService.findListByTaotiid2(taoti.getId());//通过套题id在question表中随机选取50道

			}

			modelAndView.addObject("list", list2);
			System.out.println(list2.size());
		}else {
			modelAndView.addObject("list", null);
		}
		modelAndView.setViewName("/examPage");
		return modelAndView;
	}
	
	@RequestMapping("/postExam.action")
	public ModelAndView postExam(Exam exam,HttpSession session) throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		
		Studentresult studentresult=new Studentresult();
		
		Map<Integer, String> map = exam.getAnswerMap();
		Set<Integer> keySet=map.keySet();
		Iterator<Integer> it=keySet.iterator();
		Integer singleGrade=0;
		Integer doubleGrade=0;
		Integer taotiId=null;
		while(it.hasNext()) {
			Integer key=it.next();
			String value=map.get(key);
			
			Questions questions = questionsService.findById(key);
			if(taotiId == null) {
				taotiId=questions.getTaotiid();
			}
			if(questions.getType().equals("多选")) {
				if(questions.getAnswer().equals(value)) {
					doubleGrade+=1;
				}
			}else {
				if(questions.getAnswer().equals(value)) {
					singleGrade+=1;
				}
			}
		}

		Integer totalGrade=singleGrade+doubleGrade;
		if(taotiId==8){
			totalGrade*=2;
		}

		Taoti taoti = taotiService.fintOneById(taotiId);
		
		String examnumber="CN";
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
		Date date=new Date();
		String strD = simpleDateFormat.format(date);
		Object studentName = session.getAttribute("studentName");
		Integer studentId=null;
		if(studentName!=null) {
			String studentName2=studentName.toString();
			Student student = studentService.findOne(studentName2);
			studentId=student.getId();
		}
		examnumber=examnumber+strD+studentId;
		
		studentresult.setExamnumber(examnumber);
		studentresult.setLessonid(taoti.getLessonid());
		studentresult.setResingle(singleGrade);
		studentresult.setResmore(doubleGrade);
		studentresult.setRestotal(totalGrade);
		studentresult.setCreatetime(new Timestamp(System.currentTimeMillis()));
		studentresult.setStudentid(studentId);

		
		if(session.getAttribute("studentName")!=null) {
			resultService.addOne(studentresult);
		}
		
		List<QuestionsCustom> questionsCustoms = questionsService.findListByTaotiid(taotiId);
		StudentresultCustom studentresultCustom=new StudentresultCustom();
		BeanUtils.copyProperties(studentresult, studentresultCustom);
		studentresultCustom.setLessonname(questionsCustoms.get(0).getLessonName());
		
		modelAndView.setViewName("/examResult");
		modelAndView.addObject("studentresult", studentresultCustom);
		
		return modelAndView;
	}
}
