package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_LightingSituation {
    public int[] lightingSituation ={0,0,0,0};
    public List<Integer> lightingSituation_List = new ArrayList<Integer>();
    public void deal_LightingSituation() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {

            for (Date_accident position : List) {
                switch (position.Get_LightingConditions()){
                    case 1 :
                        lightingSituation[0]+=1;
                        break;
                    case 2 :
                        lightingSituation[1]+=1;
                        break;
                    case 3 :
                        lightingSituation[2]+=1;
                        break;
                    case 4 :
                        lightingSituation[3]+=1;
                        break;

                }
            }
        }
    }

    public List lightingSituation_return(){
        lightingSituation_List.clear();
        for (int i = 0; i < 4; i++){
            lightingSituation_List.add(lightingSituation[i]);
        }
        return lightingSituation_List;
    }


}