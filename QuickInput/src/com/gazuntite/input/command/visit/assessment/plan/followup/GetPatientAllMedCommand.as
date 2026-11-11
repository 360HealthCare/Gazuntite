package com.gazuntite.input.command.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.assessment.followUp.PMedicationDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.event.GetPatientGaxenIdEvent;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.GetPatientAllMedDelegate;
	import com.gazuntite.input.model.QIModelLocator;
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
			
			if (model.LoggedInUserId)
			{
				if (model.gaxenID && model.gaxenID != "0")
				{
					var delegate:GetPatientAllMedDelegate = new  GetPatientAllMedDelegate(this);
					delegate.getPatientDrugs(model.gaxenID);
				}
				else
				{
					var getGaxenIDEv:GetPatientGaxenIdEvent = new GetPatientGaxenIdEvent(model.patientDTO.UserID.toString(), onGetGaxenId);
					CairngormEventDispatcher.getInstance().dispatchEvent(getGaxenIDEv);
				}
			}
		}
		
		public function onGetGaxenId(result:XML):void
		{
			if (!result)
				return;
			
			var gaxenID:String = result[0];
			
			if (!gaxenID)
				return;
			
			if (gaxenID == "0")
				return;
			
			model.gaxenID = gaxenID;
			model.gaxenIDSaved = true;
			
			model.patientDTO.GAXENID = gaxenID;
			
			var delegate:GetPatientAllMedDelegate = new  GetPatientAllMedDelegate(this);
			delegate.getPatientDrugs(model.gaxenID);
		}
		
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.PMedication.Messages;
				
				if (xml != null)
				{
					var xlist:XMLList = xml;
					if (xlist != null)
					{
						var dtoList:ArrayCollection = new ArrayCollection();
						
						for each (var x:XML in xlist)
						{
							var dto:GeneralTypeDTO = new GeneralTypeDTO();
							
							dto.Name = x.@["DrugName"];
							dtoList.addItem(dto);
						}
						
						model.followUpPatientMedicationlist = dtoList;
					}
					
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("GetPatientAllMedCommand \n Service didnot respond.", "Info");
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in GetPatientAllMedCommand.";
		}
	}
}