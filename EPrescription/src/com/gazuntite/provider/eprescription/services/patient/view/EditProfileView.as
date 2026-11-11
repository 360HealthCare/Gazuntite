//----- ActionScript file for EditProfileView ----------------
import com.adobe.cairngorm.control.CairngormEventDispatcher;
import com.gazuntite.common.event.LoadAllInsuranceEvent;
import com.gazuntite.common.event.provider.GetSpecialityEvent;
import com.gazuntite.common.util.xml.XmlUtils;
import com.gazuntite.common.view.components.PhoneNumberAddMoreTitleWindow;
import com.gazuntite.provider.eprescription.services.patient.dto.billing.ProviderInsuranceDTO;
import com.gazuntite.provider.eprescription.services.patient.event.LoadClinicUsersBasicInfoEvent;
import com.gazuntite.provider.eprescription.services.patient.event.LoadPrescriberbyGaxenIDEvent;
import com.gazuntite.provider.eprescription.services.patient.event.SaveAddressEvent;
import com.gazuntite.provider.eprescription.services.patient.event.UpdateGaxenIDEvent;
import com.gazuntite.provider.eprescription.services.patient.event.UpdateSubscribedUserEvent;
import com.gazuntite.provider.eprescription.services.patient.event.UpdateUserEvent;
import com.gazuntite.provider.eprescription.services.patient.event.UpdateUserPasswordbyPostEvent;
import com.gazuntite.provider.eprescription.services.patient.event.billing.GetProviderInsuranceEvent;
import com.gazuntite.provider.eprescription.services.patient.event.billing.ManageProviderInsuranceEvent;
import com.gazuntite.provider.eprescription.services.patient.event.loadServicelevelsEvent;
import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
import com.gazuntite.provider.eprescription.services.patient.util.AppUtils;
import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
import com.gazuntite.provider.eprescription.services.patient.view.events.DataGridActionEvent;
import com.gazuntite.provider.eprescription.services.patient.view.views.billing.ProviderInsuranceID;
import com.gazuntite.utils.UtilityFunctions;
import com.gazuntite.utils.ValidationUtils;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.geom.Point;
import flash.net.FileFilter;
import flash.utils.ByteArray;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.core.FlexGlobals;
import mx.events.CloseEvent;
import mx.managers.PopUpManager;

import spark.components.CheckBox;
import spark.events.IndexChangeEvent;
import spark.events.TextOperationEvent;

private var _EmailAddress:String;
private var _userID:int;
private var _Heading:String;
private var _ProviderName:String;
private var _clinicBranchID:int;

private var _userSessionStatus:String;
public var eusername:String;
public var epassword:String;
private var securityHeaderXML:XML;
private var providerInsuranceDeletedList:ArrayCollection = new ArrayCollection();
private var serviceLevels:String;
private var m_oPhoneNumbers:ArrayCollection;
private var phoneNumberAddMorePopUp:PhoneNumberAddMoreTitleWindow;
private var personalPhoneNumbers:ArrayCollection;
private var userStatus:String = "";
private var m_bLoggedInUserIsProvider:Boolean;
private var m_bLoggedInUserTypeID:int;
private var fileToOpen:File = new File();
private var SPI:String;
public var original_NPI:String;
private var strSpecialityID:String;
private var specialityArrayCol:ArrayCollection;
private var isSaveAllCase:Boolean = false;
private var isDisableServiceLevelSelected:Boolean = false;//--- property is used at saveAll method cal time chck whether disable selected as service level.
public var recGuid:String;

[Bindable] private var SSNIDValue:String ='';
[Bindable] private var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
[Bindable] private var m_oImageContent:ByteArray;
[Bindable] private var m_oImageContentString:String;
[Bindable] public var genderType:ArrayCollection = new ArrayCollection([
	{ label:"Male", data:"Male"},
	{ label:"Female", data:"Female" },
	{ label:"Undifferentiated", data:"Undifferentiated" } ]);
[Bindable] public var prefixType:ArrayCollection = new ArrayCollection([
	{ PrefixName:"Mr", data:"Mr", PrefixID:"1"},
	{ PrefixName:"Mrs.", data:"Mrs.", PrefixID:"3"  },
	{ PrefixName:"Ms.", data:"Ms.", PrefixID:"2" } ]);
[Bindable] public var SpecialityTypes:ArrayCollection = new ArrayCollection([
	{ BitValue:"1", label:"Mail Order Pharmacy"},
	{ BitValue:"2", label:"Fax Pharmacy"},
	{ BitValue:"4", label:"Prescriber is used for Medication Reconciliation"},
	{ BitValue:"8", label:"Retail Pharmacy"},
	{ BitValue:"16", label:"Specialty Pharmacy"},
	{ BitValue:"32", label:"Long-Term Care Pharmacy"},
	{ BitValue:"64", label:"24 Hour Pharmacy"},
	{ BitValue:"128", label:"Prescriber is Doctor"},
	{ BitValue:"256", label:"Prescriber is Physician Assistant"},
	{ BitValue:"512", label:"Prescriber is Nurse Practitioner"},
	{ BitValue:"1024", label:"Prescriber is Resident"},
	{ BitValue:"2048", label:"Prescriber is an In-Store Clinic"}]
);

//----------------------------- Getter Setter - Start -----------------------------
[Bindable]
public function get LoggedInUserTypeID() : int {
	return m_bLoggedInUserTypeID;
}  			
public function set LoggedInUserTypeID(value:int) : void  {
	m_bLoggedInUserTypeID = value;
} 
[Bindable]
public function get LoggedInUserIsProvider() : Boolean  {
	return m_bLoggedInUserIsProvider;
}  			
public function set LoggedInUserIsProvider(value:Boolean) : void  {
	m_bLoggedInUserIsProvider = value;
} 
[Bindable]
public function get PhoneNumberTypes():ArrayCollection {
	return m_oPhoneNumbers;
}
public function set PhoneNumberTypes(value:ArrayCollection):void{
	m_oPhoneNumbers = value;
}
[Bindable]
public function get ProviderName():String {
	return _ProviderName;
}
public function set ProviderName(value:String):void	{
	_ProviderName = value;
	_ProviderName = '';
	
	if(model.SearchProviderDetailsResults.FirstName.length>0)
		_ProviderName = model.SearchProviderDetailsResults.FirstName;
	
	if(model.SearchProviderDetailsResults.MiddleName.length>0)
		_ProviderName = _ProviderName +' '+model.SearchProviderDetailsResults.MiddleName;
	
	if(model.SearchProviderDetailsResults.LastName.length>0)
		_ProviderName = _ProviderName +' '+model.SearchProviderDetailsResults.LastName;
	if(model.SearchProviderDetailsResults.PrefixTypeID.length>0)
	{
		if(model.SearchProviderDetailsResults.PrefixTypeID == '1')
			_ProviderName ='Mr. '+ _ProviderName;
		if(model.SearchProviderDetailsResults.PrefixTypeID == '2')
			_ProviderName ='Ms. '+ _ProviderName;
		if(model.SearchProviderDetailsResults.PrefixTypeID == '3')
			_ProviderName ='Mrs. '+ _ProviderName;
	}
}
[Bindable]
public function get Heading():String {
	return _Heading;
}
public function set Heading(value:String):void {
	_Heading = value;
}
[Bindable]
public function get clinicBranchID():int {
	return _clinicBranchID;
}
public function set clinicBranchID(value:int):void {
	_clinicBranchID = value;
}
[Bindable]
public function get userID():int {
	return _userID;
}
public function set userID(value:int):void {
	_userID = value;
}

//----------------------------- Getter Setter - End -----------------------------

// ----------------------------- Creation complete Handler ---------------------------
protected function creationCompleteHandler():void
{
	loadInsurances(); // by shahid, for EDI detail
	id_tab_billing.hasChange = true;
	
	id_LicenseNo.enabled 	= id_chkBillingProvider.selected;
	id_UPIN.enabled 		= id_chkBillingProvider.selected;
	id_TPI.enabled 			= id_chkBillingProvider.selected;
	id_EIN.enabled 			= id_chkBillingProvider.selected;
	//Billing
	id_CLIA.enabled			    = id_chkBillingProvider.selected;
	id_chkSignature.enabled	    = id_chkBillingProvider.selected;
	id_SignDate.enabled			= id_chkBillingProvider.selected;
	id_chkParticipating.enabled	= id_chkBillingProvider.selected;
	id_chkHospiceEmp.enabled	= id_chkBillingProvider.selected;
	id_chkStopSubmission.enabled= id_chkBillingProvider.selected;
	
	securityHeaderXML	 			= <Header />;					
	securityHeaderXML.@EUserName	= eusername;
	securityHeaderXML.@EPassword	= epassword;
	securityHeaderXML.@ClinicID		= "sad";
	//------TA ---Load Speciality static service calls --------------
	var getSpeciality: GetSpecialityEvent = new GetSpecialityEvent(specialityLoaded);				
	getSpeciality.data = securityHeaderXML; 				
	CairngormEventDispatcher.getInstance().dispatchEvent(getSpeciality);
	// -----TA ------  GetProviderInsuranceEvent service call -----------------------
	var pvInsEventt: GetProviderInsuranceEvent = new GetProviderInsuranceEvent(userID,clinicBranchID);
	CairngormEventDispatcher.getInstance().dispatchEvent(pvInsEventt);
	
	//-----------TA - for view mode-----------------------
	id_workdaysAddMore.isViewMode 	= true;
	id_NPI.enabled 					= id_chkProvider.selected;
	id_speciality.enabled 			= id_chkProvider.selected;
	
	id_prescriberAgents.enabled  = id_chkPrescriberAgent.selected;
	id_PvInsGrid.addEventListener(DataGridActionEvent.EDIT_RECORD_CLICK, editProviderInsurance, false, 0, true);
	id_PvInsGrid.addEventListener(DataGridActionEvent.DELETE_RECORD_CLICK, deleteProviderInsurance, false, 0, true);
}
//----------------------------- Load insurance -----------------------------
private function loadInsurances():void
{				
	if(model.InsuranceOrganizationList == null || model.InsuranceOrganizationList.length == 0)
	{
		var lie:LoadAllInsuranceEvent = new LoadAllInsuranceEvent(function (list:ArrayCollection):void
		{
			model.InsuranceOrganizationList = list;
			
		});
		CairngormEventDispatcher.getInstance().dispatchEvent(lie);
	}				
}
//----------------------------- GetSpecialityEvent Call back method----------------------------
private function specialityLoaded(response:XML):void
{
	specialityArrayCol = new ArrayCollection();
	for(var i:int=0; i<response.SpecialityCodes.length(); i++)
	{
		
		var SpecialityCode:String 	= response.SpecialityCodes[i].@SpecialityCode.toString();
		var SpecialityName:String 	= response.SpecialityCodes[i].@SpecialityName.toString();
		var SpecialtyID:String 		= response.SpecialityCodes[i].@SpecialtyID.toString();
		
		specialityArrayCol.addItem({ SpecialityCode:SpecialityCode, SpecialityName:SpecialityName, SpecialtyID:SpecialtyID});
	}
	id_speciality.dataProvider = specialityArrayCol;
	id_speciality.labelField = "SpecialityName";
	//Now calls basic info
	var loadClinicUsersBasicInfoEvent: LoadClinicUsersBasicInfoEvent = new LoadClinicUsersBasicInfoEvent(userID, clinicBranchID, getProviderDetails);
	CairngormEventDispatcher.getInstance().dispatchEvent(loadClinicUsersBasicInfoEvent); 
}
//----------------------------- LoadClinicUsersBasicInfoEvent cal back method----------------------------
private function getProviderDetails(val:* = null):void
{
	strSpecialityID = '';
	ProviderName = model.SearchProviderDetailsResults.FirstName +' '+model.SearchProviderDetailsResults.MiddleName+' '+ model.SearchProviderDetailsResults.LastName ; 
	//show green tick mark if data is in BASIC INFORMATION
	if(ProviderName.length >0)
		id_tab_basicinfo.hasChange = true; 
	
	if(model.SearchProviderDetailsResults.SSN.length <= 9)
		SSNIDValue 							= ValidationUtils.setSSNMasking(model.SearchProviderDetailsResults.SSN);
	lbl_ssn.text  							= SSNIDValue;
	lbl_ssn.toolTip  						= SSNIDValue;
	
	id_FName.text 							= model.SearchProviderDetailsResults.FirstName;
	id_Address.text 						= model.SearchProviderDetailsResults.StreetName;
	id_PhoneNumberAddMore.id_TelNumber.text = id_PhoneNumberAddMore.setPhoneNumberMasking(model.SearchProviderDetailsResults.Phone);
	id_PhoneNumberAddMore.id_ExtNumber.text = model.SearchProviderDetailsResults.PhoneExtension;
	id_phoneTxt.text 						= id_PhoneNumberAddMore.setPhoneNumberMasking(model.SearchProviderDetailsResults.Phone);
	id_addressTxt.text 						= model.SearchProviderDetailsResults.StreetName +',  '+ model.SearchProviderDetailsResults.City +",  " + model.SearchProviderDetailsResults.State;
	id_addressTxt.toolTip					= model.SearchProviderDetailsResults.StreetName +',  '+ model.SearchProviderDetailsResults.City +",  " + model.SearchProviderDetailsResults.State;
	
	original_NPI 								= model.SearchProviderDetailsResults.NPI;
	id_NPI.text 								= model.SearchProviderDetailsResults.NPI;
	id_NPIlbl.text								= model.SearchProviderDetailsResults.NPI;
	
	
	if(model.SearchProviderDetailsResults.SpecialityID != null)
	{
		strSpecialityID 						= model.SearchProviderDetailsResults.SpecialityID;
		
		if(strSpecialityID.length > 0)//TA --- Set Speciality as per data
			setSpecialityType();
	}
	
	if(model.SearchProviderDetailsResults.FaxNumber != null)
	{
		id_Fax.text 							= setPhoneNumberMasking(model.SearchProviderDetailsResults.FaxNumber);
		id_faxView.text 						= setPhoneNumberMasking(model.SearchProviderDetailsResults.FaxNumber);
	}
	
	
	if(model.SearchProviderDetailsResults.Zip != '')
	{
		id_ZipCityStateCombine.loadStateCityZipCodeCombineEvent('0', '0', model.SearchProviderDetailsResults.Zip);
	}
	
	recGuid 	= model.SearchProviderDetailsResults.RecGuid;
	
	if(model.workingdays.length > 1)
	{
		id_workdaysAddMore._dp = model.workingdays;	
		//Assign only selected days for View Mode
		if(model.workingdays!= null && model.workingdays.length)
		{
			for(var w:uint=0; w<model.workingdays.length; w++)
			{
				var obj:Object = new Object();
				obj = model.workingdays[w];
				if(obj.isSelected == true)
					id_workdaysAddMore._dpView.addItem(obj);
			}
		}
	}
	eusername 						= model.SearchProviderDetailsResults.EUserName;
	epassword 						= model.SearchProviderDetailsResults.EPassword;
	
	securityHeaderXML	 			= <Header />;					
	securityHeaderXML.@EUserName	= eusername;
	securityHeaderXML.@EPassword	= epassword;
	securityHeaderXML.@ClinicID		= "sad";
	
	//Load service levels								
	var getServiceLevels: loadServicelevelsEvent = new loadServicelevelsEvent(ServiceLevelsLoaded);				
	getServiceLevels.data = securityHeaderXML; 				
	CairngormEventDispatcher.getInstance().dispatchEvent(getServiceLevels);
	
	//set gender..								
	setGender(model.SearchProviderDetailsResults.Gender);
	//set prefix..								
	setPrefix(model.SearchProviderDetailsResults.PrefixTypeID);
	//set green tick for first
	id_mainTanButtons.selectedIndex = 0;
	checkBasicTab();
	
}
// ----------------------------- Set gender type----------------------------
private function setGender(gender:String):void
{
	for (var i:int=0; i< id_Gender1.dataProvider.length; i++) 
	{
		var item:String = id_Gender1.dataProvider[i].data;
		if(item == gender) {
			id_Gender1.selectedIndex = i;
			break;
		}
	}
}
// ----------------------------- Set Prefix Type--------------------------
private function setPrefix(prefix:String):void
{
	for (var i:int=0; i< id_Prefix.dataProvider.length; i++)
	{
		var item:String = id_Prefix.dataProvider[i].PrefixID;
		if(item == prefix) {
			id_Prefix.selectedIndex = i;
			break;
		}
	}
}
// ------------------------------ GetServiceLevelsEvent call back method------------------------------
private function ServiceLevelsLoaded():void
{
	for(var i:uint=0; i<model.serviceLevelsDTO.ServiceLevels.length; i++)
	{
		var chkbox:CheckBox 	= new CheckBox();
		chkbox.label 			= model.serviceLevelsDTO.ServiceLevels[i].servicename;
		chkbox.id 				= "id_chkbox"+i;										
		//TAlvi				//chkbox.name 			= "id_chkbox"+i;
		chkbox.name 			= model.serviceLevelsDTO.ServiceLevels[i].code;
		chkbox.styleName 		= "lightGreyCheckBoxSkin";
		chkbox.x 				= i*75;
		chkbox.y 				= 2;
		if(i > 3)
		{
			chkbox.x 			= (i-4)*75;
			chkbox.y 			= 20;	
		}
		if(i > 7)
		{
			chkbox.x 			= (i-8)*75;
			chkbox.y 			= 38;	
		}
		
		id_chkboxes.addElement(chkbox);
		
		if(model.serviceLevelsDTO.ServiceLevels[i].code == '0')
			chkbox.addEventListener(Event.CHANGE, disableCheckBoxHandler);
		else
			chkbox.addEventListener(Event.CHANGE, allCheckBoxHandler);
	}
	
	// if user request is already forwarded then load its data from esprescription.....
	if(model.SearchProviderDetailsResults.GAXENID != "0" && model.SearchProviderDetailsResults.GAXENID != null)
	{
		var gaxenId:String 					= model.SearchProviderDetailsResults.GAXENID;
		var rpEvent_ : LoadPrescriberbyGaxenIDEvent 	= new LoadPrescriberbyGaxenIDEvent(gaxenId, PrescriberLoaded);	
		rpEvent_.data 						= securityHeaderXML;
		CairngormEventDispatcher.getInstance().dispatchEvent( rpEvent_ );  
	}					
}
//-----------------------------other then disable all check box clickhandler of service level------------------------
private function allCheckBoxHandler(event:Event):void
{
	for (var i:int = 0; i < id_chkboxes.numElements; i++) 
	{
		if((id_chkboxes.getElementAt(i) as CheckBox).selected)
		{
			(id_chkboxes.getElementAt(0) as CheckBox).selected = false;
			isDisableServiceLevelSelected 	= false;
			// enable when other then disable service level is selected
			id_chkSupervisor.enabled 		= true;
			id_supervisorList.enabled		= true;
			id_DEA.enabled			 		= true;
			id_prescriberAgents.enabled 	= true;
			id_chkPrescriberAgent.enabled	= true;
			break;
		}
	}
}
//------------on disable service level change handler ------------------------------------------------------------
private function disableCheckBoxHandler(event:Event):void
{
	if((id_chkboxes.getElementAt(0) as CheckBox).selected)
	{
		Alert.show('Selecting Disable service level will Disable you from e-Prescription. Are you sure you want to select this?', 'info',Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, closeDisableHandler);
	}
}
//----------- alert od disable service level button handler ------------------------------------------------
private function closeDisableHandler(event:CloseEvent):void
{
	if(event.detail == Alert.YES)
	{
		for(var i:uint=0; i<id_chkboxes.numElements; i++)
		{
			(id_chkboxes.getElementAt(i) as CheckBox).selected = false;
		}
		(id_chkboxes.getElementAt(0) as CheckBox).selected = true;
		// disable all other form elemts for avoiding editing
		id_chkSupervisor.enabled 		= false;
		id_supervisorList.enabled		= false;
		id_DEA.enabled			 		= false;
		id_prescriberAgents.enabled 	= false;
		id_chkPrescriberAgent.enabled	= false;
		return;
	}
	else(event.detail == Alert.NO)
	{
		(id_chkboxes.getElementAt(0) as CheckBox).selected = false;
		isDisableServiceLevelSelected = false;
		return;
	}
}
//----------------------------- LoadPrescriberEvent call back method ------------------------------------------------
private function PrescriberLoaded(response:XML):void
{
	id_status.text = response.@Status;
	userStatus = response.@Status;
	
	if(response.@Status == "Pending" || response.@Status == "Accepted")
	{
		id_chkPrescriber.selected = true;
	}
	
	if(response.@Status == "Pending")
	{
		id_statusPending.visible = true;	
		id_chkboxes.visible = id_chkboxes.includeInLayout = false;
		id_epresDetails.visible = id_epresDetails.includeInLayout = false;		
		
		id_chkBillingProvider.enabled 			= false;
		id_chkProvider.enabled 					= false;
		id_chkPrescriber.enabled 				= false;
		
		id_sectionSave.enabled 					= false;
		id_sectionSaveBillingProvider.enabled 	= false;
		id_sectionSaveProvider.enabled 			= false;
		id_sectionSaveEPres.enabled 			= false;
		id_savePres.enabled 					= false;
	}
	
	id_startDate.text 							= response.Prescriber.@ActiveStartTime;
	id_endDate.text 							= response.Prescriber.@ActiveEndTime;
	id_spi.text 								= response.Prescriber.@SPI;
	SPI 										= response.Prescriber.@SPI;
	
	//Add prescriber agents..
	var prescriberAgentsArrayCol:ArrayCollection = new ArrayCollection();
	for(var j:uint=0; j < response.PrescriberAgents.Prescriber.length(); j++)
	{
		var obj:Object 	= new Object();
		obj.Label		= response.PrescriberAgents.Prescriber.@FirstName[j]+ ' '+ response.PrescriberAgents.Prescriber.@LastName[j];
		obj.Value		= response.PrescriberAgents.Prescriber.@GaxenID[j];
		prescriberAgentsArrayCol.addItem(obj);
			
		//prescriberAgentsArrayCol.addItem( {Label:response.PrescriberAgents.Prescriber.@FirstName[j], Value:response.PrescriberAgents.Prescriber.@GaxenID[j]} );
		
		if(prescriberAgentsArrayCol.getItemAt(j).Value == response.Prescriber.@AgentGaxenID)
		{
			id_prescriberAgents.selectedIndex = j;
		}
	}
	id_prescriberAgents.enabled 		= true;
	id_prescriberAgents.dataProvider 	= prescriberAgentsArrayCol;
	id_prescriberAgents.labelField 		= "Label";
	// ---end ---Add prescriber agents..
	// -------------------------Add Supervisor agents---------------------------------------------------
	if(response.Prescriber.@issupervisor == '1')
		id_chkSupervisor.selected = true;
	else
		id_chkSupervisor.selected = false;
	
	var supervisorArrayCol:ArrayCollection = new ArrayCollection();
	var supervisorConter:int = response.PrescriberAgents.Prescriber.length();
	//adding self as supervisor entery at index 0
	var objSelef:Object = new Object();
	objSelef.Label			= 'Self';
	objSelef.Value			= '0';
	supervisorArrayCol.addItem(objSelef);
	for(var s:uint = 0; s < supervisorConter; s++)
	{
		var objSuperVisor:Object 	= new Object();
		objSuperVisor.Label			= response.PrescriberAgents.Prescriber.@FirstName[s] + ' ' + response.PrescriberAgents.Prescriber.@LastName[s];
		objSuperVisor.Value			= response.PrescriberAgents.Prescriber.@GaxenID[s];
		supervisorArrayCol.addItem(objSuperVisor);
		//seleting the supervisor from list after matching the loaded data
		if(supervisorArrayCol.getItemAt(s).Value == response.Prescriber.@SupervisorGaxenID)
		{
			id_supervisorList.selectedIndex = s;
			id_supervisorList.enabled		= true;
		}
	}
	id_supervisorList.dataProvider 		= supervisorArrayCol;
	id_supervisorList.labelField 		= "Label";
	// ---end ---------------- Add Supervisor agents --------------------
	
	//set service level codes
	var servicelevelcodes:String 				= response.Prescriber.@ServiceLevelCodes;
	var servicelevelcodesArray:Array 			= servicelevelcodes.split(",");
	
	//TA - for selecting according to code
	for (var i:int = 0; i < servicelevelcodesArray.length-1; i++) 
	{
		for (var k:int = 0; k < id_chkboxes.numChildren; k++) 
		{
			if(servicelevelcodesArray[i] == (id_chkboxes.getElementAt(k) as CheckBox).name)
				(id_chkboxes.getElementAt(k) as CheckBox).selected = true;
			
			if(servicelevelcodesArray[i] == '0' && (id_chkboxes.getElementAt(k) as CheckBox).name == '0')
			{
				isDisableServiceLevelSelected 	= true;
				// on lod if disabl is saved as servce level then disable all other form element
				id_chkSupervisor.enabled 		= false;
				id_DEA.enabled			 		= false;
				id_chkPrescriberAgent.enabled	= false;
				id_prescriberAgents.enabled 	= false;
			}
			
		}
	}
}
//------------------- TA 17 sep, 2012 ---- for selecting the Speciality type that is loaded in response
private function setSpecialityType():void
{
	if(specialityArrayCol !=null)
	{
		if(specialityArrayCol.length>0)
		{
			for(var i:uint=0; i<specialityArrayCol.length; i++ )
			{
				var obj:Object = new Object();
				obj            = specialityArrayCol.getItemAt(i);
				if(strSpecialityID == obj.SpecialtyID)
				{
					id_speciality.selectedIndex = i;
					id_chkProvider.selected 	= true;
					id_lblSpeciality.text 		= id_speciality.selectedItem.SpecialityName;//for view
					id_lblSpeciality.toolTip 	= id_speciality.selectedItem.SpecialityName;//for view
				}
				
				if(id_NPI.text.length >0 && id_speciality.selectedIndex >=0)
				{
					id_chkProvider.selected = true;
					id_chkProvider_changeHandler();
				}
			}
		}
	}
}
//--------------- TA  ------- Addmore phone button click handler -------------------------
private function AddMorePhoneNumbers(event:Event):void
{				
	if (!personalPhoneNumbers)
		personalPhoneNumbers = new ArrayCollection();
	
	if (!personalPhoneNumbers.length)
	{
		var result:Object = id_PhoneNumberAddMore.isInValid(true);
		if (result.hasOwnProperty("isNotValid") && result.isNotValid)
		{
			if (result.hasOwnProperty("errorStr") && result.errorStr)
			{
				Alert.show(result.errorStr, "Phone number entry error", 4, FlexGlobals.topLevelApplication.mainContainer, function():void
				{
					if (result.hasOwnProperty("toSetFocus") && result.toSetFocus)
						result.toSetFocus.setFocus();
				});
			}
			return;
		}
		if(personalPhoneNumbers.length < 6)
		{
			personalPhoneNumbers.addItem(id_PhoneNumberAddMore.getPhoneNumberDetails());
		}
	}
	
	if (!phoneNumberAddMorePopUp)
	{
		phoneNumberAddMorePopUp = new PhoneNumberAddMoreTitleWindow();
		phoneNumberAddMorePopUp.PhoneNumberTypes = PhoneNumberTypes;
	}
	
	if (!phoneNumberAddMorePopUp.phoneNumbers)
		phoneNumberAddMorePopUp.phoneNumbers = personalPhoneNumbers;
	
	var btn:spark.components.Button = spark.components.Button(event.currentTarget);
	var pt:Point = btn.parent.localToGlobal(new Point(btn.x, btn.y));
	
	pt.x += btn.width/2 - 100;
	pt.y += btn.height;
	
	phoneNumberAddMorePopUp.display(this, pt);
}
// ---TA ------------ Save All Click Handler -------------------
protected function saveAll_ClickHandler():void
{
	if(userStatus == "Pending")
	{
		Alert.show("User Status is already Pending", "Eprescription Alert", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			return;
		});
	}
		//	else if(userStatus == "Accepted" )
	else if(userStatus == "Accepted" && !isDisableServiceLevelSelected)
	{
		Alert.show("Do you want to update at Eprescription as well ?",	"Are you sure?", Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, function( event:CloseEvent):void
		{
			if( event.detail == Alert.YES )
			{
				isNoSelectedSaveall = false;
				saveALL();		
				SubscribeUser('True');
			}
			else if( event.detail == Alert.NO )
			{
				isNoSelectedSaveall = true; // new req by azka @ 20 Nov, 2012
				saveALL();	
				SubscribeUser('false');//new req by alamdar @ 19 nov, 2012
				
			}
		});
	}
	else 
	{
		saveALL();		
	}
}
private var isNoSelectedSaveall:Boolean = false;
//----- TA --------------- Subcribe Form Validation - ------------------------------
public function subscribeUserValidations():Boolean
{
	var success:Boolean = new Boolean();
	var errorStr:String = new String();
	success = true;
	
	if (!ValidationUtils.isValidName(id_FName.text))
	{
		success = false;
		errorStr += "First name is invalid \n";	
		id_FName.setFocus();
	}				
	
	if (!ValidationUtils.isValidName(id_LName.text))
	{
		success = false;
		errorStr += "Last name is invalid \n";
		id_LName.setFocus();
	}
	
	if ((id_Address.text != ""))
	{					
		var address:String = id_Address.text; 
		address = address.toUpperCase();
		
		if(address.indexOf("PO BOX") >= 0 || address.indexOf("P.O. BOX") >= 0 || address.indexOf("POBOX") >= 0)
		{
			success = false;
			errorStr += "Address is invalid \n";
			id_Address.setFocus();
		}					
		else if(address.indexOf(" ") <= 0)
		{
			success = false;
			errorStr += "Address is invalid \n";
			id_Address.setFocus();
		}					
	}
	else
	{
		success = false;
		errorStr += "Address is empty \n";	
		id_Address.setFocus();
	}
	
	if(SSNIDValue.length > 9)
		SSNIDValue = ValidationUtils.getSSNWithoutMasking(SSNIDValue);
	
	if(SSNIDValue.length > 9 || SSNIDValue.length <= 0)
	{
		success = false;
		errorStr += "The data in ssn is invalid. \n";
		id_SSN.setFocus();
	}else if(!ValidationUtils.isSSNValid(SSNIDValue))
	{
		success = false;
		errorStr += "The data in ssn is invalid. \n";
		id_SSN.setFocus();
	}
	
	if (id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).length < 15 && id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).length >= 10) //todo
	{
		if (id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).charAt(0) == "0" || id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).charAt(0) == "1")
		{
			success = false;
			errorStr += "Area code cannot start with 0 or 1 \n";	
		}
		else if(id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).substr(0, 3) == "555")
		{
			success = false;
			errorStr += "Area code cannot start with 555 \n";
		}
			
		else if(ValidationUtils.isRepeatingChars(0, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars \n";
		}
		else if(ValidationUtils.isRepeatingChars(1, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars \n";
		}
		else if(ValidationUtils.isRepeatingChars(2, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars \n";
		}
		else if(ValidationUtils.isRepeatingChars(3, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars \n";
		}
	}
	else
	{
		success = false;
		errorStr += "Phone number is invalid \n";	
	}
	
	/* as per req
	if(! (id_PhoneNumberAddMore.id_TelNumberKind.selectedItem && id_PhoneNumberAddMore.id_TelNumberKind.selectedItem.NumberTypeCode != ""))
	{
	success = false;
	errorStr += "Please Select Phone Type \n";		
	id_PhoneNumberAddMore.id_TelNumberKind.setFocus();
	} */
	
	if(! (id_ZipCityStateCombine.id_State.selectedItem && id_ZipCityStateCombine.id_State.selectedItem.StateCode != ""))
	{
		success = false;
		errorStr += "Please Select State \n";		
		id_ZipCityStateCombine.id_State.setFocus();
	}
	
	if(! (id_ZipCityStateCombine.id_City.selectedItem && id_ZipCityStateCombine.id_City.selectedItem.CityName != ""))
	{
		success = false;
		errorStr += "Please Select City \n";
		id_ZipCityStateCombine.id_City.setFocus();
	}
	
	if(! (id_ZipCityStateCombine.id_ZIP.selectedItem && id_ZipCityStateCombine.id_ZIP.selectedItem.ZipCode != ""))
	{
		success = false;
		errorStr += "Please Select Zip \n";
		id_ZipCityStateCombine.id_ZIP.setFocus();
	}
	
	if (id_NPI.text.length != 10)
	{
		success = false;
		errorStr += "NPI must be 10 chars long \n";	
		id_NPI.setFocus();
	}
	//Fax No Validation
	var tempFAX:String = id_Fax.text;
	if(tempFAX.charAt(0) == '(')
		id_Fax.text = getPhoneNumberWithoutMasking(id_Fax.text);
	
	if(id_Fax.text.length > 0)
	{
		//check for 0 1 at start
		if(id_Fax.text.charAt(0) == '0' || id_Fax.text.charAt(0) == '1')
		{
			success = false;
			errorStr += "Fax number does't start from 0 or 1.\n";
			
			id_Fax.setFocus();
		}
		else if (id_Fax.text.length)
		{
			if (!ValidationUtils.isValidPhone(id_Fax))
			{
				success = false;
				errorStr += "The data in fax number is invalid.\n";
				id_Fax.setFocus();
			}  
			
			//More then 6 repeaing charecters are not allowed
			if(ValidationUtils.isValidPhone(id_Fax))
			{
				if(isMoreThenSixTime(id_Fax.text))
				{
					success = false;
					errorStr += "More then 6 repeating char not allowed in fax.\n";
					
					id_Fax.setFocus();
				}
				
			}
		}
	}
	else
	{
		success = false;
		errorStr += "Please enter data in fax number.\n";
		
		id_Fax.setFocus();
	}
	
	if(success == false)
	{
		Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			
		});					
	}
	return success;
}
//---------- SubscribeUser user mehod set true in save all True click and set false in case of no click
public function SubscribeUser(value:String):void
{
	var isEPCSInvalid:Boolean = false;
	if(model.SearchProviderDetailsResults.Title == "Patient")
	{
		Alert.show("Patient Cannot register at Eprescription", "Eprescription Alert", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			return;
		});	
	}
	
	// Validate the : When EPCS service level is checked, DEA should be validated on Section save as well as on Save All. (for military personnel, SSN is required)
	for(var j:uint=0; j<model.serviceLevelsDTO.ServiceLevels.length; j++)
	{
		if((id_chkboxes.getElementAt(j) as CheckBox).selected)
		{
			var tempName:String = model.serviceLevelsDTO.ServiceLevels[j].servicename;
			if(tempName.toLowerCase() == 'controlled substance (epcs)' && id_DEA.text.length != 9)
			{
				isEPCSInvalid = true;
				break;
			}
		}
	}
	// if EPCS service level is checked & DEA is not valid stop saving/updating
	if(isEPCSInvalid)
	{
		Alert.show("The data in DEA is not valid", "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer);
		return;
	}
	
	if(id_chkPrescriber.selected)
	{
		if(!subscribeUserValidations())
		{
			return;
		}
		//to update user if check is selected..
		//todo: it should be called from subsribe button, but should be called from SaveALL button.
		
		var SubscriberXML_:XML = <AddPrescriber />;				
		SubscriberXML_.appendChild(securityHeaderXML);
		
		var SubscriberXML:XML = <Prescriber />;
		
		if(id_chkProvider.selected)
		{
			if(!ValidateProviderDetails())
			{
				return;
			} 
			SubscriberXML.@SpecialityIDs		= id_speciality.selectedItem? id_speciality.selectedItem.SpecialtyID : "";
		}
		
		SubscriberXML.@FirstName			= id_FName.text;
		SubscriberXML.@LastName				= id_LName.text;
		SubscriberXML.@MiddleName			= id_MName.text;
		SubscriberXML.@DEANumber			= id_DEA.text;
		if(id_Address.text.length >34)//35an for address line 1 and 35an for address line 2. When the data in address field exceeds 35 from front end, remaining data should be sent to Surescript in Address line 2.
		{
			var tempAddress:String			= id_Address.text;
			SubscriberXML.@AddressLine1		= tempAddress.substr(0,35);
			SubscriberXML.@AddressLine2		= tempAddress.substr(35, tempAddress.length);
		}
		else
		{
			SubscriberXML.@AddressLine1		= id_Address.text;
			SubscriberXML.@AddressLine2		= id_Address.text;
		}
		SubscriberXML.@PhoneNumber			= id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text);
		
		if(id_PhoneNumberAddMore.id_ExtNumber.text != "")
		{
			SubscriberXML.@PhoneNumber			= id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)+"x"+id_PhoneNumberAddMore.id_ExtNumber.text;
		}
		
		SubscriberXML.@FaxNumber			= getPhoneNumberWithoutMasking(id_Fax.text);
		SubscriberXML.@City					= id_ZipCityStateCombine.id_City.selectedItem.CityName; 
		SubscriberXML.@State				= id_ZipCityStateCombine.id_State.selectedItem.StateCode;
		SubscriberXML.@ZipCode				= id_ZipCityStateCombine.id_ZIP.selectedItem.ZipCode;
		SubscriberXML.@UPIN					= id_UPIN.text == "" ? "0" : id_UPIN.text ;
		SubscriberXML.@DentistLiecenseNumber= getPhoneNumberWithoutMasking(id_Fax.text);
		SubscriberXML.@Email				= model.SearchProviderDetailsResults.UserEmail;
		SubscriberXML.@FAXTAXID				= "0";
		SubscriberXML.@SSN					= SSNIDValue;
		//SubscriberXML.@EN					= model.SearchProviderDetailsResults.EIN;
		SubscriberXML.@LIECENCENUMBER		= model.SearchProviderDetailsResults.LicenseNumber == "" ? 0: model.SearchProviderDetailsResults.LicenseNumber;
		SubscriberXML.@GaxenID				= model.SearchProviderDetailsResults.GAXENID == null ? 0: model.SearchProviderDetailsResults.GAXENID; //"0";
		//SubscriberXML.@ClinicName			= model.SearchProviderDetailsResults.LicenseNumber; 
		SubscriberXML.@NewNPI				= id_NPI.text;
		SubscriberXML.@NPI					= original_NPI;
		SubscriberXML.@updatedGaxenID		= model.SearchProviderDetailsResults.GAXENID;
		
		
		if(original_NPI == null || original_NPI == "")
		{
			SubscriberXML.@NPI					= id_NPI.text;
		}
		SubscriberXML.@ClinicName			= "asdasd";
		SubscriberXML.@SpecialtyQualifier	= "sq";
		SubscriberXML.@SpecialtyCode		= "sc";
		SubscriberXML.@EN					= "en";
		
		if(id_prescriberAgents.selectedItem)
		{
			SubscriberXML.@AgentGaxenID			= id_prescriberAgents.selectedItem.Value;
			SubscriberXML.@isPrescriberAgent	= "true";
		}
		
		if(id_Prefix.selectedItem)
		{
			SubscriberXML.@Prefix			= id_Prefix.selectedItem.PrefixName;
		}
		SubscriberXML.@Suffix				= id_Suffix.text;
		
		if(id_chkSupervisor.selected)
		{
			SubscriberXML.@issupervisor				= '1';
			SubscriberXML.@SupervisorGaxenID    	= id_supervisorList.selectedItem.Value;
		}
		else
		{
			SubscriberXML.@issupervisor				= '0';
			SubscriberXML.@SupervisorGaxenID    	= '';//id_supervisorList.selectedItem.Value;
		}
		
		//phoneNumberAddMorePopUp.phoneNumbers
		var additionalPhoneNos:String = "";
		
		if(phoneNumberAddMorePopUp)
		{
			for(var i:uint=0; i<phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider.length; i++)
			{
				if(i > 0)
				{
					additionalPhoneNos +=  phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider[i].phoneNumber;
					if(phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider[i].phoneExtension != "")
					{
						additionalPhoneNos += "x";
						additionalPhoneNos +=  phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider[i].phoneExtension;
					}
					//additionalPhoneNos +=  phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider[i].phoneNumberKind;
					var obj:Object = phoneNumberAddMorePopUp.id_AddPhoneNumberGrid.dataProvider[i].phoneNumberKind;
					//additionalPhoneNos += obj.NumberTypeName;
					additionalPhoneNos += ",";
					if(obj)
						additionalPhoneNos += obj.NumberTypeCode;
					
					additionalPhoneNos += ":";
					//trace(additionalPhoneNos);
				}
			}				
			SubscriberXML.@ALTPhoneWithQualifier = additionalPhoneNos;
		}
		else
		{
			SubscriberXML.@ALTPhoneWithQualifier = "";
		}
		
		serviceLevels = "";
		
		for(var j:uint=0; j<model.serviceLevelsDTO.ServiceLevels.length; j++)
		{
			if((id_chkboxes.getElementAt(j) as CheckBox).selected)
			{
				serviceLevels += model.serviceLevelsDTO.ServiceLevels[j].code;
				if(j-1 != model.serviceLevelsDTO.ServiceLevels.length)
				{
					serviceLevels += ",";
				}
			}
			//validate the : When EPCS service level is checked, DEA should be validated on Section save as well as on Save All. (for military personnel, SSN is required)
			if((id_chkboxes.getElementAt(j) as CheckBox).selected)
			{
				var tempName:String = model.serviceLevelsDTO.ServiceLevels[j].servicename;
				if(tempName.toLowerCase() == 'controlled substance (epcs)' && id_DEA.text.length != 9)
				{
					Alert.show("entered DEA not valid", "Eprescription Alert", 4, FlexGlobals.topLevelApplication.mainContainer);
					return;
				}
			}
		}
		
		SubscriberXML.@ServiceLevelCodes		= serviceLevels;
		
		if(serviceLevels == null || serviceLevels == "")
		{
			SubscriberXML.@ServiceLevelCodes		= "0";	
		}
		SubscriberXML.@isSaveAll		= value;	
		
		SubscriberXML_.appendChild(SubscriberXML);
		
		if(model.SearchProviderDetailsResults.GAXENID != "" && SPI != "" && SPI != null && model.SearchProviderDetailsResults.GAXENID != "0")
		{
			callSubscribePatientEvent('update', SubscriberXML_);
		}
		else
		{
			callSubscribePatientEvent('add', SubscriberXML_);
		}
	}
}
// ------------- callSubscribePatientEvent -----------------------------
private function callSubscribePatientEvent(method:String, xml:XML):void
{
	var rpEvent : UpdateSubscribedUserEvent = new UpdateSubscribedUserEvent(EConstants.SUBSCRIPTION_PATIENT, method, patientSubscribeCallBack);
	rpEvent.data = xml;
	CairngormEventDispatcher.getInstance().dispatchEvent( rpEvent );
}
//--Update user event service call back method ------
public function UserUpdated(response:XML):void
{
	var result:String = response;
	if(result == "true")
	{
		Alert.show("Profile Saved Successfully", "Gazuntite Manager", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			if(isSaveAllCase)
				id_ChangeMode_clickHandler();
			//id_subscribeBtn.enabled = false;
			id_workdaysAddMore._dpView.removeAll();
			//TA - Dispach event for update user picture in Gazuntite Client top bar.
			dispatchEvent(new Event('updateUserProfileEvent', true, false));
		});
	}
	else
	{
		Alert.show("Profile Saved Failed", "Gazuntite Manager", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			
		});
	}
}
// ----- patientSubscribeCallBack ----------------------------------
public function patientSubscribeCallBack(response:XML):void
{
	var msg:String 		= response.@Message;
	var userId:String 	= model.SearchProviderDetailsResults.userID.toString();
	var gaxenId:String 	= response.@GaxenID;
	var status:String 	=  response.@Status;
	
	if(gaxenId && gaxenId != "0")
	{
		var gEvent : UpdateGaxenIDEvent = new UpdateGaxenIDEvent(userId, gaxenId, GaxenIdCallBack);					
		CairngormEventDispatcher.getInstance().dispatchEvent( gEvent );
	}
	else
	{
		Alert.show(msg, "Eprescription Status", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void
		{
			
		});
		return;
	}
	
	if(!isNoSelectedSaveall)
	{
		Alert.show(msg, "Eprescription Status", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void
		{
			//id_subscribeBtn.enabled = false;
			if(userStatus == "Pending")
				id_statusPending.visible = true;
			//	userStatus = "Pending";
			id_chkboxes.visible = id_chkboxes.includeInLayout = true;
			//	id_epresDetails.visible = id_epresDetails.includeInLayout = false;
			//	id_subscribeBtn.visible = false;
		});
	}
	else
	{
		if(userStatus == "Pending")
			id_statusPending.visible = true;
		//id_subscribeBtn.enabled = false;
		//	userStatus = "Pending";
		id_chkboxes.visible = id_chkboxes.includeInLayout = true;
		//	id_epresDetails.visible = id_epresDetails.includeInLayout = false;
		//	id_subscribeBtn.visible = false;
	}
}

public function patientUpdatedCallBack(response:XML):void
{
	var msg:String = response.@Message;											
	var result:String = response.@Status;										
	
	if(result == "true")
	{
		Alert.show(msg, "Eprescription Status", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			//id_subscribeBtn.enabled = false;
		});
	}
	else
	{
		Alert.show(msg, "Eprescription Status", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			
		});
	}
}
// -----  Save address book dto method for saving data in server - ----------------
public function SaveAddressDTO():void
{
	var AddressPhoneDTOlist1:XML = new XML(<AddressPhoneDTOlist />);				
	
	var PhoneDTO:XML					= <PhoneDTO />;
	PhoneDTO.@IsDeleted 				= "false";
	PhoneDTO.@IsDirty 					= "false";
	PhoneDTO.PhoneID	 				= "0";
	PhoneDTO.AddressBookID	 			= "0";
	PhoneDTO.PhoneTypeID	 			= '1';// as per req id_PhoneNumberAddMore.id_TelNumberKind.selectedItem ? id_PhoneNumberAddMore.id_TelNumberKind.selectedItem.NumberTypeID: "1"; 
	PhoneDTO.NumberTypeID	 			= '1';// as per req id_PhoneNumberAddMore.id_TelNumberKind.selectedItem ? id_PhoneNumberAddMore.id_TelNumberKind.selectedItem.NumberTypeID: "1"; 
	PhoneDTO.OwnerTypeID	 			= "1";
	PhoneDTO.PhoneNumber	 			= id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text);
	PhoneDTO.Extension					= id_PhoneNumberAddMore.id_ExtNumber.text;
	PhoneDTO.IsPrimary	 				= "false";
	PhoneDTO.CreatedBy	 				= userID.toString();
	PhoneDTO.CreatedAt	 				= AppUtils.getToday();
	PhoneDTO.UpdatedBy	 				= userID.toString();
	PhoneDTO.UpdatedAt	 				= AppUtils.getToday();
	//ADD FAX - Tab - E-Prescription
	var PhoneDTO_Fax:XML				= <PhoneDTO />;
	PhoneDTO_Fax.@IsDeleted 			= "false";
	PhoneDTO_Fax.@IsDirty 				= "false";
	PhoneDTO_Fax.PhoneID	 			= "0";
	PhoneDTO_Fax.AddressBookID	 		= "0";
	PhoneDTO_Fax.PhoneTypeID	 		= "5"; 
	PhoneDTO_Fax.NumberTypeID	 		= "5";
	PhoneDTO_Fax.OwnerTypeID	 		= "1";
	PhoneDTO_Fax.PhoneNumber	 		= getPhoneNumberWithoutMasking(id_Fax.text);
	PhoneDTO_Fax.Extension				= '00';
	PhoneDTO_Fax.IsPrimary	 			= "false";
	PhoneDTO_Fax.CreatedBy	 			= userID.toString();
	PhoneDTO_Fax.CreatedAt	 			= AppUtils.getToday();
	PhoneDTO_Fax.UpdatedBy	 			= userID.toString();
	PhoneDTO_Fax.UpdatedAt	 			= AppUtils.getToday();
	var AddressPhoneDTO:XML				= <AddressPhoneDTO />;
	AddressPhoneDTO.@IsDeleted 			= "false";
	AddressPhoneDTO.@IsDirty 			= "false";
	AddressPhoneDTO.AddressPhoneID		= "0";
	AddressPhoneDTO.PhoneID				= "1";
	AddressPhoneDTO.AddressID			= "0";
	AddressPhoneDTO.CreatedBy	 		= userID.toString();
	AddressPhoneDTO.CreatedAt	 		= AppUtils.getToday();
	AddressPhoneDTO.UpdatedBy	 		= userID.toString();
	AddressPhoneDTO.UpdatedAt	 		= AppUtils.getToday();
	var AddressBookDTO:XML 				= <AddressBookDTO />;
	AddressBookDTO.@IsDeleted 			= "false";
	AddressBookDTO.@IsDirty 			= "false";
	AddressBookDTO.AddressBookID 		= "0";
	if(recGuid == null)//if recGUID is null then don't send call for save address book
		return;
	AddressBookDTO.PartyID 				= recGuid; //"00000000-0000-0000-0000-000000000000";				
	AddressBookDTO.AddressPartyTypeID 	= "3";  //6 for nurse
	AddressBookDTO.CreatedBy 			= userID.toString();
	AddressBookDTO.CreatedAt 			= "2011-01-01T00:00:00"; //new Date();
	AddressBookDTO.UpdatedBy 			= userID.toString();
	AddressBookDTO.UpdatedAt 			= "2011-01-01T00:00:00"; //new Date();
	var PhoneDTOlist:XML 				= <PhoneDTOlist />;
	PhoneDTOlist.appendChild(PhoneDTO);
	PhoneDTOlist.appendChild(PhoneDTO_Fax);
	//AddressPhoneDTO.appendChild(PhoneDTOlist);
	AddressPhoneDTOlist1.appendChild(AddressPhoneDTO);
	var AddressDTOlist:XML 				= <AddressDTOlist />;
	var AddressDTO:XML	 				= <AddressDTO />;
	AddressDTO.@IsDeleted 				= "false";
	AddressDTO.@IsDirty 				= "false";
	AddressDTO.AddressID 				= "0";
	AddressDTO.StreetName 				= id_Address.text;
	AddressDTO.AddressBookID			= "0";
	AddressDTO.OwnerTypeID				= "0";
	AddressDTO.AddressTypeID			= "0";
	AddressDTO.IsPrimary				= "false";
	AddressDTO.ZipCodeID				= id_ZipCityStateCombine.id_ZIP.selectedItem.ZipCodeID;
	AddressDTO.CityCode					= id_ZipCityStateCombine.id_City.selectedItem.CityCode;
	AddressDTO.StateID					= id_ZipCityStateCombine.id_State.selectedItem.StateID; 
	AddressDTO.CountryID				= "233";
	AddressDTO.CreatedBy 				= userID.toString();
	AddressDTO.CreatedAt 				= "2011-01-01T00:00:00"; //new Date();
	AddressDTO.UpdatedBy 				= userID.toString();
	AddressDTO.UpdatedAt 				= "2011-01-01T00:00:00"; //new Date();
	
	AddressDTO.appendChild(AddressPhoneDTOlist1);
	AddressDTOlist.appendChild(AddressDTO);
	AddressBookDTO.appendChild(AddressDTOlist);
	AddressBookDTO.appendChild(PhoneDTOlist);
	
	var rpEvent_ : SaveAddressEvent = new SaveAddressEvent("Save address",userID.toString(), UserAddressSaved);
	rpEvent_.data = AddressBookDTO;
	CairngormEventDispatcher.getInstance().dispatchEvent( rpEvent_ );		
}
//--SaveAddressEvent call back method ---------
public function UserAddressSaved(response:XML):void
{
}
//----- Save All Button Click handler ------------------------------------
public function saveALL():void
{
	//Validate tab - BASIC INFORMATION
	if(!ValidatePersonalInfo())
	{
//		id_subscribeBtn.setStyle("skinClass", blackButton);
		return;
	}
	// Validate tab - PROVIDER DETAIL
	if(id_chkProvider.selected)
	{
		if(!ValidateProviderDetails())
		{
//			id_subscribeBtn.setStyle("skinClass", blackButton);
			return;
		}
	}
	// Validate tab - BILLING DETAIL
	if(id_chkBillingProvider.selected)
	{
		if(!ValidateBillingProviderDetails())
		{
//			id_subscribeBtn.setStyle("skinClass", blackButton);
			return;
		}
	}
	SaveAddressDTO();
	
	var UpdateUserXML:XML = <UpdateUser />;
	UpdateUserXML.@UserId				= userID;
	UpdateUserXML.@UserEmail			= model.SearchProviderDetailsResults.UserEmail;
	UpdateUserXML.@FederalTaxId			= model.SearchProviderDetailsResults.FederalTaxId;
	
	// ************ Personal info Section - tab 1***************** TA *************
	if(id_Prefix.selectedItem)
	{
		UpdateUserXML.@PrefixTypeID			= id_Prefix.selectedItem.PrefixID;
	}
	else
	{
		UpdateUserXML.@PrefixTypeID			= model.SearchProviderDetailsResults.PrefixTypeID;
	}
	UpdateUserXML.@FirstName			= id_FName.text;
	UpdateUserXML.@LastName				= id_LName.text;
	UpdateUserXML.@MiddleName			= id_MName.text;				
	UpdateUserXML.@SSN					= SSNIDValue;
	UpdateUserXML.@Suffix				= id_Suffix.text;
	
	if(id_Gender1.selectedItem)
		UpdateUserXML.@Gender				= id_Gender1.selectedItem.data;
	else
		UpdateUserXML.@Gender				= model.SearchProviderDetailsResults.Gender;
	
	// ****************** Provider Info - Tab 2 ************** 
	if(id_chkProvider.selected)
	{
		UpdateUserXML.@NPI					= id_NPI.text;
		UpdateUserXML.@isProvider			= 'true';
		UpdateUserXML.@SpecialityID			= id_speciality.selectedItem? id_speciality.selectedItem.SpecialtyID : "";
		
		//TA - append Working hours XML in any case
		var WorkingDaysXML:XML 	= <WorkingDays />;
		
		for(var i:uint=0; i<id_workdaysAddMore._dp.length; i++)
		{
			var WorkDaysXML:XML 	= <WorkDays />;
			
			WorkDaysXML.@Day				= id_workdaysAddMore._dp[i].dayName;
			WorkDaysXML.@WorkStarttime		= id_workdaysAddMore._dp[i].startTime;
			WorkDaysXML.@WorkEndtime		= id_workdaysAddMore._dp[i].endTime;
			WorkDaysXML.@isSelected			= id_workdaysAddMore._dp[i].isSelected;
			
			WorkingDaysXML.appendChild(WorkDaysXML);
		}
		UpdateUserXML.appendChild(WorkingDaysXML);
	}else
	{
		UpdateUserXML.@isProvider			= 'false';
	}
	
	// ********************* Billing provider info -  Tab 3 ******* TA ***********************
	if(id_chkBillingProvider.selected)
	{
		UpdateUserXML.@UPIN					= id_UPIN.text;
		UpdateUserXML.@LicenseNumber		= id_LicenseNo.text;					
		UpdateUserXML.@EIN					= id_EIN.text;								
		UpdateUserXML.@TPI					= id_TPI.text;
		//by shahid to save data for doctor as well as nurse practioner
		UpdateUserXML.@CLIANumber			= id_CLIA.text;	
		UpdateUserXML.@IsHospice			= id_chkHospiceEmp.selected.toString();	
		UpdateUserXML.@SignatureOnFile		= id_chkSignature.selected.toString();	
		if(id_chkSignature.selected)
			UpdateUserXML.@SignatureDate		= id_SignDate.text;	
		UpdateUserXML.@IsParticipating		= id_chkParticipating.selected.toString();	
		UpdateUserXML.@StopSubmission		= id_chkStopSubmission.selected.toString();	
	}
	
	//epres info
	UpdateUserXML.@DAE					= id_DEA.text;
	UpdateUserXML.@Tab					= "0";
	//add image node in XML
	if(m_oImageContent != null)
	{
		//UpdateUserXML.appendChild(XmlUtils.getCDATANode(m_oImageContentString, 'ImageData'));
		UpdateUserXML.appendChild(XmlUtils.getNodeWithData(m_oImageContentString, 'ImageData'));
	}
	else
	{
		//UpdateUserXML.appendChild(XmlUtils.getCDATANode('', 'ImageData'));
		UpdateUserXML.appendChild(XmlUtils.getNodeWithData('', 'ImageData'));
	}
	
	UpdateUserEventCall("Save QM",UpdateUserXML, UserUpdated);
	
	isSaveAllCase = true;
	
	var isProviderInsuranceUpdated:Boolean = false ;
	for each (var prvIns:ProviderInsuranceDTO in model.ProviderInsuranceList) 
	{
		if(prvIns.IsToSave)
		{
			isProviderInsuranceUpdated = true;		
		}
	}
	
	if(isProviderInsuranceUpdated)
		saveProviderInsuranceID();
}			
// Validation method for personal info section (Tab 1)--------
public function ValidatePersonalInfo():Boolean
{
	var success:Boolean = new Boolean();
	var errorStr:String = new String();
	success = true;
	var toSetFocus:Object;
	//first name max 35
	if (!ValidationUtils.isValidName35(id_FName.text))
	{
		success = false;
		errorStr += "First name is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_FName;
	}				
	// last name 35 last name
	if (!ValidationUtils.isValidName35(id_LName.text))
	{
		success = false;
		errorStr += "Last name is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_LName;
	}
	// SSN 
	if(SSNIDValue.length > 9)
		SSNIDValue = ValidationUtils.getSSNWithoutMasking(SSNIDValue);
	
	if(SSNIDValue.length > 9 || SSNIDValue.length <= 0)
	{
		success = false;
		errorStr += "SSN is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_SSN;
	}
	else if(!ValidationUtils.isSSNValid(SSNIDValue))
	{
		success = false;
		errorStr += "SSN is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_SSN;
	}
	// Phone Number
	if (id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).length < 15 && id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).length >= 10) //todo
	{
		if (id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).charAt(0) == "0" || id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).charAt(0) == "1")
		{
			success = false;
			errorStr += "Area code cannot start with 0 or 1. \n";
			//id_PhoneNumberAddMore.id_TelNumber.setFocus();
			if (!toSetFocus)
				toSetFocus = id_PhoneNumberAddMore.id_TelNumber;
		}
		else if(id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text).substr(0, 3) == "555")
		{
			success = false;
			errorStr += "Area code cannot start with 555. \n";
			//id_PhoneNumberAddMore.id_TelNumber.setFocus();
			if (!toSetFocus)
				toSetFocus = id_PhoneNumberAddMore.id_TelNumber;
		}
		else if(ValidationUtils.isRepeatingChars(0, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars. \n";
			if (!toSetFocus)
				toSetFocus = id_PhoneNumberAddMore.id_TelNumber;
		}
		else if(ValidationUtils.isRepeatingChars(1, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars. \n";
		}
		else if(ValidationUtils.isRepeatingChars(2, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars. \n";
		}
		else if(ValidationUtils.isRepeatingChars(3, id_PhoneNumberAddMore.getPhoneNumberWithoutMasking(id_PhoneNumberAddMore.id_TelNumber.text)))
		{
			success = false;
			errorStr += "Phone number cannot contain repeating chars. \n";
		}
	}
	else
	{
		success = false;
		errorStr += "Phone number is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_PhoneNumberAddMore.id_TelNumber;
	}
	// Address
	if ((id_Address.text != ""))
	{					
		var address:String = id_Address.text; 
		address = address.toUpperCase();
		
		if(address.indexOf("PO BOX") >= 0 || address.indexOf("P.O. BOX") >= 0 || address.indexOf("POBOX") >= 0)
		{
			success = false;
			errorStr += "Address is invalid. \n";
			if (!toSetFocus)
				toSetFocus = id_Address;
		}					
		else if(address.indexOf(" ") <= 0)
		{
			success = false;
			errorStr += "Address is invalid. \n";
			if (!toSetFocus)
				toSetFocus = id_Address;
		}					
	}
	else
	{
		success = false;
		errorStr += "Address is invalid. \n";	
		if (!toSetFocus)
			toSetFocus = id_Address;
	}
	//--FAX No Validation
	var tempFAX:String = id_Fax.text;
	if(tempFAX.charAt(0) == '(')
		id_Fax.text = getPhoneNumberWithoutMasking(id_Fax.text);
	
	if(id_Fax.text.length > 0)
	{
		//check for 0 1 at start
		if(id_Fax.text.charAt(0) == '0' || id_Fax.text.charAt(0) == '1')
		{
			success = false;
			errorStr += "Fax number does't start from 0 or 1. \n";
			
			if (!toSetFocus)
				toSetFocus = id_Fax;
		}
		else if (id_Fax.text.length)
		{
			if (!ValidationUtils.isValidPhone(id_Fax))
			{
				success = false;
				errorStr += "Fax number is invalid. \n";
				
				if (!toSetFocus)
					toSetFocus = id_Fax;
			} 
			
			//More then 6 repeaing charecters are not allowed
			if (ValidationUtils.isValidPhone(id_Fax))//if data is valid
			{
				if(isMoreThenSixTime(id_Fax.text))
				{
					success = false;
					errorStr += "More then 6 repeating char not allowed in fax.\n";
					
					if (!toSetFocus)
						toSetFocus = id_Fax;
				}
			}
		}
	}
	else
	{
		success = false;
		errorStr += "Fax number is invalid.\n";
		
		if (!toSetFocus)
			toSetFocus = id_Fax;
	}
	
	//Zip validation
	if(! (id_ZipCityStateCombine.id_ZIP.selectedItem && id_ZipCityStateCombine.id_ZIP.selectedItem.ZipCode != ""))
	{
		success = false;
		errorStr += "Zip is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_ZipCityStateCombine.id_ZIP;
	}
	// City validation
	if(! (id_ZipCityStateCombine.id_City.selectedItem && id_ZipCityStateCombine.id_City.selectedItem.CityName != ""))
	{
		success = false;
		errorStr += "City is invalid. \n";
		if (!toSetFocus)
			toSetFocus = id_ZipCityStateCombine.id_City;
	}
	// State validation
	if(! (id_ZipCityStateCombine.id_State.selectedItem && id_ZipCityStateCombine.id_State.selectedItem.StateCode != ""))
	{
		success = false;
		errorStr += "State is inavlid. \n";		
		if (!toSetFocus)
			toSetFocus = id_ZipCityStateCombine.id_State;
	}
		
	if(success == false)
	{
		var alert:Alert = Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			if (toSetFocus)
				toSetFocus.setFocus();
		});
		id_ProfileViews.selectedIndex = 0;
		errorStr = "";
	}
	return success;
}

//-TA- count 6 repeating char in string
private function isMoreThenSixTime(val:String):Boolean
{
	var result:Boolean = false;
	if(val.length >=10)
	{
		for(var i:uint=0; i<4; i++)
		{
			var counter:int = 0;
			var str:String = val.substr(i,1);
			var index:uint = 0;
			index = i;
			index += 1;
			//case 1
			if(str == val.substr(index ,1))
				counter ++;
			index += 1;
			//case 2
			if(str == val.substr(index ,1))
				counter ++;
			index += 1;
			//case 3
			if(str == val.substr(index ,1))
				counter ++;
			index += 1;
			//case 4
			if(str == val.substr(index ,1))
				counter ++;
			index += 1;
			//case 5
			if(str == val.substr(index ,1))
				counter ++;
			index += 1;
			//case 6
			if(str == val.substr(index ,1))
				counter ++;
			if(counter >= 6){
				result = true;
				break;
			}
		}
	}
	
	return result;
}
//-- Save user data for first tab only ---------
public function SavePersonalInfo():void
{	
	if(!ValidatePersonalInfo())
	{
		return;
	}
	
	var UpdateUserXML:XML = <UpdateUser />;
	UpdateUserXML.@UserId				= userID;
	UpdateUserXML.@UserEmail			= model.SearchProviderDetailsResults.UserEmail;
	UpdateUserXML.@FederalTaxId			= model.SearchProviderDetailsResults.FederalTaxId;
	
	//Personal info
	if(id_Prefix.selectedItem)
		UpdateUserXML.@PrefixTypeID			= id_Prefix.selectedItem.PrefixID;
	else
		UpdateUserXML.@PrefixTypeID			= model.SearchProviderDetailsResults.PrefixTypeID;
	
	UpdateUserXML.@FirstName			= id_FName.text;
	UpdateUserXML.@LastName				= id_LName.text;
	UpdateUserXML.@MiddleName			= id_MName.text;				
	UpdateUserXML.@SSN					= SSNIDValue;
	UpdateUserXML.@Suffix				= id_Suffix.text;
	
	UpdateUserXML.@Tab					= "1";
	
	if(id_Gender1.selectedItem)
		UpdateUserXML.@Gender			= id_Gender1.selectedItem.data;
	else
		UpdateUserXML.@Gender			= model.SearchProviderDetailsResults.Gender;
	//add image node in XML 	
	if(m_oImageContent != null)
	{
		//UpdateUserXML.appendChild(XmlUtils.getCDATANode(m_oImageContentString, 'ImageData'));
		UpdateUserXML.appendChild(XmlUtils.getNodeWithData(m_oImageContentString, 'ImageData'));
	}
	else
	{
		//UpdateUserXML.appendChild(XmlUtils.getCDATANode('', 'ImageData'));
		UpdateUserXML.appendChild(XmlUtils.getNodeWithData('', 'ImageData'));
	}
	
	UpdateUserEventCall("Save QM", UpdateUserXML, UserUpdated);
	isSaveAllCase = false;
	SaveAddressDTO();
}
//-- Call UpdateUserEvent call ----------------------------------------------------
private function UpdateUserEventCall(method:String, xml:XML, callBack:Function):void
{
	var rpEvent_ : UpdateUserEvent = new UpdateUserEvent(method, xml, callBack);
	CairngormEventDispatcher.getInstance().dispatchEvent( rpEvent_ );
}
// Validate Provider Detail section
public function ValidateProviderDetails():Boolean
{
	var success:Boolean = new Boolean();
	var errorStr:String = new String();
	success = true;
	var toSetFocus:Object;
	var UpdateUserXML:XML = <UpdateUser />;
	//Provider info
	
	
	if (id_NPI.text.length != 10)
	{
		success = false;
		errorStr += "NPI must be 10 chars long \n";	
		if (!toSetFocus)
			toSetFocus = id_NPI;
	}
	if(! (id_speciality.selectedItem ))
	{
		success = false;
		errorStr += "Please Select Speciality \n";	
		if (!toSetFocus)
			toSetFocus = id_speciality;
	} 
	
	if(success == false)
	{
		var alert:Alert = Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			if (toSetFocus)
				toSetFocus.setFocus();
		});
		id_ProfileViews.selectedIndex = 1;
		//callLater (alert.move, [Capabilities.screenResolutionX /4 , Capabilities.screenResolutionY / 2 ]);
		PopUpManager.centerPopUp (alert);
	}
	return success;
}

//Billing Provider info
public function ValidateBillingProviderDetails():Boolean
{
	var success:Boolean = new Boolean();
	var errorStr:String = new String();
	success = true;
	var toSetFocus:Object;			
	
	if (UtilityFunctions.TrimString(id_TPI.text).length != 0 && UtilityFunctions.TrimString(id_TPI.text).length != 9)
	{
		success = false;
		errorStr += "TPI must be 9 digits long \n";	
		if (!toSetFocus)
			toSetFocus = id_TPI;					
	}
	
	/* if (UtilityFunctions.TrimString(id_LicenseNo.text).length == 0)
	{
	success = false;
	errorStr += "Please enter Liscense number \n";	
	if (!toSetFocus)
	toSetFocus = id_LicenseNo;					
	}
	else if (UtilityFunctions.TrimString(id_LicenseNo.text).length != 14)
	{
	success = false;
	errorStr += "Liscense number must be 15 chars long \n";	
	if (!toSetFocus)
	toSetFocus = id_LicenseNo;					
	}	 */
	
	if (UtilityFunctions.TrimString(id_EIN.text).length != 0 && UtilityFunctions.TrimString(id_EIN.text).length != 9)
	{
		success = false;
		errorStr += "EIN must be 9 digits long \n";	
		if (!toSetFocus)
			toSetFocus = id_EIN;					
	}
	
	if (UtilityFunctions.TrimString(id_CLIA.text).length != 0 && UtilityFunctions.TrimString(id_CLIA.text).length != 10) 
	{
		success = false;
		errorStr += "CLIA number must be 10 chars long \n";	
		if (!toSetFocus)
			toSetFocus = id_CLIA;
	}
	
	if (id_chkSignature.selected == true)
	{
		var date:String = UtilityFunctions.TrimString(id_SignDate.text)
		if(UtilityFunctions.IsNullOrEmpty(date))
		{
			success = false;
			errorStr += "Signature on file is checked, please enter signature date \n";							
			if (!toSetFocus)
				toSetFocus = id_SignDate;
			
		}
		else if( ! ValidationUtils.isValidDateFormat(date))
		{
			success = false;
			errorStr += "please enter signature date in valid format \n";						
			if (!toSetFocus)
				toSetFocus = id_SignDate;
		}
		else
		{
			var checkFutureDate:String = ValidationUtils.isValidAndNotFutureDate(date);
			if( checkFutureDate != "true")
			{
				success = false;
				if(checkFutureDate == "future")
					errorStr += "You have entered a future date, please enter a valid signatur date \n";
				else
					errorStr += "please enter a valid signatur date \n";							
				if (!toSetFocus)
					toSetFocus = id_SignDate;
			}
		}
	}							
	
	if(success == false)
	{
		var alert:Alert = Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			if (toSetFocus)
				toSetFocus.setFocus();
		});
		id_ProfileViews.selectedIndex = 2;
		//callLater (alert.move, [Capabilities.screenResolutionX /4 , Capabilities.screenResolutionY / 2 ]);
		PopUpManager.centerPopUp (alert);
	}
	return success;
}
// Tab 2 save method ----------------------
public function saveProviderDetails():void
{
	if(id_chkProvider.selected)
	{
		if(!ValidateProviderDetails())
		{
			return;
		}
		
		var UpdateUserXML:XML = <UpdateUser />;
		UpdateUserXML.@UserId				= userID;
		UpdateUserXML.@isProvider			= 'true';
		UpdateUserXML.@NPI					= id_NPI.text;
		UpdateUserXML.@WorkDays				= model.SearchProviderDetailsResults.WorkDays;
		UpdateUserXML.@SpecialityID			= id_speciality.selectedItem? id_speciality.selectedItem.SpecialtyID : "";
		
		var WorkingDaysXML:XML 	= <WorkingDays />;
		
		for(var i:uint=0; i<id_workdaysAddMore._dp.length; i++)
		{
			var WorkDaysXML:XML 	= <WorkDays />;
			
			WorkDaysXML.@Day				= id_workdaysAddMore._dp[i].dayName;
			WorkDaysXML.@WorkStarttime		= id_workdaysAddMore._dp[i].startTime;
			WorkDaysXML.@WorkEndtime		= id_workdaysAddMore._dp[i].endTime;
			WorkDaysXML.@isSelected			= id_workdaysAddMore._dp[i].isSelected;
			
			WorkingDaysXML.appendChild(WorkDaysXML);
		}
		
		UpdateUserXML.appendChild(WorkingDaysXML);
		
		UpdateUserXML.@Tab						= "2";
		UpdateUserEventCall("Save QM", UpdateUserXML, UserUpdated);
		isSaveAllCase = false;
	}
}
// save blling method -------------------
public function saveBillingProviderDetails():void
{
	//Billing provider info
	var UpdateUserXML:XML = <UpdateUser />;
	if(id_chkBillingProvider.selected)
	{
		if(!ValidateBillingProviderDetails())
		{
			return;
		}
		
		UpdateUserXML.@UserId				= userID;
		UpdateUserXML.@UPIN					= id_UPIN.text;
		UpdateUserXML.@LicenseNumber		= id_LicenseNo.text;					
		UpdateUserXML.@EIN					= id_EIN.text;								
		UpdateUserXML.@TPI					= id_TPI.text;
		//UpdateUserXML.@Tab					= "3"; //on 06/26/2012: Shahid Munir, to save data for provider(doctor or nurse practioner) accordingly
		UpdateUserXML.@Tab					= "3"+LoggedInUserTypeID.toString();
		UpdateUserXML.@CLIANumber			= id_CLIA.text;	
		UpdateUserXML.@IsHospice			= id_chkHospiceEmp.selected.toString();	
		UpdateUserXML.@SignatureOnFile		= id_chkSignature.selected.toString();	
		if(id_chkSignature.selected)
			UpdateUserXML.@SignatureDate		= id_SignDate.text;	
		UpdateUserXML.@IsParticipating		= id_chkParticipating.selected.toString();	
		UpdateUserXML.@StopSubmission		= id_chkStopSubmission.selected.toString();	
	}
	
	UpdateUserEventCall("Save QM", UpdateUserXML, UserUpdated);
	isSaveAllCase = true;
}

public function saveProviderInsuranceID():void
{
	//Billing provider info
	var updatePrvInsXML:XML = XmlUtils.getNodeByTagName("ProviderInsurances");
	
	for each (var prvIns:ProviderInsuranceDTO in model.ProviderInsuranceList) 
	{
		if(prvIns.IsToSave)
			updatePrvInsXML.appendChild(prvIns.ToXML());							
	}
	
	if(providerInsuranceDeletedList.length > 0)
	{
		for each (var prvInsDto:ProviderInsuranceDTO in providerInsuranceDeletedList) 
		{
			updatePrvInsXML.appendChild(prvInsDto.ToXML());							
		}
		
		providerInsuranceDeletedList.removeAll();
	}
	
	var rpEvent_ : ManageProviderInsuranceEvent = new ManageProviderInsuranceEvent(updatePrvInsXML, PrvInsResult);				
	CairngormEventDispatcher.getInstance().dispatchEvent( rpEvent_ ); 
}
// ManageProviderInsuranceEvent call back method
private function PrvInsResult(result:XML):void
{
	if(String(result) == "true")
		Alert.show("Provider Insurance ID(s) saved successfully.","Confirmation", 4, FlexGlobals.topLevelApplication.mainContainer);
	else
		Alert.show("Provider Insurance ID(s) not saved.","Confirmation", 4, FlexGlobals.topLevelApplication.mainContainer);
	
	for each (var PrvIns:ProviderInsuranceDTO in model.ProviderInsuranceList) 
	{
		PrvIns.IsToSave = false;
	}
}
// validate Epres Tab 
public function validateEpresTab():Boolean
{
	var success:Boolean = new Boolean();
	var errorStr:String = new String();
	success = true;
	var toSetFocus:Object;
	
	if(success == false)
	{
		var alert:Alert = Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			if (toSetFocus)
				toSetFocus.setFocus();
		});					
		errorStr = "";
		
	}
	return success;
}

public function saveEpresDetails():void
{
	//Billing provider info
	var UpdateUserXML:XML = <UpdateUser />;
	//if(id_chkBillingProvider.selected)
	{
		UpdateUserXML.@UserId				= userID;
		UpdateUserXML.@DAE					= id_DEA.text;
		UpdateUserXML.@Tab					= "4";
	}
	
	if(!ValidatePersonalInfo())
	{
		return;
	}
	if(!validateEpresTab())
	{
		return;
	}
	
	SaveAddressDTO();
	
	UpdateUserEventCall("Save QM", UpdateUserXML, UserUpdated);
	isSaveAllCase = false;
}

public function GaxenIdCallBack():void
{
	//trace("gaxen Id saved to Gazuntite manager");
}

private function editProviderInsurance(event:DataGridActionEvent):void
{	
	if(id_PvInsGrid.selectedItems.length == 0)
	{
		Alert.show("Please select a record", "No record selected", 4, FlexGlobals.topLevelApplication.mainContainer);
		return;
	}
	model.CurrentProviderInsurance = id_PvInsGrid.selectedItem as ProviderInsuranceDTO;
	model.CurrentProviderInsurance.ModifiedBy = model.LoggedInUserId.toString();
	var editPvIns:ProviderInsuranceID = new ProviderInsuranceID();
	editPvIns.title = "Edit Provider Insurance ID";
	editPvIns.ShowPopup(FlexGlobals.topLevelApplication.mainContainer,true);
	editPvIns.editIndex = id_PvInsGrid.selectedIndex;
}
// ------------------delete record in billing handler ----------------
private function deleteProviderInsurance(event:DataGridActionEvent):void
{
	if((id_PvInsGrid.selectedItem as ProviderInsuranceDTO).ID == "0")
	{
		model.ProviderInsuranceList.removeItemAt(id_PvInsGrid.selectedIndex);
		return;
	}
	Alert.show("Are you sure, you want to delete saved provider insurance ID?","Confirmation", Alert.YES|Alert.NO, this, function( event:CloseEvent):void
	{
		if( event.detail == Alert.YES )
		{
			(id_PvInsGrid.selectedItem as ProviderInsuranceDTO).IsDeleted = "true";
			(id_PvInsGrid.selectedItem as ProviderInsuranceDTO).ModifiedBy = model.LoggedInUserId.toString();
			providerInsuranceDeletedList.addItem(id_PvInsGrid.selectedItem as ProviderInsuranceDTO);
			model.ProviderInsuranceList.removeItemAt(id_PvInsGrid.selectedIndex);
		} 
	});
}
// -------------Cancel Button Click handler --------------
protected function cancelBtn_clickHandler():void
{
	
}
// ----------------- password change handler -----------------------------
protected function id_PasswordChange_clickHandler(event:MouseEvent):void
{
	var oldPass:String 			= id_OldPassword.text;
	var newpass:String 			= id_Password.text;
	var newpassConfirm:String 	= id_PasswordConfirm.text;
	
	var success:Boolean = false;
	var errorStr:String;
	
	if(oldPass == "")
	{
		errorStr = "Please provide old password";
		success = false;
		id_OldPassword.setFocus();
	}				
		
	else if(newpass == "")
	{
		errorStr = "Please provide new password";
		success = false;
		id_Password.setFocus();
	}
		
	else if(newpassConfirm == "")
	{
		errorStr = "Please confirm new password";
		success = false;
		id_PasswordConfirm.setFocus();
	}
		
	else if(newpassConfirm != newpass)
	{
		errorStr = "New and Confirm new password do not match";
		success = false;
		id_Password.setFocus();
	}
	else
	{
		success = true;
	}
	
	if(success == false)
	{
		Alert.show(errorStr, "Required Fields", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			
			
		});
		return;
	}
	else
	{					
		/* <UserPassword   UserId="1"  NewPassword="sfsdf+34+_."  ExistingPassword="sdfsdf5%#_" /> */
		
		var userPassword:XML 			= <UserPassword />
		userPassword.@UserId 			= userID.toString();
		userPassword.@NewPassword 		= UtilityFunctions.getEncodedBase64String(newpass);
		userPassword.@ExistingPassword 	= UtilityFunctions.getEncodedBase64String(oldPass);
		
		//var changepass:ChangePasswordEvent = new ChangePasswordEvent(userID.toString(), newpass, oldPass, passwordChanged);				
		var changepass:UpdateUserPasswordbyPostEvent 	= new UpdateUserPasswordbyPostEvent(passwordChanged);
		changepass.data 					= userPassword; 			
		CairngormEventDispatcher.getInstance().dispatchEvent(changepass);
	}
}
// UpdateUserPasswordbyPostEvent call back handler
public function passwordChanged(response:XML):void
{
	var pass:String = response;
	
	if(model.securityProxyObject.isPasswordChanged)
	{
		id_passwordGrpM.visible = true;
		id_passwordGrpM.includeInLayout = true;
	}
}
//  ----------- Tab 4 Prescriber checkbox change Handler ---------------- 
protected function id_chkPrescriber_changeHandler(event:Event):void
{
	if(!id_chkPrescriber.selected)
	{
		if(id_spi.text.length > 0)//TA --The user who is subscribed with surescript should not be able to un-check the prescriber checkbox. When he un-checks it, a message should come saying 'You cannot un-check this check box unless your subscription with surescript ends'
		{
			id_chkPrescriber.selected = true;
			id_DEA.setFocus();
			Alert.show('You cannot un-check this check box unless your subscription with surescript ends', 'info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
		else
		{
			Alert.show("Un-checking this check box will disable the information of this section and you will not be able to use it anywhere, are you sure you want to un-check?",	"Are you sure?", Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, function( event:CloseEvent):void
			{
				if( event.detail == Alert.YES )
				{							
					id_chkPrescriber.selected 	= false;
				}
				else if( event.detail == Alert.NO )
				{
					id_chkPrescriber.selected = true;
					id_DEA.setFocus();
				}
			});	
		}
	}
	else
	{
		id_DEA.setFocus();
	}
	
	if(!id_chkPrescriber.selected)
	{
		id_chkSupervisor.selected = false;
	}
}
//  ----------- Tab 4 Supervisor checkbox change handler ----------------
protected function id_chkSupervisor_changeHandler(event:Event):void
{
	if(id_chkSupervisor.selected)
	{
		id_chkPrescriber.selected = true;
		id_supervisorList.enabled = true;
		id_supervisorList.selectedIndex	= 0;
	}
	else
	{
		id_supervisorList.enabled = false;
	}
}
//  Tab 3 - BillingProvider check box handler -----------------------------
protected function id_chkBillingProvider_changeHandler(event:Event):void
{
	checkBillingProviderTab();
	
	id_LicenseNo.enabled 	= id_chkBillingProvider.selected;
	id_UPIN.enabled 		= id_chkBillingProvider.selected;
	id_TPI.enabled 			= id_chkBillingProvider.selected;
	id_EIN.enabled 			= id_chkBillingProvider.selected;
	//on 06/26/2012: Shahid Munir
	id_CLIA.enabled			    = id_chkBillingProvider.selected;
	id_chkSignature.enabled	    = id_chkBillingProvider.selected;
	id_SignDate.enabled			= id_chkBillingProvider.selected;
	id_chkParticipating.enabled	= id_chkBillingProvider.selected;
	id_chkHospiceEmp.enabled	= id_chkBillingProvider.selected;
	id_chkStopSubmission.enabled= id_chkBillingProvider.selected;
	
	if(!id_chkBillingProvider.selected) // check is turned off
	{
		Alert.show("Un-checking this check box will disable the information of this section and you will not be able to use it anywhere, are you sure you want to un-check?",	"Are you sure?", Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, function( event:CloseEvent):void
		{
			if( event.detail == Alert.YES )
			{							
				//
			}
			else if( event.detail == Alert.NO )
			{
				id_chkBillingProvider.selected = true;
				
				id_LicenseNo.enabled 	= id_chkBillingProvider.selected;
				id_UPIN.enabled 		= id_chkBillingProvider.selected;
				id_TPI.enabled 			= id_chkBillingProvider.selected;
				id_EIN.enabled 			= id_chkBillingProvider.selected;
				//on 06/26/2012: Shahid Munir
				id_CLIA.enabled			    = id_chkBillingProvider.selected;
				id_chkSignature.enabled	    = id_chkBillingProvider.selected;
				id_SignDate.enabled			= id_chkBillingProvider.selected;
				id_chkParticipating.enabled	= id_chkBillingProvider.selected;
				id_chkHospiceEmp.enabled	= id_chkBillingProvider.selected;
				id_chkStopSubmission.enabled= id_chkBillingProvider.selected;
			}
		});	
	}
	else
	{
		id_UPIN.setFocus();
	}
}
// -- Tab 2 - provider checkbox change handler -----------------
protected function id_chkProvider_changeHandler():void
{
	if(id_chkPrescriber.selected && !id_chkProvider.selected)
	{
		id_chkProvider.selected = true;
		Alert.show('You cannot un-check this check box unless your subscription with surescript ends', 'info', 4, FlexGlobals.topLevelApplication.mainContainer);
		id_speciality.setFocus();
		return;
	}
	checkProviderTab();
	
	id_NPI.enabled 			= id_chkProvider.selected;
	id_speciality.enabled 	= id_chkProvider.selected;
	
	if(!id_chkProvider.selected) // check is turned off
	{
		Alert.show("Un-checking this check box will disable the information of this section and you will not be able to use it anywhere, are you sure you want to un-check?",	"Are you sure?", Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, function( event:CloseEvent):void
		{
			if( event.detail == Alert.YES )
			{							
				//
			}
			else if( event.detail == Alert.NO )
			{
				id_chkProvider.selected = true;
				
				id_workdaysAddMore.enabled	 	= id_chkProvider.selected;
				
				id_NPI.enabled 			= id_chkProvider.selected;
				id_speciality.enabled 	= id_chkProvider.selected;
			}
		});	
	}
	else
	{
		id_workdaysAddMore.setFocus();
	}
}

protected function id_chkPrescriberAgent_changeHandler(event:Event):void
{
	// TODO Auto-generated method stub
	checkEPresTab();
	id_prescriberAgents.enabled  = id_chkPrescriberAgent.selected;
}
// TAb 1 save button click handler ------------------------
protected function id_sectionSave_clickHandler(event:MouseEvent):void
{
	SavePersonalInfo();
}
//TA - Eprescription Section Level save button Click handler
protected function id_savePres_clickHandler(event:MouseEvent):void
{
	if(userStatus == "Pending")
	{
		Alert.show("User Status is already Pending", "Eprescription Alert", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
			
		});
	}
	else
	{
		SubscribeUser('True');
	}
}
// change mode 
protected function id_ChangeMode_clickHandler():void
{
	id_viewmodePersonal.visible 		= id_editmodePersonal.visible;
	if(id_viewmodePersonal.visible)
	{
		if(!isSaveAllCase)
		{
			Alert.show("Unsaved changes will be lost, do you want to exit?",	"Are you sure?", Alert.YES|Alert.NO, FlexGlobals.topLevelApplication.mainContainer, function( event:CloseEvent):void
			{
				if( event.detail == Alert.YES )
				{							
					id_ChangeMode.label = "Edit Profile";
					//Change TAb 2 into view mode
					id_workdaysAddMore.isViewMode = true; // for view mode
					//E-prescription section - view mode;
					id_DEAGroup.visible = true;
					id_DEAGroup.enabled = true;
				}
				else if( event.detail == Alert.NO )
				{
					id_viewmodePersonal.visible = false;
				}
			});
		}
		else
		{
			id_ChangeMode.label = "Edit Profile";
			//Change TAb 2 into view mode
			id_workdaysAddMore.isViewMode = true; // for view mode
			//E-prescription section - view mode;
			id_DEAGroup.visible = true;
			id_DEAGroup.enabled = true;
			if(isSaveAllCase)
			{
				isSaveAllCase = false;
				creationCompleteHandler();
			}
		}
	}
	else
	{
		id_ChangeMode.label = "View";
		id_Prefix.setFocus();
	}
}
// ----------------- upload image button clic handler ------------------------
protected function UploadImage_clickHandler(event:MouseEvent):void
{
	var fileTypes:FileFilter = new FileFilter( "Image Files", "*.gif;*.jpeg;*.jpg;*.png" );
	fileToOpen.browse([fileTypes]);
	fileToOpen.addEventListener(Event.SELECT, fileSelected); 
}
// file selected handler -----------------------
private function fileSelected(event:Event):void
{
	var stream:FileStream = new FileStream(); // open filestream
	stream.open(fileToOpen, FileMode.READ); // open the file
	
	var size_500K:Number = 500 * 1024;
	
	if (stream.bytesAvailable <= size_500K)
	{
		m_oImageContent = new ByteArray();
		stream.readBytes( m_oImageContent, 0, stream.bytesAvailable ); // read file
		stream.close(); // close file
	}
	else
	{
		Alert.show("Image size can not be greater than 500k.\n", "Image size error", 4, FlexGlobals.topLevelApplication.mainContainer, function():void
		{
			id_UploadImage.setFocus();
		});
	}
	id_ProfileImage.source =  m_oImageContent;
	m_oImageContentString  =  AppUtils.getBase64String(m_oImageContent);
}  

protected function id_sectionSaveBillingProvider_clickHandler(event:MouseEvent):void
{
	saveBillingProviderDetails();				
}

protected function id_sectionSaveProvider_clickHandler(event:MouseEvent):void
{
	saveProviderDetails();
}
//--- save Prescriber section level button click handler
protected function id_sectionSaveEPres_clickHandler(event:MouseEvent):void
{
	saveEpresDetails();
}

protected function id_ChangePassBtn_clickHandler(event:MouseEvent):void
{
	id_passwordGrpM.visible = false;
	id_passwordGrpM.includeInLayout = false;
	id_OldPassword.setFocus();
}

protected function id_PasswordCancelBtn_clickHandler(event:MouseEvent):void
{
	id_passwordGrpM.visible = true;
	id_passwordGrpM.includeInLayout = true;
}

protected function button2_clickHandler(event:MouseEvent):void
{
	id_ProfileViews.selectedIndex++;
	setFocusOnChange();
}
private function setFocusOnChange():void
{
	if(id_ProfileViews.selectedIndex == 0)
	{
		id_Prefix.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 1)
	{
		id_speciality.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 2)
	{
		id_UPIN.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 3)
	{
		id_DEA.setFocus();
	}
}
//-- TA -- Tab Index Change Handler -------------------
protected function id_ProfileViews_tabIndexChangeHandler(event:Event):void
{
	checkProviderTab();
	checkBillingProviderTab();
	checkEPresTab();
	
	if(id_ProfileViews.selectedIndex > 0) // if user goes to any other tab 
	{
		if(!id_viewmodePersonal.visible) // and if its edit mode..
		{
			if(!ValidatePersonalInfo()) // and if personal info is not validated..
			{
				id_ProfileViews.selectedIndex = 0;
			}
		}
	}
	setFocusOnChange();
}
//--TA -- PROVIDER TAB GREEN TICK
private function checkBasicTab():void
{
	if(ProviderName.length)
		id_tab_basicinfo.hasChange = true;
	else
		id_tab_basicinfo.hasChange = false;
}
//--TA -- PROVIDER TAB GREEN TICK
private function checkProviderTab():void
{
	if(id_chkProvider.selected)
	{
		
		if( id_NPI.text != "" || id_speciality.selectedItem )
		{
			id_tab_provider.hasChange = true;
		}
		else
		{
			id_tab_provider.hasChange = false;
		}
	}
	else
	{
		id_tab_provider.hasChange = false;
	}
}
//--TA -- BILLING TAB GREEN TICK
private function checkBillingProviderTab():void
{
	//id_tab_billing
	if(id_chkBillingProvider.selected)
	{
		
		if(id_UPIN.text != "" || id_TPI.text != "" || id_EIN.text != "" || id_LicenseNo.text != "" || id_CLIA.text != "" )
		{
			id_tab_billing.hasChange = true;
		}
		else
		{
			id_tab_billing.hasChange = false;
		}
	}
	else
	{
		id_tab_billing.hasChange = false;
	}
}
//--TA -- PRESCRIBER TAB GREEN TICK
private function checkEPresTab():void
{
	//id_tab_epres
	
	if(id_chkPrescriber.selected)
	{
		if(id_Fax.text != "" || id_DEA.text != "")
		{
			id_tab_epres.hasChange = true;
		}
		else
		{
			id_tab_epres.hasChange = false;
		}
	}
	else
	{
		id_tab_epres.hasChange = false;
	}
}
//--TA -- Previous Button Change Handler
protected function previousButton_clickHandler(event:MouseEvent):void
{
	id_ProfileViews.selectedIndex--;
	setFocusOnChange();
}

protected function id_AddPvIns_clickHandler(event:MouseEvent):void
{
	var newPvInsDTO:ProviderInsuranceDTO = new ProviderInsuranceDTO();
	
	newPvInsDTO.CertificationNumber = "";
	newPvInsDTO.ClinicBranchID = clinicBranchID.toString();
	newPvInsDTO.CreatedBy = model.LoggedInUserId.toString();;
	newPvInsDTO.EnrollmentTypeID = "1";
	newPvInsDTO.FacilityID = "0";
	newPvInsDTO.ID = "0";
	newPvInsDTO.InsOrganizationID = "0";
	newPvInsDTO.InsuranceName = "All";
	newPvInsDTO.IsDeleted = "0";
	newPvInsDTO.IsNPIFromPractce = "true";
	newPvInsDTO.IsTaxIDFromPractce = "true";
	newPvInsDTO.IsTaxonomyFromPractce = "true";
	newPvInsDTO.Legacy1QualifierTypeID = "0";
	newPvInsDTO.Legacy2QualifierTypeID = "0";
	newPvInsDTO.Legacy3QualifierTypeID = "0";
	newPvInsDTO.LegacyNumber1 = "";
	newPvInsDTO.LegacyNumber2 = "";
	newPvInsDTO.LegacyNumber3 = "";
	newPvInsDTO.ModifiedBy = "0";
	newPvInsDTO.NPI = "";
	newPvInsDTO.POSNumber = "";
	newPvInsDTO.POSQualifierTypeID = "0";
	newPvInsDTO.StationID = model.LoggedInUserSelectedStationId.toString();
	newPvInsDTO.TaxIdSSN = "";
	newPvInsDTO.TaxIdSSNQualifierTypeID = "0";
	newPvInsDTO.Taxonomy = "";
	newPvInsDTO.UserID = userID.toString();
	newPvInsDTO.UserTypeID = model.LoggedInUserProviderTypeId.toString();				
	
	model.CurrentProviderInsurance = newPvInsDTO;
	
	var addPvIns:ProviderInsuranceID = new ProviderInsuranceID();
	addPvIns.title = "New Provider Insurance ID";
	addPvIns.ShowPopup(FlexGlobals.topLevelApplication.mainContainer,true);				
}			
//TA -- Section level Save Insurance
protected function id_savePvIns_clickHandler(event:MouseEvent):void
{
	saveProviderInsuranceID();
}

//TA - Set Provider name with prefix on data load
/* private var _ProviderName:String;

[Bindable]
public function get ProviderName():String
{
return _ProviderName;
}

public function set ProviderName(value:String):void
{
_ProviderName = value;
_ProviderName = '';

if(model.SearchProviderDetailsResults.FirstName.length>0)
_ProviderName = model.SearchProviderDetailsResults.FirstName;

if(model.SearchProviderDetailsResults.MiddleName.length>0)
_ProviderName = _ProviderName +' '+model.SearchProviderDetailsResults.MiddleName;

if(model.SearchProviderDetailsResults.LastName.length>0)
_ProviderName = _ProviderName +' '+model.SearchProviderDetailsResults.LastName;
if(model.SearchProviderDetailsResults.PrefixTypeID.length>0)
{
if(model.SearchProviderDetailsResults.PrefixTypeID == '1')
_ProviderName ='Mr. '+ _ProviderName;
if(model.SearchProviderDetailsResults.PrefixTypeID == '2')
_ProviderName ='Ms. '+ _ProviderName;
if(model.SearchProviderDetailsResults.PrefixTypeID == '3')
_ProviderName ='Mrs. '+ _ProviderName;
}
} */

//TA - changing Tab bar event handler
protected function id_mainTanButtons_changeHandler(event:IndexChangeEvent):void
{
	if(id_ProfileViews.selectedIndex == 0 && !id_viewmodePersonal.visible )//First Tab (Basic Information)
	{
		id_Prefix.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 1 && !id_viewmodePersonal.visible )//Second Tab (Provider Detail)
	{
		id_workdaysAddMore.isViewMode = false; // for edit mode
		if(id_chkProvider.selected)
			id_speciality.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 2 && !id_viewmodePersonal.visible )//Third Tab (Billing Tab)
	{
		//if(id_UPIN.text.length >0)
		//	id_chkBillingProvider.selected = true;
		
		//id_UPIN.setFocus();
		id_chkBillingProvider.setFocus();
	}
	else if(id_ProfileViews.selectedIndex == 3 && !id_viewmodePersonal.visible && id_chkPrescriber.visible && id_chkPrescriber.selected )//Fourth Tab (e-Prescription Tab)
	{
		id_DEA.setFocus();
	}
	
	if(id_ProfileViews.selectedIndex == 1 && id_viewmodePersonal.visible)
		id_workdaysAddMore.isViewMode = true; // for view mode
}

protected function id_SSN_changeHandler(event:TextOperationEvent):void
{
	var s:String = id_SSN.text.replace(/[^0-9]/g,"");
	id_SSN.text  = s.substring(0,3) + (s.length>3?"-"+s.substring(3,5) + (s.length>5?"-"+s.substring(5,9):""):"");
	id_SSN.selectRange(id_SSN.text.length, id_SSN.text.length);
	
	var val1:String = id_SSN.text;
	var val2:String = val1.replace('-','');
	SSNIDValue = val2.replace('-','');
}

protected function id_Fax_changeHandler(event:TextOperationEvent):void
{
	applyMask();
}
//--TA ----- apply masking on the phone number
public function applyMask():void
{
	var s:String      = id_Fax.text.replace(/[^0-9]/g,"");
	id_Fax.text = '('+s.substring(0,3) + (s.length>3?")"+s.substring(3,6) + (s.length>6?"-"+s.substring(6,10):""):"");
	id_Fax.selectRange(id_Fax.text.length, id_Fax.text.length);
	
	if(id_Fax.text.length == 1 && id_Fax.text == '(')
		id_Fax.text = '';
}
public function getPhoneNumberWithoutMasking(text:String):String
{
	var val1:String = text;
	var val2:String = val1.replace('(','');
	var val3:String = val2.replace(')','');
	var val4:String = val3.replace('-','');
	
	return val4;
}
//TA - apply masking on the phone number at load time
public function setPhoneNumberMasking(val:String):String
{
	var val_Format:String = '(' + val.substring(0,3) + ')' + val.substring(3,6) + '-' + val.substring(6,10);
	return val_Format;
}
//---TA -- Green tick issue ---------------------------

protected function comboChangeIndicator(event:IndexChangeEvent):void 
{
	if(id_Prefix.selectedIndex != -1 || id_Gender1.selectedIndex != -1 || id_ZipCityStateCombine.id_ZIP.selectedIndex != -1 || id_ZipCityStateCombine.id_City.selectedIndex != -1 ||id_ZipCityStateCombine.id_State.selectedIndex != -1 )
	{
		id_tab_basicinfo.hasChange = true;
	}
	else
	{
		id_tab_basicinfo.hasChange = false;
	}
}
protected function textInputChangeIndicator(event:TextOperationEvent):void 
{
	if(id_FName.text.length > 0 ||id_MName.text.length > 0 || id_LName.text.length > 0 || id_SSN.text.length > 0 || id_Suffix.text.length > 0 || id_Address.text.length >0 || id_Fax.text.length > 0 )
	{
		id_tab_basicinfo.hasChange = true;
	}
	else
	{
		id_tab_basicinfo.hasChange = false;
	}
}
