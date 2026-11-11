package com.gazuntite.input.command.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.labout.LoadLabPriorityTypeDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabPriorityTypeEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadLabPriorityTypeCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadLabPriorityTypeEvent;
		
		public function LoadLabPriorityTypeCommand()
		{
			
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadLabPriorityTypeDelegate = new  LoadLabPriorityTypeDelegate(this);
				
				LE = cgEvent as LoadLabPriorityTypeEvent;
				
				delegate.LoadLabPriority(model.LoggedInUserSessionID );
			}
			
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						
						for each( var x:XML in xlist )
						{
							var t:GeneralTypeDTO = new GeneralTypeDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
						model.labPriorityTypeDTOList= DTOlist ;
						
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("LoadLabPriorityTypes \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadLabPriorityTypesCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		
	}
}