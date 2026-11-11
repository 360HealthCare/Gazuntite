package com.gazuntite.provider.live.services.scheduler.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.delegate.LoadClinicRoomByStationtIdSCDelegate;
	import com.gazuntite.provider.live.services.scheduler.dto.RoomDTO;
	import com.gazuntite.provider.live.services.scheduler.event.LoadClinicRoomByStationIdSCEvent;
	import com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadClinicRoomByStationtIdSCCommand implements Command
	{
		private var model:SchedulerModelLocator = SchedulerModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadClinicRoomByStationtIdSCDelegate;
		public var functionName : Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadClinicRoomByStationtIdSCDelegate( responder );			
			
			var LE:LoadClinicRoomByStationIdSCEvent = cgEvent as LoadClinicRoomByStationIdSCEvent;
			
			this.functionName = LE.functionName;
			
			if(LE != null)
				delegate.LoadClinicRoomByStationtId(LE.stationId);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var xRooms:XML = event.result.Rooms[0];
			var xRoomList:XMLList = xRooms.Room;
			
			if(model.ClinicRoomList == null)//If service first time then initiate the array otherwise add the new rooms list base on Station ID
				model.ClinicRoomList	= new ArrayCollection();
			
			for( var i:int = 0; i < xRoomList.length(); i++ )
			{
				var aRoomDTO:RoomDTO = new RoomDTO();
				aRoomDTO.FromXML( xRoomList[i]);
				model.ClinicRoomList.addItem( aRoomDTO );
			}
			
			if(this.functionName != null)
				this.functionName();
			
			CursorManager.removeBusyCursor();
		}
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show(event.toString(), "LoadClinicRoomByStationtIdCommand", 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}