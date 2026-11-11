package com.gazuntite.common.util.exceptionAlert
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.adobe.gazuntite.skins.chrome.containerSkins.TitleWindowSkin;
	import com.gazuntite.common.dto.ErrorReportDTO;
	import com.gazuntite.common.event.SendErrorReportEvent;
	import com.gazuntite.controls.extended.components.PopupWindow;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import spark.components.Button;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.TextArea;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalAlign;
	import spark.layouts.VerticalLayout;
	
	public class QSCombinedExceptionAlert extends PopupWindow
	{
		private var logger:ILogger = Log.getLogger("com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert");
		
		private static var instance:QSCombinedExceptionAlert;
		
		[Bindable]
		private var loggedInUserID:int;
		
		[Bindable]
		private var IsShowDetails:Boolean =false;
		
		[SkinPart(required="false")]
		/**
		 *  general message for the user to send error reoprt;
		 */		
		public var headerLable:Label;
		
		[SkinPart(required="false")]
		/**
		 * display error detils, contains all error related information
		 */		
		public var txtDetails:TextArea;
		
		[SkinPart(required="false")]
		/**
		 *  show hide details wiew of the dialog
		 */		
		public var btnShowDetails:Button;
		
		
		[SkinPart(required="false")]
		/**
		 *  send the current error report ot server
		 */		
		public var btnSendReport:Button;
		
		
		[SkinPart(required="false")]
		/**
		 *  user cancel the dialog, close it
		 */		
		public var btnCancel:Button;
		
		
		override public function QSCombinedExceptionAlert(lock:Lock)
		{
			super();
			if( UtilityFunctions.IsNullOrEmpty( lock ) )
				throw("invalid! this class is a singleton, you can't instantiate it, use getInstance method instead...");
			this.setStyle("skinClass",TitleWindowSkin);
		}
		
		public static function getInstance():QSCombinedExceptionAlert
		{
			if ( UtilityFunctions.IsNullOrEmpty( instance ) )
				instance = new QSCombinedExceptionAlert(new Lock());
			
			return instance;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var vl:VerticalLayout = new VerticalLayout();
			vl.paddingBottom 	= 10;
			vl.paddingRight		= 10;
			vl.paddingLeft		= 10;
			vl.paddingTop		= 10;
			
			vl.verticalAlign 	= VerticalAlign.MIDDLE;
			vl.horizontalAlign	= HorizontalAlign.LEFT;
				
				
			this.layout = vl; 
			
			createAndLayoutChildren();
		}
		
		protected function createAndLayoutChildren():void
		{
			this.title 			= "System Generated Error Report" ;
			headerLable 		= new Label();
			headerLable.text 	= "Please tell Gazuntite team about this error. " +
				"System automatically created an report for this error, you can send that error to " +
				"‘Gazuntite technical team to improve the product quality.";
			headerLable.width = 450;
			addElement( headerLable );
			
			btnShowDetails 				= new Button();
			btnShowDetails.label		= "Show Details";
			btnShowDetails.styleName    = "blackButtonSkin";
			btnShowDetails.width		= 100;
			
			btnShowDetails.addEventListener( MouseEvent.CLICK, ShowDetails_clickHandler );
			addElement( btnShowDetails );
			
			txtDetails 					= new TextArea();
			txtDetails.percentWidth 	= 100;
			txtDetails.percentHeight 	= 65;
			addElement( txtDetails );
			ToggleDetailsView();
			
			var hg:HGroup 				= new HGroup();
			hg.percentWidth				= 100;
			hg.verticalAlign 			= VerticalAlign.MIDDLE;
			hg.horizontalAlign			= HorizontalAlign.RIGHT;
			addElement( hg );
			
			btnSendReport 				= new Button();
			btnSendReport.label			= "Send Error Report";
			btnSendReport.styleName    = "blackButtonSkin";
			btnSendReport.width		   = 110;
			btnSendReport.addEventListener( MouseEvent.CLICK, Send_clickHandler );
			hg.addElement( btnSendReport );
			
			btnCancel 					= new Button();
			btnCancel.label				= "Don't Send Report";
			btnCancel.styleName    = "blackButtonSkin"; 
			btnCancel.width		   = 110;
			btnCancel.addEventListener( MouseEvent.CLICK, Cancel_clickHandler );
			hg.addElement( btnCancel );
			
			addEventListener( "closing", closingHandler );
		}
		
		
		private function ClosePopup():void
		{
			try
			{
				txtDetails.text = "";
				removePopup();
			}
			catch(e:*)
			{
				trace("QSCombinedExceptionAlert::ClosePopup ", e.toString() );
			}
		}
		
		protected function ShowDetails_clickHandler(event:MouseEvent):void
		{
			ToggleDetailsView();
		}
		
		private function ToggleDetailsView():void
		{
			if(!txtDetails.visible)
			{
				txtDetails.visible 			= true;
				txtDetails.includeInLayout 	= true;
				btnShowDetails.label 		= "Hide Details";
			}
			else
			{
				txtDetails.visible			= false;
				txtDetails.includeInLayout 	= false;
				btnShowDetails.label		= "Show Details";
			}
		}
		
		protected function Cancel_clickHandler(event:MouseEvent):void
		{
			ClosePopup();		
		}
		
		protected function Send_clickHandler(event:MouseEvent):void
		{
			var objErrorDTO:ErrorReportDTO 	= new ErrorReportDTO();
			objErrorDTO.EmailTemplateID 	= 1;
			objErrorDTO.Message 			= txtDetails.text;
			objErrorDTO.Subject 			= "‘Gazuntite Error Report";
			objErrorDTO.SenderID 			= loggedInUserID;
			
			var errorSendingEvent:SendErrorReportEvent = new SendErrorReportEvent(objErrorDTO, ClosePopup);
			CairngormEventDispatcher.getInstance().dispatchEvent(errorSendingEvent);
		}
		
		protected function closingHandler(event:Event):void
		{
			txtDetails.text = "";
			//ClosePopup();		
		}
		
		
		public function Show(targetName:String, message:String, userID:int):void
		{
			var p:DisplayObject;
			if(FlexGlobals.topLevelApplication.hasOwnProperty('mainContainer'))
			{
				p = FlexGlobals.topLevelApplication.mainContainer as DisplayObject
			}
			else
			{
				p = FlexGlobals.topLevelApplication as DisplayObject
			}
			
			ShowPopup( p, false );
			
			var messageSeperator:String = "---***--- " + targetName + " ---***---   \n";
			
			callLater( function():void
			{
				if( txtDetails.text.length > 0 )
					messageSeperator = "\n\n" + messageSeperator;
				
				txtDetails.text 	+= messageSeperator + message;
				loggedInUserID 		= userID;
			});
			
			logger.error( messageSeperator + "<br />" + message );
		}
	}
}

class Lock
{
	//Singleton Lock;;;;;
}