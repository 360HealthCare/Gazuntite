package com.gazuntite.common.dto.pmh.presprection
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;

	[Bindable]
	public class PresprectionRXDTO extends BaseDTO
	{
		
		private var _Dose:int;
		private var _Refill:int;
		private var _PharmName:String;
		private var _isActive:Boolean;
		private var _DrugName:String;
		
		
		// Will complete this DTO when Need.
		
		/*<Messages GaxenPatientID="GXP-816" NDCCODE="00182512067" Strength="1%" Dose="2" DoseForm="C78747" Quantity="3" QuantityForm="Cassette" frequency="3 times a day" 
		Route="buccal" Duration="1" isPRN="false" Refill="0" Substitution="0" Type="e-Prescribed" EncounterID="12191" SIG="Take 2 28 Day Tablet for 1 days, 3 times a day via buccal " 
		NCPDPID="3349823" ReferenceNumber="PON-1083" WrittenDate="2013-02-08T03:38:01.653" MessageTypeID="" LastName="" FirstName="" Gender="" DOB="" Phone="" Address="" 
		UserName="" UserPassord="" ClinicID="" MessageStatus="" SPI="" isChronic="false" DrugName="silver sulfADIAZINE topical" VisitDate="02/08/2013" isActive="true" 
		SSN="" OtherID="" Notes="" PharmName="" PharmPhone="" PharmAddress="" GenericName="" DoseFormDES="" QuantityFormDES="" frequencyDES="" SubstitutionDES=""/>*/
		public function PresprectionRXDTO()
		{
		}
		
		public override function  FromXML(x:XML):void
		{
			Dose				=x.@Dose;
			Refill				=x.@Refill;
			PharmName			=x.@PharmName;
			isActive			=x.@isActive;
			DrugName			=x.@DrugName;
		}
		
		public function get FilterFeild():String
		{
			return DrugName;
		}
		
		public function get DrugName():String
		{
			return _DrugName;
		}

		public function set DrugName(value:String):void
		{
			_DrugName = value;
		}

		public function get isActive():Boolean
		{
			return _isActive;
		}

		public function set isActive(value:Boolean):void
		{
			_isActive = value;
		}

		public function get PharmName():String
		{
			return _PharmName;
		}

		public function set PharmName(value:String):void
		{
			_PharmName = value;
		}

		public function get Refill():int
		{
			return _Refill;
		}

		public function set Refill(value:int):void
		{
			_Refill = value;
		}

		public function get Dose():int
		{
			return _Dose;
		}

		public function set Dose(value:int):void
		{
			_Dose = value;
		}

		
	}
}