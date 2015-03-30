package com.min.web.rest;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.min.web.domain.imgarticle.ImgArticle;
import com.min.web.repository.imgarticle.ImgArticleRepository;
import com.min.web.vo.imgarticle.ImgArticleVO;

@RestController
@RequestMapping(value="/taiji/imgarticle/")
public class ImgArticleController {
	
	@Autowired
	private ImgArticleRepository repository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Value("${image.upload.location}")
	private String uploadLocation; 
	
	@RequestMapping(value="{imgGroup}",method=RequestMethod.GET)
	public ResponseEntity<?> getImgArticle(@PathVariable("imgGroup")long imgGroup){
		Type listType =  new TypeToken<List<ImgArticle>>(){}.getType();
		List<ImgArticle> response = modelMapper.map(repository.findByImgGroup(imgGroup), listType);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value="imgLike/{seq}",method=RequestMethod.PUT)
	public ResponseEntity<?> imgLike(@PathVariable("seq")long seq){
		ImgArticle article = repository.findOne(seq);
		article.setUserLike(article.getUserLike()+1);
		return new ResponseEntity<>(repository.save(article), HttpStatus.OK);
	}
	
	@RequestMapping(value = "upload/{imgGroup}", method = RequestMethod.POST)
	public ResponseEntity<?> imgUpload(@PathVariable("imgGroup")long imgGroup,@RequestParam("image")MultipartFile file,HttpSession session,@Valid ImgArticleVO articleVO, BindingResult result){
		
		if(result.hasErrors())return new ResponseEntity<> (result.getAllErrors(), HttpStatus.BAD_REQUEST);
		
		if(!file.isEmpty()){
			String path = "";
			if(imgGroup == 1)path = "boys";
			else if(imgGroup == 5)path = "solo5";
			else if(imgGroup == 6)path = "solo6";
			else if(imgGroup == 7)path = "solo7";
			else if(imgGroup == 8)path = "solo8";
			else if(imgGroup == 9)path = "solo9";
			String location = uploadLocation+path;
			UUID ranName = UUID.randomUUID();
			String prefix = file.getOriginalFilename();
			try{
				byte [] bytes = file.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(location+"/"+ranName.toString()+prefix)));
				stream.write(bytes);
				stream.close();
				articleVO.setPath("/resources/img/upload/"+path);
				articleVO.setImgGroup(imgGroup);
				articleVO.setName(ranName.toString()+prefix);
				articleVO.setUserLike(0);
				ImgArticle insertArticle = modelMapper.map(articleVO, ImgArticle.class);
				return new ResponseEntity<> (repository.save(insertArticle), HttpStatus.OK);
			}catch (Exception e) {
				// TODO: handle exception
				File img = new File(location+"/"+ranName.toString()+prefix);
				if(img.isFile()){
					img.delete();
				}
				return new ResponseEntity<> ("File upload Fail", HttpStatus.BAD_REQUEST);
			}
		}else{
			return new ResponseEntity<> ("File is Empty", HttpStatus.BAD_REQUEST);
		}
	}
}
