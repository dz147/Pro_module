package com.dz.Web;

import com.dao.TestDao;
import com.entity.TestEntity;
import com.service.TestService;

public class HelloTest {
    public static void main(String[] args) {
        System.out.println("凉完");
        TestDao.getDao();
        TestEntity.getEntity();
        TestService.getService();
    }
}
