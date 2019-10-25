package com.ujiuye.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.bean.Emp;
import com.ujiuye.service.EmpService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("/emp")
public class EmpContorller {

    @Resource
    private EmpService empService;

    /**
     * 注册用户
     * @return
     */
    @RequestMapping("addEmp")
    public String addEmp(Emp emp){
        boolean b = empService.addEmp(emp);
        if(b){
            return "redirect:/list.jsp";
        }else{
            return "redirect:/error.jsp";
        }
    }

    /**
     * 全部用户 分页
     * @return
     */
    @RequestMapping("findEmpList")
    @ResponseBody
    public  PageInfo<Emp> findEmpList(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,2);
        List<Emp> empList = empService.findEmpList();
        PageInfo<Emp> pageInfo = new PageInfo<Emp>(empList);
        return pageInfo;
    }

    /**
     * 根据eid删除
     * @return
     */
    @RequestMapping("deleteEmpByEid")
    public String deleteEmpByEid(Integer eid){
        boolean b = empService.deleteEmpByEid(eid);
        if(b){
            return "redirect:/list.jsp";
        }else{
            return "redirect:/error.jsp";
        }
    }

    /**
     * 根据eid查询
     * @return
     */
    @RequestMapping("findEmpByEid")
    @ResponseBody
    public Emp findEmpByEid(Integer eid){
        return empService.findEmpByEid(eid);
    }

    /**
     * 修改用户
     * @return
     */
    @RequestMapping("updateEmp")
    public String updateEmp(Emp emp){
        boolean b = empService.updateEmp(emp);
        if(b){
            return "redirect:/list.jsp";
        }else{
            return "redirect:/error.jsp";
        }
    }
}
