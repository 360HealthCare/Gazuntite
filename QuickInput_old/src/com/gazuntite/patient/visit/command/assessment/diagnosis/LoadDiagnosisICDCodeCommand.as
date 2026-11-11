package com.gazuntite.patient.visit.command.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ICDCodeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.assessment.diagnosis.LoadDiagnosisICDCodeDelegate;
	import com.gazuntite.patient.visit.event.assessment.diagnosis.LoadDiagnosisICDCodeEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadDiagnosisICDCodeCommand implements Command , IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var func			: Function;
		
		public function LoadDiagnosisICDCodeCommand()
		{
			
		}
		
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate:LoadDiagnosisICDCodeDelegate = new  LoadDiagnosisICDCodeDelegate(this);
				
				var LE:LoadDiagnosisICDCodeEvent = cgEvent as LoadDiagnosisICDCodeEvent;
				
				if(LE.func != null)
					func = LE.func;
				
				if(LE.icdCode!=null && LE.icdCode.length>0)
				{
					delegate.LoadICDCode(LE.icdCode,model.LoggedInUserSessionID);
				}
				
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
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
						
						
						model.icdCodeDTOList= DTOlist ;
						
						if(null != func)
							func();
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
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
		
	}
}