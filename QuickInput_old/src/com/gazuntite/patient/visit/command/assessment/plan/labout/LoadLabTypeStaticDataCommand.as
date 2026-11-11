package com.gazuntite.patient.visit.command.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.labout.LoadLabTypeStaticDataDelegate;
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.labout.LoadLabTypeStaticDataEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadLabTypeStaticDataCommand implements Command
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadLabTypeStaticDataDelegate;		
		
		
		/*	private var reqFrom:String;*/
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadLabTypeStaticDataDelegate( responder );			
			
			var LE:LoadLabTypeStaticDataEvent = cgEvent as LoadLabTypeStaticDataEvent;
			
			delegate.labOutLabTypelist( model.LoggedInUserSessionID );
			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			var Types:ArrayCollection  =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			
			var LabTestTypesList:XMLList = ResultXml.ResponseData.Laboratory;
			
								
			for(var i:int = 0 ; i < LabTestTypesList.length(); i++ )
			{
				var ct:GeneralTypeDTO = new GeneralTypeDTO();
				ct.FromXML( LabTestTypesList[i] );
				Types.addItem( ct );
			}
			
			model.labTypeDTOList = Types;
			
			
			trace( "model updated "  )
			
			trace( "on result found record ",Types.length );
		}
		
		
		
		private function onError(event:FaultEvent):void
		{			
			var errorStatus:String = "Fault occured in LoadLabTestStaticCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
		
		public function LoadLabTypeStaticDataCommand()
		{
		}
	}
}