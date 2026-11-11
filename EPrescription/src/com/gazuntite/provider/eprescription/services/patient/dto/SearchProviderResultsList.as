package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.provider.eprescription.services.patient.util.XmlUtils;
	
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	[Bindable]
	public class SearchProviderResultsList
	{
		private var _providers:ArrayCollection;
		
		public function SearchProviderResultsList()
		{
			providers = new ArrayCollection();
		}

		public function get providers():ArrayCollection
		{
			return _providers;
		}

		public function set providers(value:ArrayCollection):void
		{
			_providers = value;
		}
		
		
		public function FromXML(x:XML):void
		{	
			var xmlDoc:XMLDocument = new XMLDocument(x);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			var i:int = 0;
			for( i = 0; i < resultObj.ArrayOfContactSearchDTO.ContactSearchDTO.length; i++ )
			{
				
				var p:providerdto=new providerdto();
				//p.FromXML( resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i] );
				p.UserId= resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].UserId;
				if(resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].FirstName != null)
				{
					p.FirstName 	= resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].FirstName;
					p.ProviderCompleteName = resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].FirstName;
				}
				else
					p.FirstName 	="";
				if(resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].MiddleName != null)
				{
					p.MiddleName 	= resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].MiddleName;
					p.ProviderCompleteName +=" "+ resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].MiddleName;
				}
				else
					p.MiddleName 	= "";
				if(resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].LastName != null)
				{
					p.LastName 	= resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].LastName;
					p.ProviderCompleteName +=" "+ resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].LastName;
				}
				else
					p.LastName 	="";
				if(resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].UserEmail != null)
				{
					p.UserEmail 	= resultObj.ArrayOfContactSearchDTO.ContactSearchDTO[i].UserEmail;
				}
				else
					p.UserEmail = "";
				//p.DOB 		= "";
				providers.addItem( p );
			}
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Labs" );
			var i:int = 0;
			for( i = 0; i < providers.length; i++ )
			{
				var p:providerdto  = providers.getItemAt( i ) as providerdto;
				xml.appendChild( p.ToXML());
			}
			
			return xml;
		}

	}
}