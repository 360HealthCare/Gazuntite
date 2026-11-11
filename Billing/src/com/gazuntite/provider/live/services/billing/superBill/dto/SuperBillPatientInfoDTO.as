package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SuperBillPatientInfoDTO
	{
				
		private var m_sUserId:String;
		private var m_sPatient:String;
		private var m_sQuivusID:String;
		private var m_sSSN:String;
		private var m_sDateOfBirth:String;
		private var m_sGender:String;
		private var _ImageData:String;
		private var m_sPhone:String;
		private var m_sPreferredLocation:String;
		
		private var m_sAddress:String;
		private var m_sCity:String;
		private var m_sState:String;
		private var m_sZIP:String;
		
		private var m_sPatientId:String;		

		public function get ImageData():String
		{
			return _ImageData;
		}

		public function set ImageData(value:String):void
		{
			_ImageData = value;
		}

		public function get PatientId():String
		{
			return m_sPatientId;
		}		
		public function set PatientId(value:String):void
		{
			m_sPatientId = value;
		}
		
		public function get Address():String
		{
			return m_sAddress;
		}
		
		public function set Address(value:String):void
		{
			m_sAddress = value;
		}
		
		public function get City():String
		{
			return m_sCity;
		}
		
		public function set City(value:String):void
		{
			m_sCity = value;
		}
		
		public function get State():String
		{
			return m_sState;
		}
		
		public function set State(value:String):void
		{
			m_sState = value;
		}
		
		public function get ZIP():String
		{
			return m_sZIP;
		}
		
		public function set ZIP(value:String):void
		{
			m_sZIP = value;
		}
		
		private var m_oInsuranceInfo:ArrayCollection;
		
		public function get PatientInsuranceInfo():ArrayCollection
		{
			return m_oInsuranceInfo;
		}
		
		public function set PatientInsuranceInfo(value:ArrayCollection):void
		{
			m_oInsuranceInfo = value;
		}
		
		public function FromXML( x:XML ):void
		{
			UserId 							= x.@[XmlConstants.USERID];
			Patient 						= x.@[XmlConstants.PIPATIENT];
			PatientId 						= x.@[XmlConstants.PBPATIENTID];
			QuivusID 						= x.@[XmlConstants.PIQUIVUSID];			
			SSN 							= x.@[XmlConstants.PISSN];
			DateOfBirth 					= x.@[XmlConstants.DATEOFBIRTH];
			Gender 							= x.@[XmlConstants.PIGENDER];			
			//ImageData 						= x.@[XmlConstants.IMAGEDATA];			
			Phone 							= x.@[XmlConstants.PHONE];
			PreferredLocation 				= x.@[XmlConstants.PREFERREDLOCATION];
			Address							= x.@[XmlConstants.ADDRESS];
			City							= x.@[XmlConstants.CITY];
			State							= x.@[XmlConstants.STATE];
			ZIP								= x.@[XmlConstants.ZIP];
			
			PatientInsuranceInfo =new ArrayCollection();
			var xInsurances:XMLList = x.InsuranceInfo.Insurance;
			var i:int = 0;					
			for( i = 0; i < xInsurances.length(); i++ )
			{
				var dct:SuperBillPatientInsuranceDTO = new SuperBillPatientInsuranceDTO();
				dct.FromXML( xInsurances[i][0] );
				PatientInsuranceInfo.addItem( dct );
			}			
		}		
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "PatientInfo" );
			
			x.@[XmlConstants.PBVISITID]						= UserId;			
			x.@[XmlConstants.PIPATIENT]						= Patient;
			x.@[XmlConstants.PIQUIVUSID]					= QuivusID
			x.@[XmlConstants.PISSN]							= SSN;
			x.@[XmlConstants.DATEOFBIRTH]					= UtilityFunctions.FormatDate(DateOfBirth);
			x.@[XmlConstants.PIGENDER]						= Gender;
			x.@[XmlConstants.PHONE]							= Phone
			x.@[XmlConstants.PREFERREDLOCATION]				= PreferredLocation;
			x.@[XmlConstants.ADDRESS]						= Address;
			x.@[XmlConstants.CITY]							= City;
			x.@[XmlConstants.STATE]							= State;
			x.@[XmlConstants.ZIP]							= ZIP;
			
			if(PatientInsuranceInfo != null && PatientInsuranceInfo.length > 0 )
			{
				var xIns:XML = XmlUtils.getNodeByTagName( "InsuranceInfo" );
				
				for(var i:int = 0; i < PatientInsuranceInfo.length; i++)
				{
					var enmi:SuperBillPatientInsuranceDTO = PatientInsuranceInfo[i];				
					xIns.appendChild(enmi.ToXML());
				}
				x.appendChild(xIns);
			}
			/*else
			{
				var xIns:XML = XmlUtils.getNodeByTagName( "InsuranceInfo" );
				var emptyIns:SuperBillPatientInsuranceDTO = new SuperBillPatientInsuranceDTO();
				emptyIns.Address = "";
				emptyIns.City ="";
				emptyIns.Copay = "0";
				emptyIns.ExpiryDate ="";
				emptyIns.PolicyNumber ="";
				emptyIns.GroupNumber ="";
				emptyIns.InsOrganizationID = "0";
				emptyIns.InsuranceName = "";
				emptyIns.InsuranceNatureId = "0";
				emptyIns.InsurancePlan = "";
				emptyIns.InsuranceTypeName = "";
				emptyIns.IsEligible = "";
				emptyIns.NatureCode = "";
				emptyIns.NatureDescription = "";
				emptyIns.State = "";
				emptyIns.ZIP = "";				
				
				xIns.appendChild(emptyIns.ToXML());
				
				x.appendChild(xIns);
			}*/
			
			return x;
		}
		
		public function get UserId():String
		{
			return m_sUserId;
		}
		
		public function set UserId(value:String):void
		{
			m_sUserId = value;
		}
		
		public function get Patient():String
		{
			return m_sPatient;
		}
		
		public function set Patient(value:String):void
		{
			m_sPatient = value;
		}
		public function get QuivusID():String
		{
			return m_sQuivusID;
		}
		
		public function set QuivusID(value:String):void
		{
			m_sQuivusID = value;
		}
		public function get SSN():String
		{
			return m_sSSN;
		}
		
		public function set SSN(value:String):void
		{
			m_sSSN = value;
		}
		public function get DateOfBirth():String
		{
			return m_sDateOfBirth;
		}
		
		public function set DateOfBirth(value:String):void
		{
			value = UtilityFunctions.FormatDate(value.substr(0,10),"MM/DD/YYYY");
			m_sDateOfBirth = value;
		}
		public function get Gender():String
		{
			return m_sGender;
		}
		
		public function set Gender(value:String):void
		{
			m_sGender = value;
		}
		public function get Phone():String
		{
			return m_sPhone;
		}
		
		public function set Phone(value:String):void
		{
			m_sPhone = value;
		}
		public function get PreferredLocation():String
		{
			return m_sPreferredLocation;
		}
		
		public function set PreferredLocation(value:String):void
		{
			m_sPreferredLocation = value;
		}		
		
	}
}