package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.search.services.provider.dto.ProviderBasicInfoResult;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.GetClinicUserDetailsByIDDelegate;
	import com.zigron.gazuntite.event.login.GetClinicUserDetailsByIDEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	public class GetClinicUserDetailsByIDCommand implements Command
	{
		[Bindable]	private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var responder:Responder;
		private var delegate:GetClinicUserDetailsByIDDelegate;
		
		private var callBack			: Function;
		private var is4UserImage		: Boolean;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new GetClinicUserDetailsByIDDelegate( responder );			
			
			var LE:GetClinicUserDetailsByIDEvent = cgEvent as GetClinicUserDetailsByIDEvent;
			is4UserImage				= LE.is4UserImage;
			
			callBack = LE.resultHandlerFunction;
			delegate.GetProviderDetails(LE.userId,LE.branchId);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			if(!is4UserImage)
			{
				var xmlStr:String = event.result.toString();
				var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
				var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
				var resultObj:Object = decoder.decodeXML(xmlDoc);
				
				var psl:ProviderBasicInfoResult = new ProviderBasicInfoResult();
				psl.FromXML( event.result as XML );
				model.SearchProviderDetailsResults =psl;
				
				if(psl.StreetName != '')
				model.SearchProviderDetailsResults.Address =psl.StreetName +' , '+ psl.City +' , '+ psl.State;
			}
			else if(is4UserImage)//TA - only set image for User
			{
				var _xml:XML		= event.result as XML;
				model.userImageData = _xml.ImageData;
			}
			if( null != callBack )
				callBack();
		}
		
		private function onError(event:FaultEvent):void
		{
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserDTO.UserId)? -1:model.LoggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in GetClinicUserDetailsCommand", event.toString(), userId); 
		}
	}
}