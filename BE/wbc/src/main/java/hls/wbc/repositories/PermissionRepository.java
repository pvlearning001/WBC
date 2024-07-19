package hls.wbc.repositories;

import hls.wbc.entities.Permission;
import hls.wbc.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface PermissionRepository extends JpaRepository<Permission, Integer> {
    Set<Role> findByIsDeleted(boolean isDeleted);
}
