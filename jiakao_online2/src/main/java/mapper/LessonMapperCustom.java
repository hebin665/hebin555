package mapper;

import po.Lesson;
import po.Pagination;

import java.util.List;

public interface LessonMapperCustom {
	List<Lesson> getListByLimit(Pagination pagination);
}