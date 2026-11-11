package com.gazuntite.provider.live.services.elab.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.provider.live.services.elab.delegate.EnterResultDelegate;
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;
	import com.gazuntite.provider.live.services.elab.event.EnterResultEvent;
	import com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class EnterResultCommand implements Command
	{
		private var model:ELabsAppModelLocator = ELabsAppModelLocator.getInstance();
		
		private var responder:Responder;
		private var delegate:EnterResultDelegate;
		private var LE:EnterResultEvent;
		
		public function execute(event:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new EnterResultDelegate( responder );			
			
			LE = event as EnterResultEvent;
			
			delegate.EnterResult( LE.Lab.OrderID, LE.ResultRanage );
		}
		
		private function onSuccess(event:ResultEvent):void
		{
			var result:XML = event.result as XML;
			var xStatus:XML = result.Status[0];
			var type:String = xStatus.@[XmlConstants.TYPE];
			
			if (type.toLowerCase() == "success")
			{
				var eLabs:XML = result.Labs[0];
				
				var eLabDtoXml:XML = eLabs[0];
				
				var eLabDTO:ELabDTO = new ELabDTO();
				eLabDTO.FromXML(eLabDtoXml.Lab[0]);
				
				Alert.show("Result Saved Successfully", "Result Saved", Alert.OK, FlexGlobals.topLevelApplication.mainContainer,
					function(event:CloseEvent):void
					{
						if (LE.callBack)
							LE.callBack(eLabDTO);
					});
			}
			else
			{
				Alert.show("EnterResultCommand\nServer responded with status type" + type + "\n server status message is " +
						xStatus.@[XmlConstants.MESSAGE], "Response Status" + type);
			}
		}
		
		private function onError(event:FaultEvent):void
		{
			var errorStatus:String = "Fault occured in EnterResultCommand.";
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, event.toString(), model.LoggedInUserId ); 
			
		}
	}
}