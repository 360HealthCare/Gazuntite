package com.gazuntite.provider.eprescription.services.patient.dto
{
	
	import com.gazuntite.provider.eprescription.services.patient.util.XmlConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.XmlUtils;

	public class providerdto
	{
		private var _FirstName:String;
		private var _LastName:String;
		private var _MiddleName:String;
		private var _PrefixTypeID:int;
		private var _Suffix:String;
		private var _UserEmail:String;
		private var _UserId:int;
		private var _ProviderCompleteName:String;

		
		
		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}

		public function get MiddleName():String
		{
			return _MiddleName;
		}

		public function set MiddleName(value:String):void
		{
			_MiddleName = value;
		}

		public function get PrefixTypeID():int
		{
			return _PrefixTypeID;
		}

		public function set PrefixTypeID(value:int):void
		{
			_PrefixTypeID = value;
		}

		public function get Suffix():String
		{
			return _Suffix;
		}

		public function set Suffix(value:String):void
		{
			_Suffix = value;
		}

		public function get UserEmail():String
		{
			return _UserEmail;
		}

		public function set UserEmail(value:String):void
		{
			_UserEmail = value;
		}

		public function get UserId():int
		{
			return _UserId;
		}

		public function set UserId(value:int):void
		{
			_UserId = value;
		}

		public function get ProviderCompleteName():String
		{
			return _ProviderCompleteName;
		}
		
		public function set ProviderCompleteName(value:String):void
		{
			_ProviderCompleteName = value;
		}
		
		
		public function FromXML(x:XML):void
		{
			FirstName = x.@[XmlConstants.FIRST_NAME];
			LastName = x.@[XmlConstants.LAST_NAME];
			MiddleName = x.@[XmlConstants.MIDDLE_NAME];
			/*Suffix = x.@[XmlConstants.SUFFIX];
			PrefixTypeID = x.@[XmlConstants.PREFIX_TYPE_ID];
			UserEmail = x.@[XmlConstants.USER_EMAIL];*/
			UserId = x.@[XmlConstants.USER_ID];
			ProviderCompleteName = x.@[XmlConstants.FIRST_NAME] +" " + x.@[XmlConstants.MIDDLE_NAME] +" " + x.@[XmlConstants.LAST_NAME] 
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "" );
			xml.@[XmlConstants.USER_ID]			= UserId;
			xml.@[XmlConstants.FIRST_NAME]	= FirstName;
			xml.@[XmlConstants.LAST_NAME]	= LastName;
			xml.@[XmlConstants.MIDDLE_NAME]	= MiddleName;
			//xml.@[XmlConstants.DOB]			= DOB;
			
			return xml;
		}
	}
}