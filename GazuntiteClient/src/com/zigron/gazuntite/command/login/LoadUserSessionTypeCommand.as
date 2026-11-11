package com.zigron.gazuntite.command.login
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.delegate.login.LoadUserSessionTypeDelegate;
	import com.zigron.gazuntite.model.ApplicationModel;
	import com.zigron.gazuntite.model.valueObjects.login.SessionTypeDTO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadUserSessionTypeCommand implements Command
	{
		[Bindable]	private var model : ApplicationModel = ApplicationModel.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadUserSessionTypeDelegate;
		
		public function LoadUserSessionTypeCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadUserSessionTypeDelegate( responder );			
			
			delegate.LoadUserSessionTypes();
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			if(model.LoggedInUserDTO.UserId)
			{
				var re:ResultEvent = event;
				
				var xml:XML= re.result as XML;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							var t:SessionTypeDTO = new SessionTypeDTO();
							t.FromXml( x );
							DTOlist.addItem( t );
						}
						
						
						model.userSessionTypeList= DTOlist ;
						
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("LoaduserSessionType \n Service didnot respond.", "Info");
				}
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserDTO.UserId)? -1:model.LoggedInUserDTO.UserId;
			QSCombinedExceptionAlert.getInstance().Show( "Error in LoaduserSessionType", event.toString(), userId); 
		}
	}
}