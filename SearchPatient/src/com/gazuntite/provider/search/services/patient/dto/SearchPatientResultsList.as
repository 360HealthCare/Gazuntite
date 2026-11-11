package com.gazuntite.provider.search.services.patient.dto
{
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SearchPatientResultsList
	{
		private var m_oPatients:ArrayCollection;
		
		public function SearchPatientResultsList()
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
		
		public function FromArrayCollection(collection:ArrayCollection):void
		{
			var i:int = 0;
			for( i = 0; i < collection.length; i++ )
			{
				var p:PatientDTO = new PatientDTO();
				p.FromObject( collection.getItemAt( i ) );
				Patients.addItem( p );
			}
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
			var xml:XML = XmlUtils.getNodeByTagName( "Patient" );
			var i:int = 0;
			for( i = 0; i < Patients.length; i++ )
			{
				var p:PatientDTO = Patients.getItemAt( i ) as PatientDTO;
				xml.appendChild( p.ToXML() );
			}
			
			return xml;
		}
	}
}