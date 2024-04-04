package com.ks.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ks.dto.Comments;
import com.ks.dto.Pagination;

@Mapper
public interface CommentsMapper {
	int selectCount();
	List<Comments> selectCommentsList(int id);
	void insertComments(Comments comments);
	void updateComments(Comments comments);
	void deleteComments(int num);
	Comments selectCommentstById(int num);
	List<Comments> selectAll(int id);
	List<Comments> selectList(int start, int listSize);
	List<Comments> paging(int id, int start, int listSize);
	public ArrayList<Pagination> getPagination(int pageNo);
	Double average(int id);

}
