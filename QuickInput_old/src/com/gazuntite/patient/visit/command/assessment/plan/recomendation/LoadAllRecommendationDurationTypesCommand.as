package com.gazuntite.patient.visit.command.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.recomendation.LoadAllRecommendationDurationTypesDelegate;
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.recomendation.LoadAllRecommendationDurationTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadAllRecommendationDurationTypesCommand implements Command , IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadAllRecommendationDurationTypesEvent;
		
		public function execute( cgEvent:CairngormEvent) : void 
		{
			
			if(model.LoggedInUserId)
			{
				LE = cgEvent as LoadAllRecommendationDurationTypesEvent;
				
				var delegate:LoadAllRecommendationDurationTypesDelegate = new  LoadAllRecommendationDurationTypesDelegate(this);
				
				delegate.LoadRecommendationDurationType(model.LoggedInUserSessionID);
				
			}
		}
		
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							var t:GeneralTypeDTO = new GeneralTypeDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
						model.recommendationDurationTypeDTOList = DTOlist ;
						
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("LoadAllModuleTypes \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		public function fault( rpcEvent : Object ) : void {
			
			var errorStatus:String = "Fault occured in LoadrecommandationTypeCommand.";
			
			/*var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.loggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); */
			
		}
		
		
		public function LoadAllRecommendationDurationTypesCommand()
		{
		}
	}
}