package com.gazuntite.input.view.inputsections.history.allergy
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.dto.pmh.Allergy.AllergyDTO;
	import com.gazuntite.common.event.QSAllergyEvent;
	import com.gazuntite.common.event.SavePatientGaxenIdEvent;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIUtilityFunctions;
	import com.gazuntite.input.utils.SortType;
	import com.gazuntite.utils.UtilityFunctions;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.managers.CursorManager;
	
	import spark.collections.Sort;
	import spark.formatters.DateTimeFormatter;
	
	[Bindable]
	public class PatientInputHistoryAllergyViewModel
	{
		protected static var instance:PatientInputHistoryAllergyViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var allergyView:AllergyInputView;
		
		public var dirty:Boolean = false;
		public var patientInputModel:QIModelLocator = QIModelLocator.getInstance();
		public var newAllergyDto:AllergyDTO;
		public var NKDARecord:AllergyDTO;
		
		public var newAllergyInputDictationNoteViewModel:PatientDictationNoteViewModel;
		public var allergyDictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineAllergyInputDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public var notesDTO:ModuleNoteDTO;
		public var doClearAllergyDictationNote:Boolean;
		
		//M:13Nov2013
		[Bindable]
		public var dictationDTO:ModuleDictationDTO;
		
		protected var formatDateTime:DateTimeFormatter = new DateTimeFormatter();
		
		public function PatientInputHistoryAllergyViewModel(useSingleton:Number = 1)
		{
			newAllergyDto = new AllergyDTO;
			formatDateTime.dateTimePattern 	= "MM/DD/YYYY";
			
			newAllergyInputDictationNoteViewModel = new PatientDictationNoteViewModel();
			
			allergyDictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineAllergyInputDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineAllergyInputDictationNoteViewModel.inlineEditing = true;
			
			if(notesDTO)
				notesDTO = QIUtilityFunctions.getModuleNoteDTO(QIConstants.ALLERGY_MODULE_NAME);
			
			dictationDTO = QIUtilityFunctions.getModuleDictationDTO(QIConstants.ALLERGY_MODULE_NAME);
			
		}
		
		public static function getInstance():PatientInputHistoryAllergyViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputHistoryAllergyViewModel();
			}
			return instance;
		}
		
		public function loadPatientAllergyList():void
		{
			var evt : QSAllergyEvent = new QSAllergyEvent(QSConstants.ALLERGY_CALL_TYPE_LOAD_PATIENT, model.patientDTO.GAXENID, callBackAllergy);
			CairngormEventDispatcher.getInstance().dispatchEvent(evt);
		}
		
		public function loadPatientAllergyListCallBack(allergyDtoList:ArrayCollection):void
		{
			patientInputModel.QIAllergyDTOList = allergyDtoList;
			
			for (var ser:Number = 1; ser <= model.QIAllergyDTOList.length; ser++)
			{
				var allergy:AllergyDTO = model.QIAllergyDTOList.getItemAt(ser) as AllergyDTO;
				allergy.seriesNumber = ser;
			}
			
			if (model.QIAllergyDTOList.length > 0)
			{					
				var allergyDto:AllergyDTO = new AllergyDTO();
				allergyDto = model.QIAllergyDTOList.getItemAt(0) as AllergyDTO;
				//TA - Set Third Section data && NKDA LAbel Flag
				
				if (!allergyDto.isNKDA)
				{
					model.AllergyNKDAFlag 	= false;
				}
				else if(allergyDto.isNKDA)
				{
					model.AllergyNKDAFlag 	= true;
				}
			}
		}
		
		//-- Save Allergy Record ----------------------------------------------
		public function savePatientAllergy(saveAllergyDTO:AllergyDTO):void
		{
			if (saveAllergyDTO.isNKDA)
			{
				if (patientInputModel.QIAllergyDTOList.length == 1 &&  (patientInputModel.QIAllergyDTOList[0] as AllergyDTO).isNKDA)
				{
					UtilityFunctions.ShowMessage("The existing entry is already NKDA.", "Duplicate Entry");
					return;
				}
				else if (patientInputModel.QIAllergyDTOList.length >= 1 && !(patientInputModel.QIAllergyDTOList[0] as AllergyDTO).isNKDA)
				{
					Alert.show("Are you sure, you want to remove all existing allergies?","Confirmation", 
						Alert.YES|Alert.NO, 
						FlexGlobals.topLevelApplication.mainContainer, 
						function(event:CloseEvent):void
						{
							if (event.detail == Alert.YES)
							{
								var patientAllergyIDs:String = "";
								for each (var ad:AllergyDTO in patientInputModel.QIAllergyDTOList) 
								{
									patientAllergyIDs += ",'" + ad.GaxenAllergyID + "'";
								}								
								
								var IDsXml:XML = <DeleteAllergies  />
								IDsXml.@GaxenAllergyIDS = patientAllergyIDs.substring(1);
								NKDARecord = new AllergyDTO();
								NKDARecord = saveAllergyDTO;
								callQSAllergyEvent(4, IDsXml, deleteStatus);
							}
							else if (event.detail == Alert.NO)
							{
								return;
							}
							
						});
				}
				else 
				{
					callQSAllergyEvent(3, saveAllergyDTO.ToXML(), saveStatus);
				}
			}
			else
			{					
				if (saveAllergyDTO.onSetDate == null)
				{
					UtilityFunctions.ShowMessage("Please enter OnSet date.", "Invalid Data");
					return;						
				}
				
				if (saveAllergyDTO.AllergyName == null || saveAllergyDTO.AllergyName == "")
				{
					Alert.show("Please select Allergy.", "Required field", Alert.OK, FlexGlobals.topLevelApplication.mainContainer);
					return;
				}
				
				if (patientInputModel.gaxenID == null)
					patientInputModel.gaxenID = "";
				
				saveAllergyDTO.GaxenPatientID = patientInputModel.patientDTO.GAXENID;
				
				if (saveAllergyDTO.Reaction == null)
					saveAllergyDTO.Reaction = "";
				
				saveAllergyDTO.modNotesID = 0;
				saveAllergyDTO.modDictationID = 0;
				saveAllergyDTO.DictationID = QIConstants.GUID_FORMAT;
				
				saveAllergyDTO.GaxenUserID = model.LoggedInUserGaxenID;
				
				saveAllergyDTO.VisitDate = formatDateTime.format((new Date()).toString());
				saveAllergyDTO.LastName = patientInputModel.patientDTO.LastName;
				saveAllergyDTO.FirstName = patientInputModel.patientDTO.FirstName;
				saveAllergyDTO.Gender = patientInputModel.patientDTO.Gender.substring(0,1);
				saveAllergyDTO.DOB = patientInputModel.patientDTO.DOB;
				saveAllergyDTO.Phone = "";
				saveAllergyDTO.Address = "";
				saveAllergyDTO.ClinicID ="sad";
				saveAllergyDTO.UserName = "TESTUSER";
				saveAllergyDTO.UserPassord = "TESTPASS";
				saveAllergyDTO.SSN = patientInputModel.patientDTO.SSN; 
				
				callQSAllergyEvent(3, saveAllergyDTO.ToXML(), saveStatus);
			}
		}
		//--TA - Call Allergy Event
		private function callQSAllergyEvent(param1:int, param2:*, param3:Function = null):void
		{
			var alEvent : QSAllergyEvent = new QSAllergyEvent(param1, param2, param3);
			CairngormEventDispatcher.getInstance().dispatchEvent( alEvent ); 
		}
		//------------------ saveStatus mehod ----------------------------------------------------
		private function saveStatus(response:XML):void
		{
			var msg:String     						= response.@Description;
			var status:String  						= response.@status;
			patientInputModel.gaxenID 	   			= response.@GaxenPatientID;
			patientInputModel.patientDTO.GAXENID 	= response.@GaxenPatientID;
			
			if(status == "false" || status == "0" )
			{
				var alert:Alert = Alert.show(msg, "Allergy Status", 4, FlexGlobals.topLevelApplication.mainContainer);	
				return;
			}
			else
			{
				dirty = false;
				if((patientInputModel.gaxenID && patientInputModel.gaxenID != "0") && (patientInputModel.patientDTO.ID.toString() != '' && patientInputModel.patientDTO.ID.toString() != '0') && patientInputModel.gaxenIDSaved == false )
				{
					var gEvent : SavePatientGaxenIdEvent = new SavePatientGaxenIdEvent(patientInputModel.patientDTO.UserID.toString(), patientInputModel.gaxenID ,callbackSavePatientGaxenIdEvent);					
					CairngormEventDispatcher.getInstance().dispatchEvent( gEvent ); 
				}
				
				if(UtilityFunctions.IsNotNullOrEmpty(patientInputModel.gaxenID))
				{
					callQSAllergyEvent(2, patientInputModel.gaxenID, callBackAllergy);
				}
				newAllergyDto = new AllergyDTO();
				newAllergyDto.validate();
			}
			
			CursorManager.removeBusyCursor();
		}
		// -------------------delete status method ----------------------------------------
		private function deleteStatus(response:XML):void
		{
			var msg:String = response.@Description;
			var status:String = response.@status;
			
			if(status == "false" || status == "0" )
			{
				var alert:Alert = Alert.show(msg, "Allergy Status", 4, FlexGlobals.topLevelApplication.mainContainer);	
				return;
			}
			else
			{
				callQSAllergyEvent(3, NKDARecord.ToXML(), saveStatus); 		
			}
			CursorManager.removeBusyCursor();
		}
		// ---------------- Call Back of SavePatientGaxenIdEvent------------------------------ 
		private function callbackSavePatientGaxenIdEvent(val:Boolean):void
		{
			patientInputModel.isAtRegGaxenID = true;
			patientInputModel.gaxenIDSaved 	 = true;
			
			if (patientInputModel.isAtRegGaxenID)
			{
				patientInputModel.gaxenIDSaved 			= false;
				patientInputModel.newRegGaxenID 		= '';
			}
		}
		
		private function callBackAllergy(arrAllergy:ArrayCollection):void
		{
			if(patientInputModel.QIAllergyDTOList)
				patientInputModel.QIAllergyDTOList.removeAll();
			else
				patientInputModel.QIAllergyDTOList = new ArrayCollection();
			
			patientInputModel.QIAllergyDTOList.addAll(arrAllergy);
			
			if (patientInputModel.QIAllergyDTOList.length>0)
			{
				for (var ser:Number = 0; ser<patientInputModel.QIAllergyDTOList.length; ser++)
				{
					var allergy:AllergyDTO = patientInputModel.QIAllergyDTOList.getItemAt(ser) as AllergyDTO;
					allergy.seriesNumber = ser+1;
				}
			}
			
			if (patientInputModel.QIAllergyDTOList.length > 0)
			{					
				var allergyDto:AllergyDTO = new AllergyDTO();
				allergyDto			= patientInputModel.QIAllergyDTOList.getItemAt(0) as AllergyDTO;
				
				if (!allergyDto.isNKDA)
				{
					patientInputModel.AllergyNKDAFlag 	= false;
				}
				else if(allergyDto.isNKDA)
				{
					patientInputModel.AllergyNKDAFlag 	= true;
				}
			}				
		}
		
		public function sortAllergyList(sortType:String):void
		{
			/*temp block the function , Author : MM*/
			return;
			
			var field_name:String = null;
			switch (sortType)
			{
				case SortType.RECENTLY_ADDED:
					field_name = "seriesNumber";
					break;
				case SortType.ALLERGY_NAME:
					field_name = "AllergyName";
					break;
				default:
					Alert.show("Sort type not supported - "+sortType, "Error");
					break;
			}
			
			if (field_name!=null)
			{
				var dataSortField:SortField = new SortField();
				dataSortField.name = field_name;
				//M
				if(field_name == "seriesNumber")
				{
					dataSortField.numeric = true;
				}
				else
				{
					dataSortField.numeric = false;
				}
				var dataSort:Sort = new Sort();
				dataSort.fields = [dataSortField];
				patientInputModel.QIAllergyDTOList.sort = dataSort;
				patientInputModel.QIAllergyDTOList.refresh();
			}
		}
		
		public function clearAllergySectionDictationNote():void
		{
			if (!notesDTO)
				return;
			
			notesDTO.Note = "";
		}
		
		public function initializeAllergyInputSectionNotes():void
		{
			notesDTO = QIUtilityFunctions.getModuleNoteDTO(QIConstants.ALLERGY_MODULE_NAME);
		}
	}
}