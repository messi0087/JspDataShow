package connection;

import java.util.ArrayList;
import java.util.List;

public class Date_Deal_VehicleType {
    public int[] VehicleType ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    public List<Integer> vehicleType_List = new ArrayList<Integer>();
    public void deal_VehicleType() {
        List<Date_accident> List = Date.Dates.Send_list;
        if (List != null) {
            for (Date_accident position : List) {
                switch (position.Get_TypeofVehicle()){
                    case 1 :
                        VehicleType[0]+=1;
                        break;
                    case 2 :
                        VehicleType[1]+=1;
                        break;
                    case 3 :
                        VehicleType[2]+=1;
                        break;
                    case 4 :
                        VehicleType[3]+=1;
                        break;
                    case 5 :
                        VehicleType[4]+=1;
                        break;
                    case 6 :
                        VehicleType[5]+=1;
                        break;
                    case 7 :
                        VehicleType[6]+=1;
                        break;
                    case 8 :
                        VehicleType[7]+=1;
                        break;
                    case 9 :
                        VehicleType[8]+=1;
                        break;
                    case 10 :
                        VehicleType[9]+=1;
                        break;
                    case 11 :
                        VehicleType[10]+=1;
                        break;
                    case 12 :
                        VehicleType[11]+=1;
                        break;
                    case 13 :
                        VehicleType[12]+=1;
                        break;
                    case 14 :
                        VehicleType[13]+=1;
                        break;
                    case 15 :
                        VehicleType[14]+=1;
                        break;
                    case 16 :
                        VehicleType[15]+=1;
                        break;
                    case 17 :
                        VehicleType[16]+=1;
                        break;
                    case 18 :
                        VehicleType[17]+=1;
                        break;
                }
            }
        }
    }

    public List vehicleType_return(){
        vehicleType_List.clear();
        for(int i=0;i<18;i++) {
            vehicleType_List.add(VehicleType[i]);
        }
        return vehicleType_List;
    }


}


