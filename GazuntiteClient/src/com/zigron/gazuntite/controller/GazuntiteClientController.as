package com.zigron.gazuntite.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.zigron.gazuntite.command.login.GetClinicUserDetailsByIDCommand;
	import com.zigron.gazuntite.command.login.LoadUserImageCommand;
	import com.zigron.gazuntite.command.login.LoadUserSessionTypeCommand;
	import com.zigron.gazuntite.command.login.LoginCommand;
	import com.zigron.gazuntite.command.login.LogoutCommand;
	import com.zigron.gazuntite.command.login.ResetPasswordCommand;
	import com.zigron.gazuntite.command.rapidAccess.LoadUserDefaultQuickLinksbyLocationCommand;
	import com.zigron.gazuntite.command.rapidAccess.ManageQuickLinksCommand;
	import com.zigron.gazuntite.command.registration.CreateClinicUserProfileCommand;
	import com.zigron.gazuntite.command.registration.RegisterBaseUserCommand;
	import com.zigron.gazuntite.command.session.UpdateUserSessionStatusCommand;
	import com.zigron.gazuntite.event.login.LoginEvent;
	
	public class GazuntiteClientController extends FrontController
	{
		private static var m_oControllerInstance:GazuntiteClientController;
		public static var LOAD_CLINIC_USER_BASIC_INFO:String 				= "LOAD_CLINIC_USER_BASIC_INFO";
		public static var Load_USER_SESSION_TYPES:String 					= "Load_USER_SESSION_TYPES";
		public static var UPDATE_USER_SESSION_STATUS:String 				= "UPDATE_USER_SESSION_STATUS";
		public static var LOGOUT_EVENT:String 								= "LOGOUT_EVENT";
		public static var REGISTER_BASE_USER_EVENT:String 					= "REGISTER_BASE_USER_EVENT";
		public static var CREATE_CLINIC_USER_PROFILE_EVENT:String 			= "CREATE_CLINIC_USER_PROFILE_EVENT";
		public static var LOAD_USER_IMAGE_EVENT:String 						= "LOAD_USER_IMAGE_EVENT";
		public static var RESET_USER_PASSWORD_EVENT:String 					= "RESET_USER_PASSWORD_EVENT";
		public static var LOAD_USER_DEFAULT_QUICK_LINKS_BY_LOCATION:String 	= "LOAD_USER_DEFAULT_QUICK_LINKS_BY_LOCATION";
		public static var MANAGE_QUICK_LINKS:String 						= "MANAGE_QUICK_LINKS";
		
		
		
		public static function getInstance():GazuntiteClientController 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new GazuntiteClientController( new Lock() );
			return m_oControllerInstance;
		}
		
		public function GazuntiteClientController(lock:Lock)
		{
			if(null == lock )
				throw("Singlton class 'GazuntiteClientController' is Locked, can't create instance of this class. Please use getInstance() method instead ... ")
			
			addCommand( LoginEvent.LOGIN_REQUEST, LoginCommand );
			addCommand( LOAD_CLINIC_USER_BASIC_INFO, GetClinicUserDetailsByIDCommand );
			addCommand( Load_USER_SESSION_TYPES, LoadUserSessionTypeCommand );
			addCommand( UPDATE_USER_SESSION_STATUS, UpdateUserSessionStatusCommand );
			addCommand( LOGOUT_EVENT, LogoutCommand );
			addCommand( REGISTER_BASE_USER_EVENT, RegisterBaseUserCommand );
			addCommand( CREATE_CLINIC_USER_PROFILE_EVENT, CreateClinicUserProfileCommand );
			addCommand( LOAD_USER_IMAGE_EVENT, LoadUserImageCommand );
			addCommand( RESET_USER_PASSWORD_EVENT, ResetPasswordCommand );
			addCommand( LOAD_USER_DEFAULT_QUICK_LINKS_BY_LOCATION, LoadUserDefaultQuickLinksbyLocationCommand );
			addCommand( MANAGE_QUICK_LINKS, ManageQuickLinksCommand );
		}
	}
}
class Lock
{
	//Singlton Lock
}