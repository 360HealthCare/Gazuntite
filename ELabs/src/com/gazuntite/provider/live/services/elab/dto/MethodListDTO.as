package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class MethodListDTO
	{
		private var m_acMethods:ArrayCollection;
		
		public function MethodListDTO()
		{
			m_acMethods = new ArrayCollection();
		}
		
		public function get Methods():ArrayCollection
		{
			return m_acMethods;
		}
		
		public function set Methods(value:ArrayCollection):void
		{
			m_acMethods = value;
		}
		
		public function FromXML(x:XML):void
		{
			var xMethods:XMLList = x.Method ;
			var i:int;
			for ( i = 0; i < xMethods.length(); i++ )
			{
				var m:MethodDTO = new MethodDTO();
				m.FromXML( xMethods[i] );
				Methods.addItem( m );
			}
			
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Methods" );
			var i:int;
			for (i=0; i<Methods.length; i++)
			{
				var m:MethodDTO = Methods.getItemAt(i) as MethodDTO;
				xml.appendChild( m.ToXML() );
			}
			
			return xml;
		}
	}
}