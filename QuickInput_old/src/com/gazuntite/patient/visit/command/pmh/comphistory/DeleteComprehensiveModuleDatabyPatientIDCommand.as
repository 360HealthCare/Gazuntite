package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.DeleteComprehensiveModuleDatabyPatientIDDelegate;
	import com.gazuntite.patient.visit.event.pmh.comphistory.DeleteComprehensiveModuleDatabyPatientIDEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class DeleteComprehensiveModuleDatabyPatientIDCommand implements Command, IResponder 
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var delegate:DeleteComprehensiveModuleDatabyPatientIDDelegate
		private var callBack:Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			delegate  = new DeleteComprehensiveModuleDatabyPatientIDDelegate( this );			
			
			var LE:DeleteComprehensiveModuleDatabyPatientIDEvent  = cgEvent as DeleteComprehensiveModuleDatabyPatientIDEvent;
			
			callBack = LE.callBack;
			
			delegate.DeleteComprehensiveModuleData(LE.patientId, LE.CH_Section, LE.typeID, LE.branchId);
		}
		
		public function result(event:Object):void
		{
			var xmlStr:String = event.result.toString();
			trace(xmlStr);
			if( null != callBack )
			{
				callBack();
			}
		}
		
		public function fault(event:Object):void
		{
			/*var  cAlert:QSExceptionAlert = PopUpManager.createPopUp(FlexGlobals.topLevelApplication.mainContainer,QSExceptionAlert, true) as QSExceptionAlert;
			cAlert.Show(event.message.body.toString(),"Error Save Medical History Command ",event.fault.faultString,model.loggedInUserDTO.UserId);
			PopUpManager.centerPopUp(cAlert); */
			
			//var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserDTO )? -1:model.loggedInUserDTO.UserId;
			//QSCombinedExceptionAlert.getInstance().Show( strErrotStatus, event.toString(), userId);
			var strErrotStatus:String = "Error in DeleteComprehensiveModuleDatabyPatientIDCommand" ;
			Alert.show(strErrotStatus, 'DeleteComprehensiveModuleDatabyPatientIDCommand');
			
		}
	}
}