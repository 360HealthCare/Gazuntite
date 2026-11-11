package com.gazuntite.common.command.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.visit.GenerateSoapNotePreviewCommonDelegate;
	import com.gazuntite.common.event.visit.GenerateSoapNotePreviewCommonEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	/**
	 * Author : TA
	 * Date   : 17 jan, 2013
	 * Module : for Viewing Soap Note
	 * */
	public class GenerateSoapNotePreviewCommonCommand implements Command, IResponder
	{
		public var callback:Function;
		private var LE:GenerateSoapNotePreviewCommonEvent;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			var delegate : GenerateSoapNotePreviewCommonDelegate 	= new GenerateSoapNotePreviewCommonDelegate( this );
			LE 														= cgEvent as GenerateSoapNotePreviewCommonEvent;
			this.callback 											= LE.callback;
			
			delegate.GenerateSoapNotePreview(LE.visitID, LE.userSessionID, LE.userSelectedBranchId , LE.userSelectedStationID, LE.isAllSelected, LE.isMale, LE.isTemplateVisit, LE.gaxenID, LE.VisitProvider, LE.VisitEncounterTypeName, LE.VisitPlaceOfServiceTypeName);
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			var re:ResultEvent = rpcEvent as ResultEvent;
			
			var resp:String = re.result.@ResponseData;// as String ; //as String;   = re.result as QuickInputResponse  ;
			if(resp!=null && callback != null)
			{
				trace( re.result, resp );
				callback( resp, resp.indexOf("http://") == 0 );
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in GenerateSoapNotePreviewCommand.";
			callback( "Server Fault, please try later" );
			
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), LE.visitID); 
		}
	}
}