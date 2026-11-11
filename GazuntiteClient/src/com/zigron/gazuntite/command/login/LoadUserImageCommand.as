package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ImageDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.LoadUserImageDelegate;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadUserImageCommand implements Command, IResponder
	{
		[Bindable]
		private var model : ApplicationModel = ApplicationModel.getInstance();
		
		public function LoadUserImageCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
			if(model.LoggedInUserDTO.UserId)
			{
				var delegate : LoadUserImageDelegate = new LoadUserImageDelegate( this );
				
				delegate.LoadLoggedInUserImage(model.LoggedInUserDTO.UserId,model.userSelectedRoleDTO.UserTypeRole.UserTypeId);
			}
		}
		
		
		public function result( rpcEvent : Object ) : void {
			if(model.LoggedInUserDTO.UserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result)
				model.userImageData = re.result.@ImageData;
				
				/*var imageDTO:ImageDTO = re.result as ImageDTO;
				
				
				if(imageDTO!=null)
				{
					if(model!=null && model.LoggedInUserDTO!=null)
						model.LoggedInUserDTO.Image = imageDTO;
				}
				else
				{
					
				}*/
			}
			
		}
		
		
		public function fault( rpcEvent : Object ) : void {
			model.errorStatus = "Fault occured in LoadLoggedInUserImageCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserDTO )? -1:model.LoggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}