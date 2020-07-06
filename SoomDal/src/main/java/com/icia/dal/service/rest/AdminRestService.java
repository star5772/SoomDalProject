package com.icia.dal.service.rest;

import java.io.*;

import javax.inject.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import com.icia.dal.dao.*;
import com.icia.dal.entity.*;

@Service
public class AdminRestService {
	@Inject
	private AdminDao adminDao;
	@Value("${FieldFolder}")
	private String fieldFolder;
	@Value("${FieldPath}")
	private String fieldPath;
	@Inject
	private JejaDao jejaDao;

	public int insertFieldSajin(Field fl,MultipartFile sajin) throws IllegalStateException, IOException {
		adminDao.deleteToField(fl.getFNo());
		System.out.println(sajin);
		if(sajin != null && sajin.isEmpty()==false) {
			System.out.println(sajin);
			if(sajin.getContentType().toLowerCase().startsWith("image/")==true) {
				int lastIndexOfDot = sajin.getOriginalFilename().lastIndexOf(".");
				String extension = sajin.getOriginalFilename().substring(lastIndexOfDot+1);
				File fieldSajin = new File(fieldFolder,fl.getFName() + "." + extension);
				
				sajin.transferTo(fieldSajin);
				fl.setFSajin(fieldPath + fieldSajin.getName()); 
			}else {
				fl.setFSajin(fieldPath + "anony.jpg");
			}
		}else {
			fl.setFSajin(fieldPath+ "anony.jpg");
		}
		return adminDao.insertToField(fl);
	}
	
	public void updateJenabled(boolean jIsBlock, String jEmail) {
		if(jIsBlock==true) {
			Jeja jeja = Jeja.builder().jEmail(jEmail).jIsBlock(jIsBlock).enabled(false).build();
			jejaDao.updateJeja(jeja);
		} else {
			Jeja jeja = Jeja.builder().jEmail(jEmail).jIsBlock(jIsBlock).enabled(true).build();
			jejaDao.updateJeja(jeja);
		}
	}
	
}
