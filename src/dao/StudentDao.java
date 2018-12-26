package dao;

import bean.Student;

import java.util.List;

/**
 * Date Access Object，数据库访问对象接口
 */

public interface StudentDao {

	/**
	 * 获取数据总数目
	 * @return
	 */
	int getTotal();

	/**
	 * 增加一条数据
	 * @param student
	 */
	void add(Student student);

	/**
	 * 删除一条数据
	 * @param id
	 */
	void delete(int id);

	/**
	 * 更新一条数据
	 * @param student
	 */
	void update(Student student);

	/**
	 * 根据id返回一条数据
	 * @param id
	 * @return
	 */
	Student get(int id);

	/**
	 * list的简便方法，用于返回所有数据
	 * @return
	 */
	List<Student> list();

	/**
	 * 查询从start索引位置开始的count条数据
	 * @param start
	 * @param count
	 * @return
	 */
	List<Student> list(int start, int count);
}
