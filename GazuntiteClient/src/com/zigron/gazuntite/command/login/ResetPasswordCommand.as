package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.ResetPasswordDelegate;
	import com.zigron.gazuntite.event.login.ResetPasswordEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class ResetPasswordCommand implements Command
	{
		private var model   : ApplicationModel = ApplicationModel.getInstance();
		private var callBack    :  Function ;
		private var userName: String;
		
		private var responder:Responder;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);
			var delegate :ResetPasswordDelegate  = new ResetPasswordDelegate (responder);
			var LE:ResetPasswordEvent = cgEvent as ResetPasswordEvent ;
			
			if(LE.email.length > 0)
			{
				this.callBack = LE.callBack;
				this.userName =LE.email
				model.resetPasswordResult = 'false';
				model.resetPasswordErrorMessageResult = '';
				delegate.ResetPassword(LE.email);
			}
			
		}
		private function  onSuccess(event:ResultEvent): void 
		{
			var xml:XML = event.result as XML ;	
			
			if(xml.ResponseData[0] != null)
			{
				model.resetPasswordResult =  xml.ResponseData[0].isUpdated;
				model.resetPasswordIsLockedResult=xml.ResponseData[0].isLocked;
				model.resetPasswordIsActiveResult=xml.ResponseData[0].isActive;
				model.resetPasswordIsValidResult=xml.ResponseData[0].isValid;
			}else
			{
				model.resetPasswordErrorMessageResult = xml.@Message;
			}
			
			if(this.callBack != null)
			{
				this.callBack() ;
			}
		}
		
		private function  onError(event:FaultEvent): void 
		{
			model.errorStatus = "Received In ResetPasswordCommand";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserDTO )? -1:model.LoggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, event.toString(), userId); 
			
		}
	}
}