package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class MedicationNdcDTO
	{
		private var _FORMATTED_NDC:String;
		private var _NDC:String;
		
		/*<NDC FORMATTED_NDC="00054-4748-25" NDC="00054474825"/>*/
			
		public function MedicationNdcDTO()
		{
		}
		
		public function get NDC():String
		{
			return _NDC;
		}

		public function set NDC(value:String):void
		{
			_NDC = value;
		}

		public function get FORMATTED_NDC():String
		{
			return _FORMATTED_NDC;
		}

		public function set FORMATTED_NDC(value:String):void
		{
			_FORMATTED_NDC = value;
		}

		public function FromXml(x:XML):void
		{
			FORMATTED_NDC = x.@FORMATTED_NDC;
			NDC				= x.@NDC;
		}
	}
}