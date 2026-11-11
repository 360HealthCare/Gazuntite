package com.gazuntite.provider.eprescription.services.patient.event.billing
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;

	public class ManageProviderInsuranceEvent extends CairngormEvent
	{
		public var xmlData   :	XML;
		public var callBack	 :  Function;
		
		public function ManageProviderInsuranceEvent(xmlData:XML, callBack:Function = null)
		{
			super(EPrescriptionController.MANAGE_PROVIDER_INSURANCE_EVENT);
			
			this.xmlData   = xmlData;
			this.callBack  = callBack;
		}
	}
}