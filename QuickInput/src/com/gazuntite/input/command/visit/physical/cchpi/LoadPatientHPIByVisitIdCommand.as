package com.gazuntite.input.command.visit.physical.cchpi
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.cchpi.LoadPatientHPIByVisitIdDelegate;
	import com.gazuntite.input.event.visit.physical.cchpi.LoadPatientHPIByVisitIdEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientHPIByVisitIdCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadPatientHPIByVisitIdEvent;
		
		public function LoadPatientHPIByVisitIdCommand()
		{
		}
	
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE = event as LoadPatientHPIByVisitIdEvent;
				var delegate:LoadPatientHPIByVisitIdDelegate = new  LoadPatientHPIByVisitIdDelegate(this);
				delegate.LoadPatientHPI(model.VisitID,QIConstants.IsTemplateVisit, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				if(re.result!=null)
				{
					trace(re.result.toXMLString());
					
					if(re.result.@Status=="true")
					{
						var xml:XML = re.result.ResponseData[0];
						var typeList:ArrayCollection
						if(xml!=null)
						{
							var xlist:XMLList = xml.children();
							if( xlist != null )
							{
								
								var DTOlist:ArrayCollection = new ArrayCollection();
								var i:int = 1;
								
								for each( var x:XML in xlist )
								{
									var t:ChiefComplaintHpiDTO = new ChiefComplaintHpiDTO();
									t.serialNumber = i++;
									
									t.FromXML( x );
									DTOlist.addItem( t );
								}
								
								model.chiefComplaintHpiDTOList= DTOlist ;
							}
							
							
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("LoadHPIByVisitID \n No data returned from service.","Info");
					}
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadHPIByVisitID \n Service didnot respond.", "Info");
			}
		}
		
		
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadHPIByVisitID.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}		
		
	}
}