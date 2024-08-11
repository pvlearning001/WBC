package hls.wbc.services;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.entities.FileUpload;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.repositories.FileUploadRepository;
import hls.wbc.utilities.AppUtils;
import hls.wbc.utilities.SecuritiesUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import org.apache.commons.io.FilenameUtils;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.NoSuchAlgorithmException;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class FileUploadService {

    FileUploadRepository fileUploadRepository;

    public List<FileUploadResponse> uploadFiles(FileUploadRequest request, String uploadDirPath, String uniqueName, int fileSizeMax, List<String> fileTypes, ErrorCode fileTypesError) throws IOException, NoSuchAlgorithmException {
        List<MultipartFile> files = request.getFiles();
        files = (files == null) ? new ArrayList<MultipartFile>() : files;

        List<String> contentTypeList = new ArrayList<String>();
        for(MultipartFile file : files) {
            if (file.getSize() == 0)
                continue;

            if (file.getSize() > fileSizeMax) {
                throw new AppException(ErrorCode.FILE_OVER_SIZE);
            }

            String contentType = file.getContentType();
            contentTypeList.add(contentType);
            if (fileTypes != null && !fileTypes.isEmpty()) {
                for (String fileType : fileTypes)
                    if (contentType == null
                            || !contentType.startsWith(fileType)) {
                        throw new AppException(fileTypesError);
                    }
            }
        }

        List<FileUploadResponse> result = new ArrayList<FileUploadResponse>();

        for(MultipartFile file : files){
            FileUpload entity = new FileUpload();
            entity.setTraceNew(AppContants.SecuritiesValues.AdminId, null);
            entity.setGuid(UUID.randomUUID().toString());
            Path uploadDir = Paths.get(uploadDirPath);

            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);

            }

            String contentType = contentTypeList.get(files.indexOf(file));
            String uploadDirString = uploadDir.toString();

            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            String fileNameExt = FilenameUtils.getExtension(fileName);
            uniqueName = entity.getGuid() + AppContants.StringValues.Dot + fileNameExt;
            String hashContent = SecuritiesUtils.toEncodeMD5(file.getBytes().toString());

            Path destination = Paths.get(uploadDirString, uniqueName);

            Files.copy(file.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);

            FileUploadResponse resultItem = FileUploadResponse.builder()
                    .name(fileName)
                    .uniqueName(uniqueName)
                    .extName(fileNameExt)
                    .path(uploadDirString)
                    .contentType(contentType)
                    .hashContent(hashContent)
                    .build();

            entity.setName(resultItem.getName());
            entity.setPath(resultItem.getPath());
            entity.setExtName(resultItem.getExtName());
            entity.setUniqueName(resultItem.getUniqueName());
            entity.setContentType(resultItem.getContentType());
            entity.setHashContent(resultItem.getHashContent());

            fileUploadRepository.save(entity);
            result.add(resultItem);
        }

        return result;
    }

    public List<FileUploadResponse> uploadFileImagesUser(FileUploadRequest request) throws IOException, NoSuchAlgorithmException {
        String uploadDirPath = "uploads/images/users/";
        List<String> fileTypes = List.of(AppContants.UtilitiesValues.FileContentTypeImage);
        return uploadFiles(request, uploadDirPath, null, AppContants.UtilitiesValues.FileSizeMaxImage, fileTypes, ErrorCode.NOT_IMAGE_FILE);
    }

    public List<FileUploadResponse> uploadFilePdf(FileUploadRequest request) throws IOException, NoSuchAlgorithmException {
        String uploadDirPath = "uploads/documents/messages/";
        List<String> fileTypes = List.of(AppContants.UtilitiesValues.FileContentTypePdf);
        return uploadFiles(request, uploadDirPath, null, AppContants.UtilitiesValues.FileSizeMaxImage, fileTypes, ErrorCode.NOT_IMAGE_FILE);
    }
}
