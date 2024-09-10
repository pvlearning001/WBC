package hls.wbc.utilities;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import hls.wbc.constants.AppContants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.xml.bind.DatatypeConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

import java.text.ParseException;

public class SecuritiesUtils {
    @Autowired
    private static PasswordEncoder passwordEncoder;
    public static String toEncodeMD5(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance(AppContants.SecuritiesValues.MD5);
        md.update(text.getBytes());
        byte[] digest = md.digest();
        String result = DatatypeConverter.printHexBinary(digest);;
        return  result;
    }

    public static String toEncodeBCrypt(String text) {
        if (passwordEncoder == null)
            passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        return passwordEncoder.encode(text);
    }

    public static boolean isMatchesBCrypt(String plainText, String enryptText){
        if (passwordEncoder == null)
            passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        return passwordEncoder.matches(plainText, enryptText);
    }

    public static String getUserNameByToken(){
        String result = AppContants.StringValues.Empty;
        try {
            result = SecurityContextHolder.getContext().getAuthentication().getName();
        }
        catch (Exception ex){
            result = AppContants.StringValues.Empty;
        }
        return result;
    }

    public static String getTokenString(){
        String result = AppContants.StringValues.Empty;
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            JwtAuthenticationToken oauthToken = (JwtAuthenticationToken) authentication;
            result = oauthToken.getToken().getTokenValue();
        }
        catch (Exception ex){
            result = AppContants.StringValues.Empty;
        }
        return result;
    }

    public static SignedJWT getSignedJWT(String signerKey) throws JOSEException, ParseException {
        String token = getTokenString();
        return SignedJWT.parse(token);
    }

    public static Object getClaimsValue(String signerKey, String claimsKey) throws ParseException, JOSEException {
        SignedJWT signedJWT = getSignedJWT(signerKey);
        JWTClaimsSet jwtClaimsSet = signedJWT.getJWTClaimsSet();
        if (jwtClaimsSet != null) {
            return signedJWT.getJWTClaimsSet().getClaim(claimsKey);
        }
        return null;
    }

    public static int getClaimsUserId(String signerKey) throws ParseException, JOSEException {
        String claimsKey = AppContants.TokenKeyClaim.userId;
        Object userIdObj = getClaimsValue(signerKey, claimsKey);
        if (userIdObj != null)
            return Integer.parseInt(userIdObj.toString());
        return AppContants.SecuritiesValues.AdminId;
    }
}
