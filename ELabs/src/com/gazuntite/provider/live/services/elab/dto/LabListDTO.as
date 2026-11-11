package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class LabListDTO
	{
		private var m_oLabs:ArrayCollection;

		public function LabListDTO()
		{
			Labs = new ArrayCollection();
		}
		
		public function get Labs():ArrayCollection
		{
			return m_oLabs;
		}

		public function set Labs(value:ArrayCollection):void
		{
			m_oLabs = value;
		}
		
		public function getListIDsXML(value:Array):XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "ArrayOfString" );
			if( value )
			{
				var i:int;
				for( i = 0; i < value.length; i++ )
				{
					var lab:ELabDTO = Labs.getItemAt( i ) as ELabDTO;
					xml.appendChild(new XML("<string>"+lab.ID+"</string>"));
				}
			}
			return xml
		}
		
		public function FromXML(x:XML):void
		{
			var xLabs:XMLList = x.Labs.Lab ;
			var i:int = 0;
			for( i = 0; i < xLabs.length(); i++ )
			{
				var lab:ELabDTO = new ELabDTO();
				lab.FromXML( xLabs[i] );
				Labs.addItem( lab );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Labs" );
			var i:int = 0;
			for( i = 0; i < Labs.length; i++ )
			{
				var lab:ELabDTO = Labs.getItemAt( i ) as ELabDTO;
				xml.appendChild( lab.ToXML() );
			}
			
			return xml;
		}

	}
}