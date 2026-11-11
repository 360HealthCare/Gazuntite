package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	public class WorkRelatedServiceDTO
	{
		private var m_sWRSTypeId:String;		
		private var m_sServiceDescription:String;
		private var m_sIsSelected:Boolean;
		private var m_sFee:String;
		
		
		
		public function FromXML( x:XML ):void
		{
			WRSTypeId 								= x.@[XmlConstants.WRSTYPEID];			
			ServiceDescription 						= x.@[XmlConstants.WRSDESCRIPTION];	
			Fee 									= x.@[XmlConstants.WRSFEE];
			if(x.@[XmlConstants.WRSISSELECTED] == "true")
				IsSelected 	= true;
			else 
				IsSelected 	= false;			
		}
		
		public function ToXML( ):XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "Service" );
			
			x.@[XmlConstants.WRSTYPEID]				= WRSTypeId;		
			x.@[XmlConstants.WRSDESCRIPTION]		= ServiceDescription;
			x.@[XmlConstants.WRSFEE]				= Fee;
			if(IsSelected == true)
				x.@[XmlConstants.WRSISSELECTED] = "true";
			else 
				x.@[XmlConstants.WRSISSELECTED] = "false"	
			
			return x;
		}
		
		public function get IsSelected():Boolean
		{
			return m_sIsSelected;
		}
		
		public function set IsSelected(value:Boolean):void
		{
			m_sIsSelected = value;
		}
		
		public function get Fee():String
		{
			return m_sFee;
		}
		
		public function set Fee(value:String):void
		{
			
			m_sFee = Number(value).toFixed(2).toString();
		}
		
		public function get WRSTypeId():String
		{
			return m_sWRSTypeId;
		}
		
		public function set WRSTypeId(value:String):void
		{
			m_sWRSTypeId = value;
		}
		
		public function get ServiceDescription():String
		{
			return m_sServiceDescription;
		}
		
		public function set ServiceDescription(value:String):void
		{
			m_sServiceDescription = value;
		}
		
		public function WorkRelatedServiceDTO()
		{
		}
	}
}