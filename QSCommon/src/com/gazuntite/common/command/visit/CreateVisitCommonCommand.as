package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.visit.CreateVisitCommonDelegate;
	import com.gazuntite.common.event.visit.CreateVisitCommonEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class CreateVisitCommonCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:CreateVisitCommonDelegate;
		private var LE:CreateVisitCommonEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new CreateVisitCommonDelegate( responder );			
			
			var LE:CreateVisitCommonEvent = cgEvent as CreateVisitCommonEvent;
			
			callBack = LE.functionName;
			var d:Date = new Date();
			
			CursorManager.setBusyCursor();
			
			delegate.CreateVisit(LE.data, LE.userId, d);
		}
		
		public function result(  rpcEvent : ResultEvent ) : void 
		{
			if( null != callBack )
				callBack(new XML(rpcEvent.message.body.toString()) );
			CursorManager.removeBusyCursor();
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			CursorManager.removeBusyCursor();
			Alert.show("Fault occured in CreateVisitCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}