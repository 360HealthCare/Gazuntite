package com.gazuntite.provider.live.services.elab.view.event
{
	import com.gazuntite.provider.live.services.elab.dto.ELabFilterCriteriaDTO;
	import com.gazuntite.provider.live.services.elab.dto.SearchFieldsDTO;
	
	import flash.events.Event;
	
	import mx.core.INavigatorContent;
	
	public class ELabGridFilterEvent extends Event
	{
		public static const SEARCH_CLICKED:String = "searchClicked";
		public static const NEXT_PAGE_CLICKED:String = "nextPageClicked";
		public static const PREVIOUS_PAGE_CLICKED:String = "previousPageClicked";
		public static const PAGE_REQUESTED:String = "pageRequested";
		public static const PROCESS_CLICKED:String = "processClicked";
		public static const FILTER_CLICKED:String = "filterClicked";
		public static const APPLY_FILTER_CLICKED:String = "applyFilterClicked";
		public static const CANCEL_FILTER_CLICKED:String = "cancelFilterClicked";
		public static const SEARCH_TYPE_CHANGED:String = "searchTypeChanged";
		public static const SEARCH_POP_UP_CLOSED:String = "searchPopUpClosed";
		
		public var searchTerm:String;
		public var searchType:SearchFieldsDTO;
		public var pageNo:int;
		public var eLabFilterCriteria:ELabFilterCriteriaDTO;
		
		public function ELabGridFilterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			super.clone();
			
			var ev:ELabGridFilterEvent = new ELabGridFilterEvent(type, bubbles, cancelable);
			ev.searchTerm = this.searchTerm;
			ev.searchType = this.searchType;
			ev.pageNo = this.pageNo;
			ev.eLabFilterCriteria = eLabFilterCriteria;
			
			return ev;
		}
	}
}