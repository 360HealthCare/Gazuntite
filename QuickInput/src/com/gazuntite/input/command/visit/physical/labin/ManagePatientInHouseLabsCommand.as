package com.gazuntite.input.command.visit.physical.labin
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.event.history.physical.inHouseLab.LoadInHouseLabsByPatientIdPagedEvent;
	import com.gazuntite.input.delegate.visit.physical.labin.ManagePatientInHouseLabsDelegate;
	import com.gazuntite.input.event.visit.physical.labin.LoadPatientInHouseLabsByVisitIdEvent;
	import com.gazuntite.input.event.visit.physical.labin.ManagePatientInHouseLabsEvent;
	import com.gazuntite.input.event.visit.visit.GetVisitChargesEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import org.osmf.net.SwitchingRuleBase;

	public class ManagePatientInHouseLabsCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var onInHouseLabsLoadCallback:Function;
		private var sectioName:String;
		private var callback:Function;
		
		public function ManagePatientInHouseLabsCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var LE:ManagePatientInHouseLabsEvent = cgEvent as ManagePatientInHouseLabsEvent;
				onInHouseLabsLoadCallback = LE.callBack;
				sectioName = LE.sectionName;
				callback = LE.callBack;
				
				var delegate:ManagePatientInHouseLabsDelegate = new ManagePatientInHouseLabsDelegate(this);
				var arrCol:ArrayCollection;
				
				switch (sectioName)
				{
					case QIConstants.INPUT_VIEW:
						
						arrCol = model.inHouseLabDTOList;
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						arrCol = model.inHouseLabDTOHistoryList;
						
						break;
				}
				
				if (arrCol != null)
				{				
					var inhouseDTO:InHouseLabDTO;
					
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for (var i:int = 0; i < arrCol.length; i++)
					{
						inhouseDTO = arrCol.getItemAt(i) as InHouseLabDTO;
						
						if (inhouseDTO.IsDeleted == true || inhouseDTO.IsDirty == true)
						{
							
							if (inhouseDTO.VisitDate == null)
							{
								inhouseDTO.VisitDate= QIConstants.NULL_DATE;
							}
							
							inhouseDTO.ModifiedBy = model.LoggedInUserId;
							inhouseDTO.ModifiedAt = new Date();
							
							newList.addItem(inhouseDTO);
						}
					}
					
					if (newList.length > 0)
						delegate.ManagePatientInHouse(newList, model.LoggedInUserId, model.VisitID, 
									model.patientDTO.ID, actionDate, model.LoggedInUserSessionID);
				}
			}
		}	
		
		/** Changing every element in the arraycollection, that is directly binded with the list,
		causes the rerendering of the list manytime, I am optimizing the code to avoid this annoying behavour at UI
		 * Author : MM
		**/
		
/*		public function execute(cgEvent:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var LE:ManagePatientInHouseLabsEvent = cgEvent as ManagePatientInHouseLabsEvent;
				onInHouseLabsLoadCallback = LE.callBack;
				sectioName = LE.sectionName;
				callback = LE.callBack;
				
				var delegate:ManagePatientInHouseLabsDelegate = new ManagePatientInHouseLabsDelegate(this);
				var arrCol:ArrayCollection;
				
				switch (sectioName)
				{
					case QIConstants.INPUT_VIEW:
						
						arrCol = model.inHouseLabDTOList;
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						arrCol = model.inHouseLabDTOHistoryList;
						
						break;
				}
				
				if (arrCol != null)
				{				
					var inhouseDTO:InHouseLabDTO;
					var i:int;
					
					for (i = 0; i < arrCol.length;i++)
					{
						inhouseDTO = arrCol.getItemAt(i) as InHouseLabDTO;
						
						if (inhouseDTO.VisitDate == null)
						{
							inhouseDTO.VisitDate= QIConstants.NULL_DATE;
						}
						
						inhouseDTO.ModifiedBy = model.LoggedInUserId;
						inhouseDTO.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for (i = 0; i < arrCol.length; i++)
					{
						inhouseDTO = arrCol.getItemAt(i) as InHouseLabDTO;
						
						if (inhouseDTO.IsDeleted == true || inhouseDTO.IsDirty == true)
						{
							newList.addItem(inhouseDTO);
						}
					}
					
					if (newList.length > 0)
						delegate.ManagePatientInHouse(newList, model.LoggedInUserId, model.VisitID, 
									model.patientDTO.ID, actionDate, model.LoggedInUserSessionID);
				}
			}
		}	*/
	
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result.@Status == "true")
				{
					//[07/19/2013] Shahid Munir, to update visit charges in super bill
					var gvce:GetVisitChargesEvent = new GetVisitChargesEvent(model.VisitID); 
					CairngormEventDispatcher.getInstance().dispatchEvent(gvce);
					
					switch (sectioName)
					{
						case QIConstants.INPUT_VIEW:
							
							var lpihEvent: LoadPatientInHouseLabsByVisitIdEvent = new LoadPatientInHouseLabsByVisitIdEvent(); 
							lpihEvent.onInHouseLabLoadCallBack = onInHouseLabsLoadCallback;
							
							CairngormEventDispatcher.getInstance().dispatchEvent(lpihEvent);
							
							break;
						
						case QIConstants.HISTORY_VIEW:
							
							var lihpEv:LoadInHouseLabsByPatientIdPagedEvent = new LoadInHouseLabsByPatientIdPagedEvent();
							CairngormEventDispatcher.getInstance().dispatchEvent(lihpEv);
							
							break;
					}
					
					if (callback)
						callback(sectioName);
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientInHouse \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in ManagePatientInHouse.";
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId)? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId); 
		}
	}
}