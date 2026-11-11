package com.gazuntite.history.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.pmh.Allergy.AllergyDTO;
	import com.gazuntite.common.dto.pmh.presprection.ChronicRXDTO;
	import com.gazuntite.common.dto.pmh.presprection.PresprectionRXDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.history.delegate.GetPresprectionHistoryByProviderDelegate;
	import com.gazuntite.history.dto.HistoryListDTO;
	import com.gazuntite.history.event.GetPresprectionHistoryByProviderEvent;
	import com.gazuntite.history.model.HistoryModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetPresprectionHistoryByProviderCommand  implements Command, IResponder
	{
		
		[Bindable]
		private var model : HistoryModelLocator = HistoryModelLocator.getInstance();
		
		var LE:GetPresprectionHistoryByProviderEvent;
		
		private var Callback:Function;
		
		public function GetPresprectionHistoryByProviderCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void
		{
			if(model.LoggedInUserId)
			{
				var delegate:GetPresprectionHistoryByProviderDelegate = new  GetPresprectionHistoryByProviderDelegate(this);
				
				LE = cgEvent as GetPresprectionHistoryByProviderEvent;
				this.Callback = LE.callback;
				//PostData = LE.data;
				
				
				delegate.GetHistory(LE.GaxenID,LE.sectionID,LE.PatientGaxenID);
				
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				var xlist:XMLList = re.result.GroupByDTO;
				
				if(xlist!=null)
				{
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							
							var tempDTO:HistoryListDTO = new HistoryListDTO();
							
							switch(LE.sectionID)
							{
								
								case 1: // Allergies
								{
									tempDTO.FromXML(x.HistoryData.PatientAllergies ,AllergyDTO ,x.@Field);
									break;
								}
								case 2: // Chronic Medication
								{
									tempDTO.FromXML(x.HistoryData.Messages ,ChronicRXDTO ,x.@Field);
									break;
								}
								case 13: //General History
								{
									tempDTO.FromXML(x.HistoryData.Messages ,PresprectionRXDTO ,x.@Field);
									break;
								}
							}
							
							//tempDTO.FromXML( x );
							DTOlist.addItem( tempDTO );
						}
						
						model.SelectedSectionHistoryList= DTOlist ;
						
						if(Callback != null)
							Callback();
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("GetPresprectionHistoryByProvider \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in GetPresprectionHistoryByProvider.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}