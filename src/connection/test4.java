package connection;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test4 {
    int i =0;
    int c =0;

    public int getI(){
        Boolean result = false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        while(!result) {
            try {
                Thread.sleep(5 * 1000); //设置暂停的时间 5 秒
                i ++ ;
                c+=10;
                System.out.println(sdf.format(new Date()) + "--循环执行第" + i + "次");
                if (i == 3) {
                    result = true;
                    break ;
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    return c;}

}
