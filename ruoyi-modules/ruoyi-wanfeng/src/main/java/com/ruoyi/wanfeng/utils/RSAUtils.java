package com.ruoyi.wanfeng.utils;

import com.ruoyi.common.core.exception.GlobalException;
import lombok.extern.slf4j.Slf4j;

import javax.crypto.Cipher;
import javax.crypto.spec.OAEPParameterSpec;
import javax.crypto.spec.PSource;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

@Slf4j
public class RSAUtils {
    public static String getCorrespondPath() {
        try {
            // 定义公钥 PEM 字符串
            String publicKeyPEM = "-----BEGIN PUBLIC KEY-----\n" +
                    "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDLgd2OAkcGVtoE3ThUREbio0Eg\n" +
                    "Uc/prcajMKXvkCKFCWhJYJcLkcM2DKKcSeFpD/j6Boy538YXnR6VhcuUJOhH2x71\n" +
                    "nzPjfdTcqMz7djHum0qSZA0AyCBDABUqCrfNgCiJ00Ra7GmRj+YCK1NJEuewlb40\n" +
                    "JNrRuoEUXpabUzGB8QIDAQAB\n" +
                    "-----END PUBLIC KEY-----";

            // 去除 PEM 字符串中的头尾标识和换行符，并进行 Base64 解码
            String publicKeyStr = publicKeyPEM.replace("-----BEGIN PUBLIC KEY-----", "")
                    .replace("-----END PUBLIC KEY-----", "")
                    .replace("\n", "")
                    .trim();
            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyStr);

            // 生成公钥对象
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(keySpec);

            // 初始化 Cipher 对象，使用 RSA/ECB/OAEPPadding 加密模式
            Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPPadding");
            OAEPParameterSpec oaepParameterSpec = new OAEPParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, PSource.PSpecified.DEFAULT);
            cipher.init(Cipher.ENCRYPT_MODE, publicKey, oaepParameterSpec);

            // 获取当前时间戳，并将其作为加密的一部分
            long timestamp = System.currentTimeMillis();
            String dataToEncrypt = "refresh_" + timestamp;
            byte[] encryptedBytes = cipher.doFinal(dataToEncrypt.getBytes());

            // 将加密后的字节数组转换为十六进制字符串
            StringBuilder result = new StringBuilder();
            for (byte b : encryptedBytes) {
                result.append(String.format("%02x", b));
            }
            log.info(result.toString());
            return result.toString();
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new GlobalException("RSA加密失败");

        }
    }
}
