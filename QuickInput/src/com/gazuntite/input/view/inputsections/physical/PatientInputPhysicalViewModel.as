package com.gazuntite.input.view.inputsections.physical
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.event.visit.physical.physical.LoadPhysicalsByPatientIdPagedEvent;
	import com.gazuntite.input.event.visit.physical.ros.LoadROSByPatientIdPagedEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIUtilityFunctions;
	import com.gazuntite.input.view.inputsections.physical.chiefcomplaint.PatientInputPhysicalChiefComplaintViewModel;
	import com.gazuntite.input.view.inputsections.physical.inhouselab.PatientInputPhysicalInHouseLabViewModel;
	import com.gazuntite.input.view.inputsections.physical.vitals.PatientInputPhysicalVitalsViewModel;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class PatientInputPhysicalViewModel
	{
		public var selectedViewLabel:String;
		public var refreshPhysicalData:Boolean;
		public var isPhysicalTabSelected:Boolean;
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var vitalsViewModel:PatientInputPhysicalVitalsViewModel = PatientInputPhysicalVitalsViewModel.getInstance();
		public var ccHpiViewModel:PatientInputPhysicalChiefComplaintViewModel = PatientInputPhysicalChiefComplaintViewModel.getInstance();
		public var inHouseLabViewModel:PatientInputPhysicalInHouseLabViewModel = PatientInputPhysicalInHouseLabViewModel.getInstance();
		
		//[06/13/2013] Shahid Munir
		public var patientInputPhysicalVitalsViewModel:PatientInputPhysicalVitalsViewModel = PatientInputPhysicalVitalsViewModel.getInstance();

		protected static var instance:PatientInputPhysicalViewModel;
		public function PatientInputPhysicalViewModel(useSingleton:Number)
		{
		}
		public static function getInstance():PatientInputPhysicalViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputPhysicalViewModel(1);
			}
			return instance;
		}
		
		public function loadPhysicalTabData():void
		{
			if (refreshPhysicalData)
			{
				refreshPhysicalData = false;
				
				ccHpiViewModel.loadChiefComplaintHpi();
				inHouseLabViewModel.loadInHouseLabs();
				
				//[06/13/2013] Shahid Munir
				patientInputPhysicalVitalsViewModel.loadPatientVitals();
				
				LoadROSByPatientId();
				LoadPhysicalsByPatientId();
			}
		}
	
		public function clearPhysicalTabData():void
		{
			vitalsViewModel.clearVitals();
			ccHpiViewModel.clearChiefComplaintHpi();
			inHouseLabViewModel.clearInHouseLabs();
			
			clearROS();
			clearPhysicals();
		}
		
		public function loadPhysicalStaticData():void
		{
		}
		
		
		///////////////////////////// Review of System ////////////////////
		
		public function LoadPhysicalsByPatientId():void
		{
			if (UtilityFunctions.IsNullOrEmpty(model.physicalsCurrentPageByPatient))
			{
				model.physicalsCurrentPageByPatient = new PageDTO();
				//QIUtilityFunctions.setNoPagingAndFiltering(model.physicalsCurrentPageByPatient);
				model.physicalsCurrentPageByPatient.pageSize = 500;
			}
			
			var lpe:LoadPhysicalsByPatientIdPagedEvent = new LoadPhysicalsByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(lpe); 
		}
		
		public function LoadROSByPatientId():void
		{
			if (UtilityFunctions.IsNullOrEmpty(model.rosCurrentPageByPatient))
			{
				model.rosCurrentPageByPatient = new PageDTO();
				//QIUtilityFunctions.setNoPagingAndFiltering(model.rosCurrentPageByPatient);
				model.rosCurrentPageByPatient.pageSize = 500;
			}
			
			var lros:LoadROSByPatientIdPagedEvent = new LoadROSByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(lros); 
		}
		
		
		public function clearROS():void
		{
			var model:QIModelLocator = QIModelLocator.getInstance();
			if( null != model.rosHistoryDTOList )
				model.rosHistoryDTOList.removeAll();
		}
		
		public function clearPhysicals():void
		{
			var model:QIModelLocator = QIModelLocator.getInstance();
			if( null != model.physicalHistoryDTOList )
				model.physicalHistoryDTOList.removeAll();
		}
		
		///////////////////////////// Review of System ////////////////////
	}
}