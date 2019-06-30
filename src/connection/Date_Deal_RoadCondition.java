package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_RoadCondition {
    public int[] roadCondition ={0,0,0,0,0};
    public List<Integer> roadCondition_List = new ArrayList<Integer>();
    public void deal_RoadCondition() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {

            for (Date_accident position : List) {
                switch (position.Get_RoadSurface()){
                    case 1 :
                        roadCondition[0]+=1;
                        break;
                    case 2 :
                        roadCondition[1]+=1;
                        break;
                    case 3 :
                        roadCondition[2]+=1;
                        break;
                    case 4 :
                        roadCondition[3]+=1;
                        break;
                    case 5 :
                        roadCondition[4]+=1;
                        break;

                }
            }
        }
    }

    public List roadCondition_return(){
        roadCondition_List.clear();
        for (int i = 0; i < 5; i++){
            roadCondition_List.add(roadCondition[i]);
        }
        return roadCondition_List;
    }


}
