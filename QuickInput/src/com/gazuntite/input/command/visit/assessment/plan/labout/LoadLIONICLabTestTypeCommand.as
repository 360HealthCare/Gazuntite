package com.gazuntite.input.command.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.labOut.LabOutLIONICLabTestDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.labout.LoadLIONICLabTestTypeDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLIONICLabTestTypeEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.Responder;

	public class LoadLIONICLabTestTypeCommand  implements Command 
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var responder:Responder;
		private var callback:Function;
		private var searchTerm:String;
		private var searchType:int;
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				responder = new Responder(onSuccess, onError);
				
				var delegate:LoadLIONICLabTestTypeDelegate = new  LoadLIONICLabTestTypeDelegate(responder);
				
				var LE:LoadLIONICLabTestTypeEvent = cgEvent as LoadLIONICLabTestTypeEvent;
				
				searchTerm = LE.labTestCodeOrName;
				searchType = LE.searchType;
				callback = LE.callback;
				
				if (LE.labtestTypeID > 0 && LE.labTestCodeOrName != null && LE.labTestCodeOrName.length > 0)
				{
					delegate.LoadLIONICLabTestType(LE.labtestTypeID,LE.labTestCodeOrName,model.LoggedInUserSessionID);
				}
			}
		}
		
		private function onSuccess(event:Object):void
		{
			var Types:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			
			var LabTestTypesList:XMLList = ResultXml.ResponseData.Test;
			
			
			for (var i:int = 0; i < LabTestTypesList.length(); i++)
			{
				var ct:LabOutLIONICLabTestDTO = new LabOutLIONICLabTestDTO();
				ct.FromXML(LabTestTypesList[i]);
				Types.addItem(ct);
			}
			
			model.lionicLabTestTypeDTOList = Types;
			
			if (callback)
				callback(searchTerm, searchType);
		}
		
		private function onError(event:Object):void
		{			
			var errorStatus:String = "Fault occured in LoadLabTestStaticCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
		
		public function LoadLIONICLabTestTypeCommand()
		{
		}
	}
}