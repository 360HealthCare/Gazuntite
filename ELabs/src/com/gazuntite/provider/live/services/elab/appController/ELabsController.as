package com.gazuntite.provider.live.services.elab.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.live.services.elab.command.EnterResultCommand;
	import com.gazuntite.provider.live.services.elab.command.LoadLabOrderCommand;
	import com.gazuntite.provider.live.services.elab.command.LoadLabResultCommand;
	import com.gazuntite.provider.live.services.elab.command.LoadOrderDocumentCommand;
	import com.gazuntite.provider.live.services.elab.command.LoadTestTypeByNameCommand;
	import com.gazuntite.provider.live.services.elab.command.LoadeLabsStaticDataCommand;
	import com.gazuntite.provider.live.services.elab.command.ManageLabsCommand;
	import com.gazuntite.provider.live.services.elab.command.ProcessLabOrderCommand;
	import com.gazuntite.provider.live.services.elab.command.ProcessLabResultCommand;
	import com.gazuntite.provider.live.services.elab.command.ViewResultCommand;
	import com.gazuntite.provider.live.services.elab.event.ManageLabsEvent;

	public class ELabsController extends FrontController
	{
		
		public static const LOAD_LAB_ORDER_EVENT:String = "LOAD_LAB_ORDER_EVENT";
		public static const LOAD_LAB_RESULT_EVENT:String = "LOAD_LAB_RESULT_EVENT";
		
		public static const LOAD_SEARCH_FIELDS_EVENT:String = "LOAD_SEARCH_FIELDS_EVENT";
		public static const LOAD_TEST_TYPE_BY_NAME:String = "LOAD_TEST_TYPE_BY_NAME";
		public static const LOAD_ORDER_DOCUMENT:String = "LOAD_ORDER_DOCUMENT";
		
		public static const PROCESS_ORDER_EVENT:String = "PROCESS_ORDER_EVENT";
		public static const PROCESS_RESULT_EVENT:String = "PROCESS_RESULT_EVENT";
		
		public static const MANAGE_ELABS:String = "MANAGE_ELABS";
		public static const ENTER_LAB_RESULT:String = "ENTER_LAB_RESULT";
		public static const VIEW_RESULT:String = "VIEW_RESULT";
		
		private static var m_oELabsController:ELabsController ;
		
		public static function getInstance():ELabsController 
		{
			if ( m_oELabsController == null )
				m_oELabsController = new ELabsController(new Lock());
			return m_oELabsController;
		}
		
		public function ELabsController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			
			addCommand(LOAD_LAB_ORDER_EVENT, LoadLabOrderCommand);
			addCommand(LOAD_LAB_RESULT_EVENT, LoadLabResultCommand);
			addCommand( LOAD_SEARCH_FIELDS_EVENT, LoadeLabsStaticDataCommand);
			addCommand( PROCESS_ORDER_EVENT, ProcessLabOrderCommand);
			addCommand( PROCESS_RESULT_EVENT, ProcessLabResultCommand);
			addCommand( LOAD_TEST_TYPE_BY_NAME, LoadTestTypeByNameCommand);
			addCommand( MANAGE_ELABS, ManageLabsCommand);
			addCommand( LOAD_ORDER_DOCUMENT, LoadOrderDocumentCommand);
			addCommand( ENTER_LAB_RESULT, EnterResultCommand);
			addCommand( VIEW_RESULT, ViewResultCommand);
		}
	}
}
class Lock
{
	//Singlton Lock
}