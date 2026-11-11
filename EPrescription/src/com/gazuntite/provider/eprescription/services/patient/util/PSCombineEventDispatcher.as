package com.gazuntite.provider.eprescription.services.patient.util
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;

	public class PSCombineEventDispatcher
	{
		public function PSCombineEventDispatcher()
		{
		}
		
		
		public static function LoadDMStaticData():void
		{
			
			var model : EPrescriptionModelLocator = EPrescriptionModelLocator.getInstance();
			
			/*if(model.LabOrdersListDto == null)
			{
				var eve:LoadDocumentTypeStaticDataEvent = new LoadDocumentTypeStaticDataEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent( eve );
				
			}*/
			
		}
			
		
		/*public static function LoadLabOrdersByClinicList(pageNo:int):void
		{
			var ll:sear = new LoadPatientLabOrdersByClinicIdEvent( pageNo );
			CairngormEventDispatcher.getInstance().dispatchEvent( ll );
		}*/
		
	}
}