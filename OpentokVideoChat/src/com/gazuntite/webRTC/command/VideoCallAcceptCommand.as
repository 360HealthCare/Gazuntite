package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.delegate.VideoCallAcceptDelegate;
	import com.gazuntite.webRTC.events.VideoCallAcceptCallEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class VideoCallAcceptCommand implements Command
	{
		
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var responder:Responder;
		private var delegate:VideoCallAcceptDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new VideoCallAcceptDelegate( responder );			
			
			var VCAE:VideoCallAcceptCallEvent = cgEvent as VideoCallAcceptCallEvent;
			
			/*callBack = VCRE.resultHandlerFunction;*/
			delegate.AcceptVideoCallDetails(VCAE.videoChatID);
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
			cAlert.Show(event.message.body.toString(),"Error in Accepting Video Call ",event.fault.faultString,model.loggedInUserDTO.UserId);
			PopUpManager.centerPopUp(cAlert); */
			//Alert.show("Error in Accepting Video Call.");
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in VideoCallAcceptCommand", event.toString(), userId); 
			
			
		}
	
	}
}