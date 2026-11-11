package com.gazuntite.input.command.visit.assessment.treatment.procedure
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.treatment.procedure.LoadProcedureByVisitIDDelegate;
	import com.gazuntite.input.event.visit.assessment.treatment.procedure.LoadProcedureByVisitIDEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
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
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if (xml!=null)
				{
					var xlist:XMLList = xml.children();
					if (xlist != null)
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						var i:int = 1;
						for each (var x:XML in xlist)
						{
							var t:ProcedureDTO = new ProcedureDTO();
							t.serialNumber = i++;
							t.FromXML(x);
							DTOlist.addItem(t);
						}
						
						model.procedureDTOList = DTOlist;
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