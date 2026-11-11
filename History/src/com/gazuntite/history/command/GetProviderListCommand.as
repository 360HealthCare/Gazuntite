package com.gazuntite.history.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.history.delegate.GetProviderListDelegate;
	import com.gazuntite.history.dto.PatientVisitProviderDTO;
	import com.gazuntite.history.event.GetProviderListEvent;
	import com.gazuntite.history.model.HistoryModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GetProviderListCommand implements Command , IResponder
	{
		private var model : HistoryModelLocator = HistoryModelLocator.getInstance();
		
		private var PostData:Object;
		
		public function GetProviderListCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void
		{
			if(model.LoggedInUserId)
			{
				var delegate:GetProviderListDelegate = new  GetProviderListDelegate(this);
				
				var LE:GetProviderListEvent = cgEvent as GetProviderListEvent;
				PostData = LE.data;
				
				
			delegate.GetProviders(model.LoggedInUserSessionID,PostData as XML);
				
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xlist:XMLList = re.result.Providers.PatientVisitProvider;
				
				if(xlist!=null)
				{
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							var t:PatientVisitProviderDTO = new PatientVisitProviderDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
						
						
						model.PatientHistoryDTOList= DTOlist ;
						
						/*if(null != func)
							func();*/
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("GetProviderList \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			return;
			var errorStatus:String = "Fault occured in GetProviderListCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}