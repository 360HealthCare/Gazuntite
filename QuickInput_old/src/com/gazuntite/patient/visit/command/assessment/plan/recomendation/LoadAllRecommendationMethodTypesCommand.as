package com.gazuntite.patient.visit.command.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.recomendation.LoadAllRecommendationMethodTypesDelegate;
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.recomendation.LoadAllRecommendationMethodTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadAllRecommendationMethodTypesCommand implements Command , IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadAllRecommendationMethodTypesEvent;
		
		public function LoadAllRecommendationMethodTypesCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent) : void 
		{
			
			if(model.LoggedInUserId)
			{
				LE = cgEvent as LoadAllRecommendationMethodTypesEvent;
				
				var delegate:LoadAllRecommendationMethodTypesDelegate = new  LoadAllRecommendationMethodTypesDelegate(this);
				
				delegate.LoadRecommendationMethodType(model.LoggedInUserSessionID);
				
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
						model.recommendationMethodTypeDTOList= DTOlist ;
						
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
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
	}
}