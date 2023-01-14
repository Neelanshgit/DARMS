package com.example.darms.services;

//import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	
	private static String UPLOAD_FOLDER = "F://uploads//";
	
	public String getFileExtension(String file) {
	    return FilenameUtils.getExtension(file);
	}
	
	public void uploadFile(MultipartFile file, HttpSession session) throws IllegalStateException, IOException {
		//file.transferTo(new File("F:\\uploads\\"+file.getOriginalFilename()));
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            String filename = districtCode +"_"+ tehsilCode +"."+ getFileExtension(file.getOriginalFilename());
            Path path = Paths.get(UPLOAD_FOLDER + filename);
            Files.write(path, bytes);
            //redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + file.getOriginalFilename() + "'");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

}
