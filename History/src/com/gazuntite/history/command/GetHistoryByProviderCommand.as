package com.gazuntite.history.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.VitalsDTO;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.dto.assessment.recommendation.RecommendationDTO;
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.dto.physical.ccHpi.HPITypeDTO;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.dto.physical.ros.ROSDTO;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryDTO;
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.history.delegate.GetHistoryByProviderDelegate;
	import com.gazuntite.history.dto.HistoryListDTO;
	import com.gazuntite.history.event.GetHistoryByProviderEvent;
	import com.gazuntite.history.event.GetProviderListEvent;
	import com.gazuntite.history.model.HistoryModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class GetHistoryByProviderCommand implements Command, IResponder
	{
		[Bindable]
		private var model : HistoryModelLocator = HistoryModelLocator.getInstance();
		
		var LE:GetHistoryByProviderEvent;
		
		private var Callback:Function;
		
		public function GetHistoryByProviderCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void
		{
			if(model.LoggedInUserId)
			{
				var delegate:GetHistoryByProviderDelegate = new  GetHistoryByProviderDelegate(this);
				
				LE = cgEvent as GetHistoryByProviderEvent;
				this.Callback = LE.callback;
				//PostData = LE.data;
				
				
				delegate.GetHistory(LE.sectionID ,model.LoggedInUserSelectedBranchId,LE.providerID,model.patientID,model.LoggedInUserSessionID);
				
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				var xlist:XMLList = re.result.ResponseData;
				
				if(xlist!=null)
				{
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							
							var tempDTO:HistoryListDTO = new HistoryListDTO();
							
							switch(LE.sectionID)
							{
								
								case 1: // Allergies
								{
									
									break;
								}
								case 2: // Chronic Medication
								{
									
									break;
								}
								case 3: //General History
								{
									tempDTO.FromXML(x.HistoryData.MedicalHistoryDTO ,MedicalHistoryDTO ,x.@Feild);
									break;
								}
								case 4: // family History
								{
									tempDTO.FromXML(x.HistoryData.FamilyHistoryDTO ,FamilyHistoryDTO ,x.@Feild);
									break;
								}
								case 5: // social History
								{
									tempDTO.FromXML(x.HistoryData.SocialhistoryVBDTO ,SocialHistoryDTO ,x.@Feild);
									break;
								}
								case 6: // immunization
								{
									tempDTO.FromXML(x.HistoryData.ImmunizationDTO ,ImmunizationDTO ,x.@Feild);
									
									break;
								}
								case 7:  //vitals
								{
									tempDTO.FromXML(x.HistoryData.VitalDTO ,VitalsDTO ,x.@Feild);
									break;
								}
								case 8: // CCHPI
								{
									tempDTO.FromXML(x.HistoryData.HPI_CCDTO ,ChiefComplaintHpiDTO ,x.@Feild);
									break;
								}
								case 9: // ROS
								{
									tempDTO.FromXML(x.HistoryData.ROSDTO ,ROSDTO ,x.@Feild);
									break;
								}
								case 10: //Physical
								{
									tempDTO.FromXML(x.HistoryData.PhysicalsDTO ,PhysicalDTO ,x.@Feild);
									break;
								}
								case 11: // lab in
								{
									tempDTO.FromXML(x.HistoryData.InHouseLabDTO ,InHouseLabDTO ,x.@Feild);
									break;
								}
								case 12: // Diagnosis
								{
									tempDTO.FromXML(x.HistoryData.PatientDiagnosisDTO ,DiagnosisDTO ,x.@Feild);
									break;
								}
								case 13: // presprection
								{
									
									break;
								}
									
								case 14: // procedure
								{
									tempDTO.FromXML(x.HistoryData.ProcedureDTO ,ProcedureDTO ,x.@Feild);
									break;
								}
									
								case 15:
								{
									tempDTO.FromXML(x.HistoryData.LabDTO ,LabDTO ,x.@Feild);
									break;
								}
									
								case 16:
								{
									tempDTO.FromXML(x.HistoryData.PatientRecommendationDTO ,RecommendationDTO ,x.@Feild);
									break;
								}
									
								case 17:
								{
									tempDTO.FromXML(x.HistoryData.PatientFollowupMergedDTO ,FollowUpDTO ,x.@Feild);
									break;
								}
									
								default:
								{
									break;
								}
							}
							
							//tempDTO.FromXML( x );
							DTOlist.addItem( tempDTO );
						}
						
						model.SelectedSectionHistoryList= DTOlist ;
						
						if(Callback != null)
							Callback();
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("GetHistoryByProvider \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in GetHistoryByProviderCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}