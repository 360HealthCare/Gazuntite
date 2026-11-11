package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class CPTMedicalTypeDTO
	{
		private var m_sCPTMedicalTypeID:String;
		private var m_sProcedureCode:String;
		private var m_sProcedureDescription:String;
		private var _nodeName:String = "CPTMedicalTypeDTO" ;
		
		public function CPTMedicalTypeDTO()
		{
		}
		
		public function get nodeName():String
		{
			return _nodeName;
		}

		public function set nodeName(value:String):void
		{
			_nodeName = value;
		}

		public function get CPTMedicalTypeID():String
		{
			return m_sCPTMedicalTypeID;
		}
		
		public function set CPTMedicalTypeID(value:String):void
		{
			m_sCPTMedicalTypeID = value;
		}
		
		public function get ProcedureCode():String
		{
			return m_sProcedureCode;
		}
		
		public function set ProcedureCode(value:String):void
		{
			m_sProcedureCode = value;
		}
		
		public function get ProcedureDescription():String
		{
			return m_sProcedureDescription;
		}
		
		public function set ProcedureDescription(value:String):void
		{		
			m_sProcedureDescription = value;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			x.@["ID"] = this.CPTMedicalTypeID;
			x.@["Code"] = this.ProcedureCode;
			x.@["Description"] = this.ProcedureDescription;
			
			return x;
		}
		
		public function FromXML( x:XML ):void
		{
			CPTMedicalTypeID = x.@["ID"];
			ProcedureCode = x.@["Code"];
			ProcedureDescription = x.@["Description"];			
		}
	}
}