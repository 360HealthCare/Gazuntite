package com.zigron.gazuntite.command.session
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.webRTC.manager.OpenTokWebViewManager;
	import com.zigron.gazuntite.delegate.session.UpdateUserSessionStatusDelegate;
	import com.zigron.gazuntite.model.ApplicationModel;
	import com.zigron.gazuntite.model.valueObjects.provider.ProviderStatusDTO;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class UpdateUserSessionStatusCommand implements Command, IResponder
	{
		
		[Bindable]	private var model : ApplicationModel = ApplicationModel.getInstance();
		
		public function UpdateUserSessionStatusCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			
			var delegate : UpdateUserSessionStatusDelegate = new UpdateUserSessionStatusDelegate( this );
			
			
			delegate.UpdateUserSessionRestService(model.LoggedInUserSessionDTO);
			
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			//busy user doesn't take part in communication
			if(model.LoggedInUserSessionDTO.Status == ProviderStatusDTO.BUSY)
			{
				OpenTokWebViewManager.getInstance().isAvailable = false;  //user is not available for chat/communication
			}
			else if(OpenTokWebViewManager.getInstance().isAvailable == false){
				
				OpenTokWebViewManager.getInstance().isAvailable = true;		//user is available for chat/communication
			}
			
		}
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserDTO.UserId)? -1:model.LoggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in UpdateUserSessionCommand", rpcEvent.toString(), userId); 
			
		}
	}
}