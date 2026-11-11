package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SubscribePatientList
	{
		private var m_oPatients:ArrayCollection;
		
		private var m_oPatientXml:XML;
		
		public function get PatientXml():XML
		{
			return m_oPatientXml;
		}
		
		public function set PatientXml(value:XML):void
		{
			m_oPatientXml = value;
		}
		
		public function SubscribePatientList()
		{
			Patients = new ArrayCollection();
		}
		
		

		public function get Patients():ArrayCollection
		{
			return m_oPatients;
		}
		
		public function set Patients(value:ArrayCollection):void
		{
			m_oPatients = value;
		}
		
		public function FromXML(x:XML):void
		{
			var xPatients:XMLList = x.Patients.Patient ;
			var i:int = 0;
			for( i = 0; i < xPatients.length(); i++ )
			{
				var p:PatientDTO = new PatientDTO();
				p.FromXML( xPatients[i] );
				Patients.addItem( p );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Labs" );
			var i:int = 0;
			for( i = 0; i < Patients.length; i++ )
			{
				var p:PatientDTO = Patients.getItemAt( i ) as PatientDTO;
				xml.appendChild( p.ToXML() );
			}
			trace("XML "+xml);
			return xml;
		}
	}
}