package com.gazuntite.common.dto.pmh.Allergy
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class AllergyDTO
	{
		// Properties 
		 
		private var _GaxenPatientID 		:String;
		private var _modNotesID		 		:int;
		private var _modDictationID 		:int;
		private var _AllergyName 			:String;
		private var _isNKDA 				:Boolean;
		private var _OnSet 					:String;
		private var _onSetDate				:Date;
		private var _DictationID 			:String;
		private var _Note 					:String = '';
		private var _isActive 				:Boolean;
		private var _GaxenAllergyID 		:String = '';
		private var _NKDA 					:String;
		private var _VisitDate				:String;
		private var _Reaction				:String = '';
		private var _Status				    :String;
		private var _LastName				:String;
		private var _FirstName				:String;
		private var _Gender				    :String;
		private var _DOB				    :String;
		private var _Phone				    :String;
		private var _Address				:String;
		private var _ClinicID				:String;
		private var _UserName				:String;
		private var _UserPassord			:String;
		private var _SSN				    :String;
		private var _EncounterID			:String = '';
		private var _GaxenUserID			:String;
		
		private var _seriesNumber:Number 			= 1;
		public var isAllergyNameValid:Boolean 	= true;
		public var isReactionValid:Boolean 		= true;
		public var isOnSetValid:Boolean 		= true;
		public var inEditMode:Boolean			= false;
		public var inDictationNoteMode:Boolean = false;
		
		public function get seriesNumber():Number
		{
			return _seriesNumber;
		}

		public function set seriesNumber(value:Number):void
		{
			_seriesNumber = value;
		}

		public function get GaxenUserID():String
		{
			return _GaxenUserID;
		}

		public function set GaxenUserID(value:String):void
		{
			_GaxenUserID = value;
		}

		public function get SSN():String
		{
			return _SSN;
		}

		public function set SSN(value:String):void
		{
			_SSN = value;
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

		public function get ClinicID():String
		{
			return _ClinicID;
		}

		public function set ClinicID(value:String):void
		{
			_ClinicID = value;
		}

		public function get Address():String
		{
			return _Address;
		}

		public function set Address(value:String):void
		{
			_Address = value;
		}

		public function get Phone():String
		{
			return _Phone;
		}

		public function set Phone(value:String):void
		{
			_Phone = value;
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

		public function get Status():String
		{
			return _Status;
		}
		
		public function set Status(value:String):void
		{
			_Status = value;
		}
		
		public function get Reaction():String
		{
			return _Reaction;
		}
		
		public function set Reaction(value:String):void
		{
			_Reaction = value;
		}
		
		public function get VisitDate():String
		{
			return _VisitDate;
		}
		
		public function set VisitDate(value:String):void
		{
			_VisitDate = value;
		}
		
		public function get NKDA():String
		{
			return _NKDA;
		}
		
		public function set NKDA(value:String):void
		{
			_NKDA = value;
		}
		
		public function get GaxenPatientID():String
		{
			return _GaxenPatientID;
		}
		
		public function set GaxenPatientID(value:String):void
		{
			_GaxenPatientID = value;
		}
		
		public function get modNotesID():int
		{
			return _modNotesID;
		}
		
		public function set modNotesID(value:int):void
		{
			_modNotesID = value;
		}
		
		public function get modDictationID():int
		{
			return _modDictationID;
		}
		
		public function set modDictationID(value:int):void
		{
			_modDictationID = value;
		}
		
		public function get AllergyName():String
		{
			return _AllergyName;
		}
		
		public function set AllergyName(value:String):void
		{
			_AllergyName = value;
		}
		
		public function get isNKDA():Boolean
		{
			return _isNKDA;
		}
		
		public function set isNKDA(value:Boolean):void
		{
			_isNKDA = value;
		}
		
		public function get OnSet():String
		{
			return _OnSet;
		}
		
		public function set OnSet(value:String):void
		{
			_OnSet = value;
			var d:Date =  new Date( Date.parse(_OnSet));
			if (!isNaN(d.day))
			{
				onSetDate = d;
			}
			else
			{
				onSetDate = null;
			}
		}
		
		public function get DictationID():String
		{
			return _DictationID;
		}
		
		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}
		
		public function get Note():String
		{
			return _Note;
		}
		
		public function set Note(value:String):void
		{
			_Note = value==null?"":value;
		}
		
		public function get isActive():Boolean
		{
			return _isActive;
		}
		
		public function set isActive(value:Boolean):void
		{
			_isActive = value;
		}
		
		public function get GaxenAllergyID():String
		{
			return _GaxenAllergyID;
		}
		
		public function set GaxenAllergyID(value:String):void
		{
			_GaxenAllergyID = value;
		}
		
		public function get FilterFeild():String
		{
			return AllergyName;
		}
		public function get EncounterID():String
		{
			return _EncounterID;
		}
		
		public function set EncounterID(value:String):void
		{
			_EncounterID = value;
		}
		
		
		public function ToXML():XML
		{
			var rootXml :XML	= XmlUtils.getNodeByTagName("PatientAllergies");
			//var xml :XML 		= XmlUtils.getNodeByTagName("Header")
			rootXml.@[XmlConstants.GAXENPATIENTID]				= GaxenPatientID ;
			rootXml.@[XmlConstants.MODDICATIONID]				= modNotesID.toString() ;
			rootXml.@[XmlConstants.MODDICATIONID]				= modDictationID.toString();
			rootXml.@[XmlConstants.ALLERGYNAME]					= AllergyName ;
			
			rootXml.@[XmlConstants.NKDA]						= isNKDA.toString() ;
			rootXml.@[XmlConstants.ISACTIVE]					= isActive ;
			rootXml.@[XmlConstants.ONSET]						= OnSet ;
			rootXml.@[XmlConstants.DICTATIONID]					= DictationID.toString();
			rootXml.@[XmlConstants.NOTE]						= Note ;
			
			rootXml.@[XmlConstants.GAXENALLERGYID]				= GaxenAllergyID;
			
			rootXml.@[XmlConstants.VISITDATE]					= VisitDate;
			rootXml.@[XmlConstants.REACTION]					= Reaction;
			
			rootXml.@[XmlConstants.LAST_NAME]					= LastName;
			rootXml.@[XmlConstants.FIRST_NAME]					= FirstName;
			rootXml.@[XmlConstants.GENDER]						= Gender;
			rootXml.@[XmlConstants.DOB]							= DOB;
			rootXml.@[XmlConstants.PHONE]						= Phone;
			rootXml.@[XmlConstants.ADDRESS]						= Address;
			rootXml.@[XmlConstants.CLINICID]					= ClinicID;
			rootXml.@[XmlConstants.USER_NAME]					= UserName;
			rootXml.@[XmlConstants.USER_PASSWORD]				= UserPassord;
			rootXml.@[XmlConstants.SSN]							= SSN;
			rootXml.@[XmlConstants.UserGaxenID]					= GaxenUserID;
			rootXml.@[XmlConstants.ENCOUNTER_ID]				= EncounterID;
			
			return rootXml;
		}
		
		public function FromXML(x:XML):void
		{
			GaxenPatientID 	 	=	x.@[XmlConstants.GAXENPATIENTID];
			modNotesID			= 	parseInt(x.@[XmlConstants.MODNOTESID]);
			modDictationID 		= 	parseInt(x.@[XmlConstants.MODDICATIONID]);
			AllergyName 		= 	x.@[XmlConstants.ALLERGYNAME];
			isNKDA 				= 	UtilityFunctions.StringToBoolean(x.@[XmlConstants.NKDA]) ;
			isActive 			= 	UtilityFunctions.StringToBoolean(x.@[XmlConstants.ISACTIVE]);
			OnSet 				= 	x.@[XmlConstants.ONSET];
			DictationID     	=   x.@[XmlConstants.DICTATIONID];
			Note                =   x.@[XmlConstants.NOTE];
			GaxenAllergyID 		= 	x.@[XmlConstants.GAXENALLERGYID];
			VisitDate			=   x.@[XmlConstants.VISITDATE];
			Reaction			=	x.@[XmlConstants.REACTION];		
			EncounterID			=	x.@[XmlConstants.ENCOUNTER_ID];		
		}
		
		public function formatData():void
		{
			if(isActive)
				Status			=    "Active";
			else
				Status			=    "InActive";
			if(isNKDA)
			{
				OnSet 			= 	"N/A";
				AllergyName 	= 	"N/A";
				NKDA            =   "No Known Drug Allergies";
				VisitDate		=   "N/A";
				Status			=	"N/A";
				Reaction		=	"N/A";
			}
			else
				NKDA                =   "N/A";
		}

		public function get onSetDate():Date
		{
			return _onSetDate;
		}

		public function set onSetDate(value:Date):void
		{
			_onSetDate = value;
			if (value!=null)
			{
				_OnSet = UtilityFunctions.FormatDate (_onSetDate);
			}
			else
			{
				_OnSet = "";
			}
		}
		public function validate():void
		{
			if (isNKDA)
			{
				isAllergyNameValid = true;
				isReactionValid = true;
				isOnSetValid = true;
			}
			else
			{
				isAllergyNameValid = (AllergyName!=''&& AllergyName!=null);
			//	isReactionValid = (Reaction!='' && Reaction!=null);
				isOnSetValid = (onSetDate!=null);
			}
		}
	}
}