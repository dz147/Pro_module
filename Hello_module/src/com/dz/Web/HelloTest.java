package com.dz.Web;

import com.dao.TestDao;
import com.entity.TestEntity;
import com.service.TestService;

public class HelloTest {
    public static void main(String[] args) {
        String str="马冬梅";
        String str2="马冬梅";
        String str3=new String("马冬梅");
        System.out.println(str==str2+"指向地址一样");
        System.out.println(str==str3+"，指向地址不一样");

        TestDao.getDao();
        TestEntity.getEntity();
        TestService.getService();

    }
}
