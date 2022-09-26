package com.Final.Final1.comm.model;

import java.util.Date;

public class MainDTO {
    private String Request_title;
    private String Requester;
    private int User_score;
    private Date Recruiting_time;
    private int ReadySolver_cnt;

    public String getRequest_title() {
        return Request_title;
    }

    public void setRequest_title(String request_title) {
        Request_title = request_title;
    }

    public String getRequester() {
        return Requester;
    }

    public void setRequester(String requester) {
        Requester = requester;
    }

    public int getUser_score() {
        return User_score;
    }

    public void setUser_score(int user_score) {
        User_score = user_score;
    }

    public Date getRecruiting_time() {
        return Recruiting_time;
    }

    public void setRecruiting_time(Date recruiting_time) {
        Recruiting_time = recruiting_time;
    }

    public int getReadySolver_cnt() {
        return ReadySolver_cnt;
    }

    public void setReadySolver_cnt(int readySolver_cnt) {
        ReadySolver_cnt = readySolver_cnt;
    }


}
