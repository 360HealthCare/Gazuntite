package com.gazuntite.patient.visit.command.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteDelegate;
	import com.gazuntite.patient.visit.dto.common.GeneralLabelDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class LoadRecommendationLinksAutoCompleteCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadRecommendationLinksAutoCompleteEvent;
		
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadRecommendationLinksAutoCompleteDelegate = new  LoadRecommendationLinksAutoCompleteDelegate(this);
				
				LE = cgEvent as LoadRecommendationLinksAutoCompleteEvent;
				
				delegate.LoadAllLinks(model.LoggedInUserSelectedBranchId,LE.searchString, model.LoggedInUserSessionID);
			}
			
		}
		
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				
				trace( "onSuccess start "  )		
				
				var Types:ArrayCollection  =new ArrayCollection();
				
				var ResultXml:XML = rpcEvent.result as XML
				
				var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.string ;
				
				
				for(var i:int = 0 ; i < FollowUpServiceTypesList.length(); i++ )
				{
					var ct:GeneralLabelDTO = new GeneralLabelDTO();
					ct.FromXML( FollowUpServiceTypesList[i] );
					Types.addItem( ct );
				}
				
				if(Types.length)
					model.recommendationLinkAutoCompleteDTOList = Types;
				
				
				trace( "model updated "  )
				
				trace( "on result found record ",Types.length );
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadRecommendationLinksAutoComplete.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		
		public function LoadRecommendationLinksAutoCompleteCommand()
		{
		}
	}
}