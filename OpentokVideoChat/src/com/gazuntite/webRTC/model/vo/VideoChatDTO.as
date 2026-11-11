package com.gazuntite.webRTC.model.vo
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class VideoChatDTO
	{
		private var _ID:int;

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		
		private var _CallRecieverID:int;
		public function get CallRecieverID():int
		{
			return _CallRecieverID;
		}

		public function set CallRecieverID(value:int):void
		{
			_CallRecieverID = value;
		}

		private var _CallRecieverName:String;
		public function get CallRecieverName():String
		{
			return _CallRecieverName;
		}

		public function set CallRecieverName(value:String):void
		{
			_CallRecieverName = value;
		}

		private var _CallInitiatorID:int; 
		public function get CallInitiatorID():int
		{
			return _CallInitiatorID;
		}

		public function set CallInitiatorID(value:int):void
		{
			_CallInitiatorID = value;
		}

		private var _CallInitiatorName:String;
		public function get CallInitiatorName():String
		{
			return _CallInitiatorName;
		}

		public function set CallInitiatorName(value:String):void
		{
			_CallInitiatorName = value;
		}


		private var _ClinicBranchID:int;
		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		private var _OpenTokSessionID:String;
		public function get OpenTokSessionID():String
		{
			return _OpenTokSessionID;
		}

		public function set OpenTokSessionID(value:String):void
		{
			_OpenTokSessionID = value;
		}

		private var _OpenTokTokenID:String;
		public function get OpenTokTokenID():String
		{
			return _OpenTokTokenID;
		}

		public function set OpenTokTokenID(value:String):void
		{
			_OpenTokTokenID = value;
		}

		private var _isProvider:Boolean;
		public function get isProvider():Boolean
		{
			return _isProvider;
		}

		public function set isProvider(value:Boolean):void
		{
			_isProvider = value;
		}

		
		public function VideoChatDTO()
		{
			OpenTokSessionID = "";
			OpenTokTokenID	 = "";
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("VideoChat");
			
			x.@CallReciever 	= CallRecieverID;
			x.@CallInitiator 	= CallInitiatorID;
			x.@ClinicBranchID 	= ClinicBranchID;
			x.@OpenTokSessionID = OpenTokSessionID;
			x.@OpenTokTokenID 	= OpenTokTokenID;
			x.@isProvider 		= isProvider;
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			this.ID 				= x.@VideoChatID
			this.OpenTokSessionID 	= x.@OpenTokSessionID
			this.OpenTokTokenID 	= x.@OpenTokTokenID
		}
	}
}