package hls.wbc.utilities;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import hls.wbc.constants.AppContants;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.xml.bind.DatatypeConverter;
import java.text.ParseException;
import java.util.Date;

public class SecuritiesUtils {
    public static String toEncodeMD5(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance(AppContants.SecuritiesValues.MD5);
        byte[] digest = md.digest();
        String result = DatatypeConverter.printHexBinary(digest);
        //String result = text;
        return  result;
    }

    public static String toEncodeBCrypt(String text) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        String result = passwordEncoder.encode(text);
        //String result = text;
        return  result;
    }

    public static boolean isMatchesBCrypt(String plainText, String enryptText){
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(AppContants.SecuritiesValues.StrengBCrypt);
        return passwordEncoder.matches(plainText, enryptText);
    }

    public static SignedJWT getSignedJWT(String token, String signerKey) throws JOSEException, ParseException {
        JWSVerifier verifier = new MACVerifier(signerKey.getBytes());
        return SignedJWT.parse(token);
    }

    public static Object getClaimsValue(String token, String signerKey, String claimsKey) throws ParseException, JOSEException {
        SignedJWT signedJWT = getSignedJWT(token, signerKey);
        JWTClaimsSet jwtClaimsSet = signedJWT.getJWTClaimsSet();
        if (jwtClaimsSet != null){
            return signedJWT.getJWTClaimsSet().getClaim(claimsKey);
        }
        return null;
    }
}
