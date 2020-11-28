package com.zhuoying.Entrust.Service;

import com.zhuoying.Entrust.Dao.IEntrustDao;
import com.zhuoying.Entrust.bean.Entrust;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImpService implements IEntrustService {
    @Autowired
    IEntrustDao entrustDao;

    @Override
    public int publish(Entrust entrust) {
        return entrustDao.publish(entrust);
    }

    @Override
    public Entrust getEntrustById(Integer enid) {
        return entrustDao.getEntrustById(enid);
    }

    @Override
    public List<Entrust> getAllEntrust() {
        return entrustDao.getAllEntrust();
    }

    @Override
    public List<Entrust> completeEntrust(Integer uid, int state) {
        return entrustDao.entrustState(uid, state);
    }

    @Override
    public List<Entrust> sentEntrust(Integer uid) {
        return entrustDao.sentEntrust(uid);
    }

    @Override
    public List<Entrust> getPersonalEntrustById(Integer uid) {
        return entrustDao.getPersonalEntrustById(uid);
    }

    @Override
    public List<Entrust> getPersonalEntrustByUid(Integer uid) {
        return entrustDao.getPersonalEntrustByUid(uid);
    }

    @Override
    public List<Entrust> getPersonalCheckEntrustByUid(Integer uid) {
        return entrustDao.getPersonalCheckEntrustByUid(uid);
    }

    @Override
    public int updateEntrust(Entrust entrust) {
        return entrustDao.updateEntrust(entrust);
    }

    @Override
    public Entrust getCheckEntrustById(Integer enid) {
        return entrustDao.getCheckEntrustById(enid);
    }

    @Override
    public Integer deleteEntrust(Integer enid) {
        return entrustDao.deleteEntrust(enid);
    }

    @Override
    public List<Entrust> getAllEntrsting() {
        return entrustDao.getAllEntrsting();
    }

    @Override
    public int deleteEntrustByEnid(Integer enid) {
        return entrustDao.deleteEntrustByEnid(enid);
    }

    @Override
    public Entrust getEntrustByIdInAdmin(Integer enid) {
        return entrustDao.getEntrustByIdInAdmin(enid);
    }

    @Override
    public List<Entrust> getAllEntrustByArray(int[] array1) {
        return entrustDao.getAllEntrustByArray(array1);
    }

    @Override
    public int deleteDuoEntrust(int[] array1) {
        return entrustDao.deleteDuoEntrust(array1);
    }

    @Override
    public int addDuoEntrust(List<Entrust> entrustList) {
        return entrustDao.addDuoEntrust(entrustList);
    }

    @Override
    public int deleteDuoEntrustOnEntrustTable(int[] array1) {
        return entrustDao.deleteDuoEntrustOnEntrustTable(array1);
    }

    @Override
    public int publish_admin(Entrust entrust) {
        return entrustDao.publish_admin(entrust);
    }
}
