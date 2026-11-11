package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.visit.LoadPatientVisitDelegate;
	import com.gazuntite.common.event.visit.LoadPatientVisitsEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPatientVisitCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:LoadPatientVisitDelegate;
		private var LE:LoadPatientVisitsEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new LoadPatientVisitDelegate( responder );			
			
			var LE:LoadPatientVisitsEvent = cgEvent as LoadPatientVisitsEvent;
			
			callBack = LE.resultHandlerFunction;
			
			var d:Date = new Date();

			delegate.GetPatientVisits(LE.userId, LE.clinicBranchId);
		}
		
		public function result(rpcEvent:ResultEvent):void 
		{										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in LoadPatientVisitCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}