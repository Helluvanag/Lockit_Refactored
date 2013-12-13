package com.verudix.lockit.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.SecretKeySpec;

public class FileEncryptor{    
    
    private static File in_file,out_file;
    private static String key = "10ckit12";
    
    public static void encrypt(String algo,String inpath,String outpath) throws Exception{    	
    	 in_file = new File(inpath);     	    
         FileInputStream fis = new FileInputStream(in_file);         
         in_file=new File(in_file.getAbsolutePath()); 
         out_file = new File(outpath);
         FileOutputStream fos =new FileOutputStream(out_file);
         //generating key
         byte k[] = key.getBytes(); 
         SecretKeySpec key = new SecretKeySpec(k,algo.split("/")[0]); 
         //creating and initialising cipher and cipher streams
         Cipher encrypt =  Cipher.getInstance(algo);  
         encrypt.init(Cipher.ENCRYPT_MODE, key);  
         CipherOutputStream cout=new CipherOutputStream(fos, encrypt);
         byte[] buf = new byte[1024];
         int read;
         while((read=fis.read(buf))!=-1)  //reading data
             cout.write(buf,0,read);  //writing encrypted data
         //closing streams
         fis.close();
         cout.flush();
         cout.close();
     }
     
     public static void decrypt(String algo,String inpath,String outpath) throws Exception{    	 
    	 in_file = new File(inpath);  	    
         FileInputStream fis = new FileInputStream(in_file);         
         in_file=new File(in_file.getAbsolutePath()); 
         out_file = new File(outpath);
         FileOutputStream fos =new FileOutputStream(out_file);
         //generating same key
         byte k[] = key.getBytes();   
         SecretKeySpec key = new SecretKeySpec(k,algo.split("/")[0]);  
         //creating and initialising cipher and cipher streams
         Cipher decrypt =  Cipher.getInstance(algo);  
         decrypt.init(Cipher.DECRYPT_MODE, key);  
         CipherInputStream cin=new CipherInputStream(fis, decrypt);
         byte[] buf = new byte[1024];
         int read=0;
         while((read=cin.read(buf))!=-1)  //reading encrypted data
              fos.write(buf,0,read);  //writing decrypted data
         //closing streams
         cin.close();
         fos.flush();
         fos.close();
     }
}