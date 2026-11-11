package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.LogoutDelegate;
	import com.zigron.gazuntite.event.login.LogoutEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LogoutCommand implements Command, IResponder
	{
		private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var CallbackFunction:Function;
		
		private var delegate : LogoutDelegate;
		public function LogoutCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			delegate = new LogoutDelegate( this );
			
			var event:LogoutEvent = cgEvent as LogoutEvent;
			
			if(model.IsProviderLoggedIn){
				
				this.CallbackFunction = event.Callback;
				delegate.sendLogoutRequest( model.LoggedInUserSessionDTO.SessionID );
				
			}
		}
		
		public function result(data:Object):void
		{
			if ( null != CallbackFunction)
				CallbackFunction();
			model.isUserLoginSuccessfully = false;
			
		}
		
		
		public function fault(rpcEvent:Object):void
		{
			model.errorStatus = "Fault occured in LogOutCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInProvider )? -1:model.LoggedInProvider.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); 
		}
	}
}