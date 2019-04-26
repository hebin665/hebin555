package mapper;

import po.Manager;
import po.Pagination;

import java.util.List;

public interface ManagerMapperCustom {
	List<Manager> getListByLimit(Pagination pagination);
}