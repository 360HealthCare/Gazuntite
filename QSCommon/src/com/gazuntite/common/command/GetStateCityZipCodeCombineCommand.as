package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.GetStateCityZipCodeCombineDelegate;
	import com.gazuntite.common.dto.CitiesDTO;
	import com.gazuntite.common.dto.StatesDTO;
	import com.gazuntite.common.dto.ZipsDTO;
	import com.gazuntite.common.event.GetStateCityZipCodeCombineEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetStateCityZipCodeCombineCommand implements Command
	{
		private var responder:Responder;
		private var delegate:GetStateCityZipCodeCombineDelegate;
		private var LE:GetStateCityZipCodeCombineEvent;
		private var func:Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(result, fault);				
			delegate  = new GetStateCityZipCodeCombineDelegate( responder );			
			
			LE= event as GetStateCityZipCodeCombineEvent;
			
				this.func = LE.func;
			
			delegate.GetStateCityZipCode(LE.state, LE.city, LE.zip);
		}
		
		public function result( event : ResultEvent ) : void 
		{
			var resultXML:XML = new XML(event.message.body.toString());
			
			if(this.func != null)
			{
				this.func(resultXML);
			}
			
			CursorManager.removeBusyCursor();
		}
		
		public function fault( rpcEvent : Object ) : void
		{
			CursorManager.removeBusyCursor();
			//Alert.show("Fault occured in GetStateCityZipCodeCombineCommand.\n" + rpcEvent.toString());
			QSCombinedExceptionAlert.getInstance().Show( "Error in GetStateCityZipCodeCombineCommand", rpcEvent.toString(), 0); 
		}
		
	}
}