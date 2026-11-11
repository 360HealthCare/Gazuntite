package com.gazuntite.input.command.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.assessment.plan.labout.LoadPatientLabsByVisitDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadPatientLabsByVisitEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientLabsByVisitCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadPatientLabsByVisitEvent;
	
		public function LoadPatientLabsByVisitCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadPatientLabsByVisitDelegate = new  LoadPatientLabsByVisitDelegate(this);
				LE = cgEvent as LoadPatientLabsByVisitEvent;
				delegate.LoadPatheintLabsByVisitID(model.VisitID,model.LoggedInUserSessionID );
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
						
						var i:int = 1;
						
						for each( var x:XML in xlist )
						{
							var t:LabDTO = new LabDTO();
							t.serialNumber = i++;
							t.FromXML(x);
							DTOlist.addItem( t );
						}
						
						model.laboutDTOList = DTOlist ;
						
					}
					
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadPatientLabsByVisitIDCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadPatientLabsByVisitIDCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}