package com.min.web.repository.imgarticle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.min.web.domain.imgarticle.ImgArticle;

public interface ImgArticleRepository extends JpaRepository<ImgArticle, Long>{
	List<ImgArticle> findByImgGroup(long imgGroup);
	
	List<ImgArticle> findByName(String name);
}
