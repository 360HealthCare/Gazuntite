package com.gazuntite.patient.visit.command.physical.ros
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.delegate.physical.ros.LoadROSCategoryTypesDelegate;
	import com.gazuntite.patient.visit.dto.ROSDTO;
	import com.gazuntite.patient.visit.event.physical.ros.LoadROSCategoryTypesEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadROSCategoryTypesCommand implements Command, IResponder 
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadROSCategoryTypesEvent;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadROSCategoryTypesDelegate = new  LoadROSCategoryTypesDelegate(this);
				
				LE = cgEvent as LoadROSCategoryTypesEvent;
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
						var rosDTOList:ArrayCollection = new ArrayCollection();
						for each( var c:XML in list )
						{
							var dto:ROSDTO = new ROSDTO();
							dto.FromXML( c );
							rosDTOList.addItem( dto );
						}
						
						model.rosDTOList = rosDTOList;
						trace("ros loaded");
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