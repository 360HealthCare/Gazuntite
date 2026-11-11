package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.SavePatientGaxenIdDelegate;
	import com.gazuntite.common.event.SavePatientGaxenIdEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	
	public class SavePatientGaxenIdCommand implements Command, IResponder
	{
		private var responder:Responder;
		private var delegate:SavePatientGaxenIdDelegate;
		private var LE:SavePatientGaxenIdEvent;
		private var func:Function;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(result, fault);				
			delegate  = new SavePatientGaxenIdDelegate( responder );			
			
			LE = event as SavePatientGaxenIdEvent;
			this.func = LE.func;
			delegate.SaveGaxenId(LE.userId, LE.gaxenId);
		}
		
		public function result(data:Object):void
		{
			if(this.func!=null)
				this.func(true);
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Fault occured in SavePatientGaxenIdCommand.\n"+info.toString());
		}
	}
}