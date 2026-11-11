/*
*Class: GetEmailListCommand
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.services.email.command.GetEmailListCommand;
	import com.gazuntite.provider.services.email.delegate.GetEmailListDelegate;
	import com.gazuntite.provider.services.email.dto.EmailDTO;
	import com.gazuntite.provider.services.email.dto.EmailResultList;
	import com.gazuntite.provider.services.email.event.GetEmailEvent;
	import com.gazuntite.provider.services.email.model.EmailModelLocator;
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.Sprite;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectProxy;
	
	public class GetEmailListCommand implements Command
	{
		 private var model : EmailModelLocator = EmailModelLocator.getInstance();
		 
		 private var responder : Responder;
		 private var delegate : GetEmailListDelegate;
		
		 private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new GetEmailListDelegate(responder);
			
			var EV:GetEmailEvent = cgEvent as GetEmailEvent;
			
			callBack= EV.callBack;
			delegate.GetEmailList(EV.clinicBranchid,EV.userId,EV.stationId,EmailConstant.PAGESIZE,EV.currentPage);
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			
			trace(event.result);
		//	var eventResult:ResultEvent = event as ResultEvent;
		//	var dto:ObjectProxy	= eventResult.result.EmailDTO as ObjectProxy;
			
		//	model.currentPage = dto.currentPage;
		//	model.totalPage = dto.totalpages;
			//var re:ResultEvent = event as ResultEvent;
			//var dto:ObjectProxy	= re.result.MailDTO as ObjectProxy;
			//model.totalPage = dto.totalpages;
			
			var esl:EmailResultList = new EmailResultList();
			esl.FromXML(event.result as XML);
			model.m_oEmailResultList =esl;
			
		   model.currentPage = EmailConstant.CURRENTPAGE;
		   model.totalPage  = EmailConstant.TOTALEMAILS;
		   
		   if(null != callBack)
			   callBack();
			
		}
		
		
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in GetEmailListCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.fault.faultString, userId);

			//Alert.show("Received In GetEmailListCommand.\n" + event.toString(), EmailConstant.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}