package com.gazuntite.patient.visit.command.physical.cchpi.staticdata
{
	
	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.physical.cchpi.staticdata.LoadHPIStaticDataDelegate;
	import com.gazuntite.patient.visit.event.physical.cchpi.LoadHPIStaticDataEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.common.util.exceptionAlert.QSExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	
	
	public class LoadHPIStaticDataCommand  implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var sectionId : int;
		private var LE:LoadHPIStaticDataEvent;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadHPIStaticDataDelegate = new  LoadHPIStaticDataDelegate(this);
				
				LE = cgEvent as LoadHPIStaticDataEvent;
				this.sectionId = LE.sectionId;
				delegate.LoadHPIStaticData(LE.sectionId,
					model.LoggedInUserSelectedBranchId,
					model.LoggedInUserSessionID,
					LE.searchString);
			}
			
			//getStringList(null);
		}
		
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if(xml!=null)
				{
					var list:XMLList = xml.children();
					if( list != null )
					{
						if(LE.sectionName == QIConstants.SYMPTOM_MODULE_NAME)
						{
							model.Symptoms = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.DURATION_MODULE_NAME)
						{
							model.Duration = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.EXACERBATING_MODULE_NAME)
						{
							model.Exacerbating = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.LOCATION_MODULE_NAME)
						{
							model.Location = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.MODIFYINGFACTORS_MODULE_NAME)
						{
							model.ModifyingFactors = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.PROGRESSION_MODULE_NAME)
						{
							model.Progression = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.QUALITY_MODULE_NAME)
						{
							model.Quality = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.RADIATION_MODULE_NAME)
						{
							model.Radiation = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.SEVERITY_MODULE_NAME)
						{
							model.Severity = this.getStringList(list);
						}
						else if(LE.sectionName == QIConstants.CONTEXT_MODULE_NAME)
						{
							model.Context = this.getStringList(list);
						}
					}
					/*else
					{
						var valid:Boolean = QIUtilityFunctions.checkSession(re.@ResponseCode);
						if(valid)
							Alert.show("LoadHPIStaticData"+"\n"+hpiDetailAutoCompleteResponse.ResponseMessage,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					}*/
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("LoadAllModuleTypes \n Service didnot respond.", "Info");
				}
			}
		}
		
		private function getStringList(xlist:XMLList):ArrayCollection
		{
			/*var x:XML = <ResponseData>
						<string>3 on a scale of 1 to 5</string>
						<string>Cough med helps</string>
						<string>Foot rash</string>
						<string>hard to breathe</string>
						<string>head ache</string>
						<string>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						</string>
						<string>Mental Status Change</string>
						<string>
						qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwweeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrttttttttttttttttttttttttttttttttyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
						</string>
						<string>
						sym Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						</string>
						<string>Test</string>
						<string>Toenail fungus</string>
						</ResponseData>;*/
			
			var list:ArrayCollection = new ArrayCollection();
			
			var xxlist:XMLList = xlist.children();
			
			for each( var s:XML in xxlist )
			{
				list.addItem( s );
			}
			
			return list;
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadHPIStaticDataCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}