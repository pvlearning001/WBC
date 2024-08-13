package hls.wbc.services;
import hls.wbc.dto.responses.PermissionResponse;
import hls.wbc.entities.Permission;
import hls.wbc.mappers.PermissionMapper;
import hls.wbc.repositories.PermissionRepository;
import hls.wbc.dto.requests.PermissionRequest;
import lombok.AccessLevel;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PermissionService {

    PermissionRepository permissionRepository;
    PermissionMapper permissionMapper;

    public PermissionResponse create(PermissionRequest request){
        Permission permission = permissionMapper.toEntity(request);
        permission = permissionRepository.save(permission);
        return permissionMapper.toResponse(permission);
    }

    public List<PermissionResponse> getAll(){
        var permissions = permissionRepository.findAll();
        return permissions.stream().map(permissionMapper::toResponse).toList();
    }

    public void delete(int permissionId){
        permissionRepository.deleteById(permissionId);
    }

}
