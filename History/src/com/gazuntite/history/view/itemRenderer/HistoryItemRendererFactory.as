package com.gazuntite.history.view.itemRenderer
{
	import com.gazuntite.common.dto.VitalsDTO;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.dto.assessment.recommendation.RecommendationDTO;
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.dto.physical.ros.ROSDTO;
	import com.gazuntite.common.dto.pmh.Allergy.AllergyDTO;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryDTO;
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	import com.gazuntite.common.dto.pmh.presprection.ChronicRXDTO;
	import com.gazuntite.common.dto.pmh.presprection.PresprectionRXDTO;
	
	import mx.core.ClassFactory;

	public class HistoryItemRendererFactory
	{
		public static function getItemRendererFor(item:Object):ClassFactory
		{
			var factory:ClassFactory;
			
			if(item is FamilyHistoryDTO)
			{
				factory = new ClassFactory(HistoryFamilyHistoryIR) 
			}
		
			else if(item is SocialHistoryDTO)
			{
				factory = new ClassFactory(HistorySocialHistoryIR) 
			}
			
			else if(item is VitalsDTO)
			{
				factory = new ClassFactory(HistoryVitalsIR) 
			}
			else if(item is ImmunizationDTO)
			{
				factory = new ClassFactory(HistoryImmunizationIR) 
			}
			
			else if(item is ChiefComplaintHpiDTO)
			{
				factory = new ClassFactory(HistoryCCHPIIR) 
			}
			
			else if(item is ROSDTO)
			{
				factory = new ClassFactory(HistoryROSIR) 
			}
			
			else if(item is PhysicalDTO)
			{
				factory = new ClassFactory(HistoryPhysicalIR) 
			}
			
			else if(item is InHouseLabDTO)
			{
				factory = new ClassFactory(HistoryInHouseLabIR) 
			}
			
			else if(item is DiagnosisDTO)
			{
				factory = new ClassFactory(HistoryDignosisIR) 
			}
			
			else if(item is LabDTO)
			{
				factory = new ClassFactory(HistoryLabOutIR) 
			}
			
			else if(item is RecommendationDTO)
			{
				factory = new ClassFactory(HistoryRecommendationIR) 
			}
			
			else if(item is FollowUpDTO)
			{
				factory = new ClassFactory(HistoryFollowupIR) 
			}
			
			else if(item is ProcedureDTO)
			{
				factory = new ClassFactory(HistoryProcedureIR) 
			}
			else if(item is MedicalHistoryDTO)
			{
				factory = new ClassFactory(HistoryGeneralHistoryIR) 
			}
			else if(item is AllergyDTO)
			{
				factory = new ClassFactory(HistoryAllergyIR) 
			}
			else if(item is ChronicRXDTO)
			{
				factory = new ClassFactory(HistoryChronicIR) 
			}
			else if(item is PresprectionRXDTO)
			{
				factory = new ClassFactory(HistoryPresprectionIR) 
			}
			
			/*else if(item is MedicalHistory)
			{
				factory = new ClassFactory();
			}*/
			
			return factory;
		}
		
		public static function getItemLabelFor(item:Object):String
		{
			var label:String;
			
			if(item is FamilyHistoryDTO)
			{
				label = "FAMILY HISTORY"; 
			}
			
			else if(item is SocialHistoryDTO)
			{
				label = "SOCIAL HISTORY"; 
			}
			
			else if(item is VitalsDTO)
			{
				label = "VITALS"; 
			}
			
			else if(item is ImmunizationDTO)
			{
				label = "IMMUNIZATION"; 
			}
			
			else if(item is ChiefComplaintHpiDTO)
			{
				label = "CHIEF COMPLAINT"; 
			}
			
			else if(item is ROSDTO)
			{
				label = "REVIEW OF SYSTEM"; 
			}
			
			else if(item is PhysicalDTO)
			{
				label = "PHYSICAL"; 
			}
			
			else if(item is InHouseLabDTO)
			{
				label = "LAB IN"; 
			}
			
			else if(item is DiagnosisDTO)
			{
				label = "DIAGONSIS"; 
			}
			
			else if(item is LabDTO)
			{
				label = "LAB-OUT"; 
			}
			
			else if(item is RecommendationDTO)
			{
				label = "RECOMMENDATION"; 
			}
			
			else if(item is FollowUpDTO)
			{
				label = "FOLLOW UP"; 
			}
			else if(item is ProcedureDTO)
			{
				label = "PROCEDURE"; 
			}
			else if(item is MedicalHistoryDTO)
			{
				label = "GENERAL HISTORY"; 
			}
			
			else if(item is AllergyDTO)
			{
				label = "ALLERGIES"; 
			}
			else if(item is ChronicRXDTO)
			{
				label = "CHRONIC MEDICATION"; 
			}
			else if(item is PresprectionRXDTO)
			{
				label = "PRESCRIPTION";
			}
			
			/*else if(item is MedicalHistory)
			{
				label = "";
			}*/
			
			return label;
		}
	}
}