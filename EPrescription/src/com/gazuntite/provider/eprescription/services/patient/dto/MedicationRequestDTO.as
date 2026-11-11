package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class MedicationRequestDTO
	{
		private var DrugID:String = "0";
		private var _productGenName:String = "0";
		private var _NDC:String = "0";
		private var _SearchItemName:String = "0";
		private var GENPRODUCT_ID:String = "0";
		private var _GENERICNAME:String = "0";
		private var StartNumber:String = "0";
		private var StrengthID:String = "0";

		private var eusername:String;
		private var epassword:String;
		private var ClinicID:String;
		
		private var securityHeaderXML:XML;
		
		
		public function MedicationRequestDTO(eusername :String,epassword:String,ClinicID:String)
		{
			securityHeaderXML	 			= <Header />;					
			securityHeaderXML.@EUserName	= eusername;
			securityHeaderXML.@EPassword	= epassword;
			securityHeaderXML.@ClinicID		= ClinicID;
		}
		
		public function get GENERICNAME():String
		{
			return _GENERICNAME;
		}

		public function set GENERICNAME(value:String):void
		{
			_GENERICNAME = value;
		}

		public function get SearchItemName():String
		{
			return _SearchItemName;
		}

		public function set SearchItemName(value:String):void
		{
			_SearchItemName = value;
		}

		public function get productGenName():String
		{
			return _productGenName;
		}

		public function set productGenName(value:String):void
		{
			_productGenName = value;
		}

		public function get NDC():String
		{
			return _NDC;
		}

		public function set NDC(value:String):void
		{
			_NDC = value;
		}

		public function ToXml():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "SearchMedicationCriteria" );
			
			xml.@DrugID = DrugID;
			xml.@productGenName = productGenName;
			xml.@NDC = NDC;
			xml.@SearchItemName = SearchItemName;
			xml.@GENPRODUCT_ID = GENPRODUCT_ID;
			xml.@GENERICNAME = GENERICNAME;
			xml.@StartNumber = StartNumber;
			xml.@StrengthID = StrengthID;
			
			xml.appendChild(securityHeaderXML);
			return xml;
		}
	}
}