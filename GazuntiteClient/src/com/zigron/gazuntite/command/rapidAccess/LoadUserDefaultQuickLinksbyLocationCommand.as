package com.zigron.gazuntite.command.rapidAccess
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.rapidAccess.LoadUserDefaultQuickLinksbyLocationDelegate;
	import com.zigron.gazuntite.event.rapidAccess.LoadUserDefaultQuickLinksbyLocationEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	import com.zigron.gazuntite.model.valueObjects.rapidAccess.QuickLinkDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadUserDefaultQuickLinksbyLocationCommand implements Command, IResponder
	{
		private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var delegate : LoadUserDefaultQuickLinksbyLocationDelegate;

		public function LoadUserDefaultQuickLinksbyLocationCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			delegate = new LoadUserDefaultQuickLinksbyLocationDelegate( this );
			
			var event:LoadUserDefaultQuickLinksbyLocationEvent = cgEvent as LoadUserDefaultQuickLinksbyLocationEvent;
			
			if(model.IsProviderLoggedIn){
				delegate.LoadUserDefaultQuickLinksbyLocation(model.LoggedInUserDTO.UserId, model.userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchIdSeq, model.LoggedInUserSessionDTO.SessionID );
			}
		}
		
		public function result(event:Object):void
		{
			if(model.LoggedInUserDTO.UserId)
			{
				var xml:XML= event.result.ResponseData[0] as XML;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						if(null == model.quickLinksList)
							model.quickLinksList = new ArrayCollection();
						else if(model.quickLinksList)
							model.quickLinksList.removeAll();
						
						for (var i:int = 0; i < xlist.length(); i++) 
						{
							var t:QuickLinkDTO = new QuickLinkDTO();
							t.FromXml(xlist[i]);
							model.quickLinksList.addItem( t );
						}
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoaduserSessionType \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			model.errorStatus = "Fault occured in LoadUserDefaultQuickLinksbyLocationCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInProvider )? -1:model.LoggedInProvider.UserId;
			QSCombinedExceptionAlert.getInstance().Show( model.errorStatus, rpcEvent.toString(), userId); 
		}
	}
}