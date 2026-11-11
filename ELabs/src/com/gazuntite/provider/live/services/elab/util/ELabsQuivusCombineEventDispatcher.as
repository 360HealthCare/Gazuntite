package com.gazuntite.provider.live.services.elab.util
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.provider.live.services.elab.event.LoadeLabsStaticDataEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;

	public class ELabsQuivusCombineEventDispatcher
	{
		public function ELabsQuivusCombineEventDispatcher()
		{
		}
		
		public static function LoadDMStaticData():void
		{
			
			var model : ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
			
			if(model.LabOrderListDto == null)
			{
				/*var eve:LoadDocumentTypeStaticDataEvent = new LoadDocumentTypeStaticDataEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent( eve );*/
				
			}
		}
			
		
		public static function LoadELabStaticData():void
		{
			var lsfo:LoadeLabsStaticDataEvent = new LoadeLabsStaticDataEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( lsfo );
		}
	}
}