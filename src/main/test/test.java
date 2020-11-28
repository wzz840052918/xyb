import com.zhuoying.Entrust.Dao.IEntrustDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class test {
    @Autowired
    IEntrustDao dao;
    @Test
    public void run01(){
        dao.deleteEntrustByEnid(9);

    }
}
