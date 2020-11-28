package com.zhuoying.Entrust.Dao;

import com.zhuoying.Entrust.bean.Entrust;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IEntrustDao {
    int publish(Entrust entrust);

    Entrust getEntrustById(Integer enid);

    List<Entrust> getAllEntrust();

    List<Entrust> entrustState(Integer uid, int state);

    List<Entrust> sentEntrust(Integer uid);

    List<Entrust> getPersonalEntrustById(Integer uid);

    List<Entrust> getPersonalEntrustByUid(Integer uid);

    List<Entrust> getPersonalCheckEntrustByUid(Integer uid);

    int updateEntrust(Entrust entrust);

    Entrust getCheckEntrustById(Integer enid);

    Integer deleteEntrust(Integer enid);

    List<Entrust> getAllEntrsting();

    int deleteEntrustByEnid(Integer enid);

    Entrust getEntrustByIdInAdmin(Integer enid);

    List<Entrust> getAllEntrustByArray(int[] array1);

    int deleteDuoEntrust(int[] array1);

    int deleteDuoEntrustOnEntrustTable(int[] array1);

    int addDuoEntrust(List<Entrust> entrustList);

    int publish_admin(Entrust entrust);
}
