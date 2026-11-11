package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class CMS1500DTO
	{
		private var m_sCMSID:String;
		private var m_sClaimID:String;
		private var m_sBlock10A:String;
		private var m_sBlock10B:String;
		private var m_sBlockBStateCode:String;
		private var m_sBlock10C:String;
		private var m_sBlock16DateFrom:String;
		private var m_sBlock16DateTo:String;
		private var m_sBlock18DateFrom:String;
		private var m_sBlock18DateTo:String;
		private var m_sBlock20:String;
		private var m_sBlock20Charges:String;
		private var m_sBlock22:String;
		private var m_sBlock22RefNumber:String;
		private var m_sBlock24B:String;
		private var m_sBlock32:String;
		
		
		public function FromXML( x:XML ):void
		{
			CMSID 							= x.@[XmlConstants.CMSID];
			ClaimID 						= x.@[XmlConstants.CLAIMID];
			Block10A 						= x.@[XmlConstants.BLOCK10A];			
			Block10B 						= x.@[XmlConstants.BLOCK10B];
			BlockBStateCode 				= x.@[XmlConstants.BLOCKBSTATECODE];
			Block10C 						= x.@[XmlConstants.BLOCK10C];
			Block16DateFrom 				= x.@[XmlConstants.BLOCK16DATEFROM];
			Block16DateFrom					= UtilityFunctions.FormatDate(Block16DateFrom,"MM/DD/YYYY");
			Block16DateTo 					= x.@[XmlConstants.BLOCK16DATETO];
			Block16DateTo					= UtilityFunctions.FormatDate(Block16DateTo,"MM/DD/YYYY"); 
			Block18DateFrom 				= x.@[XmlConstants.BLOCK18DATEFROM];
			Block18DateFrom					= UtilityFunctions.FormatDate(Block18DateFrom,"MM/DD/YYYY");
			Block18DateTo 					= x.@[XmlConstants.BLOCK18DATETO];
			Block18DateTo					= UtilityFunctions.FormatDate(Block18DateTo,"MM/DD/YYYY");
			Block20 						= x.@[XmlConstants.BLOCK20];
			Block20Charges 					= x.@[XmlConstants.BLOCK20CHARGES];
			Block22 						= x.@[XmlConstants.BLOCK22];
			Block22RefNumber 				= x.@[XmlConstants.BLOCK22REFNUMBER];
			Block24B 						= x.@[XmlConstants.BLOCK24B];
			Block32 						= x.@[XmlConstants.BLOCK32];			
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "HCFA" );
			
			x.@[XmlConstants.CMSID]				= CMSID
			x.@[XmlConstants.CLAIMID]			= ClaimID				
			x.@[XmlConstants.BLOCK10A]			= Block10A
			x.@[XmlConstants.BLOCK10B]			= Block10B
			x.@[XmlConstants.BLOCKBSTATECODE]	= BlockBStateCode
			x.@[XmlConstants.BLOCK10C]			= Block10C
				if( UtilityFunctions.IsNullOrEmpty( Block16DateFrom ) )
					Block16DateFrom = UtilityFunctions.FormatDate(QSConstants.NULL_DATE);
			x.@[XmlConstants.BLOCK16DATEFROM]	= UtilityFunctions.FormatDate(Block16DateFrom);
			if( UtilityFunctions.IsNullOrEmpty( Block16DateTo ) )
				Block16DateTo = UtilityFunctions.FormatDate(QSConstants.NULL_DATE);
			x.@[XmlConstants.BLOCK16DATETO]		= UtilityFunctions.FormatDate(Block16DateTo);
			if( UtilityFunctions.IsNullOrEmpty( Block18DateFrom ) )
				Block18DateFrom = UtilityFunctions.FormatDate(QSConstants.NULL_DATE);
			x.@[XmlConstants.BLOCK18DATEFROM]	= UtilityFunctions.FormatDate(Block18DateFrom);
			if( UtilityFunctions.IsNullOrEmpty( Block18DateTo ) )
				Block18DateTo = UtilityFunctions.FormatDate(QSConstants.NULL_DATE);
			x.@[XmlConstants.BLOCK18DATETO]		= UtilityFunctions.FormatDate(Block18DateTo);
			x.@[XmlConstants.BLOCK20]			= Block20
			x.@[XmlConstants.BLOCK20CHARGES]	= Block20Charges
			x.@[XmlConstants.BLOCK22]			= Block22
			x.@[XmlConstants.BLOCK22REFNUMBER]	= Block22RefNumber
			x.@[XmlConstants.BLOCK24B]			= Block24B
			x.@[XmlConstants.BLOCK32]			= Block32
				
			return x;
			
		}
		
		public function get Block10C():String
		{
			return m_sBlock10C;
		}
		public function set Block10C(value:String):void
		{
			m_sBlock10C = value;
		}
		
		public function get Block32():String
		{
			return m_sBlock32;
		}
		public function set Block32(value:String):void
		{
			m_sBlock32 = value;
		}
		
		public function get Block24B():String
		{
			return m_sBlock24B;
		}
		public function set Block24B(value:String):void
		{
			m_sBlock24B = value;
		}
		
		public function get Block22RefNumber():String
		{
			return m_sBlock22RefNumber;
		}
		public function set Block22RefNumber(value:String):void
		{
			m_sBlock22RefNumber = value;
		}
		
		public function get Block22():String
		{
			return m_sBlock22;
		}
		public function set Block22(value:String):void
		{
			m_sBlock22 = value;
		}
		
		public function get Block20Charges():String
		{
			return m_sBlock20Charges;
		}
		public function set Block20Charges(value:String):void
		{
			m_sBlock20Charges = value;
		}
		
		public function get Block20():String
		{
			return m_sBlock20;
		}
		public function set Block20(value:String):void
		{
			m_sBlock20 = value;
		}
		
		public function get Block18DateTo():String
		{
			return m_sBlock18DateTo;
		}
		public function set Block18DateTo(value:String):void
		{
			m_sBlock18DateTo = value.substr(0,10);
		}
		
		public function get Block18DateFrom():String
		{
			return m_sBlock18DateFrom;
		}
		public function set Block18DateFrom(value:String):void
		{
			m_sBlock18DateFrom = value.substr(0,10);
		}
		
		public function get Block16DateTo():String
		{
			return m_sBlock16DateTo;
		}
		public function set Block16DateTo(value:String):void
		{
			m_sBlock16DateTo = value.substr(0,10);
		}
		
		public function get Block16DateFrom():String
		{
			return m_sBlock16DateFrom;
		}
		public function set Block16DateFrom(value:String):void
		{
			m_sBlock16DateFrom = value.substr(0,10);
		}
		
		public function get BlockBStateCode():String
		{
			return m_sBlockBStateCode;
		}
		public function set BlockBStateCode(value:String):void
		{
			m_sBlockBStateCode = value;
		}
		
		public function get Block10B():String
		{
			return m_sBlock10B;
		}
		public function set Block10B(value:String):void
		{
			m_sBlock10B = value;
		}
		
		public function get Block10A():String
		{
			return m_sBlock10A;
		}
		public function set Block10A(value:String):void
		{
			m_sBlock10A = value;
		}
		
		public function get CMSID():String
		{
			return m_sCMSID;
		}
		public function set CMSID(value:String):void
		{
			m_sCMSID = value;
		}
		
		public function get ClaimID():String
		{
			return m_sClaimID;
		}
		public function set ClaimID(value:String):void
		{
			m_sClaimID = value;
		}
		
		public function CMS1500DTO()
		{
		}
	}
}