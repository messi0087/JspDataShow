package connection;

import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;


public class MY implements ServletContextListener {
        private MyThread myThread;//线程类


       public void contextDestroyed(ServletContextEvent e) {//断点销毁
        if (myThread != null && myThread.isInterrupted()) {
                  myThread.interrupt();
        }

        }

      public void contextInitialized(ServletContextEvent e) {
        String str = null;
        if (str == null && myThread == null) {

        myThread = new MyThread();
        myThread.start(); // servlet 上下文初始化时启动 socket
        }
      }
 }


/**

 * 自定义一个 Class 线程类继承自线程类，重写 run() 方法，用于从后台获取并处理数据

 *

 * @author Champion.Wong

 *

 */

class MyThread extends Thread {
    Getdate Date = new Getdate();
    int i=0;
    int j =0;
    public void run() {
        Date.connection();
        //获取数据库数据的方法
        List<Date_accident> dateList = Date.getDateList();

        while (!this.isInterrupted())
        {// 线程未中断执行循环

            try {

                Thread.sleep(5000); //每隔2000ms执行一次//1000ms == 1s;

            } catch (InterruptedException e) {

                e.printStackTrace();

            }

             i+=1;
//           ------------------ 开始执行 ---------------------------//线程内容//

            connection.Date.Dates.Send_list.clear();

            for(int k=0;k<100;j++,k++){
                connection.Date.Dates.Send_list.add(dateList.get(j));
                if(j==18000)
                {
                    j=0;
                }
            }
            //System.out.println(connection.Date.Dates.Send_list);
            connection.Date.Dates.i+=i;
            //connection.Date.Dates.condition =true;
            System.out.println("第" + i+"获取数据连接");


        }

    }

}
