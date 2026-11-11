package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.delegate.LoadStateCodesOnlyDelegate;
	import com.gazuntite.common.dto.StateCodeDTO;
	import com.gazuntite.common.event.LoadStateCodesOnlyEvent;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadStateCodesOnlyCommand implements Command
	{
		private var model : QSCommonController = QSCommonController.getInstance();
		
		private var responder:Responder;
		private var delegate:LoadStateCodesOnlyDelegate;		
		private var callBack: Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new LoadStateCodesOnlyDelegate( responder );			
			
			var LE:LoadStateCodesOnlyEvent = event as LoadStateCodesOnlyEvent;
			
			callBack = LE.callBack;
			
			delegate.StateCodeListOnly();
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			var Types:ArrayCollection =new ArrayCollection();
			
			var ResultXml:XML = event.result as XML
			var xStateCodes:XMLList = ResultXml.States.State;
			var i:int = 0;					
			for( i = 0; i < xStateCodes.length(); i++ )
			{
				var ct:StateCodeDTO = new StateCodeDTO();
				ct.FromXML( xStateCodes[i][0] );
				Types.addItem( ct );
			}		
			
			if(callBack != null)
				callBack(Types)
		}
		
		private function onError(event:FaultEvent):void
		{
			Alert.show("Received In LoadStateCodesOnlyCommand.\n" + event.toString(), 'Info', 4, FlexGlobals.topLevelApplication as Sprite );
		}
	}
}