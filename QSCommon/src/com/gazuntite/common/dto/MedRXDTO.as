package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	/**
	 * 
	 * Author : Moeen Mohsin
	 * 
	 * **/
	[Bindable]
	public class MedRXDTO
	{
		
		/**
		 * this is the xml of the DTO
		 * 
		 * **/		
		/*<Messages GaxenPatientID="GXP-122" NDCCODE="52268050101" Strength="-" Dose="3" DoseForm="C78747" Quantity="3" QuantityForm="Cassette" frequency="3 times a week" Route="" Duration="2" 
		isPRN="false" Refill="1" Substitution="1" Type="History" EncounterID="8621" SIG="Take 3 28 Day Tablet for days, 3 times a week" NCPDPID="" ReferenceNumber="" 
		WrittenDate="2013-07-23T02:42:14.763" MessageTypeID="" LastName="TAMJEED" FirstName="MALIK" Gender="" DOB="" Phone="" Address="" UserName="" UserPassord="" ClinicID="" 
		MessageStatus="" SPI="" isChronic="true" DrugName="bisacodyl-PEG 3350 with electrolytes" VisitDate="05/03/2012" isActive="false" SSN="" OtherID="" Notes="" PharmName="" 
		PharmPhone="" PharmAddress="" GenericName="" DoseFormDES="" QuantityFormDES="" frequencyDES="" SubstitutionDES="" GaxenUserID="" DiscontinuedTypeDesc="" DiscontinuedTypeID="" EndDateofDiscontinue="" Reason=""/>*/
		
		/**
		 * 
		 * This is the xml need to send for manage call.
		 * 
		 * **/
		/*<Messages GaxenPatientID="GXP-1216" NDCCODE="00140007014" Strength="2958" Dose="2" DoseForm="C78747" DoseFormDES="28 Day Tablet" Duration="0" Quantity="2" QuantityForm="C69093" QuantityFormDES="Cassette" Route="1482" 
		frequency="3X/W" frequencyDES="3 times a week" isPRN="false" Substitution="1" SubstitutionDES="Not Allowed" Type="History" isActive="false" EncounterID="20633" Phone="" Address="" VisitDate="11/26/2013" 
		SIG="Take 2 28 Day Tablet for 2 days, 3 times a week" ReferenceNumber="" WrittenDate="2013-11-26T00:00:00" MessageTypeID="1" LastName="Patient" FirstName="Moeen" Gender="Male" DOB="07/02/2013" UserName="TESTUSER"
		UserPassord="TESTPASS" ClinicID="sad" DrugName="amitriptyline-chlordiazePOXIDE" GenericName="Limbitrol" DiscontinuedTypeID="3" MessageStatus="3" isChronic="true" SPI="null" OtherID="" Notes="" GaxenUserID="GX-7672">
			<Insurances/>
		  </Messages>*/
		
		private var _Type:String = '';  		
		private var _VisitDate:String = ''; 	
		private var _drugName:String = '';  	
		private var _SIG:String = ''; 			
		private var _Dose:String = '';  		
		private var _Quantity:String = '';  	
		private var _Status:String = ''; 	 	
		private var _NDCCODE:String = '';  	
		private var _Refill:String = '';  		
		private var _isPRN:String = '';  		
		private var _SerialNo:String = ''; 	
		private var _Phone:String = ''; 	
		private var _inEditMode:Boolean = false; 
		private var _isActive:Boolean; 
		private var _isChronic:Boolean; 
		
		
		private var _GaxenPatientID:String = ''; 	
		private var _Notes:String = ''; 	
		private var _Strength:String = ''; 	
		private var _StrengthDes:String = ''; 	
		private var _DoseForm:String = ''; 
		private var _QuantityForm:String = ''; 
		private var _frequency:String = ''; 
		private var _Route:String = ''; 
		private var _Duration:String = ''; 
		
		private var _Substitution:String = '';
		private var _EncounterID:String = '';
		private var _NCPDPID:String = '';
		private var _ReferenceNumber:String = '';
		private var _WrittenDate:String = '';
		private var _MessageTypeID:String = '';
		private var _LastName:String = '';
		private var _FirstName:String = '';
		private var _Gender:String = '';
		private var _DOB:String = '';
		private var _Address:String = '';
		private var _UserName:String = '';
		private var _UserPassord:String = '';
		private var _ClinicID:String = '';
		private var _SPI:String = '';
		private var _PharmName:String = '';
		private var _PharmPhone:String = '';
		private var _PharmAddress:String = '';
		private var _GenericName:String = '';
		private var _DoseFormDES:String = '';
		private var _QuantityFormDES:String = '';
		private var _frequencyDES:String = '';
		private var _SubstitutionDES:String = '';
		private var _GaxenUserID:String = '';
		private var _DiscontinuedTypeDesc:String = '';
		private var _DiscontinuedTypeID:String = '';
		private var _EndDateofDiscontinue:String = '';
		private var _Reason:String = '';
		private var _RouteDes :String = '';
		//M:26Nov2013
		private var _DictationID 		: String = "00000000-0000-0000-0000-000000000000";
		private var _RecordNote 		: String ;
		
		public function get RouteDes():String
		{
			return _RouteDes;
		}

		public function set RouteDes(value:String):void
		{
			_RouteDes = value;
		}

		public function get StrengthDes():String
		{
			return _StrengthDes;
		}

		public function set StrengthDes(value:String):void
		{
			_StrengthDes = value;
		}

		public function get RecordNote():String
		{
			return _RecordNote;
		}

		public function set RecordNote(value:String):void
		{
			_RecordNote = value;
		}

		public function get DictationID():String
		{
			return _DictationID;
		}
		
		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}
		
		public function MedRXDTO()
		{
		}
		
		public function get Phone():String
		{
			return _Phone;
		}

		public function set Phone(value:String):void
		{
			_Phone = value;
		}

		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get Reason():String
		{
			return _Reason;
		}

		public function set Reason(value:String):void
		{
			_Reason = value;
		}

		public function get EndDateofDiscontinue():String
		{
			return _EndDateofDiscontinue;
		}

		public function set EndDateofDiscontinue(value:String):void
		{
			_EndDateofDiscontinue = value;
		}

		public function get DiscontinuedTypeID():String
		{
			return _DiscontinuedTypeID;
		}

		public function set DiscontinuedTypeID(value:String):void
		{
			_DiscontinuedTypeID = value;
		}

		public function get DiscontinuedTypeDesc():String
		{
			return _DiscontinuedTypeDesc;
		}

		public function set DiscontinuedTypeDesc(value:String):void
		{
			_DiscontinuedTypeDesc = value;
		}

		public function get GaxenUserID():String
		{
			return _GaxenUserID;
		}

		public function set GaxenUserID(value:String):void
		{
			_GaxenUserID = value;
		}

		public function get SubstitutionDES():String
		{
			return _SubstitutionDES;
		}

		public function set SubstitutionDES(value:String):void
		{
			_SubstitutionDES = value;
		}

		public function get frequencyDES():String
		{
			return _frequencyDES;
		}

		public function set frequencyDES(value:String):void
		{
			_frequencyDES = value;
		}

		public function get QuantityFormDES():String
		{
			return _QuantityFormDES;
		}

		public function set QuantityFormDES(value:String):void
		{
			_QuantityFormDES = value;
		}

		public function get DoseFormDES():String
		{
			return _DoseFormDES;
		}

		public function set DoseFormDES(value:String):void
		{
			_DoseFormDES = value;
		}

		public function get GenericName():String
		{
			return _GenericName;
		}

		public function set GenericName(value:String):void
		{
			_GenericName = value;
		}

		public function get PharmAddress():String
		{
			return _PharmAddress;
		}

		public function set PharmAddress(value:String):void
		{
			_PharmAddress = value;
		}

		public function get PharmPhone():String
		{
			return _PharmPhone;
		}

		public function set PharmPhone(value:String):void
		{
			_PharmPhone = value;
		}

		public function get PharmName():String
		{
			return _PharmName;
		}

		public function set PharmName(value:String):void
		{
			_PharmName = value;
		}

		public function get SPI():String
		{
			return _SPI;
		}

		public function set SPI(value:String):void
		{
			_SPI = value;
		}

		public function get ClinicID():String
		{
			return _ClinicID;
		}

		public function set ClinicID(value:String):void
		{
			_ClinicID = value;
		}

		public function get UserPassord():String
		{
			return _UserPassord;
		}

		public function set UserPassord(value:String):void
		{
			_UserPassord = value;
		}

		public function get UserName():String
		{
			return _UserName;
		}

		public function set UserName(value:String):void
		{
			_UserName = value;
		}

		public function get Address():String
		{
			return _Address;
		}

		public function set Address(value:String):void
		{
			_Address = value;
		}

		public function get DOB():String
		{
			return _DOB;
		}

		public function set DOB(value:String):void
		{
			_DOB = value;
		}

		public function get Gender():String
		{
			return _Gender;
		}

		public function set Gender(value:String):void
		{
			_Gender = value;
		}

		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}

		public function get MessageTypeID():String
		{
			return _MessageTypeID;
		}

		public function set MessageTypeID(value:String):void
		{
			_MessageTypeID = value;
		}

		public function get WrittenDate():String
		{
			return _WrittenDate;
		}

		public function set WrittenDate(value:String):void
		{
			_WrittenDate = value;
		}

		public function get ReferenceNumber():String
		{
			return _ReferenceNumber;
		}

		public function set ReferenceNumber(value:String):void
		{
			_ReferenceNumber = value;
		}

		public function get NCPDPID():String
		{
			return _NCPDPID;
		}

		public function set NCPDPID(value:String):void
		{
			_NCPDPID = value;
		}

		public function get EncounterID():String
		{
			return _EncounterID;
		}

		public function set EncounterID(value:String):void
		{
			_EncounterID = value;
		}

		public function get Substitution():String
		{
			return _Substitution;
		}

		public function set Substitution(value:String):void
		{
			_Substitution = value;
		}

		public function get Duration():String
		{
			return _Duration;
		}

		public function set Duration(value:String):void
		{
			_Duration = value;
		}

		public function get Route():String
		{
			return _Route;
		}

		public function set Route(value:String):void
		{
			_Route = value;
		}

		public function get frequency():String
		{
			return _frequency;
		}

		public function set frequency(value:String):void
		{
			_frequency = value;
		}

		public function get QuantityForm():String
		{
			return _QuantityForm;
		}

		public function set QuantityForm(value:String):void
		{
			_QuantityForm = value;
		}

		public function get DoseForm():String
		{
			return _DoseForm;
		}

		public function set DoseForm(value:String):void
		{
			_DoseForm = value;
		}

		public function get Strength():String
		{
			return _Strength;
		}

		public function set Strength(value:String):void
		{
			_Strength = value;
		}

		public function get GaxenPatientID():String
		{
			return _GaxenPatientID;
		}

		public function set GaxenPatientID(value:String):void
		{
			_GaxenPatientID = value;
		}

		public function get isChronic():Boolean
		{
			return _isChronic;
		}

		public function set isChronic(value:Boolean):void
		{
			_isChronic = value;
		}

		public function get isActive():Boolean
		{
			return _isActive;
		}

		public function set isActive(value:Boolean):void
		{
			_isActive = value;
		}

		public function get inEditMode():Boolean
		{
			return _inEditMode;
		}

		public function set inEditMode(value:Boolean):void
		{
			_inEditMode = value;
		}

		public function get SerialNo():String
		{
			return _SerialNo;
		}

		public function set SerialNo(value:String):void
		{
			_SerialNo = value;
		}

		public function get isPRN():String
		{
			return _isPRN;
		}

		public function set isPRN(value:String):void
		{
			_isPRN = value;
		}

		public function get Refill():String
		{
			return _Refill;
		}

		public function set Refill(value:String):void
		{
			_Refill = value;
		}

		public function get NDCCODE():String
		{
			return _NDCCODE;
		}

		public function set NDCCODE(value:String):void
		{
			_NDCCODE = value;
		}

		public function get Status():String
		{
			return _Status;
		}

		public function set Status(value:String):void
		{
			_Status = value;
		}

		public function get Quantity():String
		{
			return _Quantity;
		}

		public function set Quantity(value:String):void
		{
			_Quantity = value;
		}

		public function get Dose():String
		{
			return _Dose;
		}

		public function set Dose(value:String):void
		{
			_Dose = value;
		}

		public function get SIG():String
		{
			return _SIG;
		}

		public function set SIG(value:String):void
		{
			_SIG = value;
		}

		public function get drugName():String
		{
			return _drugName;
		}

		public function set drugName(value:String):void
		{
			_drugName = value;
		}

		public function get VisitDate():String
		{
			return _VisitDate;
		}

		public function set VisitDate(value:String):void
		{
			_VisitDate = value;
		}

		
		public function get Type():String
		{
			return _Type;
		}

		public function set Type(value:String):void
		{
			_Type = value;
		}

		
		public function ToXml():XML
		{
			/*<Messages GaxenPatientID="GXP-1216" NDCCODE="00140007014" Strength="2958" Dose="2" DoseForm="C78747" DoseFormDES="28 Day Tablet" Duration="0" Quantity="2" QuantityForm="C69093" QuantityFormDES="Cassette" Route="1482" 
			frequency="3X/W" frequencyDES="3 times a week" isPRN="false" Substitution="1" SubstitutionDES="Not Allowed" Type="History" isActive="false" EncounterID="20633" Phone="" Address="" VisitDate="11/26/2013" 
			SIG="Take 2 28 Day Tablet for 2 days, 3 times a week" ReferenceNumber="" WrittenDate="2013-11-26T00:00:00" MessageTypeID="1" LastName="Patient" FirstName="Moeen" Gender="Male" DOB="07/02/2013" UserName="TESTUSER"
			UserPassord="TESTPASS" ClinicID="sad" DrugName="amitriptyline-chlordiazePOXIDE" GenericName="Limbitrol" DiscontinuedTypeID="3" MessageStatus="3" isChronic="true" SPI="null" OtherID="" Notes="" GaxenUserID="GX-7672">
			<Insurances/>
			</Messages>*/
			
			var x:XML = XmlUtils.getNodeByTagName('Messages');
			
			x.@GaxenPatientID		= GaxenPatientID;
			x.@NDCCODE				= NDCCODE;
			x.@Strength				= Strength;
			x.@Dose					= Dose;
			x.@DoseForm				= DoseForm;
			x.@DoseFormDES			= DoseFormDES;
			x.@Duration				= Duration;
			x.@Quantity				= Quantity;
			x.@QuantityForm			= QuantityForm;
			x.@QuantityFormDES		= QuantityFormDES;
			x.@Route				= Route;
			x.@frequency			= frequency;
			x.@frequencyDES			= frequencyDES;
			x.@isPRN				= isPRN;
			x.@Substitution			= Substitution;
			x.@SubstitutionDES		= SubstitutionDES;
			x.@Type					= Type;
			x.@isActive				= isActive;
			x.@EncounterID			= EncounterID;
			x.@Phone				= Phone;
			x.@Address				= Address;
			x.@VisitDate			= VisitDate;
			x.@SIG					= SIG;
			x.@ReferenceNumber		= ReferenceNumber;
			x.@WrittenDate			= WrittenDate;
			x.@MessageTypeID		= MessageTypeID;
			x.@LastName				= LastName;
			x.@FirstName			= FirstName;
			x.@Gender				= Gender;
			x.@DOB					= DOB;
			x.@UserName				= UserName;
			x.@UserPassord			= UserPassord;
			x.@ClinicID				= ClinicID;
			x.@DrugName				= drugName;
			x.@GenericName			= GenericName;
			x.@DiscontinuedTypeID	= DiscontinuedTypeID;
			x.@MessageStatus		= Status;
			x.@isChronic			= isChronic;
			x.@SPI					= SPI;
			x.@Notes				= Notes;
			x.@GaxenUserID			= GaxenUserID;
			x.@EndDateofDiscontinue			= EndDateofDiscontinue;
			x.@Reason			= Reason;
			
			
			
			
			x.appendChild(XmlUtils.getNodeByTagName('Insurances'));
			
			return x;
			
		}
		
		
		public function FromXml(x:XML , SNo:String):void
		{
			SerialNo = SNo;
			
			drugName	=x.@DrugName.toString();    
			Dose		=x.@Dose.toString();        
			Quantity	=x.@Quantity.toString();    
			NDCCODE		=x.@NDCCODE.toString();     
			isPRN		=x.@isPRN.toString();       
			Refill		=x.@Refill.toString();     
			Type		=x.@Type.toString();      
			VisitDate	=x.@VisitDate.toString(); 
			SIG			=x.@SIG.toString();	
			Status		=x.@MessageStatus.toString();
			isActive	=UtilityFunctions.StringToBoolean(x.@isActive.toString());
			isChronic	=UtilityFunctions.StringToBoolean(x.@isChronic.toString());
			
			
			GaxenPatientID                            =x.@GaxenPatientID.toString();          
			Strength                                  =x.@Strength.toString();                
			DoseForm                                  =x.@DoseForm.toString();                
			QuantityForm                              =x.@QuantityForm.toString();            
			frequency                                 =x.@frequency.toString();               
			Route                                     =x.@Route.toString();                   
			Duration                                  =x.@Duration.toString();                
			                                                                  
			Substitution                              =x.@Substitution.toString();            
			EncounterID                               =x.@EncounterID.toString();             
			NCPDPID                                   =x.@NCPDPID.toString();                 
			ReferenceNumber                           =x.@ReferenceNumber.toString();         
			WrittenDate                               =x.@WrittenDate.toString();             
			MessageTypeID                             =x.@MessageTypeID.toString();           
			LastName                                  =x.@LastName.toString();                
			FirstName                                 =x.@FirstName.toString();               
			Gender                                    =x.@Gender.toString();                  
			DOB                                       =x.@DOB.toString();                     
			Address                                   =x.@Address.toString();                 
			UserName                                  =x.@UserName.toString();                
			UserPassord                               =x.@UserPassord.toString();             
			ClinicID                                  =x.@ClinicID.toString();                
			SPI                                       =x.@SPI.toString();                     
			PharmName                                 =x.@PharmName.toString();               
			PharmPhone                                =x.@PharmPhone.toString();              
			PharmAddress                              =x.@PharmAddress.toString();            
			GenericName                               =x.@GenericName.toString();             
			DoseFormDES                               =x.@DoseFormDES.toString();             
			QuantityFormDES                           =x.@QuantityFormDES.toString();         
			frequencyDES                              =x.@frequencyDES.toString();            
			SubstitutionDES                           =x.@SubstitutionDES.toString();         
			GaxenUserID                               =x.@GaxenUserID.toString();             
			DiscontinuedTypeDesc                      =x.@DiscontinuedTypeDesc.toString();    
			DiscontinuedTypeID                        =x.@DiscontinuedTypeID.toString();      
			EndDateofDiscontinue                      =x.@EndDateofDiscontinue.toString();    
			Reason                                    =x.@Reason.toString();                 
			Notes                                     =x.@Notes.toString();     
			Phone                                     =x.@Phone.toString();     
			
			DictationID								  =x.@RLDictationID.toString();
			RecordNote								  =x.@RLNotes.toString();
			StrengthDes									= x.@StrengthDEs.toString();
			RouteDes									= x.@RouteDes.toString();
		}
	}
}