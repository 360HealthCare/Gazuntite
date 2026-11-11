package com.gazuntite.patient.visit.command.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.assessment.plan.followup.GetPatientAllMedDelegate;
	import com.gazuntite.patient.visit.dto.PMedicationDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetPatientAllMedCommand implements Command , IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		public function GetPatientAllMedCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent) : void 
		{
			
			if(model.LoggedInUserId)
			{
				var delegate:GetPatientAllMedDelegate = new  GetPatientAllMedDelegate(this);
				delegate.getPatientDrugs(model.gaxenID);
			}
		}
		
		
		public function result( rpcEvent : Object ) : void {
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.PMedication.Messages;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml;
					if( xlist != null )
					{
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							var t:PMedicationDTO = new PMedicationDTO();
							t.FromXml( x );
							DTOlist.addItem( t );
						}
						model.PatientMedicationDTOlist = DTOlist ;
						
					}
					
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("get mecication \n Service didnot respond.", "Info");
			}
			
		}
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in GetPatientAllMedCommand.";
		}
	}
}