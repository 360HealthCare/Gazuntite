
package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.delegate.GetIncomingVideoChatSessionDelegate;
	import com.gazuntite.webRTC.events.GetIncomingVideoChatSessionEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	
	import flash.xml.XMLDocument;
	
	import mx.controls.Alert;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	public class GetIncomingVideoChatSessionCommand implements Command
	{
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var responder:Responder;
		private var delegate:GetIncomingVideoChatSessionDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new GetIncomingVideoChatSessionDelegate( responder );			
			
			var GIVCSE:GetIncomingVideoChatSessionEvent = cgEvent as GetIncomingVideoChatSessionEvent;
			
			callBack = GIVCSE.resultHandlerFunction;
			delegate.GetVideoCallDetails(GIVCSE.userId,GIVCSE.branchId);
			
			var d:Date = new Date();
			//trace( "time call sent " + d.minutes, d.seconds )
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			/* Convert XMLNode to XMLDocument. */
			var xmlStr:String = event.result.toString();
			var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			
			model.videoCallInfo = event.result.@response;
			var isProvider:String = event.result.@isProvider;
			
			if(isProvider != '')
				model.isCallfromProvider =  UtilityFunctions.StringToBoolean(isProvider);
			
			event.stopImmediatePropagation();
			
			if( null != callBack )
				callBack();
			
			
		}
		
		private function onError(event:FaultEvent):void
		{
			event.stopImmediatePropagation();
			model.videoCallInfo=null;
			if( null != callBack )
				callBack();
			//Alert.show("Error in Getting Details of Incoming Vide Chat in Communication.");
			
		}
	}
}