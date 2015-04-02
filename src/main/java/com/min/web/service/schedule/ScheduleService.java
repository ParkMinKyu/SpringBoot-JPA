package com.min.web.service.schedule;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.min.web.domain.imgarticle.ImgArticle;
import com.min.web.repository.imgarticle.ImgArticleRepository;

@Component
@Log4j
public class ScheduleService {

	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("HH:mm:ss");
	
	@Autowired
	private ImgArticleRepository imgArticleRepository;
	
	@Value("${image.upload.location}")
	private String uploadLocation; 
	
	//@Scheduled(fixedRate=5000)
	@Scheduled(cron="0 0 3 * * *")
	public void checkedImageFiles(){
		log.info("---------------- Image File Check Start--------------------");
		log.info("Start Time is " + DATE_FORMAT.format(new Date()));
		int cnt = 0;
		File parent = new File(uploadLocation);
		if(parent.isDirectory()){
			for(File dir : parent.listFiles()){
				String logTitle = dir.getName() + " ToTal Image count : " + dir.listFiles().length; 
				for(File file : dir.listFiles()){
					if(file.isFile()){
						if(file.getName().indexOf("_thumb") == -1){
							List<ImgArticle> imgArticle = imgArticleRepository.findByName(file.getName());
							if(imgArticle.isEmpty()){
								if(file.delete()){
									String prifix = file.getName().substring(file.getName().indexOf("."));
									String thumbName = file.getName().replace(prifix, "_thumb"+prifix);
									File thumbImg = new File(uploadLocation+dir.getName()+"/"+thumbName);
									if(thumbImg.isFile()){
										thumbImg.delete();
									}
									log.info(uploadLocation + dir.getName()+"/"+file.getName() + " is Not File Data Removed");
									cnt++;
								}
							}
						}
					}
				}
				log.info(logTitle + " Image Remove Count : " + cnt);
			}
		}
		log.info("End Time is " + DATE_FORMAT.format(new Date()));
		log.info("---------------- Image File Check END--------------------");
	}
}
