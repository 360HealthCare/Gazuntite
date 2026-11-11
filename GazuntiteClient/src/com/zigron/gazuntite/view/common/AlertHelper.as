package com.zigron.gazuntite.view.common
{
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.IFlexModuleFactory;
	import mx.events.CloseEvent;
	
	public class AlertHelper
	{
//		[Embed(source="assets/images/question24px.gif")]
//		public static const QUESTION_ICON:Class;
//		
//		[Embed(source="assets/images/error24px.png")]
//		public static const ERROR_ICON:Class;
//		
//		[Embed(source="assets/images/info24px.png")]
//		public static const INFO_ICON:Class;
//		
//		[Embed(source="assets/images/warning24px.png")]
//		public static const WARNING_ICON:Class;
//		
//		[Embed(source="assets/images/complete24px.png")]
//		public static const COMPLETE_ICON:Class;
		
		public function AlertHelper()
		{
		}
		
		protected var confirmHandler:Function;
		protected var cancelHandler:Function;
		
		public static function show(text:String = "", title:String = "",
									flags:uint = 0x4 /* Alert.OK */, 
									parent:Sprite = null, 
									closeHandler:Function = null, 
									iconClass:Class = null, 
									defaultButtonFlag:uint = 0x4 /* Alert.OK */,
									moduleFactory:IFlexModuleFactory = null):Alert
		{
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				iconClass, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		
		public static function showQuestion(text:String = "", title:String = "Question",
											flags:uint = 0x4 /* Alert.OK */, 
											parent:Sprite = null, 
											closeHandler:Function = null, 
											defaultButtonFlag:uint = 0x4 /* Alert.OK */,
											moduleFactory:IFlexModuleFactory = null):Alert
		{
			if (parent == null)
			{
				parent = FlexGlobals.topLevelApplication.mainContainer;
			}
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				null, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		public static function showError(text:String = "", title:String = "Error",
										 flags:uint = 0x4 /* Alert.OK */, 
										 parent:Sprite = null, 
										 closeHandler:Function = null, 
										 defaultButtonFlag:uint = 0x4 /* Alert.OK */,
										 moduleFactory:IFlexModuleFactory = null):Alert
		{
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				null, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		public static function showComplete(text:String = "", title:String = "Action Completed",
											flags:uint = 0x4 /* Alert.OK */, 
											parent:Sprite = null, 
											closeHandler:Function = null, 
											defaultButtonFlag:uint = 0x4 /* Alert.OK */,
											moduleFactory:IFlexModuleFactory = null):Alert
		{
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				null, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		public static function showInfo(text:String = "", title:String = "Info",
										flags:uint = 0x4 /* Alert.OK */, 
										parent:Sprite = null, 
										closeHandler:Function = null, 
										defaultButtonFlag:uint = 0x4 /* Alert.OK */,
										moduleFactory:IFlexModuleFactory = null):Alert
		{
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				null, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		public static function showWarning(text:String = "", title:String = "Warning",
										   flags:uint = 0x4 /* Alert.OK */, 
										   parent:Sprite = null, 
										   closeHandler:Function = null, 
										   defaultButtonFlag:uint = 0x4 /* Alert.OK */,
										   moduleFactory:IFlexModuleFactory = null):Alert
		{
			return Alert.show(text, title,
				flags, 
				parent, 
				closeHandler, 
				null, 
				defaultButtonFlag,
				moduleFactory);
		}
		
		public static function showStatusMessages(msgs:ArrayCollection, statusCode:int):void
		{
			var message:String = '';
			for each (var msg: String in msgs)
			{
				message = message + msg + '\n';
			}
			
			if (statusCode == 0)
				AlertHelper.showComplete(message);
			if (statusCode == 1)
				AlertHelper.showWarning(message);
			if (statusCode == 2)
				AlertHelper.showError(message);
		}
		public static function showContinueWarning(confirmHandler:Function, 
												   message:String = "Unsaved changes will be lost, do you want to continue?",
												   title:String = "Warning",
												   cancelHandler:Function = null,
												   defaultButtonFlag:uint = Alert.NO
		):void
		{
			var helper:AlertHelper = new AlertHelper();
			helper.confirmHandler = confirmHandler;
			helper.cancelHandler = cancelHandler;
			showWarning(message, title, Alert.YES | Alert.NO, null, helper.closeHandler, defaultButtonFlag);
		}
		
		public static function showContinueQuestion(confirmHandler:Function, 
													message:String = "Unsaved changes will be lost, do you want to continue?",
													title:String = "Warning",
													cancelHandler:Function = null,
													defaultButtonFlag:uint = Alert.CANCEL
		):void
		{
			///// for time being don't show message for Unsaved changes
			//remove next two lines
			confirmHandler.apply();
			return; 
			
			
			var helper:AlertHelper = new AlertHelper();
			helper.confirmHandler = confirmHandler;
			helper.cancelHandler = cancelHandler;
			showQuestion(message, title, Alert.OK | Alert.CANCEL, null, helper.closeHandler, defaultButtonFlag);
		}
		
		protected function closeHandler(event:CloseEvent):void
		{
			if ((event.detail == Alert.YES || event.detail == Alert.OK) && confirmHandler!=null)
			{
				confirmHandler.apply();
			}
			else if (event.detail == Alert.NO && cancelHandler!=null)
			{
				cancelHandler.apply();
			}
		}
		
	}
}