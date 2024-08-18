package hls.wbc.repositories;

import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public interface JdbcUserRepository {
    Map<String, Object> getData(int userIdIndex) throws SQLException;
}
