package com.gazuntite.provider.eprescription.services.patient.event.billing
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;

	public class GetProviderInsuranceEvent extends CairngormEvent
	{
		public var userId			: int;
		public var clinicBranchId	: int;
		public var callBack			: Function;
		
		public function GetProviderInsuranceEvent(userId: int, clinicBranchId: int, callBack:Function = null)
		{
			super(EPrescriptionController.GET_PROVIDER_INSURANCE_EVENT);
			
			this.userId 			= userId;
			this.clinicBranchId 	= clinicBranchId;
			this.callBack			= callBack;
		}
	}
}