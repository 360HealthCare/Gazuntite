package com.gazuntite.provider.live.services.elab.view.event
{
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;
	import com.gazuntite.provider.live.services.elab.view.lab.vo.LabVO;
	
	import flash.events.Event;
	
	public class ElabActionEvent extends Event
	{
		public static const ELAB_ORDER_VIEW_DOCUMENT_CLICK:String = "eLabOrderViewDocumentClick";
		public static const ELAB_ORDER_EDIT_CLICK:String = "eLabOrderEditClick";
		public static const ELAB_ORDER_SAVE_CLICK:String = "eLabOrderSaveClick";
		public static const ELAB_ORDER_ITEM_EDIT_KEY_UP:String = "eLabOrderItemEditKeyUp";
		public static const ELAB_ORDER_PROCESSED:String = "eLabOrderProcessed";
		public static const ELAB_ORDER_SELECTED:String = "eLabOrderSelected";
		
		public static const ELAB_RESULT_ENTER_CLICK:String = "eLabResultEnterClick";
		public static const ELAB_RESULT_VIEW_CLICK:String = "eLabResultViewClick";
		public static const ELAB_RESULT_SAVE_CLICK:String = "eLabResultSaveClick";
		public static const ELAB_RESULT_VIEW_ATTACHMENT_CLICK:String = "eLabViewAttachmentClick";
		
		public static const ELAB_RESULT_ATTACHMENT_UPLOADED:String = "eLabResultAttachmentUploaded";
		
		public var selection:ELabDTO;
		public var searchString:String;
		
		public function ElabActionEvent(type:String)
		{
			super(type, true, false);
		}
	}
}