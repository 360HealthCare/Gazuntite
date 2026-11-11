package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class LaboratoryListDTO
	{
		private var m_acLaboratories:ArrayCollection;
		
		public function LaboratoryListDTO()
		{
			m_acLaboratories = new ArrayCollection();
		}
		
		public function get Laboratories():ArrayCollection
		{
			return m_acLaboratories;
		}
		
		public function set Laboratories(value:ArrayCollection):void
		{
			m_acLaboratories = value;
		}
		
		public function FromXML(x:XML):void
		{
			var xLaboratories:XMLList = x.Laboratory ;
			var i:int;
			for ( i = 0; i < xLaboratories.length(); i++ )
			{
				var l:LabTypeDTO = new LabTypeDTO();
				l.FromXML( xLaboratories[i] );
				Laboratories.addItem( l );
			}
			
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Labs" );
			var i:int;
			for (i=0; i<Laboratories.length; i++)
			{
				var l:LabTypeDTO = Laboratories.getItemAt(i) as LabTypeDTO;
				xml.appendChild( l.ToXML() );
			}
			
			return xml;
		}
	}
}