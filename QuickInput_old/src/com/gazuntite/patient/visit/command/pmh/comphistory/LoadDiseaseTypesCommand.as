package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.LoadDiseaseTypesDelegate;
	import com.gazuntite.patient.visit.dto.DiseaseTypeDTO;
	import com.gazuntite.patient.visit.event.pmh.comphistory.LoadDiseaseTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadDiseaseTypesCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadDiseaseTypesEvent;
		
		public function LoadDiseaseTypesCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE = event as LoadDiseaseTypesEvent;
				var delegate:LoadDiseaseTypesDelegate= new  LoadDiseaseTypesDelegate(this);
				delegate.LoadDisease(model.LoggedInUserSelectedBranchId, LE.typeId ,model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				if(re.result!=null)
				{
					trace(re.result.toXMLString());
					
					if(re.result.@Status=="true")
					{
						var xml:XML = re.result.ResponseData[0] as XML;
						if(xml!=null)
						{

							switch(LE.typeId)
							{
								case LoadDiseaseTypesEvent.HEART_DISEASE:
								{
									model.heartDiseaseDiseaseTypesDTOList = ParseXMl(xml.DiseaseTypeDTO);
									break;
								}
								case LoadDiseaseTypesEvent.HYPERTENSTION:
								{
									model.hypertensionDiseaseTypesDTOList = ParseXMl(xml.DiseaseTypeDTO);
									break;
								}
								case LoadDiseaseTypesEvent.DIABTESASE:
								{
									model.diabetesDiseaseTypesDTOList = ParseXMl(xml.DiseaseTypeDTO);
									break;
								}
								case LoadDiseaseTypesEvent.CANCER:
								{
									model.cancerDiseaseTypesDTOList = ParseXMl(xml.DiseaseTypeDTO);
									break;
								}
								case LoadDiseaseTypesEvent.OTHER:
								{
									model.otherDiseaseTypesDTOList = ParseXMl(xml.DiseaseTypeDTO);
									break;
								}

							}
								
						}
						else
						{
							UtilityFunctions.ShowMessage("LoadDiseaseTypeStaticData \n No data returned from service.","Info");
						}
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadDiseaseTypeStaticData \n Service didnot respond.", "Info");
				}
			}
		}
		
		private function ParseXMl(xlist:XMLList):ArrayCollection
		{
			var DTOlist:ArrayCollection = new ArrayCollection();
			
			
			for each( var x:XML in xlist )
			{
				var t:DiseaseTypeDTO = new DiseaseTypeDTO();
				t.FromXML( x );
				DTOlist.addItem( t );
			}
			
			return DTOlist;
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadDiseaseTypeStaticData.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}