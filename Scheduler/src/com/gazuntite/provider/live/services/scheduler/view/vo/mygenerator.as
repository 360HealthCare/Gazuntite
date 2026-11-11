package com.gazuntite.provider.live.services.scheduler.view.vo
{
	import com.gazuntite.controls.calendar.calsample.Calendar;
	import com.gazuntite.controls.calendar.calsample.CalendarEvent;
	import com.gazuntite.controls.calendar.vo.EventVO;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	
	import mx.collections.ArrayCollection;
	
	public class mygenerator
	{
		public function mygenerator()
		{
		}
		public var events:ArrayCollection = new ArrayCollection();
		public var calendars:ArrayCollection = new ArrayCollection();
		public var numberOfCalendars:int = 1;
		// TA - Calendar Events Color are associated with this calendar Colors
		public var colors:Array = [0x00D4FF,0xFF55FF,0xD4FF00,0x00FF00, 0xCCCCFF];
		
		[Bindable]
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		public function generate():void 
		{
			for(var i:int=0; i<numberOfCalendars; i++) 
			{
				var calendar:Calendar = new Calendar();
				calendars.addItem(calendar);
				calendar.name = "Calendar " + i
				generateEvents(events, calendar);
			}
		}
		
		private function generateEvents(events:ArrayCollection, calendar:com.gazuntite.controls.calendar.calsample.Calendar):void 
		{
			var col:ArrayCollection = getAppointmentEvents();
			for(var j:int=0; j < col.length; j++) 
			{
				var eventVO:EventVO 	= col.getItemAt( j ) as EventVO;
				var event:com.gazuntite.controls.calendar.calsample.CalendarEvent = new CalendarEvent();
				event.calendar 			= calendar;
				
				
				event.color = 			eventVO.eventColors[j];
				
				event.title 			= eventVO.Title;
				event.description		= eventVO.Description;
				event.start 			= eventVO.StartDate;
				event.end 				= eventVO.EndDate;
				//TA- Place Appointment Color on base of Ststus here!
				if(event.title.indexOf('Cancelled',0) == -1){
					//event.color 			= 0x7FD4FF;
				}else{
					event.color 			= 0xcccccc;
				}
				events.addItem(event);
			}
		}
		
		private function getAppointmentEvents():ArrayCollection
		{
			var col:ArrayCollection = new ArrayCollection();
			if(model.ScheduledAppointmentList == null)
				return col;
			
			if(model.ScheduledAppointmentList.length > 0)
			{
				for(var i:uint= 0; i< model.ScheduledAppointmentList.length; i++) 
				{
					var strDate:String = model.ScheduledAppointmentList[i].Date;
					var date:Date = new Date(strDate);
					var strSTime:String = model.ScheduledAppointmentList[i].StartTime;
					var arr1:Array = strSTime.split(' ', strSTime.length);
					var strETime:String = model.ScheduledAppointmentList[i].EndTime;
					var arr2:Array = strETime.split(' ', strETime.length);
					
					var eventVO:EventVO = new EventVO();
					eventVO.StartDate 	= date;
					eventVO.EndDate		= date;
					eventVO.StartTime   = model.ScheduledAppointmentList[i].StartTime;
					eventVO.EndTime     = model.ScheduledAppointmentList[i].EndTime;
					eventVO.Title 		= model.ScheduledAppointmentList[i].Patient.PatientName+' ('+ model.ScheduledAppointmentList[i].Action.Name+') '+'('+model.ScheduledAppointmentList[i].Type.Name+')';	
					eventVO.Description = model.ScheduledAppointmentList[i].ID +'|' + model.ScheduledAppointmentList[i].StationID +'|'+model.ScheduledAppointmentList[i].ChiefComplaint;
					col.addItem( eventVO );
				}
			}
			return col;
		}
		
	}
}