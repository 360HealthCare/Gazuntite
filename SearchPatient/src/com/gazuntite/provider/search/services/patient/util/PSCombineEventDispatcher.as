package com.gazuntite.provider.search.services.patient.util
{
	import com.gazuntite.provider.search.services.patient.model.SearchPatientModelLocator;

	public class PSCombineEventDispatcher
	{
		public function PSCombineEventDispatcher()
		{
		}
		
		
		public static function LoadDMStaticData():void
		{
			
			var model : SearchPatientModelLocator = SearchPatientModelLocator.getInstance();
			
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