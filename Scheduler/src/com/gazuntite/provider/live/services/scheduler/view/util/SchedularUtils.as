package com.gazuntite.provider.live.services.scheduler.view.util
{
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.utils.Base64Encoder;
	import mx.utils.ObjectUtil;
	
	public class SchedularUtils
	{
		[Bindable]
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		public function convertMilliSecondsToTime(time:Number):String 
		{
			//calculate playtime from milliseconds
			var h:Number = new Number(Math.floor(time/1000/60/60));
			//minutes left shows total minutes left plus hours, 1h5m = 65mins
			//so we subtract the amount of 60's added by the hours to get just minutes
			var m:Number = new Number(Math.floor(time/1000/60)-(h*60));
			//seconds left
			var s:Number = new Number(Math.floor(time/1000)-(m*60));
			
			//create string variables
			var hours:String;
			var minutes:String;
			var seconds:String
			
			//make sure minutes and seconds are always two digits
			if(m.toString().length == 1) {
				minutes = "0"+m;
			} else {
				minutes = m.toString();
			}
			
			if(s.toString().length == 1) {
				seconds = "0"+s;
			} else {
				seconds = s.toString();
			}
			
			//if hours or minutes are 0 we don't need to see them
			if(h == 0) {
				hours = '';
				if(m == 0) {
					minutes = '';
				} else {
					minutes = minutes+":";
				}
			} else {
				hours = h+":"
				minutes = minutes+":";
			}
			
			// after 1 hour passes the seconds become 4 digits long
			// the last two of those digits represent the actual seconds
			seconds = seconds.slice(seconds.length-2, seconds.length);
			return hours+':'+minutes+':'+seconds;
			
		}
		//************************* Set next Action and status Action Handler **********************************************************************		
		public function getNextAction(currentStatus:String):Object
		{
			var obj:Object = new Object();
			switch(currentStatus)
			{
				case 'Scheduled':
					obj.ID = 2;
					obj.Name = 'Arrived';
					obj.NextAction = 'Room-In';
					break;
				case 'Arrived':
					obj.ID = 3;
					obj.Name = 'BeingSeen';
					obj.NextAction = 'Check-Out';
					break;
				case 'BeingSeen':
				case 'Being Seen':
					obj.ID = 7;
					obj.Name = 'Confirmed';
					obj.NextAction = 'Completed'; 
					break;
				case 'Confirmed':
					obj.ID = 1;
					obj.Name = 'Consultation Completed';
					obj.NextAction = '';
					break;
				default:
					break;
			}
			return obj;
		}
		//*************** Comparing Two date bases on Times **************************************		
		public function comapreTime(date1:Date, date2:Date):Boolean
		{
			var ret:int = ObjectUtil.dateCompare(date1, date2);
			
			if (ret == 0)//if the strat date are equal to end date
			{
				return true;
			}else if( ret == -1)//if the first date is before the second date
			{
				return false;
			} 
			else // 1 - if the first date is after the second date
			{
				return true;
			}
		}
		//************* filter room on base of station id **********************
		public function getRoomsList(stationID:int):void
		{
			if(model.ClinicRoomList == null)
				return;
			
			if(model.SelectedRoomList == null)
				model.SelectedRoomList = new ArrayCollection();
			else
				model.SelectedRoomList.removeAll();
			
			if(model.ClinicRoomList.length > 0)
			{
				for(var i:uint =0; i< model.ClinicRoomList.length; i++)
				{
					if(String(stationID) == model.ClinicRoomList[i].Station)
					{
						model.SelectedRoomList.addItem(model.ClinicRoomList[i]);
					}
				}
			}
		}
		
		public static function getBase64String(text:String):String
		{
			var base64Dec:Base64Encoder = new Base64Encoder();
			
			base64Dec.encode(text);
			
			return base64Dec.toString();
		}
		
	}
}