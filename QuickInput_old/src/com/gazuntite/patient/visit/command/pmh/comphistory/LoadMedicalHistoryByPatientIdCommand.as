package com.gazuntite.patient.visit.command.pmh.comphistory
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ch.MedicalHistoryDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.pmh.comphistory.LoadMedicalHistoryByPatientIdDelegate;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadMedicalHistoryByPatientIdCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadMedicalHistoryByPatientIdCommand()
		{
		}
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadMedicalHistoryByPatientIdDelegate = new  LoadMedicalHistoryByPatientIdDelegate(this);
				delegate.LoadMedicalHistoryByPatientId(model.patientID,model.LoggedInUserSelectedBranchId ,model.isAllStationSelected , model.LoggedInUserSessionID ,model.LoggedInUserSelectedStationID);
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
						var xml:XMLList = re.result.ResponseData;
						var typeList:ArrayCollection
						if(xml!=null)
						{
							var xlist:XMLList = xml.children();
							if( xlist != null )
							{
								
								var DTOlist:ArrayCollection = new ArrayCollection();
								
								for each( var x:XML in xlist )
								{
									var t:MedicalHistoryDTO = new MedicalHistoryDTO();
									t.FromXML( x );
									DTOlist.addItem( t );
								}
											
								model.PreviousGeneralMedicalHistoryList= DTOlist ;
							}
							
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("loadMedicalHistorydata \n No data returned from service.","Info");
					}
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("loadMedicalHistorydata \n Service didnot respond.", "Info");
			}
		}
		

		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadComhensiveHistoryStaticDataCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
	
}