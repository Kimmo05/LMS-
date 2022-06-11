package com.min.ctrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

import com.min.vo.FileVo;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class FileUploadController {
	
	//**파일업로드 컨트롤러
		@RequestMapping(value = "/user/uploadForm.do", method = RequestMethod.GET)
		public String uploadForm() {
			log.info("********* uploadForm *********");
			System.out.println("여기까지 이동성공");
			return "user/uploadForm";
		}
		
		//년,월,일의 폴더 생성
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", File.separator);
		}
		
		//파일업로드 부분 (폴더 생성 및 랜덤 파일이름 생성 부분)
		@PostMapping(value = "/user/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<FileVo>> uploadAjaxPost(MultipartFile[] uploadFile) {
			System.out.println("ajax 이동 성공");
			
			List<FileVo> list = new ArrayList<>();
			
			String uploadFolder = "C:\\upload";
			String uploadFolderPath = getFolder();
			
			//폴더 생성하는 부분
			File uploadPath = new File(uploadFolder, uploadFolderPath);
			log.info("uploadPath : "+uploadPath);
			
			if(uploadPath.exists()==false) {
				uploadPath.mkdirs(); //폴더 생성
			}//make yyyy/MM/dd 폴더
			
			for(MultipartFile multipartFile : uploadFile) {
				
				FileVo fileVo = new FileVo();
				log.info("--------------uploadAjaxAction---------------------------------------");
				log.info("uploadFileName: "+multipartFile.getOriginalFilename());
				log.info("uploadFileSize: "+multipartFile.getSize());
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				fileVo.setOriginal_file_name(uploadFileName);
				log.info("파일이름" + uploadFileName);
				System.out.println("파일이름만 출력해봄 : "+uploadFileName);

				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString()+"-"+uploadFileName;
				System.out.println("---------------------------uploadFileName");
				System.out.println("랜덤으로 생기는 파일 이름 : " + uploadFileName);

				try {
					File saveFile = new File(uploadPath, uploadFileName);
					multipartFile.transferTo(saveFile);
					
					fileVo.setStored_file_name(uuid.toString());
					fileVo.setFile_path(uploadFolderPath);
					
					//파일 저장시 이미지일 경우 섬네일 생성 부분
					if(checkImageType(saveFile)) {
						fileVo.setFile_type(true);
						//원본파일은 그대로 저장, 이미지일 경우 s_파일이름 저장
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
						//뒤에 사이즈에 대한 부분을 파라미터로 width, height 지정
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();
					}
					list.add(fileVo);
					
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
		//이미지 파일을 판단하는 메소드
		private boolean checkImageType(File file) {
			String contentType;
			try {
				contentType = Files.probeContentType(file.toPath());
				return contentType.startsWith("image");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}

		//이미지일 경우 섬네일 데이터 전송하기
		@GetMapping("/user/display.do")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			System.out.println("이미지 섬네일 데이터 전송~~~~~~~~~~~~~~~~~~~~~~");
			log.info("display fileName : "+fileName);
			File file = new File("c:\\upload\\"+fileName);
			log.info("file : "+file);
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath())); //적절한 MIME타입 데이터를 Http의 헤더 메시지에 포함
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}
		

}
