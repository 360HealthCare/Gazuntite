package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.LoginDelegate;
	import com.zigron.gazuntite.event.login.LoginEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	import com.zigron.gazuntite.model.valueObjects.login.LoginDTO;
	import com.zigron.gazuntite.model.valueObjects.login.SessionDTO;
	import com.zigron.gazuntite.model.valueObjects.login.StationDTO;
	import com.zigron.gazuntite.model.valueObjects.login.UserClinicBranchDTO;
	import com.zigron.gazuntite.model.valueObjects.login.UserTypeDTO;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoginCommand implements Command, IResponder
	{
		private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var delegate : LoginDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			var event:LoginEvent = cgEvent as LoginEvent;
			delegate = new LoginDelegate( this );
			
			if(event.request.userID !=null && event.request.userID.length>0 && event.request.password!=null && event.request.password.length>0)
			{
				this.callBack = event.callback;
				delegate.sendLoginRequest( event.request );
			}
		}
		
		public function result(data:Object):void
		{
			var xml:XML = (data as ResultEvent).result as XML;
			trace(xml.toXMLString());
			
			var resultDTO:LoginDTO = new LoginDTO();
			
			resultDTO.FromXml(xml.ResponseData[0]);
			
			model.LoggedInUserDTO = resultDTO;
			// TA - on request of wasim & mansoor
			if(model.LoggedInUserDTO.AllUserTypes.length)
			{
				var userTypeDTO:UserTypeDTO = model.LoggedInUserDTO.AllUserTypes.getItemAt(0)as UserTypeDTO;
				
				if(!userTypeDTO.IsProvider)
				{
					if(null != callBack)
						callBack(false);
					
					return;
				}
			}
			
			if(model.LoggedInUserDTO.UserClinicBranchesList.length)
			{
				model.userSelectedClinicBranchDTO		= model.LoggedInUserDTO.UserClinicBranchesList.getItemAt(0) as UserClinicBranchDTO;
				model.userSelectedRoleDTO				= model.userSelectedClinicBranchDTO.ClinicBranchUserRole;
				
				for(var index:int =0 ; index < model.userSelectedClinicBranchDTO.StationList.length ; index++)
				{
					var dto:StationDTO = model.userSelectedClinicBranchDTO.StationList.getItemAt(index) as StationDTO;
					if(dto.IsDefault)
					{
						model.userSelectedStationDTO    = dto;
						break;
					}
				}
			}
			
			model.LoggedInUserSessionDTO = new SessionDTO();
			
			if(null != xml.SessionDTO[0])
				model.LoggedInUserSessionDTO.FromXML(xml.SessionDTO[0]);
			
			if(model.LoggedInUserDTO.isValidUser)
				model.isUserLoginSuccessfully = true;
			else
				model.isUserLoginSuccessfully = false;
			
			if(null != callBack)
				callBack(model.LoggedInUserDTO.isValidUser);
		}
		
		private function populateProviderName():void
		{
			model.providerName = '';
			if(model.LoggedInUserDTO.FirstName.toLowerCase() != 'null' )
				model.providerName = model.LoggedInUserDTO.FirstName;
			
			if(model.LoggedInUserDTO.MiddleName)
			{
				if(model.LoggedInUserDTO.MiddleName.toLowerCase() != 'null' )
					model.providerName = model.providerName+' '+ model.LoggedInUserDTO.MiddleName;
			}
			
			if(model.LoggedInUserDTO.LastName.toLowerCase() != 'null' )
				model.providerName = model.providerName +' '+ model.LoggedInUserDTO.LastName;
		}
		
		public function fault(rpcEvent:Object):void
		{
			model.errorStatus = "Fault occured in LoginCommand.";
			model.isUserLoginSuccessfully = false;
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInProvider )? -1:model.LoggedInProvider.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); 
		}
	}
}