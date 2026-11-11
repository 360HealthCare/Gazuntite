package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.provider.live.services.elab.delegate.LoadLabOrderDelegate;
	import com.gazuntite.provider.live.services.elab.dto.ELabFilterCriteriaDTO;
	import com.gazuntite.provider.live.services.elab.dto.LabListDTO;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadLabOrderCommand implements Command, IResponder
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		public function LoadLabOrderCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent) : void 
		{
			var filterCriteria:ELabFilterCriteriaDTO = model.OrderFilterCriteria;
			
			if (!filterCriteria)
				return;
			
			filterCriteria.ClinicBranchID = model.LoggedInUserSelectedBranchId;
			filterCriteria.ProviderID = model.LoggedInUserProviderId;
			filterCriteria.ProviderTypeID = model.LoggedInUserProviderTypeId;
			
			var xmlToSend:XML = filterCriteria.ToXML();
			
			var delegate:LoadLabOrderDelegate = new LoadLabOrderDelegate(this);
			delegate.LoadLabOrder(xmlToSend);
		}
		
		public function result(resultObj:Object):void
		{
			var resultEv:ResultEvent = resultObj as ResultEvent;
			
			if (!resultEv)
				return;
			
			var result:XML = resultObj.result as XML;
			var xStatus:XML = result.Status[0];
			var type:String = xStatus.@[XmlConstants.TYPE];
			
			if (type.toLowerCase() == "success")
			{
				model.PendingOrdersFirstRecord = result.@["FirstRecord"];
				model.PendingOrdersLastRecord = result.@["LastRecord"];
				model.PendingOrdersTotalRecords = result.@["TotalRecords"];
				
				var lol:LabListDTO = new LabListDTO();
				lol.FromXML(result);
				
				model.LabOrderListDto = lol;
			}
			else
			{
				Alert.show("LoadLabOrder\nServer Responded with status type " + type + "\n server status message is " + xStatus.@[XmlConstants.MESSAGE], "Response status " + type );
			}
		}
		
		public function fault(faultObj:Object):void
		{
			var errorStatus:String = "Fault occured in LoadLabOrder.";
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, faultObj.toString(), model.LoggedInUserId);
		}
	}
}