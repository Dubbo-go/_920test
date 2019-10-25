package com.ujiuye.service;

import com.ujiuye.bean.Dept;
import com.ujiuye.mapper.DeptMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Resource
    private DeptMapper deptMapper;

    /**
     * 查询全部部门
     * @return
     */
    @Override
    @Transactional
    public List<Dept> findDeptList() {
        return deptMapper.findDeptList();
    }
}
