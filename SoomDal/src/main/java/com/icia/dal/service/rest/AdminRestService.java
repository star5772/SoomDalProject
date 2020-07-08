package com.icia.dal.service.rest;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.icia.dal.dao.AdminDao;
import com.icia.dal.dao.JejaDao;
import com.icia.dal.dao.PaymentDao;
import com.icia.dal.dao.RequestBoardDao;
import com.icia.dal.entity.Field;
import com.icia.dal.entity.Jeja;
import com.icia.dal.entity.NowRefund;
import com.icia.dal.entity.RequestBoard;

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
	@Inject
	private RequestBoardDao rqBoardDao;
	
	@Transactional
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
	@Transactional
	public void updateJenabled(boolean jIsBlock, String jEmail) {
		if(jIsBlock==true) {
			Jeja jeja = Jeja.builder().jEmail(jEmail).jIsBlock(jIsBlock).enabled(false).build();
			jejaDao.updateJeja(jeja);
		} else {
			Jeja jeja = Jeja.builder().jEmail(jEmail).jIsBlock(jIsBlock).enabled(true).build();
			jejaDao.updateJeja(jeja);
		}
	}
	@Transactional
	public boolean confirmRefund(String pCode) {
		NowRefund nr = NowRefund.builder().pCode(pCode).pRefundIsOk(true).build();
		npDao.updateToNowRefund(nr);
		return true;
	}
	
	public void reportBoard(int rbNo, int jMno, boolean isBlock) {
		if(isBlock==true) {
			Jeja jeja = Jeja.builder().jEmail(jejaDao.findByJejaToJMno(jMno).getJEmail()).jMno(jMno).enabled(false).jIsBlock(true).build();
			jejaDao.updateJeja(jeja);
			RequestBoard rqBoard = RequestBoard.builder().rbNo(rbNo).rbReportCnt(2).build();
			rqBoardDao.RequestBoardUpdate(rqBoard);
			rqBoardDao.setIsBlock(rbNo);
			adminDao.deleteRpBoard(rbNo);
		}else {
			adminDao.deleteRpBoard(rbNo);
			RequestBoard rqBoard = RequestBoard.builder().rbNo(rbNo).rbReportCnt(2).build();
			rqBoardDao.RequestBoardUpdate(rqBoard);
		}
	}
	
	
	
}
