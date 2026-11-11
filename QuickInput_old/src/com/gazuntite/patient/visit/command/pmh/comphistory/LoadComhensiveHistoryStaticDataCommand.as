package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.LoadComhensiveHistoryStaticDataDelegate;
	import com.gazuntite.patient.visit.dto.ch.FamilyHistoryTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.MedicalHistoryTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryAddictionTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryMediumTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryUsageAmountTypeDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadComhensiveHistoryStaticDataCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadComhensiveHistoryStaticDataDelegate = new  LoadComhensiveHistoryStaticDataDelegate(this);
				delegate.LoadComhensiveHistoryStaticData(model.LoggedInUserSessionID);
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
						var xml:XML = re.result as XML;
						if(xml!=null)
						{
							var xMedicalHistoryTypeDTOList:XMLList 			= xml.MedicalHistory.MedicalHistoryTypeDTO; 
							model.GeneralHistoryTypeDTOList					= new ArrayCollection();
							var i:int = 0;
							for( i = 0; i < xMedicalHistoryTypeDTOList.length(); i++ )
							{
								var dto:MedicalHistoryTypeDTO = new MedicalHistoryTypeDTO();
								dto.FromXML( xMedicalHistoryTypeDTOList[i] );
								model.GeneralHistoryTypeDTOList.addItem( dto );
							}
							
							var xFamilyHistoryTypeDTOList:XMLList 			= xml.FamilyHistory.FamilyHistoryTypeDTO ; 
							model.FamilyHistoryTypeDTOList					= new ArrayCollection();
							for( i = 0; i < xFamilyHistoryTypeDTOList.length(); i++ )
							{
								var fdto:FamilyHistoryTypeDTO = new FamilyHistoryTypeDTO();
								fdto.FromXML( xFamilyHistoryTypeDTOList[i] );
								model.FamilyHistoryTypeDTOList.addItem( fdto );
							}
							
							var xSocialHistoryAddictionTypeDTOList:XMLList 	= xml.SocialHistoryAddiction.SocialHistoryAddictionTypeDTO ;
							model.SocialHistoryAddictionTypeDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryAddictionTypeDTOList.length(); i++ )
							{
								var sdto:SocialHistoryAddictionTypeDTO = new SocialHistoryAddictionTypeDTO();
								sdto.FromXML( xSocialHistoryAddictionTypeDTOList[i] );
								model.SocialHistoryAddictionTypeDTOList.addItem( sdto );
							}
							
							var xSocialHistoryUsageAmountTypeDTOList:XMLList 	= xml.SocialHistoryUsage.SocialHistoryUsageAmountTypeDTO ;
							model.usageAmountTypeDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryUsageAmountTypeDTOList.length(); i++ )
							{
								var udto:SocialHistoryUsageAmountTypeDTO = new SocialHistoryUsageAmountTypeDTO();
								udto.FromXML( xSocialHistoryUsageAmountTypeDTOList[i] );
								model.usageAmountTypeDTOList.addItem( udto );
							}
							
							var xSocialHistoryMeduimTypeDTOList:XMLList 	= xml.SocialHistoryMedium.SocialHistoryMediumTypeDTO;
							model.historyMediumTypesDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryMeduimTypeDTOList.length(); i++ )
							{
								var mdto:SocialHistoryMediumTypeDTO = new SocialHistoryMediumTypeDTO();
								mdto.FromXML( xSocialHistoryMeduimTypeDTOList[i] );
								model.historyMediumTypesDTOList.addItem( mdto );
							}
							
							
						}
						else
						{
							UtilityFunctions.ShowMessage("LoadComhensiveHistoryStaticData \n No data returned from service.","Info");
						}
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadComhensiveHistoryStaticData \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadComhensiveHistoryStaticDataCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}