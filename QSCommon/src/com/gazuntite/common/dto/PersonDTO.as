package com.gazuntite.common.dto
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class PersonDTO extends LiveProviderBaseDTO
	{
		
		private var m_iID:int;
		private var m_sFirstName:String;
		private var m_sMiddleName:String;
		private var m_sLastName:String;
		private var m_sDOB:String;
		private var m_sGenderID:String;
		private var m_sGenderName:String;
		
		
		private var m_sXmlNodeName:String;
		
		public function PersonDTO()
		{
		}
		
		public function get ID():int
		{
			return m_iID;
		}

		public function set ID(value:int):void
		{
			m_iID = value;
		}

		public function get FullName():String
		{
			var fullName:String = FirstName;
			
			if( !UtilityFunctions.IsNullOrEmpty( MiddleName ) )
			{
				fullName += " " + MiddleName;
			}
			
			fullName += " " + LastName;
			
			return fullName;
		}
		public function get FirstName():String
		{
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}

		public function get MiddleName():String
		{
			return m_sMiddleName;
		}

		public function set MiddleName(value:String):void
		{
			m_sMiddleName = value;
		}

		public function get LastName():String
		{
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}
		
		public function get DOB():String
		{
			return m_sDOB;
		}
		
		public function set DOB(value:String):void
		{
			m_sDOB = value;
		}

		public function get GenderID():String
		{
			return m_sGenderID;
		}
		
		public function set GenderID(value:String):void
		{
			m_sGenderID = value;
		}
		
		public function get Gender():String
		{
			return m_sGenderName;
		}
		
		public function set Gender(value:String):void
		{
			m_sGenderName = value;
		}


		public function get XmlNodeName():String
		{
			return m_sXmlNodeName;
		}
		
		public function set XmlNodeName(value:String):void
		{
			m_sXmlNodeName = value;
		}
		
		public function FromXML(x:XML):void
		{
			if (!x)
				return;
			
			ID			= x.@[XmlConstants.ID];
			FirstName 	= x.@[XmlConstants.FIRST_NAME];
			LastName 	= x.@[XmlConstants.LAST_NAME];
			MiddleName 	= x.@[XmlConstants.MIDDLE_NAME];
			DOB 		= x.@[XmlConstants.DOB];
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( XmlNodeName );
			xml.@[XmlConstants.ID]			= ID;
			xml.@[XmlConstants.FIRST_NAME]	= FirstName;
			xml.@[XmlConstants.LAST_NAME]	= LastName;
			xml.@[XmlConstants.MIDDLE_NAME]	= MiddleName;
			xml.@[XmlConstants.DOB]			= DOB;
			
			return xml;
		}

	}
}