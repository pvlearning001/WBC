package hls.wbc.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Repository
public class JdbcUserRepositoryImp implements JdbcUserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Map<String, Object> getData(int userIdIndex) throws SQLException {
        List prmtrsList = new ArrayList();
        prmtrsList.add(new SqlParameter(Types.INTEGER));
        prmtrsList.add(new SqlOutParameter("pageTotal", Types.INTEGER));
        prmtrsList.add(new SqlOutParameter("pageTotal2", Types.INTEGER));

        Map<String, Object> resultData = jdbcTemplate.call(connection -> {
            CallableStatement callableStatement = connection.prepareCall("{call sp_TestGetUsersData(?, ?, ?)}");
            callableStatement.setInt("userIdIndex", userIdIndex);
            callableStatement.registerOutParameter("pageTotal", Types.INTEGER);
            callableStatement.registerOutParameter("pageTotal2", Types.INTEGER);
            return callableStatement;
        }, prmtrsList);
        return resultData;
    }
}
