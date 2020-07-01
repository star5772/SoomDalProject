package com.icia.dal.controller.rest;

import java.io.*;
import java.security.*;

import javax.inject.Inject;
import javax.validation.*;

import org.apache.commons.compress.utils.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.prepost.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.dal.Exception.MembernameExistException;
import com.icia.dal.dao.*;
import com.icia.dal.dto.*;
import com.icia.dal.entity.*;
import com.icia.dal.service.DalinService;

@RestController
public class DalinRestController {
	
	@Inject
	private DalinService dalService;
	
	@GetMapping("/dalin/check_email")
	public ResponseEntity<Void> ableEmail(String dEmail) throws MembernameExistException {
		dalService.checkId(dEmail);
		return ResponseEntity.ok(null);
	}
	
	// 달인 프로필 정보 변경
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/dalin/info_update")
	public ResponseEntity<Void> profileUpdate(@Valid DalinDto.DtoForUpdateToDalinProfile dto, @RequestParam("sajin") @Nullable MultipartFile sajin, Principal principal) {
		dto.setDName(principal.getName());
		try {
			dalService.profileUpdate(dto, sajin);
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(null);
	}
	
	// 달인 내정보 변경
	//@PreAuthorize("isAuthenticated()")
	@PutMapping("/dalin/my_info_update")
	public ResponseEntity<Void> update(@Valid DalinDto.DtoForUpdateToDalin dto, BindingResult results
			, Principal principal) throws BindException {
		System.out.println(dto.getDTel());
		if(results.hasErrors())
			throw  new BindException(results);
		System.out.println("2===========");
		dalService.update(dto, principal.getName());
		return ResponseEntity.ok(null);
	}
	
	@GetMapping("/attachment/view")
	public ResponseEntity<?> view(Integer pAttachmentNo) throws IOException {
		ProfileAttachment p = dalService.readAttachment(pAttachmentNo);
		String originalFileName = p.getPOriginalFileName();
		
		File saveFile = new File("c:/project/attachment", p.getPSaveFileName());
		HttpHeaders headers = new HttpHeaders();
		if(p.getPIsOk()==true) {
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1).toUpperCase();
			if(ext.equals("JPG") || ext.equals("JPEG"))
				headers.setContentType(MediaType.IMAGE_JPEG);
			else if(ext.equals("PNG"))
				headers.setContentType(MediaType.IMAGE_PNG);
			else if(ext.equals("GIF"))
				headers.setContentType(MediaType.IMAGE_GIF);
			headers.add("Content-Disposition", "inline;filename="+originalFileName);
		} else {
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;filename="+originalFileName);
		}
		
		InputStream in = new FileInputStream(saveFile);
		byte[] attachmentFile = IOUtils.toByteArray(in);
		in.close();
		return ResponseEntity.ok().headers(headers).body(attachmentFile);
	}
}
