package com.ujiuye.service;

import com.ujiuye.bean.Emp;

import java.util.List;


public interface EmpService {
    boolean addEmp(Emp emp);

    List<Emp> findEmpList();

    boolean deleteEmpByEid(Integer eid);

    Emp findEmpByEid(Integer eid);

    boolean updateEmp(Emp emp);
}
