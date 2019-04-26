package mapper;

import po.Pagination;
import po.TaotiCustom;

import java.util.List;

public interface TaotiMapperCustom {
	List<TaotiCustom> getListByLimit(Pagination pagination);
}