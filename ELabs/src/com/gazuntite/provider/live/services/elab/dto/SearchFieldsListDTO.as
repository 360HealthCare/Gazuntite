package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SearchFieldsListDTO
	{
		private var m_acFields:ArrayCollection;
		
		public function SearchFieldsListDTO()
		{
			m_acFields = new ArrayCollection();
		}
		
		public function get Fields():ArrayCollection
		{
			return m_acFields;
		}
		
		public function set Fields(value:ArrayCollection):void
		{
			m_acFields = value;
		}

		public function FromXML(x:XML):void
		{
			var xFields:XMLList = x.List.Field;
			var i:int;
			for (i=0; i<xFields.length(); i++)
			{
				var f:SearchFieldsDTO = new SearchFieldsDTO();
				f.FromXML( xFields[i] );
				Fields.addItem( f );
			}
			
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Fields" );
			var i:int;
			for (i=0; i<Fields.length; i++)
			{
				var f:SearchFieldsDTO = Fields.getItemAt(i) as SearchFieldsDTO;
				xml.appendChild( f.ToXML() );
			}
			
			return xml;
		}

	}
}