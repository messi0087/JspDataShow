package connection;

import java.io.Serializable;

public class Date_accident implements Serializable {
    private int n_easting;
    private int n_northing;
    private int RoadClass;
    private int AccidentTime;
    private int NumberofVehicles;
    private int RoadSurface;
    private int LightingConditions;
    private int WeatherConditions;
    private int TypeofVehicle;
    private int CasualtyClass;
    private int SexofCasualty;
    private int AgeofCasualty;
    private String Severity;


    public Date_accident(){
        super();
    }
    public Date_accident(int n_easting,int n_northing,int RoadClass,int AccidentTime,int NumberofVehicles,
                         int RoadSurface, int LightingConditions, int WeatherConditions, int TypeofVehicle,
                         int CasualtyClass, int SexofCasualty, int AgeofCasualty,String Severity){
        super();
        this.n_easting=n_easting;
        this.n_northing=n_northing;
        this.RoadClass=RoadClass;
        this.AccidentTime=AccidentTime;
        this.NumberofVehicles=NumberofVehicles;
        this.RoadSurface=RoadSurface;
        this.LightingConditions=LightingConditions;
        this.WeatherConditions=WeatherConditions;
        this.TypeofVehicle=TypeofVehicle;
        this.CasualtyClass=CasualtyClass;
        this.SexofCasualty=SexofCasualty;
        this.AgeofCasualty=AgeofCasualty;
        this.Severity=Severity;

    }
    public int Get_N_easting(){
        return n_easting;
    }
    public int Get_N_northing(){
        return n_northing;
    }
    public int Get_RoadClass(){
        return RoadClass;
    }
    public int Get_AccidentTime(){
        return AccidentTime;
    }
    public int Get_NumberofVehicles(){
        return NumberofVehicles;
    }
    public int Get_RoadSurface(){
        return RoadSurface;
    }
    public int Get_LightingConditions(){
        return LightingConditions;
    }
    public int Get_WeatherConditions(){
        return WeatherConditions;
    }
    public int Get_TypeofVehicle(){
        return TypeofVehicle;
    }
    public int Get_CasualtyClass(){
        return CasualtyClass;
    }
    public int Get_SexofCasualty(){
        return SexofCasualty;
    }
    public int Get_AgeofCasualty(){
        return AgeofCasualty;
    }
    public String Get_Severity(){
        return Severity;
    }
}
