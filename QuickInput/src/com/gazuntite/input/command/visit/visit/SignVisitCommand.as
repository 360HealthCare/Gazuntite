package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.visit.SignVisitDelegate;
	import com.gazuntite.input.event.visit.visit.SignVisitEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
 
	public class SignVisitCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		public var functionName 	: Function;
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : SignVisitDelegate = new SignVisitDelegate( this );
				
				var LE:SignVisitEvent = cgEvent as SignVisitEvent;
				this.functionName	   = LE.functionName;
				//var visitId:int = LE.visitId;
				
				var opetationDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
				
				if(model.VisitID>0)
				{
					
					delegate.SignVisit(model.VisitID , model.LoggedInUserId,model.LoggedInUserProviderTypeId , opetationDate, model.LoggedInUserSessionID);
				}
			}
		}
		
		
		public function result( rpcEvent : Object ) : void {
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				//var serviceResponse:re.result  = re.result as ServiceResponse ;
				if(re.result.@Status!=null)
				{
					if(re.result.@Status == "true")
					{
						if(this.functionName!=null)
						{
							this.functionName(QIConstants.VISIT_SIGNED);
						}
						
					}
					else
					{
						/*model.errorStatus = serviceResponse.ResponseMessage ;
						var valid:Boolean = QSUtilityFunctions.checkSession(serviceResponse.ResponseCode);
						if(valid)*/
							Alert.show("SignVisit"+"\n"+re.result.ResponseMessage,"Info",4, FlexGlobals.topLevelApplication.mainContainer);
					}
				}
				else
				{
					Alert.show("SignVisit"+"\n"+ "SERVICE_DIDNOT_RESPOND"+"",  "Info",4, FlexGlobals.topLevelApplication.mainContainer);
				}
			}
		}
		
		
		public function fault( rpcEvent : Object ) : void {
			
			var errorStatus:String = "Fault occured in SignVisitCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}