package com.gazuntite.input.command.visit.pmh.immunization
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.pmh.immunization.LoadImmunizationByVisitIDDelegate;
	import com.gazuntite.input.event.visit.pmh.immunization.LoadImmunizationByVisitIDEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
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
				delegate.LoadImmunicationByVisitID(model.VisitID, QIConstants.IsTemplateVisit, model.LoggedInUserSessionID, model.patientDTO.ID);
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
								var ser:Number = 0;
								for each( var x:XML in xlist )
								{
									var t:ImmunizationDTO = new ImmunizationDTO();
									t.FromXML( x );
									t.serialNumber 		= ser++;
									DTOlist.addItem( t );
								}
								
								if(model.immunizationDTOList)
									model.immunizationDTOList.removeAll();
								
								/*for (var ser:Number = 0; ser < DTOlist.length; ser++)
								{
									var dto:ImmunizationDTO = new ImmunizationDTO();
									dto						= model.immunizationDTOList.getItemAt(ser) as ImmunizationDTO;
									dto.serialNumber 		= ser+1;
								}*/
								
								model.immunizationDTOList= DTOlist ;
								//TA-  for Display Number in List Item
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