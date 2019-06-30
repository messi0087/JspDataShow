package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_AccidentTime {
    public int day;
    public int night;
    public float d;
    public float n;
    public float ac;

    public List<Integer> accidentTime_List = new ArrayList<Integer>();
    public void deal_AccidentTime() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {

            for (Date_accident position : List) {
                switch (position.Get_AccidentTime()){
                    case 1 :
                        day+=1;
                        break;
                    case 2 :
                        night+=1;
                        break;

                }
            }
        }
    }

    public List accidentTime_return(){
        float dd;
        float nn;
        accidentTime_List.clear();

        d = day;
        n = night;
        ac =d+n;
        dd =(d/(ac))*100;
        nn =(n/(ac))*100;

        accidentTime_List.add((int)dd);
        accidentTime_List.add((int)nn);

        return accidentTime_List;
    }


}
