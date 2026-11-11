package com.gazuntite.provider.live.services.billing.superBill.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.superBill.delegate.LoadAllPendingBillsbyProviderIdDelegate;
	import com.gazuntite.provider.live.services.billing.superBill.dto.PendingBillsDTO;
	import com.gazuntite.provider.live.services.billing.superBill.event.LoadAllPendingBillsbyProviderIdEvent;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAllPendingBillsbyProviderIdCommand implements Command
	{
		private var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadAllPendingBillsbyProviderIdDelegate;		
		private var callBack			: Function;
		
		private var searchType		    : int;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadAllPendingBillsbyProviderIdDelegate( responder );			
			
			var LE:LoadAllPendingBillsbyProviderIdEvent = cgEvent as LoadAllPendingBillsbyProviderIdEvent;
			
			callBack = LE.callBack;
			searchType = LE.searchType;
			
			model.PendingBills = new ArrayCollection();
			model.VisitSuperBill = new PendingBillsDTO();
			model.procedureDTOList = new ArrayCollection();
			model.diagnosisDTOList = new ArrayCollection();
			
			delegate.SearchPendingBillsList(LE.clinicBranchId,LE.searchType,LE.searchString,LE.pageNumber );
			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )
			
			var result:XML = event.result as XML
			
			model.PendingBills = new ArrayCollection();
				
			var xPendingBills:XMLList = result.PendingBills.PendingBill;
			var i:int = 0;					
			for( i = 0; i < xPendingBills.length(); i++ )
			{
				if(xPendingBills[i][0])
				{
					var ct:PendingBillsDTO = new PendingBillsDTO();
					ct.FromXML( xPendingBills[i][0] );
					model.PendingBills.addItem( ct );
				}
			}
			
			if(searchType == 8 && model.PendingBills.length == 1)
			{
				model.VisitSuperBill =  model.PendingBills[0] as PendingBillsDTO;
				if(model.VisitSuperBill.ProcedureInfo)
				{
					model.procedureDTOList = model.VisitSuperBill.ProcedureInfo;
					model.diagnosisDTOList = model.VisitSuperBill.DiagnosisInfo;
				}
			}
			if( null != callBack )
				callBack();			
			
			
			trace( "on result found records : ", model.PendingBills.length );
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In LoadAllPendingBillsbyProviderIdCommand.\n" + event.toString(), SuperBillConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}