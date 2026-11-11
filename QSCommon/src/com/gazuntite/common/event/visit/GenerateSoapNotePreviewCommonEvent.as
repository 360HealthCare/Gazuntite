package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	/**
	 * Author : TA
	 * Date   : 17 jan, 2013
	 * Module : for Viewing Soap Note
	 * */
	
	public class GenerateSoapNotePreviewCommonEvent extends CairngormEvent
	{
		public var visitID:int;
		public var userSessionID:String;
		public var userSelectedBranchId:int;
		public var userSelectedStationID:int;
		public var isAllSelected:Boolean;
		public var isMale:Boolean;
		public var isTemplateVisit:Boolean;
		public var gaxenID:String;
		public var VisitProvider:String;
		public var VisitEncounterTypeName:String;
		public var VisitPlaceOfServiceTypeName:String;
		public var callback:Function = null ;
		
		public function GenerateSoapNotePreviewCommonEvent(_visitID:int, _userSessionID:String, _UserSelectedBranchId:int, _userSelectedStationID:int, _isAllSelected:Boolean, _isMale:Boolean, _isTemplateVisit:Boolean, _gaxenID:String,_VisitProvider:String,_VisitEncounterTypeName:String,_VisitPlaceOfServiceTypeName:String,  _callback:Function)
		{
			super( QSCommonController.GENERATE_SOAP_NOTE_PREVIEW_COMMON_EVENT );
			
			this.visitID						= _visitID;
			this.userSessionID					= _userSessionID;
			this.userSelectedBranchId			= _UserSelectedBranchId;
			this.userSelectedStationID			= _userSelectedStationID;
			this.isAllSelected					= _isAllSelected;
			this.isMale							= _isMale;
			this.isTemplateVisit				= _isTemplateVisit;
			this.gaxenID						= _gaxenID;
			this.VisitProvider					= _VisitProvider;
			this.VisitEncounterTypeName			= _VisitEncounterTypeName;
			this.VisitPlaceOfServiceTypeName	= _VisitPlaceOfServiceTypeName;
			this.callback						= _callback ;
		}
	}
}