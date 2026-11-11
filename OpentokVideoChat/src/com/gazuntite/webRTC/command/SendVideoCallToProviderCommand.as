package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.delegate.SendVideoCallToProviderDelegate;
	import com.gazuntite.webRTC.events.SendVideoCallToProviderEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	import com.gazuntite.webRTC.model.vo.VideoChatDTO;
	
	import mx.rpc.IResponder;
	
	public class SendVideoCallToProviderCommand implements Command, IResponder
	{
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var delegate				:SendVideoCallToProviderDelegate;
		private var callEvent				:SendVideoCallToProviderEvent
		private var callBack				:Function;
		private var CallRecieverName    	:String;
		
		
		public function execute(cgEvent:CairngormEvent):void
		{
			delegate  = new SendVideoCallToProviderDelegate( this );			
			
			callEvent = cgEvent as SendVideoCallToProviderEvent;
			
			delegate.SendVideoCallDetails(callEvent.videoChat);
			callBack = callEvent.callBack;
			
			CallRecieverName = callEvent.videoChat.CallRecieverName;
		}
		
		public function result(event:Object):void
		{
			trace(event.result);
			var result:XML = event.result as XML;
			
			var dto:VideoChatDTO = new VideoChatDTO();
			dto.FromXML( result );
			
			if(dto.ID == -1)
				UtilityFunctions.ShowMessage( CallRecieverName + " rejected the call. " , "User busy!");
			else if(dto.ID == -2 )
				UtilityFunctions.ShowMessage( CallRecieverName + " is not responding."  , "No Response!");
			else if( null != callBack )
				callBack( dto );
			else
				UtilityFunctions.ShowMessage( "Unable to call " + callEvent.videoChat.CallRecieverName + ", server didn't respond, try again later.", "Call Again, server error");
		}
		
		public function fault(event:Object):void
		{
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in SendVideoCallToProviderCommand", event.toString(), userId); 
		}
	}
}