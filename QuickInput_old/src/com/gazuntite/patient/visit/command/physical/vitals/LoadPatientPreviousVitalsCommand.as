package com.gazuntite.patient.visit.command.physical.vitals
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.vitals.LoadPatientPreviousVitalsDelegate;
	import com.gazuntite.patient.visit.dto.VitalsDTO;
	import com.gazuntite.patient.visit.event.physical.vitals.LoadPatientPreviousVitalsEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientPreviousVitalsCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadPatientPreviousVitalsEvent;
		private var func:Function;
		public function LoadPatientPreviousVitalsCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE = event as LoadPatientPreviousVitalsEvent;
				if(LE.func != null)
					func = LE.func;
				var delegate:LoadPatientPreviousVitalsDelegate = new  LoadPatientPreviousVitalsDelegate(this);
				delegate.LoadPatientPreviousVitals(model.patientID, model.LoggedInUserSessionID);
				
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
									var t:VitalsDTO = new VitalsDTO();
									t.FromXML( x );
									DTOlist.addItem( t );
								}
								
								model.patientPreviousVitalsList= DTOlist ;
								
								if(this.func())
									func();
							}
							
							
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("LoadVitalsByPatient \n No data returned from service.","Info");
					}
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadVitalsByPatient \n Service didnot respond.", "Info");
			}
		}
		
		
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadVitalsByPatient.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}