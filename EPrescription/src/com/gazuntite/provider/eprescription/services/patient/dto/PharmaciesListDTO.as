package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PharmaciesListDTO
	{
		private var m_Pharmacies:ArrayCollection;

		public function PharmaciesListDTO()
		{
			Pharmacies = new ArrayCollection();
		}
		
		public function get Pharmacies():ArrayCollection
		{
			return m_Pharmacies;
		}

		public function set Pharmacies(value:ArrayCollection):void
		{
			m_Pharmacies = value;
		}
		
		/*public function getListIDsXML(value:Array):XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "ArrayOfString" );
			if( value )
			{
				var i:int;
				for( i = 0; i < value.length; i++ )
				{
					var lab:LabDTO = Labs.getItemAt( i ) as LabDTO;
					xml.appendChild(new XML("<string>"+lab.ID+"</string>"));
				}
			}
			return xml
		}*/
		
		public function FromXML(x:XML):void
		{
			var xLabs:XMLList = x.Pharmacy;
			var i:int = 0;
			for( i = 0; i < xLabs.length(); i++ )
			{
				var ph:PharmaciesResult = new PharmaciesResult();
				ph.FromXML( xLabs[i] );
				Pharmacies.addItem( ph );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Pharmacy" );
			var i:int = 0;
			for( i = 0; i < Pharmacies.length; i++ )
			{
				var lab:PharmaciesResult = Pharmacies.getItemAt( i ) as PharmaciesResult;
				xml.appendChild( lab.ToXML() );
			}
			
			return xml;
		}

	}
}