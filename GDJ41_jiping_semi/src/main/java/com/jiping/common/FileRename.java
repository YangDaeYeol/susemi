package com.jiping.common;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRename implements FileRenamePolicy {
	@Override
	public File rename (File oldFile) {
		File newFile = null;
		do {
			long currentTime=System.currentTimeMillis();
			int ranNum=(int)(Math.random() * 1000 + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			String oriName=oldFile.getName();
			String ext=oriName.substring(oriName.lastIndexOf("."));
			
			String newName = "Jiping_" + sdf.format(new Date(currentTime))+"_"+ranNum+ext;
			newFile=new File(oldFile.getParent(),newName);
		} while(!createNewFile(newFile));
		return newFile;
		}
	
	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile();
		} catch (IOException e) {
			return false;
		}
	}
	
}
