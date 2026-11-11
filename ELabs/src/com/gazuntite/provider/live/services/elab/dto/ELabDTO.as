package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.common.dto.ProviderDTO;
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	[Bindable]
	public class ELabDTO extends LiveProviderBaseDTO
	{
		private var m_sID:String;
		private var m_sOrderID:String;
		private var m_sLabID:String;
		private var m_sLabName:String;
		private var m_sStatus:String;
		private var m_sOrderDate:String;
		
		private var m_bResultAvailable:Boolean;
		private var m_bAttachmentAvailable:Boolean;
		
		private var m_oPatient:PatientDTO;
		private var m_oProvider:ProviderDTO;
		private var m_oTest:TestDTO;
		private var m_oResult:ResultDTO;
		private var m_oMethod:MethodDTO;//TA
		
		
		public function ELabDTO()
		{
			/*Patient 	= new PatientDTO();
			Provider 	= new ProviderDTO();
			Test 		= new TestDTO();*/
		}
		
		public function get AttachmentAvailable():Boolean
		{
			return m_bAttachmentAvailable;
		}

		public function set AttachmentAvailable(value:Boolean):void
		{
			m_bAttachmentAvailable = value;
		}

		public function get ResultAvailable():Boolean
		{
			return m_bResultAvailable;
		}

		public function set ResultAvailable(value:Boolean):void
		{
			m_bResultAvailable = value;
		}

		public function get Test():TestDTO
		{
			return m_oTest;
		}
		
		public function set Test(value:TestDTO):void
		{
			m_oTest = value;
		}
		
		public function get Provider():ProviderDTO
		{
			return m_oProvider;
		}
		
		public function set Provider(value:ProviderDTO):void
		{
			m_oProvider = value;
		}
		
		public function get Patient():PatientDTO
		{
			return m_oPatient;
		}
		
		public function set Patient(value:PatientDTO):void
		{
			m_oPatient = value;
		}
		
		public function get Result():ResultDTO
		{
			return m_oResult;
		}
		
		public function set Result(value:ResultDTO):void
		{
			m_oResult = value;
		}
		
		public function get Method():MethodDTO
		{
			return m_oMethod;
		}
		
		public function set Method(value:MethodDTO):void
		{
			m_oMethod = value;
		}
		
		public function get OrderDate():String
		{
			return m_sOrderDate;
		}
		
		public function set OrderDate(value:String):void
		{
			m_sOrderDate = value;
		}
		
		public function get ID():String
		{
			return m_sID;
		}
		
		public function set ID(value:String):void
		{
			m_sID = value;
		}
		
		public function get LabName():String
		{
			return m_sLabName;
		}
		
		public function set LabName(value:String):void
		{
			m_sLabName = value;
		}
		
		public function get Status():String
		{
			return m_sStatus;
		}
		
		public function set Status(value:String):void
		{
			m_sStatus = value;
		}
		
		public function get OrderID():String
		{
			return m_sOrderID;
		}
		
		public function set OrderID(value:String):void
		{
			m_sOrderID = value;
		}
		
		public function get LabID():String
		{
			return m_sLabID;
		}
		
		public function set LabID(value:String):void
		{
			m_sLabID = value;
		}
		
		public function FromXML(x:XML):void
		{
			ID 			= x.@[XmlConstants.ID];
			OrderDate	= x.@[XmlConstants.DATE];
			LabID 		= x.@[XmlConstants.LAB_ID];
			OrderID 	= x.@[XmlConstants.ORDER_ID];
			LabName 	= x.@[XmlConstants.LABORATORY];
			Status		= x.@[XmlConstants.STATUS];
			
			AttachmentAvailable = x.@[XmlConstants.ATTACHMENT_AVAILABLE] == XmlConstants.STRING_TRUE;
			ResultAvailable 	= x.@[XmlConstants.RESULT_AVAILABLE]  == XmlConstants.STRING_TRUE;
			
			var xPatient:XML 	= x.Patient[0];
			Patient 			= new PatientDTO();
			Patient.FromXML( xPatient );
			
			var xProvider:XML 	= x.Provider[0];
			Provider			= new ProviderDTO();
			Provider.FromXML( xProvider );
			
			var xTest:XML 		= x.Test[0];
			Test 				= new TestDTO();
			Test.FromXML( xTest );
			
			var xMethod:XML 		= x.Method[0];
			if( xMethod )
			{
				Method 					= new MethodDTO();
				Method.FromXML( xMethod );
			}
			
			var xResult:XML 	= x.Result[0];
			if( xResult )
			{
				Result 				= new ResultDTO();
				Result.FromXML( xResult );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Lab" );
			xml.@[XmlConstants.ID]			= ID;
			xml.@[XmlConstants.DATE]		= OrderDate;
			xml.@[XmlConstants.LAB_ID]		= LabID;
			xml.@[XmlConstants.ORDER_ID]	= OrderID;
			xml.@[XmlConstants.LABORATORY]	= LabName;
			xml.@[XmlConstants.STATUS]		= Status;
			xml.@[XmlConstants.IS_DIRTY]	= IsDirty.toString();
			xml.@[XmlConstants.IS_DELETED]	= IsDeleted.toString();
			
			xml.@[XmlConstants.ATTACHMENT_AVAILABLE] = AttachmentAvailable ? XmlConstants.STRING_TRUE : XmlConstants.STRING_FALSE;
			xml.@[XmlConstants.RESULT_AVAILABLE]  	 = ResultAvailable     ? XmlConstants.STRING_TRUE : XmlConstants.STRING_FALSE;
			
			xml.appendChild( Patient.ToXML() );
			xml.appendChild( Provider.ToXML() );
			xml.appendChild( Test.ToXML() );
			xml.appendChild( Method.ToXML() );//TA
			if( Result )
				xml.appendChild( Result.ToXML() );
			
			return xml;
		}
		
	}
}