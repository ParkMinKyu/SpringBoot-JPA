package com.min.web.repository.article;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.min.web.domain.article.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long>{
	List<Comment> findByArticleSeq(long articleSeq);
}
