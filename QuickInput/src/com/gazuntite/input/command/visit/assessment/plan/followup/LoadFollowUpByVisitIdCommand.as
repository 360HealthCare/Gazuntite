package com.gazuntite.input.command.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.LoadFollowUpByVisitIdDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpByVisitIdEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpByVisitIdCommand implements Command, IResponder 
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadFollowUpByVisitIdEvent;
		
		public function LoadFollowUpByVisitIdCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadFollowUpByVisitIdDelegate = new  LoadFollowUpByVisitIdDelegate(this);
				LE = cgEvent as LoadFollowUpByVisitIdEvent;
				
				delegate.LoadFollowUpMergeByVisitId(model.VisitID, QIConstants.IsTemplateVisit, model.LoggedInUserSessionID );
			}	
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if (xml != null)
				{
					var xlist:XMLList = xml.children();
					
					if (xlist != null)
					{
						var DTOlist:ArrayCollection = new ArrayCollection();
						var i:int = 1;
						
						for each (var x:XML in xlist)
						{
							var t:FollowUpDTO = new FollowUpDTO();
							
							t.serialNumber = i++;
							t.FromXML(x);
							DTOlist.addItem(t);
						}
						
						model.followUpDTOList = DTOlist;
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadFollowUpByVisitIDCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadFollowUpByVisitIDCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}