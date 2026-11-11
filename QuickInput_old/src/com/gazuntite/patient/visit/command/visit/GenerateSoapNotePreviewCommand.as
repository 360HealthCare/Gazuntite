package com.gazuntite.patient.visit.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.visit.GenerateSoapNotePreviewDelegate;
	import com.gazuntite.patient.visit.event.visit.GenerateSoapNotePreviewEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class GenerateSoapNotePreviewCommand implements Command, IResponder
	{
		[Bindable]
		private var model : QIModelLocator = QIModelLocator.getInstance();
		public var callback:Function;
		
		public function GenerateSoapNotePreviewCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void 
		{
			/*if( ! NetworkUtil.Network.IsConnected )
			{
				Alert.show(Messages.NETWORK_NOT_AVAILABLE, Messages.NETWORK_ERROR);
				return;
			}*/
			
			if(model.LoggedInUserId)
			{
				var delegate : GenerateSoapNotePreviewDelegate = new GenerateSoapNotePreviewDelegate( this );
				
				var LE:GenerateSoapNotePreviewEvent 	= cgEvent as GenerateSoapNotePreviewEvent;
				this.callback 							= LE.callback;

				delegate.GeneratePreview(model.VisitID, model.LoggedInUserSessionID, model.LoggedInUserSelectedBranchId , model.LoggedInUserSelectedStationID, LE.isAllSelected, LE.isPatientMale, QIConstants.IsTemplateVisit , model.gaxenID);
				
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var resp:String = re.result.@ResponseData;// as String ; //as String;   = re.result as QuickInputResponse  ;
				if(resp!=null && callback != null)
				{
					trace( re.result, resp );
					callback( resp, resp.indexOf("http://") == 0 );
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			 var errorStatus:String = "Fault occured in GenerateSoapNotePreviewCommand.";
			callback( "Server Fault, please try later" );
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
	}
}