package hls.wbc.RepositoriesCustom;

import hls.wbc.dto.responses.PagingResponse;
import hls.wbc.entities.User;
import org.springframework.data.domain.Pageable;
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

    PagingResponse<Object> getUserList(String findText, String sort,
    String sortType, int pageIndex);

    SPResult setDeleted(int userId, int userChanged, boolean deletedValue);

    SPResult save(int userId, int userChanged, String uName, String pw, String fName, String mName, String lName, String email, String phone, String rolesId);

    List<Object> getUsersRoles(int userIdIndex);

    List<Object> getAllUserDetailsPaging(Pageable pageable);
}
