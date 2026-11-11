/*
*Class: DeleteEmailCommand
*Created by: zahid mehmood
*Description: Deletes Email
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.command
{
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.services.email.delegate.DeleteEmailDelegate;
	import com.gazuntite.provider.services.email.dto.EmailDTO;
	import com.gazuntite.provider.services.email.dto.EmailResultList;
	import com.gazuntite.provider.services.email.event.*;
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
	
	public class DeleteEmailCommand implements Command
	{
		
		private var model : EmailModelLocator = EmailModelLocator.getInstance();
		
		private var responder : Responder;
		private var delegate : DeleteEmailDelegate;
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess,onError);
			delegate = new DeleteEmailDelegate(responder);
			
			var DEV:DeleteEmailEvent = cgEvent as DeleteEmailEvent;
			
			callBack = DEV.callBack;
			delegate.DeleteEmails(DEV.emailIDs,DEV.userID);
		}
		
		
		private function onSuccess(event:ResultEvent):void
		{
			trace(event.result);
			if(null != callBack)
				callBack();
		}
		
		
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in DeleteEmailCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.loggedInUserId )? -1:model.loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.fault.faultString, userId);

		//	Alert.show("Received In GetEmailListCommand.\n" + event.toString(), EmailConstant.ERROR, 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}