package com.gazuntite.provider.search.services.provider.appController
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.search.services.provider.command.SearchProviderCommand;

	public class SearchProviderController extends FrontController
	{
		
		public static const SEARCH_PROVIDER_ID_EVENT : String =	"search_provider_id_event";
		
		private static var m_oSearchProviderController:SearchProviderController ;
		
		public static function getInstance():SearchProviderController 
		{
			if ( m_oSearchProviderController == null )
				m_oSearchProviderController = new SearchProviderController(new Lock());
			return m_oSearchProviderController;
		}
		
		public function SearchProviderController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			addCommand( SEARCH_PROVIDER_ID_EVENT, SearchProviderCommand );
		}
	}
}

class Lock
{
	//Singlton Lock
}