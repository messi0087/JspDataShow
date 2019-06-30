package connection;

public class MapDate {
    public int easting;
    public int northing;
    public int severity;


    public MapDate(int easting, int northing,int severity) {
        this.easting = easting;
        this.northing = northing;
        this.severity=severity;
    }

    public int getNorthing(){
        return northing;
    }
    public int getEasting(){
        return easting;
    }
    public int getSeverity(){
        return severity;
    }

}
