package com.gazuntite.model
{
	import mx.collections.ArrayCollection;
	import mx.utils.ArrayUtil;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class SharedModel
	{
		public var addedImmunizationsAC:ArrayCollection = new ArrayCollection([]);
		public var immunizationHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedChronicMedicationAC:ArrayCollection = new ArrayCollection([]);
		public var chronicMedicationAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedDiagnosisAC:ArrayCollection = new ArrayCollection([]);
		public var diagnosisAC:ArrayCollection 		= new ArrayCollection([]);
		
		public var addedProcedureAC:ArrayCollection = new ArrayCollection([]);
		public var procedureAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedPrescriptionAC:ArrayCollection = new ArrayCollection([]);
		public var PrescriptionAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedLabOutAC:ArrayCollection = new ArrayCollection([]);
		public var LabOutAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedRecommendationAC:ArrayCollection = new ArrayCollection([]);
		public var RecommendationAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedFollowUpAC:ArrayCollection = new ArrayCollection([]);
		public var FollowUpAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedChiefComplaintsAC:ArrayCollection = new ArrayCollection([]);
		public var chiefComplaintHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedAllergiesAC:ArrayCollection = new ArrayCollection([]);
		public var allergyHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedVitalsAC:ArrayCollection = new ArrayCollection([]);
		public var vitalsAC:ArrayCollection = new ArrayCollection([]);
		
		
		public var addedReviewOfSystemAC:ArrayCollection = new ArrayCollection([]);
		public var reviewOfSystemHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		public var addedInHouseLabAC:ArrayCollection = new ArrayCollection([]);
		public var inHouseLabHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		
		// comp history
		public var generalHistoryAC:ArrayCollection = new ArrayCollection([]);
		public var familyHistoryAC:ArrayCollection = new ArrayCollection([]);
		public var socialHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		// comp history data input options
		public var generalHistoryOptionsAC:ArrayCollection = new ArrayCollection([
			{icdCode:"111", icdDescription:"Description 1"},
			{icdCode:"222", icdDescription:"Description 2"},
			{icdCode:"333", icdDescription:"Description 3"},
			{icdCode:"444", icdDescription:"Description 4"},
			{icdCode:"555", icdDescription:"Description 5"}
		]);
		
		// diagnosis
		public var diagnosisHistoryAC:ArrayCollection = new ArrayCollection([]); 
		
		// prescriptions
		public var prescriptionsHistoryAC:ArrayCollection = new ArrayCollection([]);
		
		
		// service related AC's
		public var CPTProcedureDTOList					:ArrayCollection 	= new ArrayCollection([]);
		public var ICDCodeDTOList						:ArrayCollection 	= new ArrayCollection([]);
		public var immunizationTypes					:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationManufacturersDTOList		:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationBodySideRouteDTOList		:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationDoseDTOList				:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationLotDTOList				:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationReasonForRefusalDTOList	:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationSitesDTOList				:ArrayCollection 	= new ArrayCollection([]);
		public var ImmunizationSeriesDTOList			:ArrayCollection 	= new ArrayCollection([]);
		
		public var AllergyClassTypes					:ArrayCollection	= new ArrayCollection([]);
		
		//chronic medication
		public var MedicationQuantityFormList			:ArrayCollection	= new ArrayCollection([]);
		private var _MedicationDosageFormList			:ArrayCollection	= new ArrayCollection([]);
		public var MedicationMedicineNameList			:ArrayCollection	= new ArrayCollection([]);
		public var MedicationGenericnameList			:ArrayCollection	= new ArrayCollection([]);
		public var MedicationStrengthList				:ArrayCollection	= new ArrayCollection([]);
		public var MedicationNDCList					:ArrayCollection	= new ArrayCollection([]);
		
		//inhouse lab
		public var LabInTestNameList					:ArrayCollection	= new ArrayCollection([]);
		public var LabInTestCodeList					:ArrayCollection	= new ArrayCollection([]);
		
		//cchpi
		public var CCHPISymptomList						:ArrayCollection	= new ArrayCollection([]);
		
		public var versionNumber:String;
		
		public var testNames:ArrayCollection 			= new ArrayCollection([]);
		
		
		public var patientName:String = "John Smith";
		public var doctorName:String = "Dr. John Harrison";
		
		public function SharedModel()
		{
			
			createDummyAllergyData();
			createDummyMedicationData()
			createDummyImmunizationData();
			createDummyChiefComplaintData();
			createDummyReviewOfSystemData();
			createDummyInHouseLabData();
			
			createDummyVBData();
		}
		
		protected function createDummyVBData():void
		{
			// dummy data for test binding
			var r:ObjectProxy = new ObjectProxy();
			r.visitDate = "Medical";
			r.onSet = "08/13/12";
			r.diagnosis = "Diagnosis 1";
			r.chronic = "Chronic 1";
			r.icdCode = "732.1";
			r.description = "Abdominal pain unspecified";
			
			var r1:ObjectProxy = new ObjectProxy();
			r1.visitDate = "Medical";
			r1.onSet = "08/13/12";
			r1.diagnosis = "Diagnosis 2";
			r1.chronic = "Chronic 2";
			r1.icdCode = "732.2";
			r1.description = "Abdominal pain unspecified";
			
			var r2:ObjectProxy = new ObjectProxy();
			r2.visitDate = "Medical";
			r2.onSet = "08/13/12";
			r2.diagnosis = "Diagnosis 3";
			r2.chronic = "Chronic 3";
			r2.icdCode = "732.3";
			r2.description = "Abdominal pain unspecified";
			
			var r3:ObjectProxy = new ObjectProxy();
			r3.visitDate = "Medical";
			r3.onSet = "08/13/12";
			r3.diagnosis = "Diagnosis 4";
			r3.chronic = "Chronic 4";
			r3.icdCode = "732.4";
			r3.description = "Abdominal pain unspecified";
			
			var r4:ObjectProxy = new ObjectProxy();
			r4.visitDate = "Medical";
			r4.onSet = "08/13/12";
			r4.diagnosis = "Diagnosis 5";
			r4.chronic = "Chronic 5";
			r4.icdCode = "732.5";
			r4.description = "Abdominal pain unspecified";
			
			diagnosisHistoryAC.addItem(r);
			diagnosisHistoryAC.addItem(r1);
			diagnosisHistoryAC.addItem(r2);
			diagnosisHistoryAC.addItem(r3);
			diagnosisHistoryAC.addItem(r4);
			
			
			// prescription
			var p:ObjectProxy = new ObjectProxy();
			p.visitDate = "08/13/12";
			p.dose = "Every day";
			p.medStrength = "PanOxl-8 8%";
			p.sig = "2";
			p.action = "Take";
			p.numberOfRefills = "4";
			
			var p1:ObjectProxy = new ObjectProxy();
			p1.visitDate = "08/13/12";
			p1.dose = "Every day";
			p1.medStrength = "PanOxl-8 8%";
			p1.sig = "2";
			p1.action = "Take";
			p1.numberOfRefills = "4";
			
			var p2:ObjectProxy = new ObjectProxy();
			p2.visitDate = "08/13/12";
			p2.dose = "Every day";
			p2.medStrength = "PanOxl-8 8%";
			p2.sig = "2";
			p2.action = "Take";
			p2.numberOfRefills = "4";
			
			var p3:ObjectProxy = new ObjectProxy();
			p3.visitDate = "08/13/12";
			p3.dose = "Every day";
			p3.medStrength = "PanOxl-8 8%";
			p3.sig = "2";
			p3.action = "Take";
			p3.numberOfRefills = "4";
			
			var p4:ObjectProxy = new ObjectProxy();
			p4.visitDate = "08/13/12";
			p4.dose = "Every day";
			p4.medStrength = "PanOxl-8 8%";
			p4.sig = "2";
			p4.action = "Take";
			p4.numberOfRefills = "4";
			
			prescriptionsHistoryAC.addItem(p);
			prescriptionsHistoryAC.addItem(p1);
			prescriptionsHistoryAC.addItem(p2);
			prescriptionsHistoryAC.addItem(p3);
			prescriptionsHistoryAC.addItem(p4);
		}
		
		public function get MedicationDosageFormList():ArrayCollection
		{
			return _MedicationDosageFormList;
		}
		
		public function set MedicationDosageFormList(value:ArrayCollection):void
		{
			_MedicationDosageFormList = value;
		}
		
		protected function createDummyReviewOfSystemData():void
		{
			
			// Dummy data for Review of System history form
			
		}
		
		protected function createDummyInHouseLabData():void
		{
			
			// Dummy data for In House Lab history form
			var r:ObjectProxy = new ObjectProxy();
			r.testCode = "1";
			r.testName = "Test Name 1";
			r.msg = "Msg 1";
			
			var obj:Object = new Object();
			obj.name = "test 1";
			
			
			testNames.addItem(obj);
			
		}
		
		protected function createDummyChiefComplaintData():void
		{
			
			// Dummy data for Chief Complaint history form
			var r:ObjectProxy = new ObjectProxy();
			r.complaint = "Complaint 1";
			r.symptom = "Rash";
			r.onSet = "05/28/2012";
			r.duration = "1 month";
			r.location = "Back/Neck";
			r.quality = "10 out of 10";
			r.severity = "Moderate";	
			r.context = "Intermitent";
			r.modifyingFactors = "Inhaler helps";
			r.exacerbating = "Cold air";
			r.progression = "Getting better";
			r.radiation = "None";
			
			var r1:ObjectProxy = new ObjectProxy();
			r1.complaint = "Complaint 1";
			r1.symptom = "Rash";
			r1.onSet = "05/28/2012";
			r1.duration = "1 month";
			r1.location = "Back/Neck";
			r1.quality = "10 out of 10";
			r1.severity = "Moderate";	
			r1.context = "Intermitent";
			r1.modifyingFactors = "Inhaler helps";
			r1.exacerbating = "Cold air";
			r1.progression = "Getting better";
			r1.radiation = "None";
			
			var r2:ObjectProxy = new ObjectProxy();
			r2.complaint = "Complaint 1";
			r2.symptom = "Rash";
			r2.onSet = "05/28/2012";
			r2.duration = "1 month";
			r2.location = "Back/Neck";
			r2.quality = "10 out of 10";
			r2.severity = "Moderate";	
			r2.context = "Intermitent";
			r2.modifyingFactors = "Inhaler helps";
			r2.exacerbating = "Cold air";
			r2.progression = "Getting better";
			r2.radiation = "None";
			
			chiefComplaintHistoryAC.addItem(r);
			chiefComplaintHistoryAC.addItem(r1);
			chiefComplaintHistoryAC.addItem(r2);
		}
		
		protected function createDummyImmunizationData():void
		{
			
			// Dummy data for Immunization history form
			var r:ObjectProxy = new ObjectProxy();
			r.associatedWith = "This Visit";
			r.immunization = "7-Valent";
			r.dose = "1000000";
			r.lotNumber = "5000000000000";
			r.dateAdmin = "5/28/2012";
			r.expiryDate = "5/30/2010";	
			r.manufacturer = "Manufacturer 1";
			r.bodySideRoute = "Body Side/route 1";
			r.nextDue = "5/30/2013";
			r.refusal = true;
			r.reasonForRefusal = "Reason for refusal 1";
			r.site = null;
			r.series = "Series 1";
			
			var r2:ObjectProxy = new ObjectProxy();
			r2.associatedWith = "Last Visit";
			r2.immunization = "Immunization 2";
			r2.dose = "2000000";
			r2.lotNumber = "6000000000000";
			r2.dateAdmin = "5/28/2012";
			r2.expiryDate = "5/30/2010";	
			r2.manufacturer = null;
			r2.bodySideRoute = null;
			r2.nextDue = "5/30/2013";
			r2.refusal = false;
			r2.reasonForRefusal = null;
			r2.site = null;
			r2.series = null;
			
			var r3:ObjectProxy = new ObjectProxy();
			r3.associatedWith = "This Visit";
			r3.immunization = "Immunization 3";
			r3.dose = "1000000";
			r3.lotNumbe3 = "7000000000000";
			r3.dateAdmin = "5/28/2012";
			r3.expiryDate = "5/30/2010";	
			r3.manufacturer = "Manufacturer 3";
			r3.bodySideRoute = "Body Side/route 4";
			r3.nextDue = "5/30/2013";
			r3.refusal = false;
			r3.reasonForRefusal = null;
			r3.site = null;
			r3.series = null;
			
			immunizationHistoryAC.addItem(r);
			immunizationHistoryAC.addItem(r2);
			immunizationHistoryAC.addItem(r3);
		}
		
		protected function createDummyMedicationData():void
		{
			var m:ObjectProxy = new ObjectProxy();
			m.medicineName 	= "abacavir";
			m.strength 		= "5 mg";
			m.genericName 	= "Accupril";
			m.dose 			= "2";
			
			var m1:ObjectProxy 	= new ObjectProxy();
			m1.medicineName 	= "Cortisporin";
			m1.strength 		= "5 mg";
			m1.genericName 		= "Cortisporin";
			m1.dose 			= "2";
			
			var m2:ObjectProxy 	= new ObjectProxy();
			m2.medicineName 	= "Flurazepam Hydrochloride";
			m2.strength 		= "5 mg";
			m2.genericName 		= "Flurazepam Hydrochloride";
			m2.dose 			= "2";
			
			var m3:ObjectProxy 	= new ObjectProxy();
			m3.medicineName 	= "CellCept";
			m3.strength 		= "5 mg";
			m3.genericName 		= "CellCept";
			m3.dose 			= "2";
			
			var m4:ObjectProxy 	= new ObjectProxy();
			m4.medicineName 	= "Cortisporin";
			m4.strength 		= "5 mg";
			m4.genericName 		= "Cortisporin";
			m4.dose 			= "2";
			
			var m5:ObjectProxy 	= new ObjectProxy();
			m5.medicineName 	= "Flurazepam Hydrochloride";
			m5.strength 		= "5 mg";
			m5.genericName 		= "Flurazepam Hydrochloride";
			m5.dose 			= "2";
			
			var m6:ObjectProxy 	= new ObjectProxy();
			m6.medicineName 	= "CellCept";
			m6.strength 		= "5 mg";
			m6.genericName 		= "CellCept";
			m6.dose 			= "2";
			
			chronicMedicationAC.addItem( m );
			chronicMedicationAC.addItem( m1 );
			chronicMedicationAC.addItem( m2 );
			chronicMedicationAC.addItem( m3 );
			chronicMedicationAC.addItem( m4 );
			chronicMedicationAC.addItem( m5 );
			chronicMedicationAC.addItem( m6 );
		}
		
		protected function createDummyAllergyData():void
		{
			// dummy data for test binding
			var r:ObjectProxy = new ObjectProxy();
			r.onSet = "03/02/2011";
			r.allergy = "Biaxin";
			r.reaction = "Swelling";
			r.status = "Active";
			
			var r1:ObjectProxy = new ObjectProxy();
			r1.onSet = "09/09/2010";
			r1.allergy = "Darvon";
			r1.reaction = "Urticaria (hives)";
			r1.status = "Active";
			
			var r2:ObjectProxy = new ObjectProxy();
			r2.onSet = "03/23/2010";
			r2.allergy = "Panadiplon";
			r2.reaction = "Reaction";
			r2.status = "Active";
			
			var r3:ObjectProxy = new ObjectProxy();
			r3.onSet = "08/02/2007";
			r3.allergy = "Peach";
			r3.reaction = "None";
			r3.status = "Active";
			
			allergyHistoryAC.addItem(r);
			allergyHistoryAC.addItem(r1);
			allergyHistoryAC.addItem(r2);
			allergyHistoryAC.addItem(r3);
		}
		
		
		
		
	}
}