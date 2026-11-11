/*
*Class: GetSentEmailListCommand
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.command
{
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.services.email.delegate.GetSentEmailListDelegate;
	import com.gazuntite.provider.services.email.dto.EmailResultList;
	import com.gazuntite.provider.services.email.event.GetSentEmailEvent;
	import com.gazuntite.provider.services.email.model.EmailModelLocator;
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class GetSentEmailListCommand implements Command
	{
		private var model : EmailModelLocator = EmailModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : GetSentEmailListDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new GetSentEmailListDelegate(responder);
			
			var GSEV:GetSentEmailEvent  = cgEvent as GetSentEmailEvent;
			callBack= GSEV.callBack;
			delegate.GetEmailList(GSEV.clinicBranchid,GSEV.userId,GSEV.stationId,GSEV.totalPages,GSEV.currentPage);
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			
			trace(event.result);
			/*
			var esl:EmailResultList = new EmailResultList();
			esl.FromXMLSentEmail(event.result as XML);
			model.m_oEmailResultList =esl;
			*/
			
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
			var errorStatus:String = "Fault occured in GetSentEmailListCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.fault.faultString, userId);

		//	Alert.show("Received In GetEmailListCommand.\n" + event.toString(), EmailConstant.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}