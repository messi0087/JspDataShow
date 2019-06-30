package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Getdate {
    private String driver = "com.mysql.cj.jdbc.Driver";
    //String dbName = "spring";
    private String passwrod = "123456";
    private String userName = "root";
    private String url = "jdbc:mysql://localhost:3306/test1?  & serverTimezone=Hongkong & useUnicode=true & characterEncoding=utf-8&useSSL=false";
    private String sql = "select * from origin";
    List<Date_accident> dateList = new ArrayList<>();

    public void connection(){
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, userName, passwrod);
            PreparedStatement ps = conn.prepareStatement("select * from origin");
            ResultSet rs = ps.executeQuery();
            System.out.println("数据获取成功");
            while(rs.next()){
                 int Easting = Integer.parseInt(rs.getString(1));
                 int Westing = Integer.parseInt(rs.getString(2));
                 int RoadClass = Integer.parseInt(rs.getString(3));
                 int AccidentTime = Integer.parseInt(rs.getString(4));
                 int NumberofVehicles = Integer.parseInt(rs.getString(5));
                 int RoadSurface = Integer.parseInt(rs.getString(6));
                 int LightingConditions = Integer.parseInt(rs.getString(7));
                 int WeatherConditions = Integer.parseInt(rs.getString(8));
                 int TypeofVehicle = Integer.parseInt(rs.getString(9));
                 int CasualtyClass = Integer.parseInt(rs.getString(10));
                 int SexofCasualty = Integer.parseInt(rs.getString(11));
                 int AgeofCasualty = Integer.parseInt(rs.getString(12));
                 String Severity = rs.getString(13);
                  //  String Level =rs.getString(13);
                    Date_accident position = new Date_accident(Easting, Westing,
                            RoadClass,AccidentTime,NumberofVehicles,RoadSurface,
                            LightingConditions,WeatherConditions,TypeofVehicle,
                            CasualtyClass,SexofCasualty,AgeofCasualty,Severity
                    );
                    dateList.add(position);
            }

            // 关闭记录集
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // 关闭声明
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // 关闭链接对象
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Date_accident> getDateList() {
        return dateList;
    }
}



