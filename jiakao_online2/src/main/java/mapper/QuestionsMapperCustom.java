package mapper;

import po.Pagination;
import po.QuestionsCustom;

import java.util.List;

public interface QuestionsMapperCustom {
	List<QuestionsCustom> getListByLimit(Pagination pagination);
	List<QuestionsCustom> getListByTaotiId(Integer taotiId);
	List<QuestionsCustom> getListByTaotiId2(Integer taotiId);

}