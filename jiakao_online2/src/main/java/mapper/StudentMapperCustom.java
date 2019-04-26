package mapper;

import po.Pagination;
import po.Student;

import java.util.List;

public interface StudentMapperCustom {
	List<Student> getListByLimit(Pagination pagination);
}