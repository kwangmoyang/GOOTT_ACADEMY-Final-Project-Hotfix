package com.Final.Final1.comm.serviceImpl;

import java.util.List;


//import com.ibm.jvm.j9.dump.extract.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Final.Final1.comm.model.MainDAO;
import com.Final.Final1.comm.model.MainDTO;
import com.Final.Final1.comm.service.MainService;

@Service
public class MainServiceImpl implements MainService{
    @Autowired
    MainDAO MainDAO;

    @Override
    public List<MainDTO> list() {
        return MainDAO.list();
    }

    @Override
    public List<MainDTO> listTeam() {
        return MainDAO.listTeam();
    }

    @Override
    public List<MainDTO> listBoard() {
        return MainDAO.listBoard();
    }


}






