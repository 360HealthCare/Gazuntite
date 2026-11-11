package com.gazuntite.provider.search.services.provider.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.search.services.provider.appController.SearchProviderController;
	
	public class SearchProviderEvent extends CairngormEvent
	{

		public var searchString 	: String;
		public var callBack			: Function;
		
		public function SearchProviderEvent( searchString:String, callback:Function = null )
		{
			super(SearchProviderController.SEARCH_PROVIDER_ID_EVENT);
			this.searchString 	= searchString;
			this.callBack 		= callback;
		}
	}
}