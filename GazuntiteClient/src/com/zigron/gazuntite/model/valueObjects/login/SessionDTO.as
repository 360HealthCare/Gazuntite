package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.model.valueObjects.provider.ProviderStatusDTO;
	
	[Bindable]
	public class SessionDTO
	{
		
		private var _IsProvider:Boolean;
		private var _IsActive:Boolean;
		private var _IsAlreadyLoggedIn:Boolean;
		private var _KickOutPreviousSession:Boolean;
		
		
		private var _SessionID:String;
		//private var _LastActivityPerformedAt:String;
		private var _CreatedAt:String;
		private var _ClientIPAdress:String;
		
		private var _UserID:int;
		private var _UserTypeID:int;
		private var _ClinicBranchID:int;
		private var _TimeZoneId:int;
		private var _UserSessionStatusID:int;
		private var _UserSessionStatusDescription:String;
		
		
		private var _Status:ProviderStatusDTO;
		
		
		public function SessionDTO()
		{
			
			_Status = new ProviderStatusDTO();
			
		}
		
		
		public function get Status():String
		{
			return _Status.status;
		}
		
		public function set Status(value:String):void
		{
			_Status.status = value;
		}
		
		public function get UserSessionStatusDescription():String
		{
			return _UserSessionStatusDescription;
		}
		
		public function set UserSessionStatusDescription(value:String):void
		{
			_UserSessionStatusDescription = value;
		}
		
		public function get UserSessionStatusID():int
		{
			return _UserSessionStatusID;
		}
		
		public function set UserSessionStatusID(value:int):void
		{
			_UserSessionStatusID = value;
		}
		
		public function get TimeZoneId():int
		{
			return _TimeZoneId;
		}
		
		public function set TimeZoneId(value:int):void
		{
			_TimeZoneId = value;
		}
		
		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}
		
		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}
		
		public function get UserTypeID():int
		{
			return _UserTypeID;
		}
		
		public function set UserTypeID(value:int):void
		{
			_UserTypeID = value;
		}
		
		public function get UserID():int
		{
			return _UserID;
		}
		
		public function set UserID(value:int):void
		{
			_UserID = value;
		}
		
		public function get ClientIPAdress():String
		{
			return _ClientIPAdress;
		}
		
		public function set ClientIPAdress(value:String):void
		{
			_ClientIPAdress = value;
		}
		
		public function get CreatedAt():String
		{
			return _CreatedAt;
		}
		
		public function set CreatedAt(value:String):void
		{
			_CreatedAt = value;
		}
		
		/*	public function get LastActivityPerformedAt():String
		{
		return _LastActivityPerformedAt;
		}
		
		public function set LastActivityPerformedAt(value:String):void
		{
		_LastActivityPerformedAt = value;
		}*/
		
		public function get SessionID():String
		{
			return _SessionID;
		}
		
		public function set SessionID(value:String):void
		{
			_SessionID = value;
		}
		
		public function get KickOutPreviousSession():Boolean
		{
			return _KickOutPreviousSession;
		}
		
		public function set KickOutPreviousSession(value:Boolean):void
		{
			_KickOutPreviousSession = value;
		}
		
		public function get IsAlreadyLoggedIn():Boolean
		{
			return _IsAlreadyLoggedIn;
		}
		
		public function set IsAlreadyLoggedIn(value:Boolean):void
		{
			_IsAlreadyLoggedIn = value;
		}
		
		public function get IsActive():Boolean
		{
			return _IsActive;
		}
		
		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}
		
		public function get IsProvider():Boolean
		{
			return _IsProvider;
		}
		
		public function set IsProvider(value:Boolean):void
		{
			_IsProvider = value;
		}
		
		public function FromXML(x:XML):void
		{
			IsProvider                   = UtilityFunctions.StringToBoolean(x.@IsProvider);              
			IsActive                     = UtilityFunctions.StringToBoolean(x.@IsActive);             
			IsAlreadyLoggedIn            = UtilityFunctions.StringToBoolean(x.@IsAlreadyLoggedIn);      
			KickOutPreviousSession       = UtilityFunctions.StringToBoolean(x.@KickOutPreviousSession);  
			
			
			SessionID                    = x.@SessionID;               
			UserID                       = x.@UserID;                 
			UserTypeID                   = x.@UserTypeID;              
			ClinicBranchID               = x.@ClinicBranchID;          
			TimeZoneId                   = x.@TimeZoneId;              
			//LastActivityPerformedAt      = x.@ LastActivityPerformedAt; 
			CreatedAt                    = x.@CreatedAt;               
			ClientIPAdress               = x.@ClientIPAdress;          
			UserSessionStatusID          = x.@UserSessionStatusID;   
			
			UserSessionStatusDescription          = x.@UserSessionStatusDescription;     
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName('SessionDTO');
			
			x.@IsProvider                     = IsProvider;            
			x.@IsActive                       = IsActive;               
			x.@IsAlreadyLoggedIn              = IsAlreadyLoggedIn;      
			x.@KickOutPreviousSession         = KickOutPreviousSession; 
			
			
			x.@SessionID                      = SessionID;              
			x.@UserID                         = UserID;                 
			x.@UserTypeID                     = UserTypeID;             
			x.@ClinicBranchID                 = ClinicBranchID;         
			x.@TimeZoneId                     = TimeZoneId;             
			//x.@ LastActivityPerformedAt       = LastActivityPerformedAt;
			x.@CreatedAt                      = CreatedAt;              
			x.@ClientIPAdress                 = ClientIPAdress;         
			x.@UserSessionStatusID            = UserSessionStatusID;    
			
			return x;
		}
	}
}