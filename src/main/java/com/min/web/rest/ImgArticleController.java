package com.min.web.rest;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.coobird.thumbnailator.Thumbnails;

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
	
	@RequestMapping(value="list/{imgGroup}/{orderType}",method=RequestMethod.GET)
	public ResponseEntity<?> getImgArticle(@PathVariable("imgGroup")long imgGroup,@PathVariable("orderType")String orderType){
		if(orderType.equals("userLike"))
			return new ResponseEntity<>(repository.findByImgGroupOrderByUserLikeDesc(imgGroup), HttpStatus.OK);
		else
			return new ResponseEntity<>(repository.findByImgGroupOrderBySeqDesc(imgGroup), HttpStatus.OK);
		/*Type listType =  new TypeToken<List<ImgArticle>>(){}.getType();
		List<ImgArticle> response = modelMapper.map(repository.findByImgGroupOrderBySeqDesc(imgGroup), listType);*/
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
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(!file.isEmpty()){
			String type = file.getContentType().split("/")[0];
	        if(!type.equals("image")){
	        	resultMap.put("success", false);
	        	resultMap.put("msg", "Checked File, This is Not Image Files");
	        	return new ResponseEntity<> (resultMap, HttpStatus.BAD_REQUEST);
	        }
	        	
			String path = "";
			if(imgGroup == 1)path = "boys";
			else if(imgGroup == 5)path = "solo5";
			else if(imgGroup == 6)path = "solo6";
			else if(imgGroup == 7)path = "solo7";
			else if(imgGroup == 8)path = "solo8";
			else if(imgGroup == 9)path = "solo9";
			String location = uploadLocation+path;
			UUID ranName = UUID.randomUUID();
			String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
			
			try{
				byte [] bytes = file.getBytes();
				File image = new File(location+"/"+ranName.toString()+prefix);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image));
				stream.write(bytes);
				stream.close();
				Thumbnails.of(image).size(363, 300).toFile(new File(location+"/"+ranName+"_thumb"+prefix));
				articleVO.setPath("/resources/img/upload/"+path);
				articleVO.setImgGroup(imgGroup);
				articleVO.setName(ranName.toString()+prefix);
				articleVO.setThumbName(ranName+"_thumb"+prefix);
				articleVO.setUserLike(0);
				ImgArticle insertArticle = modelMapper.map(articleVO, ImgArticle.class);
				return new ResponseEntity<> (repository.save(insertArticle), HttpStatus.OK);
			}catch (Exception e) {
				// TODO: handle exception
				File img = new File(location+"/"+ranName.toString()+prefix);
				if(img.isFile()){
					img.delete();
					File imgThum = new File(location+"/"+ranName+"_thumb"+prefix);
					if(imgThum.isFile()){
						imgThum.delete();
					}
				}
				resultMap.put("success", false);
	        	resultMap.put("msg", e.getMessage());
				return new ResponseEntity<> (resultMap, HttpStatus.BAD_REQUEST);
			}
		}else{
			resultMap.put("success", false);
        	resultMap.put("msg", "File is Empty");
			return new ResponseEntity<> (resultMap, HttpStatus.BAD_REQUEST);
		}
	}
}
