package hls.wbc.CustomRepositories;

import hls.wbc.entities.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserCustomRepository {
    List<User> customGetDataBySql(String sql);
    List<User> customGetAllData();
    List<User> customGetActiveData(boolean isDeleted);
    int customGetMaxId();
    int customExecQuery(String sql);
    User customFindByIdCustom(int id);
    User customSave(Object t);
    User customUpdate(Object t);
    User customDelete(int id);
}
