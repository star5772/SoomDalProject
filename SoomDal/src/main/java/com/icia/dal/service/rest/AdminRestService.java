package com.icia.dal.service.rest;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.dao.AdminDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.entity.Field;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.NowPayment;
import com.icia.dal.entity.NowRefund;

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
	@Inject
	private PaymentDao npDao;

	public int insertFieldSajin(Field fl,MultipartFile sajin) throws IllegalStateException, IOException {
		adminDao.deleteToField(fl.getFNo());
		if(sajin != null && sajin.isEmpty()==false) {
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

	public boolean confirmRefund(String pCode) {
		NowRefund nr = NowRefund.builder().pCode(pCode).pRefundIsOk(true).build();
		npDao.updateToNowRefund(nr);
		return true;
	}
	
	
	
}
