package com.ujiuye.controller;

import com.ujiuye.bean.Dept;
import com.ujiuye.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Resource
    private DeptService deptService;

    /**
     * 查询全部部门
     * @return
     */
    @RequestMapping("findDeptList")
    @ResponseBody
    public List<Dept> findDeptList(){
        System.out.println("1");
        return deptService.findDeptList();
    }

}
