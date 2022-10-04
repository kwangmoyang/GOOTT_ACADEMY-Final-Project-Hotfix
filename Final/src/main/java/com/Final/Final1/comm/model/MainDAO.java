package com.Final.Final1.comm.model;

import java.util.List;

public interface MainDAO {
    List<MainDTO> list();

    List<MainDTO> listTeam();

    List<MainDTO> listBoard();

	List<MainDTO> listNotice();
}
