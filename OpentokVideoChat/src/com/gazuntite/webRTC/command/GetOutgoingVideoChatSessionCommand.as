package com.gazuntite.webRTC.command
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.delegate.GetOutgoingVideoChatSessionDelegate;
	import com.gazuntite.webRTC.events.GetOutgoingVideoChatSessionEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class GetOutgoingVideoChatSessionCommand
	{
		public function GetOutgoingVideoChatSessionCommand()
		{
		}
		
		[Bindable]
		private var model : WebRTCModel = WebRTCModel.getInstance();
		
		private var responder:Responder;
		private var delegate:GetOutgoingVideoChatSessionDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new GetOutgoingVideoChatSessionDelegate( responder );			
			
			var LE:GetOutgoingVideoChatSessionEvent  = cgEvent as GetOutgoingVideoChatSessionEvent;
			
			callBack = LE.resultHandlerFunction;
			delegate.GetOutgoingVideoSession(LE.userId,LE.branchId);
			
			var d:Date = new Date();
			trace( "time call sent " + d.minutes, d.seconds )
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
			
			event.stopImmediatePropagation();
			
			if( null != callBack )
				callBack();
			
			
		}
		
		private function onError(event:FaultEvent):void
		{
			/*var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error in Getting Details of Outgoing Video Chat ",event.fault.faultString,model.loggedInUserDTO.UserId);
			PopUpManager.centerPopUp(cAlert); */
			//Alert.show("Error in Getting Details of Outgoing Vide Chat in Communication.");
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId)? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in GetOutgoingVideoChatSessionCommand", event.toString(), userId); 
			
		}
		
	}
}