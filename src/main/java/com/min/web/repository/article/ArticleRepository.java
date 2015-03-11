package com.min.web.repository.article;


import org.springframework.data.jpa.repository.JpaRepository;

import com.min.web.domain.article.Article;

public interface ArticleRepository extends JpaRepository<Article, Long>{
	
}
