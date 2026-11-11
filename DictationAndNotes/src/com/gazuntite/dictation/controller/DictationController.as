package com.gazuntite.dictation.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.dictation.command.LoadDictationByIdCommand;
	import com.gazuntite.dictation.command.UploadDictationCommand;
	
	public class DictationController extends FrontController
	{
		public static const LOAD_DICTATION_BY_ID_EVENT : String =	"load_dictation_by_id_event";
		
		public static const UPLOAD_DICTATION_EVENT : String =	"upload_dictation_event";
		
		private static var m_oControllerInstance:DictationController ;
		
		public static function getInstance():DictationController 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new DictationController(new Lock());
			return m_oControllerInstance;
		}
		
		public function DictationController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			
			addCommand( LOAD_DICTATION_BY_ID_EVENT, LoadDictationByIdCommand );
			
			addCommand( UPLOAD_DICTATION_EVENT, UploadDictationCommand );
		}
	}
	
}
class Lock
{
	//Singlton Lock
}