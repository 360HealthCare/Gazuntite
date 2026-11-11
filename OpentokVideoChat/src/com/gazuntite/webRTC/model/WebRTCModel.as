package com.gazuntite.webRTC.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.webRTC.util.WebRTCConstants;
	
	import mx.logging.ILogger;
	import mx.logging.Log;

	[Bindable]
	public class WebRTCModel  implements ModelLocator
	{
		//////// Service Related Data
		private var logger:ILogger = Log.getLogger("com.gazuntite.webRTC.model.WebRTCModel");
		
		
		private var _videoCallInfo:String;
		private var _CallerID:String;
		private var _CallerName:String;
		private var _isCallfromProvider:Boolean = true;
		
		public function get CallerName():String
		{
			return _CallerName;
		}

		public function set CallerName(value:String):void
		{
			_CallerName = value;
		}

		public function get isCallfromProvider():Boolean
		{
			return _isCallfromProvider;
		}

		public function set isCallfromProvider(value:Boolean):void
		{
			_isCallfromProvider = value;
		}

		public function get CallerID():String
		{
			return _CallerID;
		}

		public function set CallerID(value:String):void
		{
			_CallerID = value;
		}

		public function get videoCallInfo():String
		{
			return _videoCallInfo;
		}
		
		public function set videoCallInfo(value:String):void
		{
			_videoCallInfo = value;
		}
		public function get loggedInUserId():int
		{
			return _loggedInUserId;
		}
		
		
		//////// Service Related Data ends
		
		
		
		
		//////selgelton Related Code
		private static var model 	:WebRTCModel;
		
		public function WebRTCModel()
		{
			if ( model != null )
				throw new Error( "Only one EmailModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : WebRTCModel
		{
			if ( model == null )
				model = new WebRTCModel();
			return model;
		}
		
		
		///Segelton Ends /////////////////////
		
		
		
		/////////user Related Code Starts
		
		private var _loggedInUserId							:int;
		private var _loggedInUserProviderId					:int;
		private var _loggedInUserProviderTypeId				:int;
		private var _loggedInUserSelectedBranchId			:int;
		
		private var _loggedInUserSelectedPracticeName		:String;//clinic branch name
		private var _loggedInUserSelectedStationID			:int;
		
		
		
		
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int,loggedInUserProviderTypeId:int,loggedInUserSelectedBranchId:int, loggedInUserSelectedBranchName:String,stationName:String ,stationID:int,loginsuccessfull:Boolean):void
		{
			this.loggedInUserId						= loggedInUserId;
			this.loggedInUserProviderId				= loggedInUserProviderId;
			this.loggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.loggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.loggedInUserSelectedStationID 	= stationID; 
		}
		
		public function ResetModel():void
		{
			
			this.loggedInUserId					= undefined;
			this.loggedInUserProviderId			= undefined;
			this.loggedInUserProviderTypeId		= undefined;
			this.loggedInUserSelectedBranchId	= undefined;
			this.loggedInUserSelectedStationID  = undefined;
		}
		
		public function set loggedInUserId(value:int):void
		{
			_loggedInUserId = value;
		}
		
		public function get loggedInUserProviderId():int
		{
			return _loggedInUserProviderId;
		}
		
		public function set loggedInUserProviderId(value:int):void
		{
			_loggedInUserProviderId = value;
		}
		
		public function get loggedInUserProviderTypeId():int
		{
			return _loggedInUserProviderTypeId;
		}
		
		public function set loggedInUserProviderTypeId(value:int):void
		{
			_loggedInUserProviderTypeId = value;
		}
		
		public function get loggedInUserSelectedBranchId():int
		{
			return _loggedInUserSelectedBranchId;
		}
		
		public function set loggedInUserSelectedBranchId(value:int):void
		{
			_loggedInUserSelectedBranchId = value;
		}
		
		public function get loggedInUserSelectedPracticeName():String
		{
			return _loggedInUserSelectedPracticeName;
		}
		
		public function set loggedInUserSelectedPracticeName(value:String):void
		{
			_loggedInUserSelectedPracticeName = value;
		}
		
		public function get loggedInUserSelectedStationID():int
		{
			return _loggedInUserSelectedStationID;
		}
		
		public function set loggedInUserSelectedStationID(value:int):void
		{
			_loggedInUserSelectedStationID = value;
		}
		
		/////// user related Code Ends
		
		
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			WebRTCConstants.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'COMMUNICATION_RESTFUL_SERVICE', value );
			WebRTCConstants.VIDEO_CHAT_URL 						= XmlUtils.getPropertyValueByName( 'VIDEO_CHAT_URL', value );
			
			//log it 
			logger.debug( "COMMUNICATION_RESTFUL_SERVICE: " + WebRTCConstants.RESTFULL_SERVICE_BASE_URL  );
			logger.debug( "VIDEO_CHAT_URL: " + WebRTCConstants.VIDEO_CHAT_URL  );
		}
	}
}