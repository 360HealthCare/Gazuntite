package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;

	public class LoadOrderDocumentEvent extends CairngormEvent
	{
		
		public var OrderID		:int;
		public var docType		:String;
		public var callBack	:Function;
		
		public function LoadOrderDocumentEvent( orderID : int, docType:String, callBack:Function )
		{
			super( ELabsController.LOAD_ORDER_DOCUMENT );
			this.OrderID 	= orderID;
			this.docType 	= docType;
			this.callBack 	= callBack;
		}
	}
}