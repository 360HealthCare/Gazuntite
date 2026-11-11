package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.visit.GetVisitChargesDelegate;
	import com.gazuntite.input.event.visit.visit.GetVisitChargesEvent;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class GetVisitChargesCommand implements Command
	{
		private var reponder			: Responder ;
		private var delegate			:GetVisitChargesDelegate;
		private var LE					:GetVisitChargesEvent;
		private var callBackFunction	:Function;
		private var model:SuperBillModelLocator = SuperBillModelLocator.getInstance();
		public function execute(cgEvent:CairngormEvent):void
		{
			reponder = new Responder(onSuccess,onFault);
			delegate = new GetVisitChargesDelegate(reponder);
			LE		 = cgEvent as GetVisitChargesEvent;
			this.callBackFunction = LE.callBackFunction;
			delegate.GetCharges(LE.VisitId);
			
		}
		
		private function onSuccess(successEvent:ResultEvent):void
		{   
			var totalCharges:String = String(successEvent.result.text());
			if(UtilityFunctions.IsNotNullOrEmpty(totalCharges))
				model.PatientBalance = Number(totalCharges);
			
			if(this.callBackFunction!= null)
				this.callBackFunction();
		}
		
		private function onFault(faultEvent:FaultEvent):void
		{
			Alert.show("Receieved in GetVisitChargesCommand"+ faultEvent.toString());
		}
	}
}