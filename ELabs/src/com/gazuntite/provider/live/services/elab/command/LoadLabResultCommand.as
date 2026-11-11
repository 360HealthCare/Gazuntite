package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.provider.live.services.elab.delegate.LoadLabResultDelegate;
	import com.gazuntite.provider.live.services.elab.dto.ELabFilterCriteriaDTO;
	import com.gazuntite.provider.live.services.elab.dto.LabListDTO;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadLabResultCommand implements Command, IResponder
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		public function LoadLabResultCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			var filterCriteria:ELabFilterCriteriaDTO = model.ResultFilterCriteria;
			
			if (!filterCriteria)
				return;
			
			filterCriteria.ClinicBranchID = model.LoggedInUserSelectedBranchId;
			filterCriteria.ProviderID = model.LoggedInUserProviderId;
			filterCriteria.ProviderTypeID = model.LoggedInUserProviderTypeId;
			
			var xmlToSend:XML = filterCriteria.ToXML();
			
			var delegate:LoadLabResultDelegate = new LoadLabResultDelegate(this);
			delegate.LoadLabResult(xmlToSend);
		}
		
		public function result(resultObj:Object):void
		{
			var resultEv:ResultEvent = resultObj as ResultEvent;
			
			if (!resultEv)
				return;
			
			var result:XML = resultEv.result as XML;
			var xStatus:XML = result.Status[0];
			var type:String = xStatus.@[XmlConstants.TYPE];
			
			if (type.toLowerCase() == "success")
			{
				model.ResultFirstRecord = result.@["FirstRecord"];
				model.ResultLastRecord = result.@["LastRecord"];
				model.ResultTotalRecords = result.@["TotalRecords"];
				
				var lol:LabListDTO = new LabListDTO();
				lol.FromXML(result);
				
				model.LabResultListDto = lol;
			}
			else
			{
				Alert.show("LoadLabResultCommand\nServer Responded with status type " + type + "\n server status message is " + 
							xStatus.@[XmlConstants.MESSAGE], "Response status " + type );
			}
		}
		
		public function fault(faultObj:Object):void
		{
			var errorStatus:String = "Fault occured in LoadLabResultCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, faultObj.toString(), model.LoggedInUserId); 
		}
	}
}