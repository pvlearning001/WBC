package hls.wbc.utilities;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import hls.wbc.constants.AppContants;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.xml.bind.DatatypeConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;

import javax.swing.text.Utilities;
import java.text.ParseException;
import java.util.Date;

public class SecuritiesUtils {
    public static String toEncodeMD5(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance(AppContants.SecuritiesValues.MD5);
        md.update(text.getBytes());
        byte[] digest = md.digest();
        String result = DatatypeConverter.printHexBinary(digest);;
        return  result;
    }

    public static String toEncodeBCrypt(String text) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        return passwordEncoder.encode(text);
    }

    public static boolean isMatchesBCrypt(String plainText, String enryptText){
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        return passwordEncoder.matches(plainText, enryptText);
    }

    public static String getToken(){
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

    public static SignedJWT getSignedJWT(String token, String signerKey) throws JOSEException, ParseException {
        JWSVerifier verifier = new MACVerifier(signerKey.getBytes());
        return SignedJWT.parse(token);
    }

    public static SignedJWT getSignedJWT(String signerKey) throws JOSEException, ParseException {
        String token = getToken();
        return getSignedJWT(token, signerKey);
    }

    public static Object getClaimsValue(String token, String signerKey, String claimsKey) throws ParseException, JOSEException {
        if (!AppUtils.isNullOrEmptyString(token)) {
            SignedJWT signedJWT = getSignedJWT(token, signerKey);
            JWTClaimsSet jwtClaimsSet = signedJWT.getJWTClaimsSet();
            if (jwtClaimsSet != null) {
                return signedJWT.getJWTClaimsSet().getClaim(claimsKey);
            }
        }
        return null;
    }

    public static Object getClaimsValue(String signerKey, String claimsKey) throws ParseException, JOSEException {
        String token = getToken();
        return getClaimsValue(token, signerKey, claimsKey);
    }

    public static int getClaimsUserId(String token, String signerKey) throws ParseException, JOSEException {
        String claimsKey = AppContants.TokenKeyClaim.userId;
        Object userIdObj = getClaimsValue(token, signerKey, claimsKey);
        if (userIdObj != null)
            return Integer.parseInt(userIdObj.toString());
        return AppContants.SecuritiesValues.AdminId;
    }

    public static int getClaimsUserId(String signerKey) throws ParseException, JOSEException {
        String token = getToken();
        return getClaimsUserId(token, signerKey);
    }
}
