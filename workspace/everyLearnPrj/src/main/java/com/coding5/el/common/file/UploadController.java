package com.coding5.el.common.file;

import java.io.File;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class UploadController {
	
	private String getServerIp() {

		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (local == null) {
			return "";
		} else {
			String ip = local.getHostAddress();
			return ip;
		}
	}

//summernote, quill 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/editorImage")
	public String profileUpload(MultipartFile file, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");

		
		String imageServerPath = null;	//서버경로
		String savePath= null;			//저장경로
		String originalImagename= null;	//원본이름
		String imageName= null;			//저장본이름
		String extension= null;			//확장자
	
		
		savePath = session.getServletContext().getRealPath("/resources/upload/");
		
		originalImagename = file.getOriginalFilename(); 
		imageName = null; 

		extension = FilenameUtils.getExtension(originalImagename); 
		imageName = "img_" + UUID.randomUUID() + "." + extension;

		File imageUpload = new File( savePath + imageName);
		if (!imageUpload.exists()) {
			imageUpload.mkdirs();
		}
		file.transferTo(imageUpload);

		imageServerPath = request.getScheme() + "://" + getServerIp() + ":" + request.getServerPort() + request.getContextPath() + "/images/" + imageName; // 로컬 받아오는거 찾기

		Thread.sleep(5000); // 이미지 폴더 새로고침 시간용 딜레이

		return imageServerPath;

	}
}
