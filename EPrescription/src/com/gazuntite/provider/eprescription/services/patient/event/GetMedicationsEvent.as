package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	import com.gazuntite.provider.eprescription.services.patient.dto.MedicationRequestDTO;

	public class GetMedicationsEvent extends CairngormEvent
	{
		public var MedicineDTO:MedicationRequestDTO;
		public var callback:Function;
		
		public function GetMedicationsEvent(obj:MedicationRequestDTO , Callback:Function)
		{
			this.MedicineDTO = obj;
			this.callback = Callback;
			super(EPrescriptionController.GET_MEDICATIONS);
		}
	}
}