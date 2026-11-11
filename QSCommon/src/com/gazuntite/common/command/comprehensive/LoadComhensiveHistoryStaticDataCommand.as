package com.gazuntite.common.command.comprehensive
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.comprehensive.LoadComhensiveHistoryStaticDataDelegate;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryAddictionTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryMediumTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryUsageAmountTypeDTO;
	import com.gazuntite.common.event.comprehensive.LoadComhensiveHistoryStaticDataEvent;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadComhensiveHistoryStaticDataCommand implements Command, IResponder
	{
		private var responder:Responder;
		private var LE:LoadComhensiveHistoryStaticDataEvent;
		private var callBack:Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(result, fault);
		    LE = event as LoadComhensiveHistoryStaticDataEvent;	
			var delegate:LoadComhensiveHistoryStaticDataDelegate = new  LoadComhensiveHistoryStaticDataDelegate(responder);
			delegate.LoadComhensiveHistoryStaticData(LE.sessionID);
			
			callBack = LE.callBack;
			
		}
		
		public function result(rpcEvent:Object):void
		{
			//if(model.LoggedInUserId)
			//{
				var re:ResultEvent = rpcEvent as ResultEvent;
				if(re.result!=null)
				{
					var GeneralHistoryTypeDTOList:ArrayCollection = null;
					var FamilyHistoryTypeDTOList:ArrayCollection  = null;
					var SocialHistoryAddictionTypeDTOList:ArrayCollection  = null;
					var usageAmountTypeDTOList:ArrayCollection  = null;
					var historyMediumTypesDTOList:ArrayCollection  = null;
					
					var MainCollection:ArrayCollection = null;
					
					trace(re.result.toXMLString());
					
					if(re.result.@Status=="true")
					{
						var xml:XML = re.result as XML;
						if(xml!=null)
						{
							MainCollection = new ArrayCollection();
							var xMedicalHistoryTypeDTOList:XMLList 			= xml.MedicalHistory.MedicalHistoryTypeDTO; 
							GeneralHistoryTypeDTOList					= new ArrayCollection();
							var i:int = 0;
							for( i = 0; i < xMedicalHistoryTypeDTOList.length(); i++ )
							{
								var dto:MedicalHistoryTypeDTO = new MedicalHistoryTypeDTO();
								dto.FromXML( xMedicalHistoryTypeDTOList[i] );
								GeneralHistoryTypeDTOList.addItem( dto );
							}
							
							MainCollection.addItem(GeneralHistoryTypeDTOList);
							
							var xFamilyHistoryTypeDTOList:XMLList 			= xml.FamilyHistory.FamilyHistoryTypeDTO ; 
							FamilyHistoryTypeDTOList					= new ArrayCollection();
							for( i = 0; i < xFamilyHistoryTypeDTOList.length(); i++ )
							{
								var fdto:FamilyHistoryTypeDTO = new FamilyHistoryTypeDTO();
								fdto.FromXML( xFamilyHistoryTypeDTOList[i] );
								FamilyHistoryTypeDTOList.addItem( fdto );
							}
							
							MainCollection.addItem(FamilyHistoryTypeDTOList);
							
							var xSocialHistoryAddictionTypeDTOList:XMLList 	= xml.SocialHistoryAddiction.SocialHistoryAddictionTypeDTO ;
							SocialHistoryAddictionTypeDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryAddictionTypeDTOList.length(); i++ )
							{
								var sdto:SocialHistoryAddictionTypeDTO = new SocialHistoryAddictionTypeDTO();
								sdto.FromXML( xSocialHistoryAddictionTypeDTOList[i] );
								SocialHistoryAddictionTypeDTOList.addItem( sdto );
							}
							
							MainCollection.addItem(SocialHistoryAddictionTypeDTOList);
							
							var xSocialHistoryUsageAmountTypeDTOList:XMLList 	= xml.SocialHistoryUsage.SocialHistoryUsageAmountTypeDTO ;
							usageAmountTypeDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryUsageAmountTypeDTOList.length(); i++ )
							{
								var udto:SocialHistoryUsageAmountTypeDTO = new SocialHistoryUsageAmountTypeDTO();
								udto.FromXML( xSocialHistoryUsageAmountTypeDTOList[i] );
								usageAmountTypeDTOList.addItem( udto );
							}
							
							MainCollection.addItem(usageAmountTypeDTOList);
							
							var xSocialHistoryMeduimTypeDTOList:XMLList 	= xml.SocialHistoryMedium.SocialHistoryMediumTypeDTO;
							historyMediumTypesDTOList			= new ArrayCollection();
							for( i = 0; i < xSocialHistoryMeduimTypeDTOList.length(); i++ )
							{
								var mdto:SocialHistoryMediumTypeDTO = new SocialHistoryMediumTypeDTO();
								mdto.FromXML( xSocialHistoryMeduimTypeDTOList[i] );
								historyMediumTypesDTOList.addItem( mdto );
							}
							
							MainCollection.addItem(historyMediumTypesDTOList);
							
							if(callBack != null)
								callBack(MainCollection);
							
						}
						else
						{
							UtilityFunctions.ShowMessage("LoadComhensiveHistoryStaticDataCommand \n No data returned from service.","Info");
						}
					}
				//}
				//else
				//{
				//	UtilityFunctions.ShowMessage("LoadComhensiveHistoryStaticData \n Service didnot respond.", "Info");
				//}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			
			CursorManager.removeBusyCursor();
			Alert.show("Received In LoadComhensiveHistoryStaticDataCommand.\n" + rpcEvent.toString(), 'Error occured on server', 4, FlexGlobals.topLevelApplication.mainContainer as Sprite );
			
			//var errorStatus:String = "Fault occured in LoadComhensiveHistoryStaticDataCommand.";
			//var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			//QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}