package serviceImpl;

import mapper.StudentresultMapper;
import mapper.StudentresultMapperCustom;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import po.*;
import service.ResultService;
import vo.QueryResultVo;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;

public class ResultServiceImpl implements ResultService {
	@Autowired
	private StudentresultMapper studentresultMapper;
	
	@Autowired
	private StudentresultMapperCustom studentresultMapperCustom;

	public List<Studentresult> getList() throws Exception {
		StudentresultExample example=new StudentresultExample();
		return studentresultMapper.selectByExample(example);
	}

	public List<StudentresultCustom> getListByLimit(Pagination pagination, QueryResult queryResult) throws Exception {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		QueryResultVo queryResultVo=new QueryResultVo();
		queryResultVo.setPagination(pagination);
		queryResultVo.setQueryResult(queryResult);
		return studentresultMapperCustom.getListByLimit(queryResultVo);
	}

	@Transactional
	public void addOne(Studentresult studentresult) throws Exception {
		studentresultMapper.insertSelective(studentresult);
	}

	public List<StudentresultCustom> getListByStudentId(Integer id) throws Exception {
		return studentresultMapperCustom.getListByStudentId(id);
	}

	public void export(HttpServletResponse response, Workbook workbook, String fileName) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("utf-8"),"iso8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		OutputStream out=response.getOutputStream();
		workbook.write(out);
		out.flush();
		out.close();
	}

	@Override
	public Integer getTotalByLessonnName(String lessonName, List<StudentresultCustom> list) throws Exception {
		int total=0;
		for (StudentresultCustom studentresultCustom : list) {
			if (studentresultCustom.getLessonname().equals(lessonName)) {
				total+=studentresultCustom.getRestotal();
			}
		}
		return total;
	}

}
