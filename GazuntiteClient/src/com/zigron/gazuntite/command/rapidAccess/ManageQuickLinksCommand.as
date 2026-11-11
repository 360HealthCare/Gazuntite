package com.zigron.gazuntite.command.rapidAccess
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.rapidAccess.ManageQuickLinksDelegate;
	import com.zigron.gazuntite.event.rapidAccess.ManageQuickLinksEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class ManageQuickLinksCommand implements Command, IResponder
	{
		[Bindable]	private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var delegate : ManageQuickLinksDelegate;
		private var callback:Function;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			delegate = new ManageQuickLinksDelegate(this);
			
			var event:ManageQuickLinksEvent = cgEvent as ManageQuickLinksEvent;
			this.callback = event.callBack;
			
			if(model.IsProviderLoggedIn)
				delegate.ManageQuickLinks(event.isdefault, model.LoggedInUserDTO.UserId, model.userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchIdSeq, model.LoggedInUserDTO.UserId, model.manageQuickLinksList);
		}
		
		public function result(event:Object):void
		{
			//<?xml version="1.0" encoding="utf-8"?><int>1</int>
			if(model.LoggedInUserDTO.UserId)
			{
				var result:String= event.result ;
				if(result == '1')
				{
					if(model.manageQuickLinksList)
						model.manageQuickLinksList = null;
					if(callback!= null)
						callback();
				}
				else
				{
					return;
				}
			}
		}
		public function fault(rpcEvent:Object):void
		{
			model.errorStatus = "Fault occured in ManageQuickLinksCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInProvider )? -1:model.LoggedInProvider.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); 
		}
	}
}