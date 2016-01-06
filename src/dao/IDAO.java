package dao;

import java.util.List;

/**
 * DAO接口，规定DAO提供的方法
 * Created by hypo on 15-12-26.
 */
public interface IDAO<T> {

    /**
     * 以ID快速获取相关对象
     * @param id 要获取的ID
     * @return   返回相关对象
     */
    T get(Integer id);

    /**
     * 数据持久化到数据库
     * @param one 要持久化的对象
     * @return    返回是否持久化成功
     */
    Boolean add(T one);

    /**
     * 在数据库中删除相关数据
     * @param one 要删除的对象
     * @return    返回是否删除成功
     */
    Boolean delete(T one);

    /**
     * 更新数据
     * @param one 要更新的数据对象
     * @return    返回是否更新成功
     */
    Boolean update(T one);

    /**
     * 查询数据
     * @param HQL 输入要查询的HQL语句
     * @return    返回符合条件的对象列表
     */
    List<T> query(String HQL);
}
