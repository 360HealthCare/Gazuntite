package com.gazuntite.input.command.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.baseDTO.GeneralLabelDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class LoadRecommendationLinksAutoCompleteCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadRecommendationLinksAutoCompleteEvent;
		
		public function LoadRecommendationLinksAutoCompleteCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadRecommendationLinksAutoCompleteDelegate = new  LoadRecommendationLinksAutoCompleteDelegate(this);
				
				LE = cgEvent as LoadRecommendationLinksAutoCompleteEvent;
				
				delegate.LoadAllLinks(model.LoggedInUserSelectedBranchId, LE.searchString, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var Types:ArrayCollection  =new ArrayCollection();
				
				var ResultXml:XML = rpcEvent.result as XML
				
				if (!ResultXml)
					return;
				
				var FollowUpServiceTypesList:XMLList = ResultXml.ResponseData.string ;
				
				for (var i:int = 0; i < FollowUpServiceTypesList.length(); i++)
				{
					var ct:GeneralLabelDTO = new GeneralLabelDTO();
					ct.FromXML(FollowUpServiceTypesList[i]);
					Types.addItem(ct);
				}
				
				if (Types.length)
					model.recommendationLinkAutoCompleteDTOList = Types;
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadRecommendationLinksAutoComplete.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}