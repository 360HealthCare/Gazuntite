package com.gazuntite.input.view.viewmodel
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.dto.visit.VisitDTO;
	import com.gazuntite.common.event.MarkValidDataExistsEvent;
	import com.gazuntite.common.event.comprehensive.LoadComhensiveHistoryStaticDataEvent;
	import com.gazuntite.common.event.visit.LoadPatientVisitsEvent;
	import com.gazuntite.common.event.visit.ManageModuleNotesEvent;
	import com.gazuntite.common.view.PatientViewModel;
	import com.gazuntite.input.controller.QIController;
	import com.gazuntite.input.event.history.dictationNote.LoadModuleDictationNoteByPatientIDEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadAllBloodRelationShipTypeDTOEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadDiseaseTypesEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadFamilyHistoryByPatientIdEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadMedicalHistoryByPatientIdEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadSocialHistoryByPatientIdEvent;
	import com.gazuntite.input.event.visit.pmh.immunization.LoadImmunicationStaticDataEvent;
	import com.gazuntite.input.event.visit.visit.CreateVisitEvent;
	import com.gazuntite.input.event.visit.visit.GetVisitChargesEvent;
	import com.gazuntite.input.event.visit.visit.LoadVisitModuleTypesEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.AppUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.view.inputsections.PatientInputSoapExpandView;
	import com.gazuntite.input.view.inputsections.assessment.PatientInputAssessmentViewModel;
	import com.gazuntite.input.view.inputsections.billing.PatientInputBillingView;
	import com.gazuntite.input.view.inputsections.history.Immunization.PatientInputHistoryImmunizationViewModel;
	import com.gazuntite.input.view.inputsections.history.PatientInputHistoryGuideView;
	import com.gazuntite.input.view.inputsections.history.allergy.PatientInputHistoryAllergyViewModel;
	import com.gazuntite.input.view.inputsections.history.chronic.PatientInputMedicationPrescriptionViewModel;
	import com.gazuntite.input.view.inputsections.physical.PatientInputPhysicalViewModel;
	import com.gazuntite.input.view.inputsections.visitSign.VisitSignAuthenticationPopUp;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.formatters.DateFormatter;
	import mx.managers.PopUpManager;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class PatientInputViewModel extends EventDispatcher
	{
		protected static var instance:PatientInputViewModel = null;
	
		public var patientViewModel:PatientViewModel = PatientViewModel.getInstance();
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var allergyViewModel:PatientInputHistoryAllergyViewModel;
		public var medicationPrescriptionViewModel:PatientInputMedicationPrescriptionViewModel;
		public var immunizationViewModel:PatientInputHistoryImmunizationViewModel;
		
		public var patientInputPhysicalViewModel:PatientInputPhysicalViewModel;
		public var patientInputAssessmentViewModel:PatientInputAssessmentViewModel;
		
		protected var inputSoapPop:PatientInputSoapExpandView;
		protected var inputHistoryGuidePop:PatientInputHistoryGuideView;
		protected var inputBillingPop:PatientInputBillingView;
		
		private var visitSignAuthenticationPopUp:VisitSignAuthenticationPopUp;
		
		private var _inputSoapMaximized:Boolean;
		private var _showInputSoap:Boolean;
		private var _showInputHistoryGuide:Boolean;
		private var _inputBillingMaximized:Boolean;
		private var _showInputBilling:Boolean;
		
		public var selectedTabIdx:int = 0; //by default first tab should be selected
		
		public function PatientInputViewModel(useSingleton:Number)
		{
			allergyViewModel = PatientInputHistoryAllergyViewModel.getInstance();
			medicationPrescriptionViewModel = PatientInputMedicationPrescriptionViewModel.getInstance();
			immunizationViewModel = PatientInputHistoryImmunizationViewModel.getInstance();
			
			patientInputPhysicalViewModel = PatientInputPhysicalViewModel.getInstance();
			patientInputAssessmentViewModel = PatientInputAssessmentViewModel.getInstance();
		}
		
		public static function getInstance():PatientInputViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputViewModel(1);
				QIController.getInstance(); 
				QSCommonController.getInstance();
				initQuickInputModel();
			}
			return instance;
		}
		
		public function get inputSoapMaximized():Boolean
		{
			return _inputSoapMaximized;
		}
		
		public function set inputSoapMaximized(value:Boolean):void
		{
			_inputSoapMaximized = value;
			updateInputSoap();
		}
		
		public function get showInputSoap():Boolean
		{
			return _showInputSoap;
		}
		
		public function set showInputSoap(value:Boolean):void
		{
			if (_showInputSoap == value)
			{
				return;
			}
			_showInputSoap = value;
			updateInputSoap(value);
		}
		
		public function get inputBillingMaximized():Boolean
		{
			return _inputBillingMaximized;
		}
		
		public function set inputBillingMaximized(value:Boolean):void
		{
			if(_inputBillingMaximized == value)
			{
				return;	
			}
			
			_inputBillingMaximized = value;
			updateinputBillingPop();
		}

		
		protected function updateInputSoap(loadData:Boolean = false):void
		{
			if (_showInputSoap)
			{
				if (inputSoapPop == null)
				{
					inputSoapPop = new PatientInputSoapExpandView();
				}
				var pop:PatientInputSoapExpandView = inputSoapPop;
				if( loadData )
					pop.LoadSoapNotePreview();
				var app:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
				if (inputSoapMaximized)
				{
					pop.x = 9;//72;
					pop.y = 77;
					pop.width = app.width*0.5 - pop.x - 34;
					pop.height = app.height - pop.y - 60;
				}
				else
				{
					pop.x = 9;//72;
					pop.width = app.width*0.5 - pop.x - 34;
					var container_height:Number = patientViewModel.patientInputContainerHeight; 
					pop.height = container_height - 26;
					pop.y = app.height - pop.height -60;
				}
				PopUpManager.addPopUp(pop, app, false);
			}
			else
			{
				PopUpManager.removePopUp(inputSoapPop);
				inputSoapPop = null;
				inputSoapMaximized = false;
			}
		}
		
		public function visitSignCosign():void
		{
			if (!visitSignAuthenticationPopUp)
				visitSignAuthenticationPopUp = new VisitSignAuthenticationPopUp();
			
			if (model.VisitID)
				visitSignAuthenticationPopUp.visitID = model.VisitID;
			
			visitSignAuthenticationPopUp.originName = QIConstants.QUICK_INPUT_MODULE_NAME;
			visitSignAuthenticationPopUp.onVisitSignCosignCallback = onSuccessfullVisitSave;
			
			visitSignAuthenticationPopUp.ShowPopup(FlexGlobals.topLevelApplication.mainContainer);
		}
		
		public function saveVisit():void
		{
			var mvdEv:MarkValidDataExistsEvent = new MarkValidDataExistsEvent(model.LoggedInUserId,10 ,10,model.LoggedInUserSessionID,model.VisitID,model.VisitDate.toString());
			
			/*mvdEv.visitID = model.VisitID;
			mvdEv.visitDate = model.VisitDate.toString();*/
			mvdEv.functionName = onSuccessfullVisitSave;
			CairngormEventDispatcher.getInstance().dispatchEvent(mvdEv);
		}
		
		public function onSuccessfullVisitSave():void
		{
			showInputSoap = false;
			
			var ev:PatientInputEvent = new PatientInputEvent(PatientInputEvent.REFRESH_PATIENT_ENCOUNTER_LIST, true);
			dispatchEvent(ev);
		}
		
		public function get showInputHistoryGuide():Boolean
		{
			return _showInputHistoryGuide;
		}
		
		public function set showInputHistoryGuide(value:Boolean):void
		{
			if (_showInputHistoryGuide == value)
			{
				return;
			}
			_showInputHistoryGuide = value;
			if (_showInputHistoryGuide)
			{
				inputHistoryGuidePop = new PatientInputHistoryGuideView();
				var pop:PatientInputHistoryGuideView = inputHistoryGuidePop;
				var app:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
				pop.width = app.width*0.5*0.3;
				pop.x = app.width*0.5 - pop.width -32;
				var container_height:Number = patientViewModel.patientInputContainerHeight; 
				pop.height = container_height - 104;
				pop.y = app.height - pop.height -92;
				PopUpManager.addPopUp(pop, app, false);
			}
			else
			{
				if (inputHistoryGuidePop!=null)
				{
					PopUpManager.removePopUp(inputHistoryGuidePop);
					inputHistoryGuidePop = null;
				}
			}
		}
		
		public function get showInputBilling():Boolean
		{
			return _showInputBilling;
		}
		
		public function set showInputBilling(value:Boolean):void
		{
			if (_showInputBilling == value)
			{
				return;
			}
			_showInputBilling = value;
			
			updateinputBillingPop(value);
		}

		protected function updateinputBillingPop(loadData:Boolean = false):void
		{
			if (_showInputBilling)
			{
				inputBillingPop = new PatientInputBillingView();
				var app:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
				inputBillingPop.LoadData();
				if (inputBillingMaximized)
				{
					inputBillingPop.x = 9;//72;
					inputBillingPop.y = 77;
					inputBillingPop.width = app.width*0.5 - inputBillingPop.x - 34;
					inputBillingPop.height = app.height - inputBillingPop.y - 60;
				}
				else
				{
					inputBillingPop.x = 9;//72;
					inputBillingPop.width = app.width*0.5 - inputBillingPop.x - 34;
					var container_height:Number = patientViewModel.patientInputContainerHeight; 
					inputBillingPop.height = container_height - 26;
					inputBillingPop.y = app.height - inputBillingPop.height -60;
				}
				
				inputBillingPop.ShowPopup(app);
			}
			else
			{
				if (inputBillingPop!=null)
				{
					if(SuperBillModelLocator.getInstance().isSupderBillUpdated)
					{
						UtilityFunctions.AskMessage("Super Bill is updated, do you want to discard changes",function(): void
						{						
							//SuperBillModelLocator.getInstance().PatientBalance -= SuperBillModelLocator.getInstance().ENMUsedCharges;
							removeBilling();
							
						},null,function():void { _showInputBilling = true; return; } );	
					}
					else
					{
						removeBilling();
					}
				}
			}
		}
		
		private function removeBilling():void
		{
			var gce:GetVisitChargesEvent =new GetVisitChargesEvent(model.VisitID);
			CairngormEventDispatcher.getInstance().dispatchEvent(gce);
			
			if( inputBillingPop.isPopUp )
				inputBillingPop.removePopup();
			inputBillingMaximized = false;
			inputBillingPop = null;
		}
		
		protected static function initQuickInputModel():void
		{
			QIModelLocator.getInstance().updateModel(597, "Dr. Test User", 597, 3, 
				7, "Test Practice", "Test Station", 1,
				new ObjectProxy(), true, false, QIConstants.GUID_FORMAT);
			
			//LoadStaticData();
		}
		
		// TA -- 
		// Clear All Sections(Array, list, forms etc) of Quick Input on new patien Load
		public function clearOldQuickInputData():void
		{
			model.isVisitCreated = false;
			// PMH - Allergy Section////////////////////
			if (model.QIAllergyDTOList)
				model.QIAllergyDTOList.removeAll();
			if (model.gaxenIDSaved == true)
				model.gaxenIDSaved = false;
			
			model.gaxenID = '0';
			
			if (model.AllergyList)			// clear allergy name list
				model.AllergyList.removeAll();
			
			//PMH - Immunization ////////////////////////
			if (model.immunizationDTOList)
				model.immunizationDTOList.removeAll();
			else
				model.immunizationDTOList = new ArrayCollection();
			
			//PMH - Comprehensive ////////////////////////[05/28/2013]by Shahid Munir
			if (model.GeneralHistoryList)
				model.GeneralHistoryList.removeAll();
			else
				model.GeneralHistoryList = new ArrayCollection();
			
			if(model.FamilyHistoryList)
				model.FamilyHistoryList.removeAll();
			else
				model.FamilyHistoryList = new ArrayCollection();
			
			medicationPrescriptionViewModel.clearMedicationPrescriptionData();
			patientInputPhysicalViewModel.clearPhysicalTabData();
			patientInputAssessmentViewModel.clearAssessmentTabData();
			
			SuperBillModelLocator.getInstance().PatientBalance = 0.00;
			if (inputBillingPop!=null)
			{
				removeBilling();
				showInputBilling = false;
			}
			
			model.ShowDiabeticControl = false;
			
			clearInputDictationNote();
			
			model.isAtRegGaxenID 	= false;
			model.patientDTO 		= null;
			model.visitCount		= 0;
			model.EncounterID       = '';
			
			if(showInputSoap) //close soap note
				showInputSoap = false;
			if(showInputHistoryGuide) //close GUIDE
				showInputHistoryGuide = false;
			if(showInputBilling) //close Billing
				showInputBilling = false;
		}
		
		public function clearPHMTabData():void
		{
			
		}
		private function clearInputDictationNote():void
		{
			if( null != model.moduleNotes )
				model.moduleNotes.removeAll();
			
			if( null != model.moduleDictationList )
				model.moduleDictationList.removeAll();
			
			allergyViewModel.clearAllergySectionDictationNote();
			medicationPrescriptionViewModel.clearMedicationPrescriptionData();
		}
		
		// TA -- Create Visit --///////////////////////////////////////////
		public function createVisit():void
		{
			var createDate:Date 				= new Date();
			var df:DateFormatter 				= new DateFormatter();
			df.formatString						= 'MM/DD/YYYY';
			
			var visit:VisitDTO 					= new VisitDTO(	model.patientDTO.ID,
				model.LoggedInUserId,
				model.userSelectedRoleDTO.UserTypeRole.UserTypeId,
			10,
			0,
			model.LoggedInUserSelectedStationID,
			model.placeOfServiceID ,
			model.LoggedInUserId,
			createDate,
			createDate,
			model.LoggedInUserSelectedBranchId);
			
			model.VisitDate = createDate;//for future use in QI
			
			var cve:CreateVisitEvent = new CreateVisitEvent(visit, onCreateVisitEvent);
			CairngormEventDispatcher.getInstance().dispatchEvent( cve ); 
		}
		
		public function loadPhysicalTabData():void
		{
			patientInputPhysicalViewModel.loadPhysicalTabData();
		}
		
		public function loadAssessmentTabData():void
		{
			patientInputAssessmentViewModel.loadAssessmentTabData();
		}
		
		public function manageModuleNotes(notesDTO:ModuleNoteDTO, sectionName:String = "", callBack:Function = null):void
		{
			var ev: ManageModuleNotesEvent = new ManageModuleNotesEvent(notesDTO, sectionName,model.LoggedInUserId,model.LoggedInUserSessionID,callBack);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
				
		/////// Call back method for CreateVisitEvent ////////
		private function onCreateVisitEvent(val:*=null):void
		{
			selectedTabIdx = 0; //on creating the new visit, history tab should be selected.
			
			model.isVisitCreated 	= true;// Visit create Successfully
			
			loadCompHistoryImmunizationData();
			
			if (model.patientDTO.GAXENID != '' && model.patientDTO.GAXENID != "0")
			{
				model.gaxenIDSaved = true;
				
				loadAllergyMedicationAndPrescriptionData(); //Load PMH Section Visits Data
			}
			
			loadPMHStaticData();						// Load PMH Static data
			loadAssessmentStaticData();
			
			loadVisistModuleTypes();
			loadAllModuleDictationNotes();
			
			/**
			 *Different patient has been loaded then all three tabs data should be refreshed according to newly loaded patient
			 */
			patientInputPhysicalViewModel.refreshPhysicalData = true;
			patientInputAssessmentViewModel.refreshAssessmentData = true;
		}
		///// TA -- Call from Exambar when New patient is selected after Search -- LOAD PMH SECTION DATA ////
		private function loadCompHistoryImmunizationData():void
		{
			loadCompHistory();							// Load Comprehensive History
			loadImmunization();							// Load Immunization
		}
		
		private function loadAllergyMedicationAndPrescriptionData():void
		{
			allergyViewModel.loadPatientAllergyList();							// Load Allergies
			medicationPrescriptionViewModel.loadMedicationPrescription();// Load Chronic Medication and Prescription
		}
		/////////// TA-  Call from Exambar when New patient is selected after Search /////////////////////////
		private function loadCompHistory():void
		{
			//General History
			var loadMedicalHistoryByPatientIdEvent:LoadMedicalHistoryByPatientIdEvent = new LoadMedicalHistoryByPatientIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( loadMedicalHistoryByPatientIdEvent );
			
			//Family Hitory
			var loadFamilyHistoryByPatientIdEvent:LoadFamilyHistoryByPatientIdEvent = new LoadFamilyHistoryByPatientIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( loadFamilyHistoryByPatientIdEvent );
			
			//Social History
			var loadSocialHistoryEvent : LoadSocialHistoryByPatientIdEvent = new LoadSocialHistoryByPatientIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( loadSocialHistoryEvent );
		}
		
		// Shahid Munir 
		private function ComhensiveHistoryStaticDataResult(listOfLists:ArrayCollection):void
		{
			if(listOfLists && listOfLists.length)
			{
				model.GeneralHistoryTypeDTOList = listOfLists[0];
				model.FamilyHistoryTypeDTOList = listOfLists[1];
				model.SocialHistoryAddictionTypeDTOList = listOfLists[2];
				model.usageAmountTypeDTOList = listOfLists[3];
				model.historyMediumTypesDTOList = listOfLists[4];
			}
		}
		
		/////////// TA-  Call from Exambar when New patient is selected after Search /////////////////////////
		public function loadImmunization():void
		{
			immunizationViewModel.loadPatientImmunizationByVisitId();
		}
		private function loadPMHStaticData():void
		{
			//var loadMedicalHistoryByPatientIdEvent:LoadMedicalHistoryByPatientIdEvent = new LoadMedicalHistoryByPatientIdEvent();
			//CairngormEventDispatcher.getInstance().dispatchEvent( loadMedicalHistoryByPatientIdEvent );
			
			if(!model.heartDiseaseDiseaseTypesDTOList.length){
				var eve:LoadDiseaseTypesEvent = new LoadDiseaseTypesEvent(LoadDiseaseTypesEvent.HEART_DISEASE);
				CairngormEventDispatcher.getInstance().dispatchEvent(eve);
			}
			
			if(!model.hypertensionDiseaseTypesDTOList.length){
				var ht:LoadDiseaseTypesEvent = new LoadDiseaseTypesEvent(LoadDiseaseTypesEvent.HYPERTENSTION);
				CairngormEventDispatcher.getInstance().dispatchEvent(ht);
			}
			
			if(!model.diabetesDiseaseTypesDTOList.length){
				var DBT:LoadDiseaseTypesEvent = new LoadDiseaseTypesEvent(LoadDiseaseTypesEvent.DIABTESASE);
				CairngormEventDispatcher.getInstance().dispatchEvent(DBT);
			}
			
			if(!model.cancerDiseaseTypesDTOList.length)	{
				var CD:LoadDiseaseTypesEvent = new LoadDiseaseTypesEvent(LoadDiseaseTypesEvent.CANCER);
				CairngormEventDispatcher.getInstance().dispatchEvent(CD);
			}
			
			if(!model.otherDiseaseTypesDTOList.length) {
				var oth:LoadDiseaseTypesEvent = new LoadDiseaseTypesEvent(LoadDiseaseTypesEvent.OTHER);
				CairngormEventDispatcher.getInstance().dispatchEvent(oth);
			}
			
			if(!model.RelationShipTypeList.length){
				var BR:LoadAllBloodRelationShipTypeDTOEvent = new LoadAllBloodRelationShipTypeDTOEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(BR);
			}
			
			/// Load Unsigned Visits List
			var lPVE: LoadPatientVisitsEvent = new LoadPatientVisitsEvent(model.patientDTO.ID.toString(), model.LoggedInUserSelectedBranchId.toString(), onLoadPatientVisitsEvent);				
			CairngormEventDispatcher.getInstance().dispatchEvent(lPVE);
			/// Load immuninzation Static list for immunization Type
			var lISE:LoadImmunicationStaticDataEvent = new LoadImmunicationStaticDataEvent('temp', QIConstants.TYPE_SELECT_TYPE);
			CairngormEventDispatcher.getInstance().dispatchEvent(lISE);
			
			//[05/28/2013] by Shahid Munir
			if(model.LoggedInUserId)
			{
				var lcsd:LoadComhensiveHistoryStaticDataEvent = new LoadComhensiveHistoryStaticDataEvent(model.LoggedInUserSessionID,ComhensiveHistoryStaticDataResult);  
				CairngormEventDispatcher.getInstance().dispatchEvent( lcsd );
			}
		}
		
		private function loadAssessmentStaticData():void
		{
			patientInputAssessmentViewModel.loadAssessmentStaticData();
		}
		
		private function loadVisistModuleTypes():void
		{
			var ev:LoadVisitModuleTypesEvent = new LoadVisitModuleTypesEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		private function loadAllModuleDictationNotes():void
		{
			allergyViewModel.initializeAllergyInputSectionNotes();
			var ev:LoadModuleDictationNoteByPatientIDEvent = new LoadModuleDictationNoteByPatientIDEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		/////////// on LoadPatientVisitsEvent /////////
		public function onLoadPatientVisitsEvent(response:XML):void
		{
			var visitArray:ArrayCollection = new ArrayCollection();
			var response:XML = AppUtils.removeDefaultNamespaceFromXML(response);
			visitArray.removeAll();
			
			
			for(var i:uint=0; i<response.Visits.PatientVisitDTO.length(); i++)
			{
				var VisitDateLbl:String = AppUtils.formatDate(response.Visits.PatientVisitDTO[i].VisitDate.toString());
				var VisitDate:String = response.Visits.PatientVisitDTO[i].VisitDate.toString();
				var VisitID:String = response.Visits.PatientVisitDTO[i].VisitID.toString();
				visitArray.addItem({VisitDate:VisitDate, VisitID:VisitID, VisitDateLbl:VisitDateLbl});
			}
			
			if(visitArray.length > 0)
				model.patientDiagnosisAllChronicTemplateAvailable = true;
			else
				model.patientDiagnosisAllChronicTemplateAvailable = false;
			
			if(response.VisitCount)// TA - Get the number of visit saved against this patient
				model.visitCount = response.VisitCount;
			
			model.unSignedVisitDates = visitArray;
		}
		
		/**
		 * return a list of strings, each string is a name of a view that has unsaved data
		 **/
		public function getDirtyViewList():ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection();
			var allergy_view_model:PatientInputHistoryAllergyViewModel = PatientInputHistoryAllergyViewModel.getInstance();
			if (allergy_view_model.dirty)
			{
				result.addItem("Patient History Allergy");
			}
			return result;
		}
		
		public function resetDirtyViewList():ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection();
			var allergy_view_model:PatientInputHistoryAllergyViewModel = PatientInputHistoryAllergyViewModel.getInstance();
			allergy_view_model.dirty = false;
			return result;
		}
	}
}