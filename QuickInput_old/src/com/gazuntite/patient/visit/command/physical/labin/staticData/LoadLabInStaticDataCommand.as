package com.gazuntite.patient.visit.command.physical.labin.staticData
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.labin.LoadLabInStaticDataDelegate;
	import com.gazuntite.patient.visit.dto.InHouseLabTestTypeDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.view.events.LoadInHouseLabTestTypeByClinicIdEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	


	public class LoadLabInStaticDataCommand implements Command, IResponder 
	{
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE : LoadInHouseLabTestTypeByClinicIdEvent;
		
		private var fun : Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadLabInStaticDataDelegate = new  LoadLabInStaticDataDelegate(this);
				
				LE = cgEvent as LoadInHouseLabTestTypeByClinicIdEvent;
				fun = LE.func;			
				
				delegate.loadLabInStaticData(LE.searchValue ,model.LoggedInUserSelectedBranchId,model.LoggedInUserSessionID );
			}
			
			getStringList(null);
		}
		
		
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						
						for each( var x:XML in xlist )
						{
							var t:InHouseLabTestTypeDTO = new InHouseLabTestTypeDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
							model.LabInStaticDataList= DTOlist ;
							if(null!=fun)
								fun();
						
					}
					
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
			var x:XML = <ResponseData>
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
						</ResponseData>;
			
			var list:ArrayCollection = new ArrayCollection();
			
			var xlist:XMLList = x.children();
			
			for each( var s:XML in xlist )
			{
				list.addItem( s.text() );
			}
			
			return list;
		}
		
		
		
		public function LoadLabInStaticDataCommand()
		{
			
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadLabInStaticDataCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}