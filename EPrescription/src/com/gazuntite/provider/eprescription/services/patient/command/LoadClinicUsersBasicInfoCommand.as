package com.gazuntite.provider.eprescription.services.patient.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.delegate.LoadClinicUsersBasicInfoDelegate;
	import com.gazuntite.provider.eprescription.services.patient.dto.ProviderBasicInfoResult;
	import com.gazuntite.provider.eprescription.services.patient.event.LoadClinicUsersBasicInfoEvent;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadClinicUsersBasicInfoCommand implements Command
	{
		private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadClinicUsersBasicInfoDelegate;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadClinicUsersBasicInfoDelegate( responder );			
			
			var LE:LoadClinicUsersBasicInfoEvent = cgEvent as LoadClinicUsersBasicInfoEvent;
			
			callBack = LE.resultHandlerFunction;
			
			delegate.loadClinicUsersBasicInfo(LE.userId,LE.branchId);				
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var psl:ProviderBasicInfoResult = new ProviderBasicInfoResult();
			psl.FromXML( event.result as XML );
			model.SearchProviderDetailsResults =psl;
			
			var workingdays:XML = new XML(event.result);
			model.workingdays.removeAll();
			
			for(var i:int = 0; i < workingdays.WorkingDays.DoctorWorkDaysDTO.length(); i++)
			{
				var obj:Object = new Object();
				
				obj.dayName		 	= workingdays.WorkingDays.DoctorWorkDaysDTO.WorkDays[i];
				obj.startTime 		= workingdays.WorkingDays.DoctorWorkDaysDTO.WorkStart[i];
				obj.endTime 		= workingdays.WorkingDays.DoctorWorkDaysDTO.WorkEnd[i];
				obj.isSelected 		= workingdays.WorkingDays.DoctorWorkDaysDTO.isSelected[i] == "true" ? true: false;
				model.workingdays.addItem(obj);
			}
			
			event.stopImmediatePropagation();
			
			if( null != callBack )
				callBack();
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Error in GetUserDetailsCommand.\n"+event.toString(),'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}