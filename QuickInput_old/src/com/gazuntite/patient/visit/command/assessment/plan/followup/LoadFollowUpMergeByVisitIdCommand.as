package com.gazuntite.patient.visit.command.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.followup.LoadFollowUpMergeByVisitIdDelegate;
	import com.gazuntite.patient.visit.dto.PatientFollowupMergedDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.followup.LoadFollowUpMergeByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadFollowUpMergeByVisitIdCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadFollowUpMergeByVisitIdEvent;
		public function LoadFollowUpMergeByVisitIdCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadFollowUpMergeByVisitIdDelegate = new  LoadFollowUpMergeByVisitIdDelegate(this);
				LE = cgEvent as LoadFollowUpMergeByVisitIdEvent;
				delegate.LoadFollowUpMergeByVisitId(model.VisitID, QIConstants.IsTemplateVisit,model.LoggedInUserSessionID );
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
							var t:PatientFollowupMergedDTO = new PatientFollowupMergedDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
						
						model.PatientFollowupMerged = DTOlist ;
						
					}
					
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadPatientFollowUpByVisitIDCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadPatientFollowUpByVisitIDCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}