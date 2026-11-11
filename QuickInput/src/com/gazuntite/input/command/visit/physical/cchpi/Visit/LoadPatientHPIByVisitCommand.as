package com.gazuntite.input.command.visit.physical.cchpi.Visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.physical.cchpi.Visit.LoadPatientHPIByVisitDelegate;
	import com.gazuntite.input.delegate.visit.physical.cchpi.staticdata.LoadAllHPIDetailTypesDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	
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