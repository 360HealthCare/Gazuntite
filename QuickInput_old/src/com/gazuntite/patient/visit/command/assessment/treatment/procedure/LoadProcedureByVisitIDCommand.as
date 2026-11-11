package com.gazuntite.patient.visit.command.assessment.treatment.procedure
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.treatment.procedure.LoadProcedureByVisitIDDelegate;
	import com.gazuntite.patient.visit.dto.ProcedureDTO;
	import com.gazuntite.patient.visit.event.assessment.treatment.procedure.LoadProcedureByVisitIDEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadProcedureByVisitIDCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadProcedureByVisitIDEvent;
	
		public function LoadProcedureByVisitIDCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadProcedureByVisitIDDelegate = new  LoadProcedureByVisitIDDelegate(this);
				LE = cgEvent as LoadProcedureByVisitIDEvent;
				delegate.LoadProcedureVisitID(model.VisitID,QIConstants.IsTemplateVisit,model.LoggedInUserSessionID );
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
							var t:ProcedureDTO = new ProcedureDTO();
							t.FromXML(x);
							DTOlist.addItem( t );
						}
						
						model.ProcedureDTOList = DTOlist ;
						
					}
					
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadProcedureVisitIDCommand \n Service didnot respond.", "Info");
				}
			}
		}
	
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadProcedureVisitIDCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}