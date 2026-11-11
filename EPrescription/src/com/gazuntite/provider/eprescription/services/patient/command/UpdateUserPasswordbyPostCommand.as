package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.UpdateUserPasswordbyPostDelegate;
	import com.gazuntite.provider.eprescription.services.patient.event.UpdateUserPasswordbyPostEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectProxy;
	
	public class UpdateUserPasswordbyPostCommand  implements Command 
	{
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:UpdateUserPasswordbyPostDelegate;
		private var LE:UpdateUserPasswordbyPostEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new UpdateUserPasswordbyPostDelegate( responder );			
			
			var LE:UpdateUserPasswordbyPostEvent = cgEvent as UpdateUserPasswordbyPostEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();
			delegate.ChangePassword(LE.data);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{
			var re:ResultEvent = rpcEvent as ResultEvent;
			var result:ObjectProxy = re.result as ObjectProxy;
			
			if(result!=null)
			{
				model.securityProxyObject = result.UserPasswordChangedDTO;
			}
			
			if(model.securityProxyObject.isPasswordChanged && model.securityProxyObject.ValidationType =='Validated')
			{
				Alert.show('Password changed successfully', 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
			}
			else //if(model.securityProxyObject.ValidationType =='InValidAt8')
			{
				Alert.show(model.securityProxyObject.PasswordValidationError, 'Error', 4, FlexGlobals.topLevelApplication.mainContainer);
			}
			
			if( null != callBack )
			callBack(new XML(rpcEvent.message.body.toString()));
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in UpdateUserPasswordbyPostCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}