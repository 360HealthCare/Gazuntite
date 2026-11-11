package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.delegate.VideoCallNotificationDelegate;
	import com.gazuntite.webRTC.events.VideoCallNotificationEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class VideoCallNotificationCommand implements Command
	{
		
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var responder:Responder;
		private var delegate:VideoCallNotificationDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new VideoCallNotificationDelegate( responder );			
			
			var VCNE:VideoCallNotificationEvent = cgEvent as VideoCallNotificationEvent;
			
			callBack = VCNE.callBack;
			delegate.VideoCallNotificationDetails(VCNE.videoChatID);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			/* Convert XMLNode to XMLDocument. */
			var xmlStr:String = event.result.toString();
			var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			/* Assign the values... */
			
			event.stopImmediatePropagation();
			
		}
		
		private function onError(event:FaultEvent):void
		{
			/*var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Video Call ",event.fault.faultString,model.loggedInUserDTO.UserId);
			PopUpManager.centerPopUp(cAlert); */
			//Alert.show("Error in Video Call.");
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in VideoCallNotificationCommand", event.toString(), userId); 
			
			
		}
		
	
	}
}