package com.gazuntite.patient.visit.command.physical.cchpi.Visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.cchpi.Visit.LoadPatientHPIByVisitDelegate;
	import com.gazuntite.patient.visit.delegate.physical.cchpi.staticdata.LoadAllHPIDetailTypesDelegate;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	
	import mx.rpc.IResponder;

	public class LoadPatientHPIByVisitCommand implements com.adobe.cairngorm.commands.Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		public function LoadPatientHPIByVisitCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadPatientHPIByVisitDelegate = new LoadPatientHPIByVisitDelegate(this);
				delegate.LoadPatientHPIByVisit(model.VisitID, false ,model.LoggedInUserSessionID);
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			
		}
		
		public function fault( rpcEvent : Object ) : void
		{
			
		}
	}
}