package com.gazuntite.common.dto.assessment.followUp
{
	[Bindable]
	public class PMedicationDTO
	{
		private var _DrugName:String = '';
		
		/*<PatientMedication xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<PMedication>
				<Messages GaxenPatientID="GXP-667" NDCCODE="00078038305" Strength="25 mg-160 mg" Dose="0" DoseForm="" Quantity="0" QuantityForm="" frequency="" Route="" Duration="" isPRN="false" 
		Refill="0" Substitution="" Type="History" EncounterID="6644" SIG="" NCPDPID="" ReferenceNumber="PON-737" WrittenDate="2012-12-16T10:50:32.937" MessageTypeID="" LastName="" FirstName="" Gender="" 
		DOB="" Phone="" Address="" UserName="" UserPassord="" ClinicID="" MessageStatus="" SPI="" isChronic="true" DrugName="hydrochlorothiazide-valsartan" VisitDate="12/16/2012" isActive="true" SSN=""/>
			</PMedication>
			</PatientMedication>*/
		
		public function PMedicationDTO()
		{
		}
		
		public function get DrugName():String
		{
			return _DrugName;
		}

		public function set DrugName(value:String):void
		{
			_DrugName = value;
		}

		public function FromXml(x:XML):void
		{
			DrugName = x.@DrugName;
		}
		
		public function ToXml():void
		{
			
		}
	}
}