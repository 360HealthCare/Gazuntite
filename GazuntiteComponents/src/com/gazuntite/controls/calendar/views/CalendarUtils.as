package com.gazuntite.controls.calendar.views
{
	public class CalendarUtils
	{
		public function CalendarUtils()
		{
		}
		public static function getMonthdate(intMonth:Number, year:Number):String
		{
			var strMonth:String;
			switch(intMonth)
			{
				case 0:
					strMonth = "January";
					break;
				case 1:
					strMonth = "Febuary";
					break;
				case 2:
					strMonth = "March";
					break;
				case 3:
					strMonth = "April";
					break;
				case 4:
					strMonth = "May";
					break;
				case 5:
					strMonth = "June";
					break;
				case 6:
					strMonth = "July";
					break;
				case 7:
					strMonth = "August";
					break;
				case 8:
					strMonth = "September";
					break;
				case 9:
					strMonth = "October";
					break;
				case 10:
					strMonth = "November";
					break;
				case 11:
					strMonth = "December";
					break;  
				
				default:
					trace("Month Out of range");
					break;
			}
			return strMonth +" "+ year;
		}
		
		public static function getNextDate(date:Date, count:int):Date 
		{
			var times:int = count;
			var newDate:Date = new Date(date.getFullYear(), date.month, date.date);
			
			if(times < 0)
				times = times * -1;
			
			for (var i:int = 1; i <= times; i++) 
			{	
				if(count > 0)
					newDate.date = newDate.date + 1;
				else if (count < 0)
					newDate.date = newDate.date - 1;
			}
			return newDate;
		}
	}
}