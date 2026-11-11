package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class PatientDTO extends PersonDTO
	{
		
		private var m_sQuivusID				:String;
		private var m_iUserID				:int;
		private var m_sSSN					:String;
		private var m_sCreatedAt 	        :String;
		private var _m_sRecGuid :String;
		private var _m_GAXENID :String;
		
		
		private var m_bIsAuthorized 		:Boolean;
		private var m_bIsChatIdAvailable 	:Boolean;
		private var m_bIsEmailIdAvailable 	:Boolean;
		private var m_bIsPhoneNoAvailable 	:Boolean;
		private var m_bIsSMSNoAvalable 		:Boolean;
		private var m_bIsSnailIdAvailable 	:Boolean;
		
		
		
		
		
		public function PatientDTO()
		{
			XmlNodeName = "Patient";
		}
		
		public function get GAXENID():String
		{
			return _m_GAXENID;
		}

		public function set GAXENID(value:String):void
		{
			_m_GAXENID = value;
		}

		public function get RecGuid():String
		{
			return _m_sRecGuid;
		}

		public function set RecGuid(value:String):void
		{
			_m_sRecGuid = value;
		}

      public function get CreatedAt():String
      {
         return m_sCreatedAt;
      }

      public function set CreatedAt(value:String):void
      {
         m_sCreatedAt = value;
      }

		public function get UserID():int
		{
			return m_iUserID;
		}

		public function set UserID(value:int):void
		{
			m_iUserID = value;
		}

		/*   **********************************    *
		 *   Patient Complete Info
		 *   **********************************    */
		

		
		/*   **********************************    *
		 *   Patient Complete Info END
		 *   **********************************    */
		
		public function get IsAuthorized():Boolean
		{
			return m_bIsAuthorized;
		}

		public function set IsAuthorized(value:Boolean):void
		{
			m_bIsAuthorized = value;
		}

		public function get IsChatIdAvailable():Boolean
		{
			return m_bIsChatIdAvailable;
		}

		public function set IsChatIdAvailable(value:Boolean):void
		{
			m_bIsChatIdAvailable = value;
		}

		public function get IsEmailIdAvailable():Boolean
		{
			return m_bIsEmailIdAvailable;
		}

		public function set IsEmailIdAvailable(value:Boolean):void
		{
			m_bIsEmailIdAvailable = value;
		}

		public function get IsPhoneNoAvailable():Boolean
		{
			return m_bIsPhoneNoAvailable;
		}

		public function set IsPhoneNoAvailable(value:Boolean):void
		{
			m_bIsPhoneNoAvailable = value;
		}

		public function get IsSMSNoAvalable():Boolean
		{
			return m_bIsSMSNoAvalable;
		}

		public function set IsSMSNoAvalable(value:Boolean):void
		{
			m_bIsSMSNoAvalable = value;
		}

		public function get IsSnailIdAvailable():Boolean
		{
			return m_bIsSnailIdAvailable;
		}

		public function set IsSnailIdAvailable(value:Boolean):void
		{
			m_bIsSnailIdAvailable = value;
		}

		public function get SSN():String
		{
			return m_sSSN;
		}

		public function set SSN(value:String):void
		{
			m_sSSN = value;
		}

		public function get QuivusID():String
		{
			return m_sQuivusID;
		}

		public function set QuivusID(value:String):void
		{
			m_sQuivusID = value;
		}
		

		public function FromObject(o:Object):void
		{
			this.ID				= o.ID;
			this.UserID			= o.UserID;
			this.DOB 			= o.DOB;
			this.FirstName 		= o.FirstName;
			this.LastName 		= o.LastName;
			this.MiddleName 	= o.MiddleName;
			this.QuivusID 		= o.QuivusID;
			this.SSN	 		= o.SSN;
			this.RecGuid		= o.RecGuid;
			
			this.GAXENID		= o.GAXENID;
			
		}
		
		override public function FromXML(x:XML):void
		{
			if (!x)
				return;
			
			super.FromXML( x );
			
			ID 						= x.@[XmlConstants.ID];
			SSN 					= x.@[XmlConstants.SSN];
			QuivusID 				= x.@[XmlConstants.QUIVUS_ID];
			UserID 					= x.@[XmlConstants.USER_ID];
			Gender 					= x.@[XmlConstants.GENDER];

			IsSnailIdAvailable 		= x.@[XmlConstants.IS_SNAIL_ID_AVAILABLE] 	== QSConstants.STRING_TRUE;
			IsSMSNoAvalable 		= x.@[XmlConstants.IS_SMS_NO_AVALABLE]		== QSConstants.STRING_TRUE;
			IsPhoneNoAvailable 		= x.@[XmlConstants.IS_PHONE_NO_AVAILABLE]	== QSConstants.STRING_TRUE;
			IsEmailIdAvailable 		= x.@[XmlConstants.IS_EMAIL_ID_AVAILABLE]	== QSConstants.STRING_TRUE;
			IsChatIdAvailable 		= x.@[XmlConstants.IS_CHAT_ID_AVAILABLE]	== QSConstants.STRING_TRUE;
			IsAuthorized 			= x.@[XmlConstants.IS_AUTHORIZED]			== QSConstants.STRING_TRUE;
         	CreatedAt            	= x.@[XmlConstants.CREATEDAT];
			RecGuid					= x.@[XmlConstants.REC_GUID]; 
			GAXENID					= x.@[XmlConstants.GAXENID];
			
		}
		
		override public function ToXML():XML
		{
			var xml:XML = super.ToXML();
			
			xml.@[XmlConstants.ID]						= ID;
			xml.@[XmlConstants.SSN]						= SSN;
			xml.@[XmlConstants.QUIVUS_ID] 				= QuivusID;
			xml.@[XmlConstants.USER_ID]					= UserID;
			xml.@[XmlConstants.GENDER]					= Gender;
			xml.@[XmlConstants.IS_SNAIL_ID_AVAILABLE] 	= IsSnailIdAvailable;
			xml.@[XmlConstants.IS_SMS_NO_AVALABLE]		= IsSMSNoAvalable;
			xml.@[XmlConstants.IS_PHONE_NO_AVAILABLE]	= IsPhoneNoAvailable;
			xml.@[XmlConstants.IS_EMAIL_ID_AVAILABLE]	= IsEmailIdAvailable;
			xml.@[XmlConstants.IS_CHAT_ID_AVAILABLE]	= IsChatIdAvailable;
			xml.@[XmlConstants.IS_AUTHORIZED]			= IsAuthorized;
			xml.@[XmlConstants.CREATEDAT]				= CreatedAt;
			xml.@[XmlConstants.REC_GUID]				= RecGuid;
			
			xml.@[XmlConstants.GAXENID]					= GAXENID;
			
			
			
			return xml;
		}
	}
}