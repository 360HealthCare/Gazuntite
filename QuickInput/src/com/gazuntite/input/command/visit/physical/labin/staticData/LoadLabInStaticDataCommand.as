package com.gazuntite.input.command.visit.physical.labin.staticData
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabTestTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.physical.labin.LoadLabInStaticDataDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.view.components.visit.events.LoadInHouseLabTestTypeByClinicIdEvent;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadLabInStaticDataCommand implements Command, IResponder 
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadInHouseLabTestTypeByClinicIdEvent;
		
		private var searchTerm:String;
		private var seacrhType:int;
		private var callback:Function;
		
		public function LoadLabInStaticDataCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void 
		{
			if (model.LoggedInUserId)
			{
				var delegate:LoadLabInStaticDataDelegate = new  LoadLabInStaticDataDelegate(this);
				
				LE = cgEvent as LoadInHouseLabTestTypeByClinicIdEvent;
				
				searchTerm = LE.searchTerm;
				seacrhType = LE.searchType;
				callback = LE.func;
				
				delegate.loadLabInStaticData(searchTerm, model.LoggedInUserSelectedBranchId, model.LoggedInUserSessionID);
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
					var xlist:XMLList = xml.children();
					
					if (xlist != null)
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each (var x:XML in xlist)
						{
							var t:InHouseLabTestTypeDTO = new InHouseLabTestTypeDTO();
							t.FromXML(x);
							DTOlist.addItem(t);
						}
						
						model.inHouseLabTestTypeDTOList= DTOlist;
						
						if (callback)
							callback(searchTerm, seacrhType);
					}
					
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadLabInStaticDataCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in LoadLabInStaticDataCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}