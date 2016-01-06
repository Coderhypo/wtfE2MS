package tools;

import models.Manager;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 密码工具类，提供与用户密码相关的静态方法
 * Created by hypo on 15-12-26.
 */
public class PasswordTool {

    /**
     * 对明文密码进行加密
     * @param password 用户明文密码
     * @return         返回经过加密的密码
     */
    public static String getPass(String password){

        MessageDigest md5= null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        try {
            assert md5 != null;
            password=base64en.encode(md5.digest(password.getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return password;
    }

    /**
     * 密码验证
     * @param password 输入的密码
     * @param user     需要验证对应的用户
     * @return         返回验证结果 true：成功 | false：失败
     */
    public static Boolean verify(String password, Manager user){

        MessageDigest md5= null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        try {
            assert md5 != null;
            password=base64en.encode(md5.digest(password.getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        if (password.equals(user.getPass())){
            return true;
        }
        return false;
    }

}
