package com.gazuntite.input.command.visit.physical.cchpi.staticdata
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.cchpi.staticdata.LoadHPIStaticDataDelegate;
	import com.gazuntite.input.event.visit.physical.cchpi.LoadHPIStaticDataEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadHPIStaticDataCommand  implements Command, IResponder 
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var sectionId:int;
		private var LE:LoadHPIStaticDataEvent;
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadHPIStaticDataDelegate = new  LoadHPIStaticDataDelegate(this);
				
				LE = cgEvent as LoadHPIStaticDataEvent;
				this.sectionId = LE.sectionId;
				delegate.LoadHPIStaticData(LE.sectionId,
					model.LoggedInUserSelectedBranchId,
					model.LoggedInUserSessionID,
					LE.searchString);
			}
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if (xml != null)
				{
					var list:XMLList = xml.children();
					
					if (list != null)
					{
						if (LE.sectionName == QIConstants.SYMPTOM_MODULE_NAME)
						{
							model.symptomsList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.DURATION_MODULE_NAME)
						{
							model.durationList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.EXACERBATING_MODULE_NAME)
						{
							model.exacerbatingList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.LOCATION_MODULE_NAME)
						{
							model.locationList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.MODIFYINGFACTORS_MODULE_NAME)
						{
							model.modifyingFactorsList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.PROGRESSION_MODULE_NAME)
						{
							model.progressionList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.QUALITY_MODULE_NAME)
						{
							model.qualityList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.RADIATION_MODULE_NAME)
						{
							model.radiationList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.SEVERITY_MODULE_NAME)
						{
							model.severityList = this.getStringList(list);
						}
						else if (LE.sectionName == QIConstants.CONTEXT_MODULE_NAME)
						{
							model.contextList = this.getStringList(list);
						}
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadHPIStaticDataCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		private function getStringList(xlist:XMLList):ArrayCollection
		{
			var list:ArrayCollection = new ArrayCollection();
			
			var xxlist:XMLList = xlist.children();
			
			for each (var s:XML in xxlist)
			{
				list.addItem(s);
			}
			
			return list;
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadHPIStaticDataCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}