package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_MapDate {
    public int value;

    public List<MapDate> MapDate_List = new ArrayList<MapDate>();
    public void deal_MapDate() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {
            for (Date_accident position : List) {
                switch (position.Get_Severity()){
                    case "Slight" :
                        value=100;
                        break;
                    case "Serious" :
                        value=200;
                        break;
                    case "Fatal" :
                        value=300;
                        break;
                }

                MapDate_List.add(new MapDate(position.Get_N_easting(), position.Get_N_northing(),value));
            }
        }
    }


    public List mapDate_return(){
        return MapDate_List;
    }
}
