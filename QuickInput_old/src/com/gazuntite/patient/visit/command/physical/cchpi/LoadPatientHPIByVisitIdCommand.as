package com.gazuntite.patient.visit.command.physical.cchpi
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.cchpi.LoadPatientHPIByVisitIdDelegate;
	import com.gazuntite.patient.visit.dto.HPI_CCDTO;
	import com.gazuntite.patient.visit.event.physical.cchpi.LoadPatientHPIByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
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
								
								for each( var x:XML in xlist )
								{
									var t:HPI_CCDTO = new HPI_CCDTO();
									t.FromXML( x );
									DTOlist.addItem( t );
								}
								
								model.HPI_CCDTOList= DTOlist ;
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