package com.zigron.gazuntite.command.registration
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.zigron.gazuntite.delegate.registration.CreateClinicUserProfileDelegate;
	import com.zigron.gazuntite.event.registration.CreateClinicUserProfileEvent;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class CreateClinicUserProfileCommand implements Command
	{
		private var responder:Responder;
		private var delegate:CreateClinicUserProfileDelegate;
		
		private var callBack			: Function;
		private var userId			: int;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new CreateClinicUserProfileDelegate( responder );			
			
			var LE:CreateClinicUserProfileEvent = cgEvent as CreateClinicUserProfileEvent;
			
			callBack = LE.callBack;
			userId = LE.userId;
			delegate.GetDoctorID(LE.userId,LE.userTypeId,LE.clinicBranchId,LE.specailityTypeID,LE.NPI);
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			callBack(event.result as XML);
		}
		
		private function onError(event:FaultEvent):void
		{			
			QSCombinedExceptionAlert.getInstance().Show( "Error in CreateClinicUserProfileCommand", event.toString(), userId); 
		}
	}
}