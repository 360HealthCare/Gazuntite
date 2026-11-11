package com.gazuntite.patient.visit.command.pmh.immunization
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ImmunizationDTO;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.pmh.immunization.LoadImmunizationByVisitIDDelegate;
	import com.gazuntite.patient.visit.event.pmh.immunization.LoadImmunizationByVisitIDEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadImmunizationByVisitIDCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadImmunizationByVisitIDEvent;
		
		public function LoadImmunizationByVisitIDCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE = event as LoadImmunizationByVisitIDEvent;
				var delegate:LoadImmunizationByVisitIDDelegate = new  LoadImmunizationByVisitIDDelegate(this);
				delegate.LoadImmunicationByVisitID(model.VisitID,QIConstants.IsTemplateVisit, model.LoggedInUserSessionID, model.patientID);
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
									var t:ImmunizationDTO = new ImmunizationDTO();
									t.FromXML( x );
									DTOlist.addItem( t );
								}
								
								model.immunizationDTOList= DTOlist ;
							}
							
							
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("LoadImmunicationByVisitID \n No data returned from service.","Info");
					}
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadImmunicationByVisitID \n Service didnot respond.", "Info");
			}
		}
		
		
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadImmunicationByVisitID.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}