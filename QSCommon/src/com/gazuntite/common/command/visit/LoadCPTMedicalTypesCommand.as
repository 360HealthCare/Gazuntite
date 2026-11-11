package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.visit.LoadCPTMedicalTypesDelegate;
	import com.gazuntite.common.dto.typeDTO.CPTMedicalTypeDTO;
	import com.gazuntite.common.event.visit.LoadCPTMedicalTypesEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadCPTMedicalTypesCommand  implements Command
	{
		//private var model:QIModelLocator = QIModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadCPTMedicalTypesDelegate;		
		private var callBack:Function;
		private var reqFrom:int;
		
		private var searchTerm:String;
		private var searchType:int;
		private var loggenInUserId:int;
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadCPTMedicalTypesDelegate(responder);			
			
			var LE:LoadCPTMedicalTypesEvent = cgEvent as LoadCPTMedicalTypesEvent;
			
			loggenInUserId = LE.loggenInUserId;
			
			if (LE.func != null)
				callBack = LE.func;
			
			searchTerm = LE.searchTerm;
			searchType = LE.searchType;
			
			if (LE.searchTerm != "")
			{
				delegate.CPTMediacalTypeList(LE.searchTerm, LE.sessionID);
			}			
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var CptMedicalTypeDTOList:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML;
			var xCPTMedicalTypes:XMLList = ResultXml.ResponseData.CPTMedicalTypeDTO;
			var i:int = 0;
			
			for (i = 0; i < xCPTMedicalTypes.length(); i++)
			{
				var cptCode:CPTMedicalTypeDTO = new CPTMedicalTypeDTO();
				
				cptCode.FromXML(xCPTMedicalTypes[i]);
				
				CptMedicalTypeDTOList.addItem(cptCode);
			}
			
			if (null != callBack)
				callBack(searchTerm, searchType,CptMedicalTypeDTOList);
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in LoadCPTMedicalTypesCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( loggenInUserId ) ? -1:loggenInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), userId); 
		}
	}
}