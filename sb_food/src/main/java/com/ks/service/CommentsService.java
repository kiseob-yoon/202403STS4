package com.ks.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ks.dto.Comments;
import com.ks.dto.Pagination;
import com.ks.repository.CommentsMapper;

@Service
public class CommentsService {
	
    private static final int listSize = 3;
    private static final int paginationSize = 3;

	@Autowired
	private CommentsMapper commentsMapper;
	
    public ArrayList<Comments> getMsgList(int pageNo) {
        return (ArrayList<Comments>) commentsMapper.selectList((pageNo - 1) * listSize, listSize);
     }
    public List<Comments> paging(int id, int start, int listSize) {
        return (ArrayList<Comments>) commentsMapper.paging(id, (start - 1) * listSize, listSize);
    }

    
    public ArrayList<Pagination> getPagination(int pageNo) {
        ArrayList<Pagination> pgnList = new ArrayList<>();
        int numRecords = commentsMapper.selectCount();
        int numPages = (int)Math.ceil((double)numRecords / listSize);

        int firstLink = ((pageNo - 1) / paginationSize) * paginationSize + 1;
        int lastLink = firstLink + paginationSize - 1;
        if (lastLink > numPages) {
            lastLink = numPages;
        }

        if (firstLink > 1) {
            pgnList.add(new Pagination("이전", pageNo - paginationSize, false));
        }

        for (int i = firstLink; i <= lastLink; i++) {
            pgnList.add(new Pagination("" + i, i, i == pageNo));
        }

        if (lastLink < numPages) {
            int tmpPageNo = pageNo + paginationSize;
            if (tmpPageNo > numPages) {
                tmpPageNo = numPages;
            }
            pgnList.add(new Pagination("다음", tmpPageNo, false));
        }

        return pgnList;
    }
	
	public List<Comments> selectList(int start,int listSize){
		return commentsMapper.selectList(start,listSize);
	}
	
	public int selectCount() {
		return commentsMapper.selectCount();
	}
	
	public List<Comments> selectCommentsList(int id){
		return commentsMapper.selectCommentsList(id);
	}
	
	public void insertComments(Comments comments) {
		commentsMapper.insertComments(comments);
	}
	public void updateComments(Comments comments) {
		commentsMapper.updateComments(comments);
	}
	public void deleteComments(int num) {
		commentsMapper.deleteComments(num);
	}
	
	public Comments selectCommentstById(int num) {
		return commentsMapper.selectCommentstById(num);
	}
	public List<Comments> selectAll(int id){
		return commentsMapper.selectAll(id);
	}

}
