package com.core.util;

import java.io.*;

/**
 * object 与  byte之间转换工具类
 * @author ouyw
 *
 */
public class JedisUtil {
	/**
     * object to bytes
     * @param object
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T extends Serializable> byte[] objectToBytes(T object) throws IOException {
        try(ByteArrayOutputStream bout = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(bout);) {
            out.writeObject(object);
            return bout.toByteArray();
        }catch (Exception e){
            throw e;
        }
    }

    /**
     * bytes to object
     * @param bytes
     * @param <T>
     * @return
     * @throws IOException
     * @throws ClassNotFoundException
     */
    @SuppressWarnings("unchecked")
	public static <T> T bytesToObject(byte[] bytes) throws IOException, ClassNotFoundException {
        try (ByteArrayInputStream bin = new ByteArrayInputStream(bytes);
            ObjectInputStream oin = new ObjectInputStream(bin);){
            return (T)oin.readObject();
        }catch (Exception e){
            throw e;
        }
    }
}
