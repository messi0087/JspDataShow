package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_Severity {
    public int severity1;
    public int severity2;
    public int severity3;


    public List<Integer> severity_List = new ArrayList<Integer>();
    public void deal_Severity() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {

            for (Date_accident position : List) {
                switch (position.Get_Severity()){
                    case "Slight" :
                        severity1+=4;
                        break;
                    case "Serious" :
                        severity2+=4;
                        break;
                    case "Fatal" :
                        severity3+=4;
                        break;

                }
            }
        }
    }

    public List severity_return(){
        severity_List.clear();
        severity_List.add(severity1);
        severity_List.add(severity2);
        severity_List.add(severity3);
        return severity_List;
    }


}