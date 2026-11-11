package com.gazuntite.common.util.exceptionAlert
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.adobe.gazuntite.skins.chrome.containerSkins.TitleWindowSkin;
	import com.gazuntite.common.dto.ErrorReportDTO;
	import com.gazuntite.common.event.SendErrorReportEvent;
	import com.gazuntite.controls.extended.components.PopupWindow;
	
	import flash.events.MouseEvent;
	
	import mx.containers.TitleWindow;
	import mx.controls.LinkButton;
	import mx.core.ContainerLayout;
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.skins.Border;
	
	import spark.components.Button;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.TextArea;
	import spark.components.VGroup;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalAlign;
	import spark.layouts.VerticalLayout;

	public class QSExceptionAlert extends PopupWindow
	{
		
		private var txtMessage:TextArea;
		private var txtDetailedMessage:TextArea;
		private var btnSendError:Button;
		private var btnCancel:Button;
		private var lnkbutton:LinkButton;
		private var lblHeader:Label;
		private var group:HGroup;
		private var vergroup:VGroup;
		
		
		[Bindable]
		private var loggedInUserID:int;
		
		[Bindable]
		private var IsShowDetails:Boolean =false;
		
		public function QSExceptionAlert() {
			super();
			init();
		}
		
		private function init():void {
			//this.layout = ContainerLayout.VERTICAL //ABSOLUTE;
			//this.showCloseButton = true;
			
			var verLayout:VerticalLayout = new VerticalLayout();
			verLayout.paddingBottom 	= 10;
			verLayout.paddingRight		= 10;
			verLayout.paddingLeft		= 10;
			verLayout.paddingTop		= 10;
			
			verLayout.verticalAlign 	= VerticalAlign.MIDDLE;
			verLayout.horizontalAlign	= HorizontalAlign.LEFT;
			
			
			this.layout = verLayout; 
			this.width = 400;
			this.percentHeight = 100;
			//this.setStyle("backgroundColor" ,0xB2BECC);
			this.setStyle("skinClass",TitleWindowSkin);
			
			//this.setStyle("skinClass",exceptionTitleWindowSkin);
			//this.verticalScrollPolicy = "false";
			//this.horizontalScrollPolicy = "false";
			this.addEventListener(FlexEvent.INITIALIZE, titleWin_initialize);
			this.addEventListener(CloseEvent.CLOSE, titleWin_close);
			
			lblHeader=new Label();
			lblHeader.text="This is the Header Message";
			lblHeader.id="lblHeader";
			lblHeader.setStyle("fontFamily","Calibri");
			
			
			
			txtMessage = new TextArea();
			
			txtMessage.setStyle("horizontalCenter", 0);
			txtMessage.setStyle("verticalCenter", 0);
			txtMessage.setStyle("verticalScrollPolicy","auto");
			txtMessage.setStyle("borderVisible",false);
			/*txtMessage.setStyle("width","100%");
			txtMessage.setStyle("height","100%");*/
			/*txtMessage.x=150;
			txtMessage.y=200;*/
			txtMessage.width=390;
			txtMessage.height=100;
			txtMessage.editable = false;
			txtMessage.visible = false;
			txtMessage.includeInLayout = false;
			
			
			//addChild(txtMessage);
			btnSendError =new Button();
			btnSendError.width = 150;
			btnSendError.styleName = "blackButtonSkin";
			btnSendError.label="Send Error Report";
			btnSendError.addEventListener(MouseEvent.CLICK,btnSendErrorReport_clickHandler);
			/*btnSendError.width=120;
			btnSendError.height =20;*/
			
			
			lnkbutton =new LinkButton();
			lnkbutton.label="Show Details";
			lnkbutton.setStyle("color","#0000FF");
			lnkbutton.setStyle("fontFamily","CalibriCFFDateField");
			lnkbutton.right ="0";
			lnkbutton.addEventListener(MouseEvent.CLICK,lnkShowDetails_clickHandler);
			
			
			
			txtDetailedMessage = new TextArea();
			
			txtDetailedMessage.setStyle("horizontalCenter", 0);
			txtDetailedMessage.setStyle("verticalCenter", 0);
			txtDetailedMessage.setStyle("verticalScrollPolicy","auto");
			txtDetailedMessage.setStyle("borderVisible",false);
			/*txtDetailedMessage.x=150;
			txtDetailedMessage.y=200;*/
			txtDetailedMessage.width=390;
			txtDetailedMessage.height=150;
			txtDetailedMessage.editable = false;
			txtDetailedMessage.visible = false;
			//txtDetailedMessage.visible = IsShowDetails;
			
			btnCancel =new Button();
			btnCancel.width = 100;
			btnCancel.label="Don't Send";
			btnCancel.styleName = "blackButtonSkin";
			/*btnCancel.width=120;
			btnCancel.height =20;*/
			btnCancel.addEventListener(MouseEvent.CLICK, btnDntSend_clickHandler);
			
			
			vergroup =new VGroup();
			vergroup.setStyle("width","100%");
			vergroup.setStyle("height","100%");
			
			vergroup.addElement(lblHeader);
			vergroup.addElement(lnkbutton);
			vergroup.addElement(txtMessage);

			//vergroup.addElement(txtDetailedMessage);
			
			
			group=new HGroup();
			
			group.addElement(btnCancel);
			group.addElement(btnSendError);
			
			/*vergroup.width=100;
			vergroup.height=100;*/
			vergroup.addElement(group);
			this.addElement(vergroup);
		}
		
		private function titleWin_initialize(evt:FlexEvent):void {
			this.isPopUp = true;
		}
		
		private function titleWin_close(evt:CloseEvent):void {
			
			PopUpManager.removePopUp(evt.target as IFlexDisplayObject);
		}
		
		protected function lnkShowDetails_clickHandler(event:MouseEvent):void
		{
			if(!txtMessage.visible)
			{
				//txtDetailedMessage.visible = true; 
				txtMessage.visible = true;
				txtMessage.includeInLayout = true;
				lnkbutton.label ="Hide Details";
			}
			else
			{
				//txtDetailedMessage.visible = false;
				txtMessage.visible=false;
				txtMessage.includeInLayout = false;
				lnkbutton.label="Show Details";
			}
			
		}
		
		protected function btnDntSend_clickHandler(event:MouseEvent):void
		{
			ClosePopup();
		}
		
		private function ClosePopup():void
		{
			PopUpManager.removePopUp(this);
		}
		
		protected function btnSendErrorReport_clickHandler(event:MouseEvent):void
		{
			var objErrorDTO:ErrorReportDTO =new ErrorReportDTO();
			objErrorDTO.EmailTemplateID = 1;
			objErrorDTO.Message = txtMessage.text;
			objErrorDTO.Subject = "Gazuntite Error Report";//lblHeader.text;
			objErrorDTO.SenderID = loggedInUserID;
			
			var errorSendingEvent:SendErrorReportEvent=new SendErrorReportEvent(objErrorDTO,ClosePopup);
			CairngormEventDispatcher.getInstance().dispatchEvent(errorSendingEvent);
		}
		
		public function Show(message:String,titlemessage:String,headerMessage:String,userID:int):void
		{
			this.title = titlemessage;
			txtMessage.text = message;
			lblHeader.text = "Please tell Gazuntite team about this error.\nSystem automatically created an report for this error, you can send that\nerror to gazuntite technical team to improve the product performance."; //headerMessage
			loggedInUserID = userID;
		}
		
		/*public function SetMessages(exObject:Object):void
		{
			if(exObject as FaultEvent)
			{
				this.title = titlemessage;
				txtMessage.text = message;
				lblHeader.text = "Please tell Gazuntite team about this error.\nSystem automatically created an report for this error, you can send that\nerror to Gazuntite technical team to improve the product performance."; //headerMessage
				loggedInUserID = userID;
			}
			else
			{
				txtMessage.text = exObject.toString();
			}
			event.message.body.toString(),"Error in View Email "
			
		}*/
		
	}
}