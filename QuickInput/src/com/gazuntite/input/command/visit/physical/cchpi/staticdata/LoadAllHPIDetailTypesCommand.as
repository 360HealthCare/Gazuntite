package com.gazuntite.input.command.visit.physical.cchpi.staticdata
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.ccHpi.HPITypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.cchpi.staticdata.LoadAllHPIDetailTypesDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadAllHPIDetailTypesCommand  implements com.adobe.cairngorm.commands.Command, IResponder 
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				 var delegate:LoadAllHPIDetailTypesDelegate = new  LoadAllHPIDetailTypesDelegate(this);
				 delegate.LoadAllHPIDetailTypes(model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void 
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				/*var sectionId:int = 6;//remove 6 when done integration //QIUtilityFunctions.getHPIDetailTypeIdByName(QIConstants.CONTEXT_MODULE_NAME);
				var ldsdEvent : LoadHPIStaticDataEvent = new LoadHPIStaticDataEvent(sectionId,QIConstants.EMPTY_STRING);
				CairngormEventDispatcher.getInstance().dispatchEvent( ldsdEvent );*/
				
				if (re.result!=null)
				{
					if (re.result.@Status=="true")
					{
						var xml:XML = re.result.ResponseData[0];
						if (xml != null)
						{
	
							model.hpiDetailTypesList = new ArrayCollection();
							
							var hpiTypeList:XMLList = xml.children();
							for each (var x:XML in hpiTypeList)
							{
								var t:HPITypeDTO = new HPITypeDTO();
								t.FromXML( x );
								model.hpiDetailTypesList.addItem(t);
							}
							
							/*if(model.symptom ==null || model.symptom.length==0)
							{
								//model.hpiCallNumber = 1;
								var sectionId:int = QIUtilityFunctions.getHPIDetailTypeIdByName(QIConstants.CONTEXT_MODULE_NAME);
								var ldsdEvent : LoadHPIStaticDataEvent = new LoadHPIStaticDataEvent(sectionId,QIConstants.EMPTY_STRING);
								CairngormEventDispatcher.getInstance().dispatchEvent( ldsdEvent );
							}*/
						}
						else
						{
							UtilityFunctions.ShowMessage("LoadAllHPIDetailTypes \n No data returned from service.","Info");
						}
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadAllModuleTypes \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadAllHPIDetailTypesCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}