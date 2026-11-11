package com.gazuntite.controls.calendar.vo
{
	

	public class EventVO
	{
		private var startDate:Date;
		private var endDate:Date;
		private var startTime:String;
		private var endTime:String;
		private var title:String;
		private var description:String;
		private var location:String;
		
		public var eventColors:Array = [0x7FD4FF,0xFF55FF,0xD4FF00,0x00FF00, 0xCCCCFF]; // [,0x7FD4FF];
		//All Information of Appointment
		private var objInfo:Object;
		
		
		public function EventVO()
		{
			/*var today:Date = new Date();
			
			var dateS1:String = today.toDateString();//"Thu Sep 15 2011"
			var timeS1:String = today.toTimeString();// "02:15:00 GMT+0500";
			startDate = new Date( dateS1 + " " + timeS1 );
			
			today.setTime( today.getTime() + DateUtil.HOUR );
			
			var dateS2:String = today.toDateString();//"Thu Sep 15 2011"
			var timeS2:String = today.toTimeString();//"06:00:00 GMT+0500";
			
			endDate = new Date( dateS2 + " " + timeS2 );*/
		}
		
		public function get EndTime():String
		{
			return endTime;
		}

		public function set EndTime(value:String):void
		{
			endTime = value;
			endDate = new Date( endDate.toDateString() + " " + value );
			
			//trace( "endDate", endDate.toString(), value ,"\n");
		}

		public function get StartTime():String
		{
			return startTime;
		}

		public function set StartTime(value:String):void
		{
			startTime = value;
			startDate = new Date( startDate.toDateString() + " " + value );
			
			//trace( "StartTime", startDate.toString(), value );
		}

		public function get Location():String
		{
			return location;
		}

		public function set Location(value:String):void
		{
			location = value;
		}

		public function get Description():String
		{
			return description;
		}

		public function set Description(value:String):void
		{
			description = value;
		}

		public function get Title():String
		{
			return title;
		}

		public function set Title(value:String):void
		{
			title = value;
		}

		public function get EndDate():Date
		{
			return endDate;
		}

		public function set EndDate(value:Date):void
		{
			endDate = value;
		}

		public function get StartDate():Date
		{
			return startDate;
		}

		public function set StartDate(value:Date):void
		{
			startDate = value;
		}
		
		public function get ObjInfo():Object
		{
			return objInfo;
		}

		public function set ObjInfo(value:Object):void
		{
			objInfo = value;
		}
		
		public function Clone():EventVO
		{
			var e:EventVO 	= new EventVO();
			e.title 		= this.title;
			e.description 	= this.description;
			e.location  	= this.location;
			e.startDate 	= this.startDate;
			e.endDate   	= this.endDate;
			e.startTime		= this.startTime;
			e.endTime		= this.endTime;
			e.objInfo		= this.objInfo;
			
			return e;
		}



	}
}