package com.gazuntite.provider.eprescription.services.patient.dto.billing
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	

	public class ProviderInsuranceDTO
	{		
		private var _ID:String;
		private var _ClinicBranchID:String;
		private var _UserID:String;
		private var _UserTypeID:String;
		private var _InsOrganizationID:String;
		private var _InsuranceName:String;
		private var _StationID:String;
		private var _FacilityID:String;
		private var _EnrollmentTypeID:String;
		private var _IsNPIFromPractce:String;
		private var _NPI:String;
		private var _IsTaxonomyFromPractce:String;
		private var _Taxonomy:String;
		private var _IsTaxIDFromPractce:String;
		private var _TaxIdSSN:String;
		private var _TaxIdSSNQualifierTypeID:String;
		private var _CertificationNumber:String;
		private var _POSNumber:String;
		private var _POSQualifierTypeID:String;
		private var _LegacyNumber1:String;
		private var _Legacy1QualifierTypeID:String;
		private var _LegacyNumber2:String;
		private var _Legacy2QualifierTypeID:String;
		private var _LegacyNumber3:String;
		private var _Legacy3QualifierTypeID:String;
		private var _CreatedBy:String;
		private var _ModifiedBy:String;
		private var _IsDeleted:String;
		private var _IsToSave:Boolean;
		
		
		public function ProviderInsuranceDTO()
		{
		}
		
		public function get IsToSave():Boolean
		{
			return _IsToSave;
		}

		public function set IsToSave(value:Boolean):void
		{
			_IsToSave = value;
		}

		public function get InsuranceName():String
		{
			return _InsuranceName;
		}

		public function set InsuranceName(value:String):void
		{
			_InsuranceName = value;
		}

		public function FromXML(x:XML):void
		{
			ID  						= x.@[XmlConstants.ID];
			ClinicBranchID				= x.@["ClinicBranchID"];
			UserID  					= x.@[XmlConstants.USER_ID];
			UserTypeID  				= x.@["UserTypeID"];
			InsOrganizationID  			= x.@[XmlConstants.INSORGANIZATIONID];
			InsuranceName  			    = x.@[XmlConstants.INSURANCENAME];
			StationID  					= x.@["StationID"];
			FacilityID  				= x.@["FacilityID"];
			EnrollmentTypeID  			= x.@["EnrollmentTypeID"];
			IsNPIFromPractce  			= x.@["IsNPIFromPractce"];
			if(IsNPIFromPractce == "true")
				NPI = "From Practice";
			else
				NPI = x.@[XmlConstants.NPI];
			IsTaxonomyFromPractce  		= x.@["IsTaxonomyFromPractce"];
			if(IsTaxonomyFromPractce == "true")
				Taxonomy = "From Practice";
			else
				Taxonomy = x.@["Taxonomy"];
			IsTaxIDFromPractce  		= x.@["IsTaxIDFromPractce"];
			if(IsTaxIDFromPractce == "true")
				TaxIdSSN = "From Practice";
			else
				TaxIdSSN = x.@["TaxIdSSN"];
			TaxIdSSNQualifierTypeID  	= x.@["TaxIdSSNQualifierTypeID"];
			CertificationNumber  		= x.@["CertificationNumber"];
			POSNumber  					= x.@["POSNumber"];
			POSQualifierTypeID  		= x.@["POSQualifierTypeID"];
			LegacyNumber1  				= x.@["LegacyNumber1"];
			Legacy1QualifierTypeID  	= x.@["Legacy1QualifierTypeID"];
			LegacyNumber2  				= x.@["LegacyNumber2"];
			Legacy2QualifierTypeID  	= x.@["Legacy2QualifierTypeID"];
			LegacyNumber3  				= x.@["LegacyNumber3"];
			Legacy3QualifierTypeID  	= x.@["Legacy3QualifierTypeID"];
			CreatedBy  					= x.@[XmlConstants.CREATEDBY];
			ModifiedBy  				= x.@[XmlConstants.MODIFIEDBY];
			IsDeleted  					= x.@[XmlConstants.ISDELETED];
			IsToSave					= false;
			
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("ProviderInsurance");
			
			x.@[XmlConstants.ID]					= ID;
			x.@["ClinicBranchID"]					= ClinicBranchID;
			x.@[XmlConstants.USER_ID]   			= UserID;
			x.@["UserTypeID"]           			= UserTypeID;
			x.@[XmlConstants.INSORGANIZATIONID]     = InsOrganizationID;
			x.@["StationID"]						= StationID;
			x.@["FacilityID"]						= FacilityID;
			x.@["EnrollmentTypeID"]					= EnrollmentTypeID;
			x.@["IsNPIFromPractce"]					= IsNPIFromPractce;			
			x.@[XmlConstants.NPI]					= NPI;
			x.@["IsTaxonomyFromPractce"]			= IsTaxonomyFromPractce;
			x.@["Taxonomy"]							= Taxonomy;
			x.@["IsTaxIDFromPractce"]				= IsTaxIDFromPractce;
			x.@["TaxIdSSN"]							= TaxIdSSN;
			x.@["TaxIdSSNQualifierTypeID"]			= TaxIdSSNQualifierTypeID;
			x.@["CertificationNumber"]				= CertificationNumber;
			x.@["POSNumber"]						= POSNumber;
			x.@["POSQualifierTypeID"]				= POSQualifierTypeID;
			x.@["LegacyNumber1"]					= LegacyNumber1;
			x.@["Legacy1QualifierTypeID"]			= Legacy1QualifierTypeID;
			x.@["LegacyNumber2"]					= LegacyNumber2;
			x.@["Legacy2QualifierTypeID"]			= Legacy2QualifierTypeID;
			x.@["LegacyNumber3"]					= LegacyNumber3;
			x.@["Legacy3QualifierTypeID"]			= Legacy3QualifierTypeID;
			x.@[XmlConstants.CREATEDBY]				= CreatedBy;
			x.@[XmlConstants.MODIFIEDBY]			= ModifiedBy;
			x.@[XmlConstants.ISDELETED]				= IsDeleted;
			
			return x;
			
		}

		public function get ID():String
		{
			return _ID;
		}

		public function set ID(value:String):void
		{
			_ID = value;
		}

		public function get ClinicBranchID():String
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:String):void
		{
			_ClinicBranchID = value;
		}

		public function get UserID():String
		{
			return _UserID;
		}

		public function set UserID(value:String):void
		{
			_UserID = value;
		}

		public function get UserTypeID():String
		{
			return _UserTypeID;
		}

		public function set UserTypeID(value:String):void
		{
			_UserTypeID = value;
		}

		public function get InsOrganizationID():String
		{
			return _InsOrganizationID;
		}

		public function set InsOrganizationID(value:String):void
		{
			_InsOrganizationID = value;
		}

		public function get StationID():String
		{
			return _StationID;
		}

		public function set StationID(value:String):void
		{
			_StationID = value;
		}

		public function get FacilityID():String
		{
			return _FacilityID;
		}

		public function set FacilityID(value:String):void
		{
			_FacilityID = value;
		}

		public function get EnrollmentTypeID():String
		{
			return _EnrollmentTypeID;
		}

		public function set EnrollmentTypeID(value:String):void
		{
			_EnrollmentTypeID = value;
		}

		public function get IsNPIFromPractce():String
		{
			return _IsNPIFromPractce;
		}

		public function set IsNPIFromPractce(value:String):void
		{
			_IsNPIFromPractce = value;
		}

		public function get NPI():String
		{
			return _NPI;
		}

		public function set NPI(value:String):void
		{
			_NPI = value;
		}

		public function get IsTaxonomyFromPractce():String
		{
			return _IsTaxonomyFromPractce;
		}

		public function set IsTaxonomyFromPractce(value:String):void
		{
			_IsTaxonomyFromPractce = value;
		}

		public function get Taxonomy():String
		{
			return _Taxonomy;
		}

		public function set Taxonomy(value:String):void
		{
			_Taxonomy = value;
		}

		public function get IsTaxIDFromPractce():String
		{
			return _IsTaxIDFromPractce;
		}

		public function set IsTaxIDFromPractce(value:String):void
		{
			_IsTaxIDFromPractce = value;
		}

		public function get TaxIdSSN():String
		{
			return _TaxIdSSN;
		}

		public function set TaxIdSSN(value:String):void
		{
			_TaxIdSSN = value;
		}

		public function get TaxIdSSNQualifierTypeID():String
		{
			return _TaxIdSSNQualifierTypeID;
		}

		public function set TaxIdSSNQualifierTypeID(value:String):void
		{
			_TaxIdSSNQualifierTypeID = value;
		}

		public function get CertificationNumber():String
		{
			return _CertificationNumber;
		}

		public function set CertificationNumber(value:String):void
		{
			_CertificationNumber = value;
		}

		public function get POSNumber():String
		{
			return _POSNumber;
		}

		public function set POSNumber(value:String):void
		{
			_POSNumber = value;
		}

		public function get POSQualifierTypeID():String
		{
			return _POSQualifierTypeID;
		}

		public function set POSQualifierTypeID(value:String):void
		{
			_POSQualifierTypeID = value;
		}

		public function get LegacyNumber1():String
		{
			return _LegacyNumber1;
		}

		public function set LegacyNumber1(value:String):void
		{
			_LegacyNumber1 = value;
		}

		public function get Legacy1QualifierTypeID():String
		{
			return _Legacy1QualifierTypeID;
		}

		public function set Legacy1QualifierTypeID(value:String):void
		{
			_Legacy1QualifierTypeID = value;
		}

		public function get LegacyNumber2():String
		{
			return _LegacyNumber2;
		}

		public function set LegacyNumber2(value:String):void
		{
			_LegacyNumber2 = value;
		}

		public function get Legacy2QualifierTypeID():String
		{
			return _Legacy2QualifierTypeID;
		}

		public function set Legacy2QualifierTypeID(value:String):void
		{
			_Legacy2QualifierTypeID = value;
		}

		public function get LegacyNumber3():String
		{
			return _LegacyNumber3;
		}

		public function set LegacyNumber3(value:String):void
		{
			_LegacyNumber3 = value;
		}

		public function get Legacy3QualifierTypeID():String
		{
			return _Legacy3QualifierTypeID;
		}

		public function set Legacy3QualifierTypeID(value:String):void
		{
			_Legacy3QualifierTypeID = value;
		}

		public function get CreatedBy():String
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:String):void
		{
			_CreatedBy = value;
		}

		public function get ModifiedBy():String
		{
			return _ModifiedBy;
		}

		public function set ModifiedBy(value:String):void
		{
			_ModifiedBy = value;
		}

		public function get IsDeleted():String
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:String):void
		{
			_IsDeleted = value;
		}

	}
}