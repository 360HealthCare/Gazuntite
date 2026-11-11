package com.gazuntite.provider.eprescription.services.patient.dto
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ResponseDTO
	{
		private var m_Pharmacies:ArrayCollection;
		
		private var _SubscribeUserResponse:XML; 
		
		
		public function ResponseDTO()
		{
		}
		
		
		public function get SubscribeUserResponse():XML
		{
			return _SubscribeUserResponse;
		}
		
		public function set SubscribeUserResponse(value:XML):void
		{
			_SubscribeUserResponse = value;
		}
		

		public function ServiceLevelDTO()
		{
			ServiceLevels = new ArrayCollection();
		}
		
		

		public function get ServiceLevels():ArrayCollection
		{
			return m_Pharmacies;
		}

		public function set ServiceLevels(value:ArrayCollection):void
		{
			m_Pharmacies = value;
		}
		
		
		/*public function FromXML(x:XML):void
		{
			
			trace("ServiceLevelDTO --"+x.toString());
			var xLabs:XMLList = x.ServiceLevelCodes.ServiceLevel;
			var i:int = 0;
			for( i = 0; i < xLabs.length(); i++ )
			{
				trace("zzzz "+xLabs[i]);
				var ph:ServiceLevelResult = new ServiceLevelResult();
				ph.FromXML( xLabs[i] );
				ServiceLevels.addItem( ph );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "ServiceLevelCodes" );
			var i:int = 0;
			for( i = 0; i < ServiceLevels.length; i++ )
			{
				var lab:ServiceLevelResult = ServiceLevels.getItemAt( i ) as ServiceLevelResult;
				xml.appendChild( lab.ToXML() );
			}
			
			return xml;
		}*/

	}
}