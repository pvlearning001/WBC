package hls.wbc.repositories;
import hls.wbc.CustomRepositories.UserCustomRepository;
import hls.wbc.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Pageable;


import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>, UserCustomRepository {

    @Query(value = "select u from User u where isDeleted = false order by u.id DESC")
    Page<User> getAllDataPaging(Pageable pageable);

    @Query(value = "select u from User u where (u.userName like %:text%) and (u.isDeleted = false)")
    Page<User> searchData(@Param("text") String text, Pageable pageable);

    @Query("select count(u)>0 from User u where userName = ?1 and isDeleted = false")
    boolean existsByUserName(String userName);

    @Query("select count(u)>0 from User u where userName = ?1 and isDeleted = true")
    boolean existsByUserNameDeleted(String userName);

    @Query("select u from User u where userName = :userName and isDeleted = false")
    Optional<User> findByUserName(@Param("userName") String userName);

    @Query("select u from User u where userName = ?1 and isDeleted = true")
    Optional<User> findByUserNameDeleted(@Param("userName") String userName);
}
