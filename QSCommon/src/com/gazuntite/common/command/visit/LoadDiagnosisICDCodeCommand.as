package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.visit.LoadDiagnosisICDCodeDelegate;
	import com.gazuntite.common.dto.assessment.diagnosis.ICDCodeDTO;
	import com.gazuntite.common.event.visit.LoadDiagnosisICDCodeEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadDiagnosisICDCodeCommand implements Command , IResponder
	{
		private var func			: Function;
		private var evt: LoadDiagnosisICDCodeEvent;
		private var loggedInUserId:int;
		
		public function LoadDiagnosisICDCodeCommand()
		{
			
		}
		
		
		public function execute( cgEvent:CairngormEvent ) : void {
			//if(model.LoggedInUserId)
			//{
				var delegate:LoadDiagnosisICDCodeDelegate = new  LoadDiagnosisICDCodeDelegate(this);
				
				var LE:LoadDiagnosisICDCodeEvent = cgEvent as LoadDiagnosisICDCodeEvent;
				evt = LE;
				
				loggedInUserId = LE.loggedInUserId;
				
				if(LE.func != null)
					func = LE.func;
				
				if(LE.icdCode!=null && LE.icdCode.length>0)
				{
					delegate.LoadICDCode(LE.icdCode,LE.sessionID);
				}
				
			//}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(loggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = re.result.ResponseData;
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{
						
						var DTOlist:ArrayCollection = new ArrayCollection();
						
						for each( var x:XML in xlist )
						{
							var t:ICDCodeDTO = new ICDCodeDTO();
							t.FromXML( x );
							DTOlist.addItem( t );
						}
						
						if(null != func)
							func(DTOlist);
					}
					
				}
				else
				{
					//Alert.show("LoadHPIStaticData"+"\n"+Messages.SERVICE_DIDNOT_RESPOND ,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
					UtilityFunctions.ShowMessage("LoadICDCode \n Service didnot respond.", "Info");
				}
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadDiagnosisIDCCodeCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( loggedInUserId )? -1:loggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		
	}
}