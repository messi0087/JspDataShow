function GT_OSGB()
{
	this.northings=0;
	this.eastings=0;
	this.status="Undefined";
}
GT_OSGB.prefixes = new Array (
	new Array("SV","SW","SX","SY","SZ","TV","TW"),
	new Array("SQ","SR","SS","ST","SU","TQ","TR"),
	new Array("SL","SM","SN","SO","SP","TL","TM"),
	new Array("SF","SG","SH","SJ","SK","TF","TG"),
	new Array("SA","SB","SC","SD","SE","TA","TB"),
	new Array("NV","NW","NX","NY","NZ","OV","OW"),
	new Array("NQ","NR","NS","NT","NU","OQ","OR"),
	new Array("NL","NM","NN","NO","NP","OL","OM"),
	new Array("NF","NG","NH","NJ","NK","OF","OG"),
	new Array("NA","NB","NC","ND","NE","OA","OB"),
	new Array("HV","HW","HX","HY","HZ","JV","JW"),
	new Array("HQ","HR","HS","HT","HU","JQ","JR"),
	new Array("HL","HM","HN","HO","HP","JL","JM"));
GT_OSGB.prototype.setGridCoordinates = function(eastings,northings)
{
	this.northings=northings;
	this.eastings=eastings;
	this.status="OK";
}
GT_OSGB.prototype.setError = function(msg)
{
	this.status=msg;
}
GT_OSGB.prototype._zeropad = function(num, len)
{
	var str=new String(num);
	while (str.length<len)
	{
		str='0'+str;
	}
	return str;
}
GT_OSGB.prototype.getGridRef = function(precision)
{
	if (precision<0)
		precision=0;
	if (precision>5)
		precision=5;
	var e="";
	var n="";
	if (precision>0)
	{
		var y=Math.floor(this.northings/100000);
		var x=Math.floor(this.eastings/100000);
		var e=Math.round(this.eastings%100000);
		var n=Math.round(this.northings%100000);
		var div=(5-precision);
		e=Math.round(e / Math.pow(10, div));
		n=Math.round(n / Math.pow(10, div));
	}
	var prefix=GT_OSGB.prefixes[y][x];
    return prefix+" "+this._zeropad(e, precision)+" "+this._zeropad(n, precision);
}
GT_OSGB.prototype.parseGridRef = function(landranger)
{
	var ok=false;
	this.northings=0;
	this.eastings=0;
	var precision;
	for (precision=5; precision>=1; precision--)
	{
		var pattern = new RegExp("^([A-Z]{2})\\s*(\\d{"+precision+"})\\s*(\\d{"+precision+"})$", "i")
		var gridRef = landranger.match(pattern);
		if (gridRef)
		{
			var gridSheet = gridRef[1];
			var gridEast=0;
			var gridNorth=0;
			//5x1 4x10 3x100 2x1000 1x10000 
			if (precision>0)
			{
				var mult=Math.pow(10, 5-precision);
				gridEast=parseInt(gridRef[2],10) * mult;
				gridNorth=parseInt(gridRef[3],10) * mult;
			}
			var x,y;
			search: for(y=0; y<GT_OSGB.prefixes.length; y++) 
			{
				for(x=0; x<GT_OSGB.prefixes[y].length; x++)
					if (GT_OSGB.prefixes[y][x] == gridSheet) {
						this.eastings = (x * 100000)+gridEast;
						this.northings = (y * 100000)+gridNorth;
						ok=true;
						break search;
					}
			}
		}
	}
	return ok;
}
GT_OSGB.prototype.getWGS84 = function()
{
	var height = 0;
	var lat1 = GT_Math.E_N_to_Lat (this.eastings,this.northings,6377563.396,6356256.910,400000,-100000,0.999601272,49.00000,-2.00000);
	var lon1 = GT_Math.E_N_to_Long(this.eastings,this.northings,6377563.396,6356256.910,400000,-100000,0.999601272,49.00000,-2.00000);
	var x1 = GT_Math.Lat_Long_H_to_X(lat1,lon1,height,6377563.396,6356256.910);
	var y1 = GT_Math.Lat_Long_H_to_Y(lat1,lon1,height,6377563.396,6356256.910);
	var z1 = GT_Math.Lat_H_to_Z     (lat1,      height,6377563.396,6356256.910);
	var x2 = GT_Math.Helmert_X(x1,y1,z1,446.448 ,0.2470,0.8421,-20.4894);
	var y2 = GT_Math.Helmert_Y(x1,y1,z1,-125.157,0.1502,0.8421,-20.4894);
	var z2 = GT_Math.Helmert_Z(x1,y1,z1,542.060 ,0.1502,0.2470,-20.4894);
	var latitude = GT_Math.XYZ_to_Lat(x2,y2,z2,6378137.000,6356752.313);
	var longitude = GT_Math.XYZ_to_Long(x2,y2);
	var wgs84=new GT_WGS84();
	wgs84.setDegrees(latitude, longitude);
	return wgs84;
}
function GT_WGS84()
{
	this.latitude=0;
	this.longitude=0;
}
GT_WGS84.prototype.setDegrees = function(latitude,longitude)
{
	this.latitude=latitude;
	this.longitude=longitude;
}
GT_WGS84.prototype.parseString = function(text)
{
	var ok=false;
	var str=new String(text);
	//N 51� 53.947 W 000� 10.018
	var pattern = /([ns])\s*(\d+)[�\s]+(\d+\.\d+)\s+([we])\s*(\d+)[�\s]+(\d+\.\d+)/i;
	var matches=str.match(pattern);
	if (matches)
	{
		ok=true;
		var latsign=(matches[1]=='s' || matches[1]=='S')?-1:1;
		var longsign=(matches[4]=='w' || matches[4]=='W')?-1:1;
		var d1=parseFloat(matches[2]);
		var m1=parseFloat(matches[3]);
		var d2=parseFloat(matches[5]);
		var m2=parseFloat(matches[6]);
		this.latitude=latsign * (d1 + (m1/60.0));
		this.longitude=longsign * (d2 + (m2/60.0));
	}
	return ok;
}
GT_WGS84.prototype.isGreatBritain = function()
{
	return this.latitude > 49 &&
		this.latitude < 62 &&
		this.longitude > -9.5 &&
		this.longitude < 2.3;
}
GT_WGS84.prototype.isIreland = function()
{
	return this.latitude > 51.2 &&
		this.latitude < 55.73 &&
		this.longitude > -12.2 &&
		this.longitude < -4.8;
}
GT_WGS84.prototype.getOSGB = function()
{
	var osgb=new GT_OSGB();
	if (this.isGreatBritain())
	{
		var height = 0;
		var x1 = GT_Math.Lat_Long_H_to_X(this.latitude,this.longitude,height,6378137.00,6356752.313);
		var y1 = GT_Math.Lat_Long_H_to_Y(this.latitude,this.longitude,height,6378137.00,6356752.313);
		var z1 = GT_Math.Lat_H_to_Z     (this.latitude,      height,6378137.00,6356752.313);
		var x2 = GT_Math.Helmert_X(x1,y1,z1,-446.448,-0.2470,-0.8421,20.4894);
		var y2 = GT_Math.Helmert_Y(x1,y1,z1, 125.157,-0.1502,-0.8421,20.4894);
		var z2 = GT_Math.Helmert_Z(x1,y1,z1,-542.060,-0.1502,-0.2470,20.4894);
		var latitude2  = GT_Math.XYZ_to_Lat (x2,y2,z2,6377563.396,6356256.910);
		var longitude2 = GT_Math.XYZ_to_Long(x2,y2);
		var e = GT_Math.Lat_Long_to_East (latitude2,longitude2,6377563.396,6356256.910,400000,0.999601272,49.00000,-2.00000);
		var n = GT_Math.Lat_Long_to_North(latitude2,longitude2,6377563.396,6356256.910,400000,-100000,0.999601272,49.00000,-2.00000);
		osgb.setGridCoordinates(Math.round(e), Math.round(n));
	}
	else
	{
		osgb.setError("Coordinate not within Great Britain");
	}
	return osgb;
}
function GT_Math()
{
}
GT_Math.E_N_to_Lat = function(East, North, a, b, e0, n0, f0, PHI0, LAM0)
{
    var Pi = 3.14159265358979;
    var RadPHI0 = PHI0 * (Pi / 180);
    var RadLAM0 = LAM0 * (Pi / 180);
    var af0 = a * f0;
    var bf0 = b * f0;
    var e2 = (Math.pow(af0,2) - Math.pow(bf0,2)) / Math.pow(af0,2);
    var n = (af0 - bf0) / (af0 + bf0);
    var Et = East - e0;
    var PHId = GT_Math.InitialLat(North, n0, af0, RadPHI0, n, bf0);
    var nu = af0 / (Math.sqrt(1 - (e2 * ( Math.pow(Math.sin(PHId),2)))));
    var rho = (nu * (1 - e2)) / (1 - (e2 * Math.pow(Math.sin(PHId),2)));
    var eta2 = (nu / rho) - 1;
    var VII = (Math.tan(PHId)) / (2 * rho * nu);
    var VIII = ((Math.tan(PHId)) / (24 * rho * Math.pow(nu,3))) * (5 + (3 * (Math.pow(Math.tan(PHId),2))) + eta2 - (9 * eta2 * (Math.pow(Math.tan(PHId),2))));
    var IX = ((Math.tan(PHId)) / (720 * rho * Math.pow(nu,5))) * (61 + (90 * ((Math.tan(PHId)) ^ 2)) + (45 * (Math.pow(Math.tan(PHId),4))));
    var E_N_to_Lat = (180 / Pi) * (PHId - (Math.pow(Et,2) * VII) + (Math.pow(Et,4) * VIII) - ((Et ^ 6) * IX));
	return (E_N_to_Lat);
}
GT_Math.E_N_to_Long = function(East, North, a, b, e0, n0, f0, PHI0, LAM0)
{
    var Pi = 3.14159265358979;
    var RadPHI0 = PHI0 * (Pi / 180);
    var RadLAM0 = LAM0 * (Pi / 180);
    var af0 = a * f0;
    var bf0 = b * f0;
    var e2 = (Math.pow(af0,2) - Math.pow(bf0,2)) / Math.pow(af0,2);
    var n = (af0 - bf0) / (af0 + bf0);
    var Et = East - e0;
    var PHId = GT_Math.InitialLat(North, n0, af0, RadPHI0, n, bf0);
   	var nu = af0 / (Math.sqrt(1 - (e2 * (Math.pow(Math.sin(PHId),2)))));
    var rho = (nu * (1 - e2)) / (1 - (e2 * Math.pow(Math.sin(PHId),2)));
    var eta2 = (nu / rho) - 1;
    var X = (Math.pow(Math.cos(PHId),-1)) / nu;
    var XI = ((Math.pow(Math.cos(PHId),-1)) / (6 * Math.pow(nu,3))) * ((nu / rho) + (2 * (Math.pow(Math.tan(PHId),2))));
    var XII = ((Math.pow(Math.cos(PHId),-1)) / (120 * Math.pow(nu,5))) * (5 + (28 * (Math.pow(Math.tan(PHId),2))) + (24 * (Math.pow(Math.tan(PHId),4))));
    var XIIA = ((Math.pow(Math.cos(PHId),-1)) / (5040 * Math.pow(nu,7))) * (61 + (662 * (Math.pow(Math.tan(PHId),2))) + (1320 * (Math.pow(Math.tan(PHId),4))) + (720 * (Math.pow(Math.tan(PHId),6))));
    var E_N_to_Long = (180 / Pi) * (RadLAM0 + (Et * X) - (Math.pow(Et,3) * XI) + (Math.pow(Et,5) * XII) - (Math.pow(Et,7) * XIIA));
	return E_N_to_Long;
}
GT_Math.InitialLat = function(North, n0, afo, PHI0, n, bfo)
{
   	var PHI1 = ((North - n0) / afo) + PHI0;
    var M = GT_Math.Marc(bfo, n, PHI0, PHI1);
    var PHI2 = ((North - n0 - M) / afo) + PHI1;
	while (Math.abs(North - n0 - M) > 0.00001) 
	{
        PHI2 = ((North - n0 - M) / afo) + PHI1;
        M = GT_Math.Marc(bfo, n, PHI0, PHI2);
        PHI1 = PHI2;
	}    
    return PHI2;
}
GT_Math.Lat_Long_H_to_X = function(PHI, LAM, H, a, b)
{
    var Pi = 3.14159265358979;
    var RadPHI = PHI * (Pi / 180);
    var RadLAM = LAM * (Pi / 180);
    var e2 = (Math.pow(a,2) - Math.pow(b,2)) / Math.pow(a,2);
    var V = a / (Math.sqrt(1 - (e2 * (  Math.pow(Math.sin(RadPHI),2)))));
    return (V + H) * (Math.cos(RadPHI)) * (Math.cos(RadLAM));
}
GT_Math.Lat_Long_H_to_Y =function(PHI, LAM, H, a, b) 
{
    var Pi = 3.14159265358979;
    var RadPHI = PHI * (Pi / 180);
    var RadLAM = LAM * (Pi / 180);
    var e2 = (Math.pow(a,2) - Math.pow(b,2)) / Math.pow(a,2);
    var V = a / (Math.sqrt(1 - (e2 * (  Math.pow(Math.sin(RadPHI),2))) ));
    return (V + H) * (Math.cos(RadPHI)) * (Math.sin(RadLAM));
}
GT_Math.Lat_H_to_Z =function(PHI, H, a, b)
{
    var Pi = 3.14159265358979;
    var RadPHI = PHI * (Pi / 180);
    var e2 = (Math.pow(a,2) - Math.pow(b,2)) / Math.pow(a,2);
    var V = a / (Math.sqrt(1 - (e2 * (  Math.pow(Math.sin(RadPHI),2)) )));
    return ((V * (1 - e2)) + H) * (Math.sin(RadPHI));
}
GT_Math.Helmert_X =function(X,Y,Z,DX,Y_Rot,Z_Rot,s) 
{
	var Pi = 3.14159265358979;
	var sfactor = s * 0.000001;
	var RadY_Rot = (Y_Rot / 3600) * (Pi / 180);
	var RadZ_Rot = (Z_Rot / 3600) * (Pi / 180);
    return  (X + (X * sfactor) - (Y * RadZ_Rot) + (Z * RadY_Rot) + DX);
}
GT_Math.Helmert_Y =function(X,Y,Z,DY,X_Rot,Z_Rot,s)
{
	var Pi = 3.14159265358979;
	var sfactor = s * 0.000001;
	var RadX_Rot = (X_Rot / 3600) * (Pi / 180);
	var RadZ_Rot = (Z_Rot / 3600) * (Pi / 180);
	return (X * RadZ_Rot) + Y + (Y * sfactor) - (Z * RadX_Rot) + DY;
}
GT_Math.Helmert_Z =function(X, Y, Z, DZ, X_Rot, Y_Rot, s)
{
	var Pi = 3.14159265358979;
	var sfactor = s * 0.000001;
	var RadX_Rot = (X_Rot / 3600) * (Pi / 180);
	var RadY_Rot = (Y_Rot / 3600) * (Pi / 180);
	return (-1 * X * RadY_Rot) + (Y * RadX_Rot) + Z + (Z * sfactor) + DZ;
} 
GT_Math.XYZ_to_Lat =function(X, Y, Z, a, b) 
{
    var RootXYSqr = Math.sqrt(Math.pow(X,2) + Math.pow(Y,2));
    var e2 = (Math.pow(a,2) - Math.pow(b,2)) / Math.pow(a,2);
    var PHI1 = Math.atan2(Z , (RootXYSqr * (1 - e2)) );
    var PHI = GT_Math.Iterate_XYZ_to_Lat(a, e2, PHI1, Z, RootXYSqr);
    var Pi = 3.14159265358979;
    return PHI * (180 / Pi);
}
GT_Math.Iterate_XYZ_to_Lat =function(a, e2, PHI1, Z, RootXYSqr) 
{
    var V = a / (Math.sqrt(1 - (e2 * Math.pow(Math.sin(PHI1),2))));
    var PHI2 = Math.atan2((Z + (e2 * V * (Math.sin(PHI1)))) , RootXYSqr);
    while (Math.abs(PHI1 - PHI2) > 0.000000001) {
        PHI1 = PHI2;
        V = a / (Math.sqrt(1 - (e2 * Math.pow(Math.sin(PHI1),2))));
        PHI2 = Math.atan2((Z + (e2 * V * (Math.sin(PHI1)))) , RootXYSqr);
    }
    return PHI2;
}
GT_Math.XYZ_to_Long =function (X, Y) 
{
    var Pi = 3.14159265358979;
    return Math.atan2(Y , X) * (180 / Pi);
}
GT_Math.Marc =function (bf0, n, PHI0, PHI) 
{
		return bf0 * (((1 + n + ((5 / 4) * Math.pow(n,2)) + ((5 / 4) * Math.pow(n,3))) * (PHI - PHI0)) - (((3 * n) + (3 * Math.pow(n,2)) + ((21 / 8) * Math.pow(n,3))) * (Math.sin(PHI - PHI0)) * (Math.cos(PHI + PHI0))) + ((((15 / 8
	) * Math.pow(n,2)) + ((15 / 8) * Math.pow(n,3))) * (Math.sin(2 * (PHI - PHI0))) * (Math.cos(2 * (PHI + PHI0)))) - (((35 / 24) * Math.pow(n,3)) * (Math.sin(3 * (PHI - PHI0))) * (Math.cos(3 * (PHI + PHI0)))));
}
GT_Math.Lat_Long_to_East =function (PHI, LAM, a, b, e0, f0, PHI0, LAM0)
{
    var Pi = 3.14159265358979;
    var RadPHI = PHI * (Pi / 180);
    var RadLAM = LAM * (Pi / 180);
    var RadPHI0 = PHI0 * (Pi / 180);
    var RadLAM0 = LAM0 * (Pi / 180);
    var af0 = a * f0;
    var bf0 = b * f0;
    var e2 = (Math.pow(af0,2) - Math.pow(bf0,2)) / Math.pow(af0,2);
    var n = (af0 - bf0) / (af0 + bf0);
    var nu = af0 / (Math.sqrt(1 - (e2 * Math.pow(Math.sin(RadPHI),2) )));
    var rho = (nu * (1 - e2)) / (1 - (e2 * Math.pow(Math.sin(RadPHI),2) ));
    var eta2 = (nu / rho) - 1;
    var p = RadLAM - RadLAM0;
    var IV = nu * (Math.cos(RadPHI));
    var V = (nu / 6) * ( Math.pow(Math.cos(RadPHI),3)) * ((nu / rho) - (Math.pow(Math.tan(RadPHI),2)));
    var VI = (nu / 120) * (Math.pow(Math.cos(RadPHI),5)) * (5 - (18 * (Math.pow(Math.tan(RadPHI),2))) + (Math.pow(Math.tan(RadPHI),4)) + (14 * eta2) - (58 * (Math.pow(Math.tan(RadPHI),2)) * eta2));
    return e0 + (p * IV) + (Math.pow(p,3) * V) + (Math.pow(p,5) * VI);
}
GT_Math.Lat_Long_to_North =function (PHI, LAM, a, b, e0, n0, f0, PHI0, LAM0) 
{
    var Pi = 3.14159265358979;
    var RadPHI = PHI * (Pi / 180);
    var RadLAM = LAM * (Pi / 180);
    var RadPHI0 = PHI0 * (Pi / 180);
    var RadLAM0 = LAM0 * (Pi / 180);
    var af0 = a * f0;
    var bf0 = b * f0;
    var e2 = (Math.pow(af0,2) - Math.pow(bf0,2)) / Math.pow(af0,2);
    var n = (af0 - bf0) / (af0 + bf0);
    var nu = af0 / (Math.sqrt(1 - (e2 * Math.pow(Math.sin(RadPHI),2))));
    var rho = (nu * (1 - e2)) / (1 - (e2 * Math.pow(Math.sin(RadPHI),2)));
    var eta2 = (nu / rho) - 1;
    var p = RadLAM - RadLAM0;
    var M = GT_Math.Marc(bf0, n, RadPHI0, RadPHI);
    var I = M + n0;
    var II = (nu / 2) * (Math.sin(RadPHI)) * (Math.cos(RadPHI));
    var III = ((nu / 24) * (Math.sin(RadPHI)) * (Math.pow(Math.cos(RadPHI),3))) * (5 - (Math.pow(Math.tan(RadPHI),2)) + (9 * eta2));
    var IIIA = ((nu / 720) * (Math.sin(RadPHI)) * (Math.pow(Math.cos(RadPHI),5))) * (61 - (58 * (Math.pow(Math.tan(RadPHI),2))) + (Math.pow(Math.tan(RadPHI),4)));
    return I + (Math.pow(p,2) * II) + (Math.pow(p,4) * III) + (Math.pow(p,6) * IIIA);
}