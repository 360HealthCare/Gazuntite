package com.gazuntite.patient.visit.utils.managers
{
	import com.gazuntite.common.util.QSPopUpManagerImpl;

	public class QIPopUpManager
	{
		public static const COMPREHENSIVE_HISTORY:String = "comprehensiveHistory";
		public static const IMMUNIZATION:String = "immunization";
		public static const HPI_CC:String = "hpiCC";
		public static const ROS:String = "ros";
		public static const PHYSICAL:String = "physical";
		public static const IN_HOUSE_LAB:String = "inHouseLab";
		public static const DIAGNOSIS:String = "diagnosis";
		public static const PROCEDURE:String = "procedure";
		public static const LAB_OUT:String = "labOut";
		public static const RECOMMENDATION:String = "recommendation";
		public static const FOLLOW_UP_INSTRUCTIONS:String = "followUpInstruction";
		
		
		public static const VB_COMPREHENSIVE_HISTORY:String = "vb_comprehensiveHistory";
		public static const VB_IMMUNIZATION:String = "vb_immunization";
		public static const VB_HPI_CC:String = "vb_hpiCC";
		public static const VB_ROS:String = "vb_ros";
		public static const VB_PHYSICAL:String = "vb_physical";
		public static const VB_IN_HOUSE_LAB:String = "vb_inHouseLab";
		public static const VB_DIAGNOSIS:String = "vb_diagnosis";
		public static const VB_PROCEDURE:String = "vb_procedure";
		public static const VB_LAB_OUT:String = "vb_labOut";
		public static const VB_RECOMMENDATION:String = "vb_recommendation";
		public static const VB_FOLLOW_UP_INSTRUCTIONS:String = "vb_followUpInstruction";
		
		
		
		public static const PATIENT_ENCOUNTER_LIST:String = "patientEncounterList";
		
		private static var impl:QSPopUpManagerImpl = QSPopUpManagerImpl.getInstance();
		
		public function QIPopUpManager()
		{
			throw ("QIPopUpManager is a singleton class, You can not create its instance");
		}
		
		public static function hideAllPopUps():void
		{
			impl.hideAllPopUps();
		}
		
		public static function hideAllSectionPopUps(section:String):void
		{
			impl.hideAllSectionPopUps(section);
		}
		
		public static function addPopUp(popUp:*, section:String):void
		{
			impl.addPopUp(popUp, section);
		}
		
		public static function removePopUp(popUp:*, section:String):void
		{
			impl.removePopUp(popUp, section);
		}
	}
}