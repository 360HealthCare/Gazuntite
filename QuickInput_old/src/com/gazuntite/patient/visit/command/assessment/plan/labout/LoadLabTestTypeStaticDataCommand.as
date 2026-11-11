package com.gazuntite.patient.visit.command.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.labout.LoadLabTestTypeStaticDelegate;
	import com.gazuntite.patient.visit.dto.LabOutTestTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.labout.LoadLabTestTypeStaticDataEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadLabTestTypeStaticDataCommand implements Command
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadLabTestTypeStaticDelegate;		

		
	/*	private var reqFrom:String;*/
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);
			
			delegate  = new LoadLabTestTypeStaticDelegate( responder );			
			
			var LE:LoadLabTestTypeStaticDataEvent = cgEvent as LoadLabTestTypeStaticDataEvent;
			
			delegate.laboutTypeList( model.LoggedInUserSessionID );
						
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
				
			var LabTestTypesList:XMLList = ResultXml.ResponseData.LabTest;
			
			var i:int = 0;					
			for( i = 0; i < LabTestTypesList.length(); i++ )
			{
				var ct:LabOutTestTypeDTO = new LabOutTestTypeDTO();
				ct.FromXML( LabTestTypesList[i] );
				Types.addItem( ct );
			}
			
			model.labTestTypeDTOList = Types;
				
			
			trace( "model updated "  )
			
			trace( "on result found record ",Types.length );
		}
		

		
		private function onError(event:FaultEvent):void
		{			
			var errorStatus:String = "Fault occured in LoadLabTestStaticCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
		
		
		public function LoadLabTestTypeStaticDataCommand()
		{
			
		}
	}
}