package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.visit.VerifyUserDelegate;
	import com.gazuntite.input.event.visit.visit.CoSignVisitEvent;
	import com.gazuntite.input.event.visit.visit.SignVisitEvent;
	import com.gazuntite.input.event.visit.visit.VerifyUserEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class VerifyUserCommand implements Command, IResponder
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		public var visitId 	: int;
		
		public var functionName 	: Function;
		
		public var originName		:String; // calling function name
		public var actionName		:String; // Sign/Cosign
		
		public function VerifyUserCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : VerifyUserDelegate = new VerifyUserDelegate( this );
				
				var LE:VerifyUserEvent = cgEvent as VerifyUserEvent;
				this.functionName	   = LE.functionName;
				this.visitId = LE.visitId;
				var password:String = LE.password;
				
				this.originName = LE.originName;
				this.actionName = LE.actionName;
				
				if( password!=null && password.length>0 && this.visitId>0){
					delegate.VerifyUser(model.LoggedInUserId,password,model.LoggedInUserSessionID);
				}
			}
		}
		
		
		public function result( rpcEvent : Object ) : void {
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				//var resp:ServiceResponse  = re.result as ServiceResponse;
				
				if(re.result.@Status!=null)
				{
					if(re.result.@Status == "true")
					{
						/*var mqiEvent:ManageQuickInputEvent = new ManageQuickInputEvent( false);
						CairngormEventDispatcher.getInstance().dispatchEvent( mqiEvent );*/
						
						
						if(this.originName != null && this.originName == QIConstants.QUICK_INPUT_MODULE_NAME)
						{
							if(this.actionName != null && this.actionName == QIConstants.VISIT_SIGNED)
							{
								var svEvent : SignVisitEvent = new SignVisitEvent(this.visitId,this.functionName);
								CairngormEventDispatcher.getInstance().dispatchEvent( svEvent );
							}
							else if(this.actionName != null && this.actionName == QIConstants.VISIT_CO_SIGNED)
							{
								var csvEvent : CoSignVisitEvent = new CoSignVisitEvent(this.visitId,this.functionName);
								CairngormEventDispatcher.getInstance().dispatchEvent( csvEvent );
							}
						}
						else
						{
							/*if(model.canSign)
							{
								var svEvent : SignVisitEvent = new SignVisitEvent(this.visitId,this.functionName);
								CairngormEventDispatcher.getInstance().dispatchEvent( svEvent );
							}
							else if(model.canCoSign)
							{
								var csvEvent : CoSignVisitEvent = new CoSignVisitEvent(this.visitId,this.functionName);
								CairngormEventDispatcher.getInstance().dispatchEvent( csvEvent );
							}*/
						}
					}
					else
					{
						//model.errorStatus = resp.ResponseMessage ;
						//Alert.show("VerifyUser"+"\n"+resp.ResponseMessage, Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
						if(this.functionName!=null)
						{
							this.functionName(QIConstants.INVALID_CREDENTIALS);
						}
					}
				}
				else
				{
					Alert.show("VerifyUser"+"\n"+"Service didnot respond.",  "info",4, FlexGlobals.topLevelApplication.mainContainer);
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void {
			//if(model.isUserManagerServiceOnline){
			 var errorStatus:String = "Fault occured in VerifyUserCommand.";
			
			 var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			 QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}