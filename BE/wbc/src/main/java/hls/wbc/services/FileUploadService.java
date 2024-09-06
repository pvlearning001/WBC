package hls.wbc.services;
import com.nimbusds.jose.JOSEException;
import hls.wbc.constants.AppContants;
import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.responses.FileAttachmentResponse;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.entities.FileUpload;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.FileUploadMapper;
import hls.wbc.repositories.FileUploadRepository;
import hls.wbc.utilities.SecuritiesUtils;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
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
import java.text.ParseException;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class FileUploadService {
    @NonFinal
    @Value("${jwt.signerKey}")
    protected String SIGNER_KEY;
    FileUploadRepository repository;
    FileUploadMapper mapper;

    public List<FileUploadResponse> uploadFiles(FileUploadRequest request, String uploadDirPath, int fileSizeMax, List<String> fileTypes, ErrorCode fileTypesError) throws IOException, NoSuchAlgorithmException, ParseException, JOSEException {
        List<FileUploadResponse> result = new ArrayList<FileUploadResponse>();
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

        for(MultipartFile file : files){

            Path uploadDir = Paths.get(uploadDirPath);

            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }

            String contentType = contentTypeList.get(files.indexOf(file));
            String filePath = uploadDir.toString();

            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            String fileNameExt = FilenameUtils.getExtension(fileName);
            String uniqueNamePrefix = UUID.randomUUID().toString();
            String uniqueName = uniqueNamePrefix + AppContants.StringValues.Dot + fileNameExt;
            String hashContent = null;
            Path destination = Paths.get(filePath, uniqueName);

            Files.copy(file.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);

            FileUpload entity = FileUpload.builder()
                    .name(fileName)
                    .path(filePath)
                    .extName(fileNameExt)
                    .uniqueName(uniqueName)
                    .contentType(contentType)
                    .hashContent(hashContent)
                    .build();

            String token = SecuritiesUtils.getTokenString();
            int userId = SecuritiesUtils.getClaimsUserId(token, SIGNER_KEY);
            entity.setTraceNew(userId, null);
            entity.setGuid(uniqueNamePrefix);

            FileUpload saveItem = repository.save(entity);
            FileUploadResponse resultItem = mapper.toResponse(saveItem);
            result.add(resultItem);
        }

        return result;
    }

    public List<FileUploadResponse> uploadFileImagesUser(FileUploadRequest request) throws IOException, NoSuchAlgorithmException, ParseException, JOSEException {
        String uploadDirPath = AppContants.FilePaths.ImageUser;
        List<String> fileTypes = List.of(AppContants.UtilitiesValues.FileContentTypeImage);
        return uploadFiles(request, uploadDirPath, AppContants.UtilitiesValues.FileSizeMaxImage, fileTypes, ErrorCode.NOT_IMAGE_FILE);
    }

    public List<FileUploadResponse> uploadFilePdf(FileUploadRequest request) throws IOException, NoSuchAlgorithmException, ParseException, JOSEException {
        String uploadDirPath = AppContants.FilePaths.DocumentsMessage;
        List<String> fileTypes = List.of(AppContants.UtilitiesValues.FileContentTypePdf);
        return uploadFiles(request, uploadDirPath, AppContants.UtilitiesValues.FileSizeMaxImage, fileTypes, ErrorCode.NOT_PDF_FILE);
    }

    public FileUploadResponse getById(int id){
        Optional<FileUpload> entityOpt = repository.findById(id);
        if (entityOpt.isPresent()){
            return mapper.toResponse(entityOpt.get());
        }
        return FileUploadResponse.builder().build();
    }

    public void deletePhysicalFiles(List<Integer> ids) throws IOException {
        for(int id:ids){
            Optional<FileUpload> fileOpt = repository.findById(id);
            if (fileOpt.isPresent()){
                FileUpload file = fileOpt.get();
                Path path = Paths.get(file.getPath(), file.getUniqueName());
                Files.deleteIfExists(path);
            }
        }
    }

    public FileAttachmentResponse getBinaryArray(int id) throws IOException {
        String base64String = AppContants.StringValues.Empty;
        Optional<FileUpload> fileOpt = repository.findById(id);
        if (fileOpt.isPresent()){
            FileUpload file = fileOpt.get();
            Path path = Paths.get(file.getPath(), file.getUniqueName());
            byte[] byteArr = Files.readAllBytes(path);
            base64String = Base64.getEncoder().encodeToString(byteArr);
        }
        return FileAttachmentResponse.builder().fileContent(base64String).build();
    }
}
