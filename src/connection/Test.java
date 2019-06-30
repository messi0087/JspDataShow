package connection;

import connection.Getdate;

import javax.servlet.http.HttpServlet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martin17 on 2017/3/16.
 */
public class Test  {
    public static void main(String[] args) {
        Getdate getdate = new Getdate();
        getdate.connection();
        List<Date_accident> dateList = getdate.getDateList();
        if (dateList!= null) {
            for (Date_accident position: dateList) {
                String userinfo = position.Get_Severity() + "---" +  "---"  ;
                System.out.println(userinfo);
              //  System.out.println(dateList);
            }
        }
    }
}
