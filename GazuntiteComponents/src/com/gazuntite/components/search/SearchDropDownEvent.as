package com.gazuntite.components.search
{
	import flash.events.Event;
	
	[Bindable]
	public class SearchDropDownEvent extends Event
	{
		public static const SEARCH_TYPE_CHANGE:String 				= "searchTypeChange";
		public static const Start_SEARCH:String 					= "startSearch";
		public static const SEARCH_RESULT_SELECTION_CHANGE:String 	= "searchResultSelectionChange";
		
		private var ms_SearchTypeIndex:int;
		private var ms_SearchTypePrompt:String;
		private var ms_SearchQuery:String;
		private var mo_SelectedItem:*;
		private var mi_SelectedIndex:int;
		
		public function SearchDropDownEvent( type:String )
		{
			super(type, true );
		}

		/**
		 * Actual user input ... query string 
		 */		
		public function get SearchQuery():String
		{
			return ms_SearchQuery;
		}

		public function set SearchQuery(value:String):void
		{
			ms_SearchQuery = value;
		}

		/**
		 * Selected item index from the Result list 
		 */	
		public function get SelectedIndex():int
		{
			return mi_SelectedIndex;
		}

		public function set SelectedIndex(value:int):void
		{
			mi_SelectedIndex = value;
		}

		/**
		 * Selected item from the Result list 
		 */
		public function get SelectedItem():*
		{
			return mo_SelectedItem;
		}

		public function set SelectedItem(value:*):void
		{
			mo_SelectedItem = value;
		}

		/**
		 * 'Search Type' ... Selected item label from dataProvider 
		 * @return value shown to user as prompt 
		 * 
		 */		
		public function get searchTypePrompt():String
		{
			return ms_SearchTypePrompt;
		}

		public function set searchTypePrompt(value:String):void
		{
			ms_SearchTypePrompt = value;
		}

		/**
		 * 'Search Type' ... Selected item index from dataProvider
		 * @return index of value shown to user as prompt 
		 * 
		 */	
		public function get searchTypeIndex():int
		{
			return ms_SearchTypeIndex;
		}

		public function set searchTypeIndex(value:int):void
		{
			ms_SearchTypeIndex = value;
		}

	}
}