package com.gazuntite.input.command.visit.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.diagnosis.LoadPatientDiagnosisByVisitIdDelegate;
	import com.gazuntite.input.event.visit.assessment.diagnosis.LoadPatientDiagnosisByVisitIdEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientDiagnosisByVisitIdCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadPatientDiagnosisByVisitIdEvent;
		
		public function LoadPatientDiagnosisByVisitIdCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadPatientDiagnosisByVisitIdDelegate = new  LoadPatientDiagnosisByVisitIdDelegate(this);
				LE = cgEvent as LoadPatientDiagnosisByVisitIdEvent;
				delegate.loadPatientDiagnosis(model.VisitID,QIConstants.IsTemplateVisit,model.LoggedInUserSessionID );
			}
		}
		
		public function result(rpcEvent:Object):void 
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
							var t:DiagnosisDTO = new DiagnosisDTO();
							t.FromXML(x);
							
							t.serialNumber = i++;
							
							DTOlist.addItem( t );
						}
						
						model.diagnosisDTOList = DTOlist;
						
						if(model.diagnosisDTOList.length > 0)
							model.signCosignBtnEnabled  = true;
						else 
							model.signCosignBtnEnabled  = false;
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadPatientDiagnosisCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in LoadPatientDiagnosisCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}