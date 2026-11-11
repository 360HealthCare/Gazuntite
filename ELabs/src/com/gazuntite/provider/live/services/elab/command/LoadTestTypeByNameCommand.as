package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.provider.live.services.elab.delegate.LoadTestTypeByNameDelegate;
	import com.gazuntite.provider.live.services.elab.dto.TestTypeDTO;
	import com.gazuntite.provider.live.services.elab.event.LoadTestTypeByNameEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadTestTypeByNameCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadTestTypeByNameDelegate;
		private var LE:LoadTestTypeByNameEvent;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadTestTypeByNameDelegate(responder);			
			
			LE = event as LoadTestTypeByNameEvent;
			
			delegate.LoadTestTypeByName( LE.SearchName );
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			model.TestTypeList.removeAll();
			
			var xTests:XMLList = event.result.Tests;
			var i:int;
			
			for (i=0; i < xTests.length(); i++)
			{
				var t:TestTypeDTO = new TestTypeDTO();
				
				t.FromXML(xTests[i]);
				model.TestTypeList.addItem(t);
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in LoadTestTypeByNameCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, event.toString(), model.LoggedInUserId);
		}
	}
}