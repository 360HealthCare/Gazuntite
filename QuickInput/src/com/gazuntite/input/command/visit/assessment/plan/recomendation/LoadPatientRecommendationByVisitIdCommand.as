package com.gazuntite.input.command.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.recommendation.RecommendationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientRecommendationByVisitIdCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadPatientRecommendationByVisitIdEvent;
		
		public function LoadPatientRecommendationByVisitIdCommand()
		{
			
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadPatientRecommendationByVisitIdDelegate = new  LoadPatientRecommendationByVisitIdDelegate(this);
				LE = cgEvent as LoadPatientRecommendationByVisitIdEvent;
				delegate.loadRecommendationByvisitID(model.VisitID, QIConstants.IsTemplateVisit,model.LoggedInUserSessionID );
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
						var i:int = 1;
						
						for each (var x:XML in xlist)
						{
							var t:RecommendationDTO = new RecommendationDTO();
							t.serialNumber = i++;
							t.FromXML(x);
							DTOlist.addItem(t);
						}
						
						model.recommendationDTOList = DTOlist;
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadPatientRecommendationByVisitIDCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			
			var errorStatus:String = "Fault occured in LoadPatientRecommendationByVisitIDCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}