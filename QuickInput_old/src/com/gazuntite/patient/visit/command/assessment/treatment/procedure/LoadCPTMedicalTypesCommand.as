package com.gazuntite.patient.visit.command.assessment.treatment.procedure
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.treatment.procedure.LoadCPTMedicalTypesDelegate;
	import com.gazuntite.patient.visit.dto.CPTMedicalTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.treatment.procedure.LoadCPTMedicalTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadCPTMedicalTypesCommand  implements Command
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		
		private var responder:Responder;
		private var delegate:LoadCPTMedicalTypesDelegate;		
		private var callBack			: Function;
		private var reqFrom:int;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadCPTMedicalTypesDelegate( responder );			
			
			var LE:LoadCPTMedicalTypesEvent = cgEvent as LoadCPTMedicalTypesEvent;
			
			if(LE.func != null)
				callBack = LE.func;
			
			if( LE.cptName != "" )
			{	
				/*reqFrom = LE.reqFrom;*/
				delegate.CPTMediacalTypeList( LE.cptName, model.LoggedInUserSessionID );
			}			
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			trace( "onSuccess start "  )		
			
			model.CptMedicalTypeDTOList =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xCPTMedicalTypes:XMLList = ResultXml.ResponseData.CPTMedicalTypeDTO;
			var i:int = 0;					
			for( i = 0; i < xCPTMedicalTypes.length(); i++ )
			{
				var ct:CPTMedicalTypeDTO = new CPTMedicalTypeDTO();
				ct.FromXML( xCPTMedicalTypes[i] );
				model.CptMedicalTypeDTOList.addItem( ct );
			}		
			/*if(reqFrom == 1)
				model.CPTMedicalTypeList = Types;	
			else if(reqFrom == 2)
				model.CPTMedicalTypeListOther = Types;*/
			
				
			trace( "model updated "  )
			
			if( null != callBack )
				callBack(/*model.CptMedicalTypeDTOList, reqFrom*/);			
			
			//trace( " after callBack() "  )
			
			trace( "on result found record ",model.CptMedicalTypeDTOList.length );
		}
		
		private function onError(event:FaultEvent):void
		{			
			//Alert.show("Received In LoadCPTMedicalTypesCommand.\n" + event.toString(), QSConstants.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
			
			var errorStatus:String = "Fault occured in LoadCPTMedicalTypesCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
	}
}