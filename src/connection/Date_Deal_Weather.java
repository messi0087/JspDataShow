package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_Weather {
    public int weather1;
    public int weather2;
    public int weather3;
    public int weather4;
    public int weather5;
    public int weather6;
    public int weather7;
    public int weather8;
    public List<Integer> weather_List = new ArrayList<Integer>();
    public void deal_weather() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {
            for (Date_accident position : List) {
                switch (position.Get_WeatherConditions()){
                    case 1 :
                        weather1+=1;
                        break;
                    case 2 :
                        weather2+=1;
                        break;
                    case 3 :
                        weather3+=1;
                        break;
                    case 4 :
                        weather4+=1;
                        break;
                    case 5 :
                        weather5+=1;
                        break;
                    case 6 :
                        weather6+=1;
                        break;
                    case 7 :
                        weather7+=1;
                        break;
                    case 8 :
                        weather8+=1;
                        break;
                }
            }
        }
    }

    public List weather_return(){
        weather_List.clear();
        weather_List.add(weather1);
        weather_List.add(weather2);
        weather_List.add(weather3);
        weather_List.add(weather4);
        weather_List.add(weather5);
        weather_List.add(weather6);
        weather_List.add(weather7);
        weather_List.add(weather8);
        return weather_List;
    }


}
