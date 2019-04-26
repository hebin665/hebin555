package mapper;

import po.StudentresultCustom;
import vo.QueryResultVo;

import java.util.List;

public interface StudentresultMapperCustom {
	List<StudentresultCustom> getListByLimit(QueryResultVo queryResultVo);
	List<StudentresultCustom> getListByStudentId(Integer id);
}