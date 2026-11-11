package com.gazuntite.common.command.provider
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.provider.GetSpecialityDelegate;
	import com.gazuntite.common.event.provider.GetSpecialityEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class GetSpecialityCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:GetSpecialityDelegate;
		private var LE:GetSpecialityEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			responder = new Responder(result, fault);				
			delegate  = new GetSpecialityDelegate( responder );			
			
			var LE:GetSpecialityEvent = cgEvent as GetSpecialityEvent;
			
			callBack = LE.resultHandlerFunction;
			if(LE.isNewCallInService)
				delegate.GetSpecialityNew(LE.data);
			else
				delegate.GetSpeciality(LE.data);
		}
		public function result( rpcEvent : ResultEvent ) : void 
		{										
			if( null != callBack )
			{
				callBack(new XML(rpcEvent.message.body.toString()));
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			Alert.show("Fault occured in GetSpecialityCommand.\n"+rpcEvent.toString(), 'Info', 4, FlexGlobals.topLevelApplication.mainContainer);
		}
	}
}