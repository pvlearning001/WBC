package hls.wbc.repositories;

import hls.wbc.entities.Role;
import hls.wbc.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
    //Optional<Set<Role>> findByIsDeleted(boolean isDeleted);
}
