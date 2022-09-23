package com.Final.Final1.comm.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOImpl implements MainDAO{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;


    @Override
    public List<MainDTO> list() {
        // TODO Auto-generated method stub
        return sqlSessionTemplate.selectList("main.list");
    }

}










