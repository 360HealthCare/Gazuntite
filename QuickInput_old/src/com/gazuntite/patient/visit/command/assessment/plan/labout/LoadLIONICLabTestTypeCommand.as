package com.gazuntite.patient.visit.command.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.labout.LoadLIONICLabTestTypeDelegate;
	import com.gazuntite.patient.visit.dto.LabOutLIONICLabTestDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.labout.LoadLIONICLabTestTypeEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadLIONICLabTestTypeCommand  implements Command 
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var responder:Responder;
		
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				responder = new Responder(onSuccess, onError);
				var delegate:LoadLIONICLabTestTypeDelegate = new  LoadLIONICLabTestTypeDelegate(responder);
				
				
				
				var LE:LoadLIONICLabTestTypeEvent = cgEvent as LoadLIONICLabTestTypeEvent;
				trace("labtestTypeID: "+LE.labtestTypeID+ " labTestCodeOrName: "+LE.labTestCodeOrName );
				if(LE.labtestTypeID > 0 && LE.labTestCodeOrName!=null && LE.labTestCodeOrName.length>0)
				{
					delegate.LoadLIONICLabTestType(LE.labtestTypeID,LE.labTestCodeOrName,model.LoggedInUserSessionID);
				}
			}			 
			
		}
		
		private function onSuccess(event:Object):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			
			var LabTestTypesList:XMLList = ResultXml.ResponseData.Test;
			
			
			for(var i:int = 0 ; i < LabTestTypesList.length(); i++ )
			{
				var ct:LabOutLIONICLabTestDTO = new LabOutLIONICLabTestDTO();
				ct.FromXML( LabTestTypesList[i] );
				Types.addItem( ct );
			}
			
			model.lionicLabTestTypeDTOList = Types;
			
			
			trace( "model updated "  )
			
			trace( "on result found record ",Types.length );
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