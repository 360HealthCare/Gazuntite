package com.gazuntite.patient.visit.command.physical.physical
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.physical.LoadPhysicalCategoryTypesDelegate;
	import com.gazuntite.patient.visit.dto.PhysicalDTO;
	import com.gazuntite.patient.visit.event.physical.physical.LoadPhysicalCategoryTypesEvent;
	import com.gazuntite.patient.visit.event.physical.ros.LoadROSCategoryTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPhysicalCategoryTypesCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadPhysicalCategoryTypesEvent;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadPhysicalCategoryTypesDelegate = new  LoadPhysicalCategoryTypesDelegate(this);
				
				LE = cgEvent as LoadPhysicalCategoryTypesEvent;
				delegate.LoadCategoryTypes(LE.IsMale, model.VisitID, model.LoggedInUserSessionID);
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XML = re.result.ResponseData[0];
				
				if(xml!=null && re.result.@Status == "true")
				{
					var list:XMLList = xml.children();
					if( list != null )
					{
						var DTOList:ArrayCollection = new ArrayCollection();
						for each( var c:XML in list )
						{
							var dto:PhysicalDTO = new PhysicalDTO();
							dto.FromXML( c );
							DTOList.addItem( dto );
						}
						
						model.physicalDTOList = DTOList;
					}
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadROSCategoryTypesCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}