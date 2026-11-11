package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.delegate.VideoCallRejectDelegate;
	import com.gazuntite.webRTC.events.VideoCallRejectEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class VideoCallRejectCommand  implements Command
	{
		
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var responder:Responder;
		private var delegate:VideoCallRejectDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new VideoCallRejectDelegate( responder );			
			
			var VCRE:VideoCallRejectEvent = cgEvent as VideoCallRejectEvent;
			
			callBack = VCRE.resultHandlerFunction;
			delegate.RejectVideoCallDetails(VCRE.userId,VCRE.branchId,VCRE.videoChatID);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			/* Convert XMLNode to XMLDocument. */
			var xmlStr:String = event.result.toString();
			var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			/* Assign the values... */
			
			/*var psl:ProviderBasicInfoResult = new ProviderBasicInfoResult();
			psl.FromXML( event.result as XML );
			model.SearchProviderDetailsResults =psl;*/
			model.videoCallInfo = event.result.toString();
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