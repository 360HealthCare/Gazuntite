package com.gazuntite.services
{
	import com.gazuntite.model.SharedModel;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	public class GazuntiteTestService extends EventDispatcher
	{
		private var responder:IResponder;
		private var service:Object;
		
		[Bindable]
		[Inject(id="sharedModel")]
		public var sharedModel:SharedModel;
		
		[MessageHandler(selector="saveFormData")]
		public function testService():void 
		{
			trace("Service received message from Parsley");
		}
		
		private function onFault(e:FaultEvent):void {
			//mx.controls.Alert.show("Failed to load html","Alert!");
		}
	}
}