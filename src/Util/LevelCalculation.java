package Util;

public class LevelCalculation {
	
	public static String calclevel(String credit)
	{
		Double realcredit = Double.parseDouble(credit);
        if(realcredit < 200) return "Bronze Member";
        else if(realcredit < 400) return "Silver Member";
        else if(realcredit < 600) return "Gold Member";
        else  return "Platinum Member";
		
	}

}
