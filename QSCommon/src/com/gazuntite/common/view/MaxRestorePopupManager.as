package com.gazuntite.common.view
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import spark.components.Group;
	import spark.components.VGroup;
	
	public class MaxRestorePopupManager
	{
		public static var curView:UIComponent;
		public static var curViewContainer:Group;
		public static var curViewIndex:int;
		
		public static var popup:VGroup;
		
		public function MaxRestorePopupManager()
		{
		}
		public static function maxPatientView(tabName:Number):void
		{
			var main_vm:MainContainerViewModel = MainContainerViewModel.getInstance();
			var patient_vm:PatientViewModel = PatientViewModel.getInstance();
			main_vm.topbarExpended = false;
			main_vm.dispatchEvent(new Event(MainContainerViewModel.EVENT_CLOSE_TOPBAR));
			switch (tabName)
			{
				case PatientViewModel.MAIN_TAB_INPUT:
					patient_vm.showMainHistoryTab = false;
					break;
				case PatientViewModel.MAIN_TAB_HISTORY:
					patient_vm.showMainInputTab = false;
					break;
			}
		}
		public static function maxRestoreView(view:UIComponent):void
		{
			var app:UIComponent = FlexGlobals.topLevelApplication as UIComponent;
			
			if (view == curView)
			{
				PopUpManager.removePopUp(popup);
				curViewContainer.addElementAt(curView, curViewIndex);
				curView = null;
			}
			else
			{
				curView = view;
				curViewContainer = curView.parent as Group;
				curViewIndex = curViewContainer.getElementIndex(curView);
				popup = new VGroup();
				
				popup.x = 8;
				popup.y = 77;
				popup.width = app.width*0.5 - popup.x - 4;
				popup.height = app.height - popup.y - 8;

				popup.addElement(curView);
				
				PopUpManager.addPopUp(popup, app as DisplayObject, true);
			}
		}
	}
}