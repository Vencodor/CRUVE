package util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;

import javax.imageio.ImageIO;

public class ImageBLOB {
	public static byte[] imageToByte(String path)throws Exception {
		File fi = new File(path);
		byte[] fileContent = Files.readAllBytes(fi.toPath());
	 
	    return fileContent;
	}
}
