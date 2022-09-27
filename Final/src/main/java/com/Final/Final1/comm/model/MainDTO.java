package com.Final.Final1.comm.model;

import javax.inject.Inject;
import java.util.Calendar;
import java.util.Date;

public class MainDTO {
    private String Request_title;
    private String Requester;
    private int User_score;
    private Date Recruiting_time;
    private String Team_intro;
    private String Team_leader;
    private Date Team_cr_date;
    private int Team_num_mem;
    private int SolverReady_cnt;
    private int SolverReady_cnt2;

    public int getSolverReady_cnt() {
        return SolverReady_cnt;
    }

    public void setSolverReady_cnt(int solverReady_cnt) {
        SolverReady_cnt = solverReady_cnt;
    }

    public int getSolverReady_cnt2() {
        return SolverReady_cnt2;
    }

    public void setSolverReady_cnt2(int solverReady_cnt2) {
        SolverReady_cnt2 = solverReady_cnt2;
    }

    public String getTeam_intro() {
        return Team_intro;
    }

    public void setTeam_intro(String team_intro) {
        Team_intro = team_intro;
    }

    public String getTeam_leader() {
        return Team_leader;
    }

    public void setTeam_leader(String team_leader) {
        Team_leader = team_leader;
    }

    public Date getTeam_cr_date() {
        return Team_cr_date;
    }

    public void setTeam_cr_date(Date team_cr_date) {
        Team_cr_date = team_cr_date;
    }

    public int getTeam_num_mem() {
        return Team_num_mem;
    }

    public void setTeam_num_mem(int team_num_mem) {
        Team_num_mem = team_num_mem;
    }


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



}
