package com.ujiuye.service;

import com.ujiuye.bean.Emp;
import com.ujiuye.mapper.EmpMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    private EmpMapper empMapper;

    /**
     * 注册用户
     * @param emp
     * @return
     */
    @Override
    @Transactional
    public boolean addEmp(Emp emp) {
        return empMapper.addEmp(emp);
    }

    /**
     * 全部用户
     * @return
     */
    @Override
    @Transactional
    public List<Emp> findEmpList() {
        return empMapper.findEmpList();
    }

    /**
     * 根据eid删除
     * @param eid
     * @return
     */
    @Override
    @Transactional
    public boolean deleteEmpByEid(Integer eid) {
        return empMapper.deleteEmpByEid(eid);
    }

    /**
     * 根据eid查询用户
     * @param eid
     * @return
     */
    @Override
    @Transactional
    public Emp findEmpByEid(Integer eid) {
        return empMapper.findEmpByEid(eid);
    }

    /**
     * 修改
     * @param emp
     * @return
     */
    @Override
    @Transactional
    public boolean updateEmp(Emp emp) {
        return empMapper.updateEmp(emp);
    }
}
