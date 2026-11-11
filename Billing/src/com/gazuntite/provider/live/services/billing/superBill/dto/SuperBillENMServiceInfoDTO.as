package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class SuperBillENMServiceInfoDTO
	{
		private var m_sENMServiceID:String;
		private var m_sClaimID:String;
		private var m_sENMCodeTypeID:String;
		private var m_sFee:String;	
		private var m_sEncouterType:String;
		private var m_sCodeType:String;
		
		public function FromXML( x:XML ):void
		{
			ENMServiceID 					= x.@[XmlConstants.ENMSERVICEID];
			ClaimID 						= x.@[XmlConstants.CLAIMID];
			ENMCodeTypeID 					= x.@[XmlConstants.ENMCODETYPEID];			
			Fee 							= x.@[XmlConstants.FEE];
			EncouterType 					= x.@[XmlConstants.ENCOUNTERTYPE];
			CodeType 						= x.@[XmlConstants.ENMCODETYPE];
		}		
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "ENMService" );
			
			x.@[XmlConstants.ENMSERVICEID]  	= 	ENMServiceID;			
			x.@[XmlConstants.CLAIMID] 			=   ClaimID;
			x.@[XmlConstants.ENMCODETYPEID]		=   ENMCodeTypeID;
			x.@[XmlConstants.FEE]				=   Fee;
			x.@[XmlConstants.ENCOUNTERTYPE]		=	EncouterType;
			x.@[XmlConstants.ENMCODETYPE]		=	CodeType;
			
			return x;
		}
		
		public function get CodeType():String
		{
			return m_sCodeType;
		}
		
		public function set CodeType(value:String):void
		{
			m_sCodeType = value ;
		}
		
		public function get EncouterType():String
		{
			return m_sEncouterType;
		}
		
		public function set EncouterType(value:String):void
		{
			m_sEncouterType = value ;
		}
		
		public function get ENMServiceID():String
		{
			return m_sENMServiceID;
		}
		
		public function set ENMServiceID(value:String):void
		{
			m_sENMServiceID = value ;
		}
		
		public function get ClaimID():String
		{
			return m_sClaimID;
		}
		
		public function set ClaimID(value:String):void
		{
			m_sClaimID = value ;
		}
		
		public function get ENMCodeTypeID():String
		{
			return m_sENMCodeTypeID;
		}
		
		public function set ENMCodeTypeID(value:String):void
		{
			m_sENMCodeTypeID = value ;
		}
		
		public function get Fee():String
		{
			return m_sFee;
		}
		
		public function set Fee(value:String):void
		{
			m_sFee = value ;
		}
		
		public function SuperBillENMServiceInfoDTO()
		{
		}
	}
}