package service;

import po.Manager;
import po.Pagination;

import java.util.List;

public interface ManagerService {

	List<Manager> checkManager(Manager manager) throws Exception;

	List<Manager> getList() throws Exception;

	List<Manager> getListByLimit(Pagination pagination) throws Exception;

	void addOne(Manager manager) throws Exception;

	void deleteOne(Integer id) throws Exception;

	Manager findOneById(Integer id) throws Exception;

	void updateOne(Manager manager) throws Exception;
}
