package com.gazuntite.provider.live.services.scheduler.dto.staticData
{
	import com.gazuntite.provider.live.services.scheduler.dto.TypeDTO;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class StaticDataDTO
	{
		private var m_acAppointmentTypesList:ArrayCollection;
		private var m_acAppointmentRequestStatusList:ArrayCollection;
		private var m_acAppointmentCurrentStatusList:ArrayCollection;
		private var m_acSearchFieldTypeList:ArrayCollection;
		private var m_acProviderByClinicIDList:ArrayCollection;
		private var m_acStationsByClinicIDList:ArrayCollection;

		public function StaticDataDTO()
		{
			m_acAppointmentTypesList 			 = new ArrayCollection();
			m_acAppointmentRequestStatusList     = new ArrayCollection();
			m_acAppointmentCurrentStatusList     = new ArrayCollection();
			m_acSearchFieldTypeList    			 = new ArrayCollection();
			m_acProviderByClinicIDList           = new ArrayCollection();
			m_acStationsByClinicIDList           = new ArrayCollection();
		}
		
//   XML Parser Methods that parse service result and assign to appropiate DTO's
		public function FromXML( x:XML ):void
		{
			switch( x.localName())
			{
				case 'Types':
					var xTypeList:XMLList = x.Type;
					if( xTypeList.length() > 0 )AppointmentTypesList = new ArrayCollection();
					
					for( var i:int = 0; i < xTypeList.length(); i ++ )
					{
						var atype:TypeDTO = new TypeDTO();
						atype.FromXML( xTypeList[i] );
						AppointmentTypesList.addItem( atype );
					}
					break;
				case 'Statuses':
					var xStatusList:XMLList = x.Status;
					if( xStatusList.length() > 0 )AppointmentRequestStatusList = new ArrayCollection();
					
					for( var j:int = 0; j < xStatusList.length(); j ++ )
					{
						var aStatus:RequestTypeDTO = new RequestTypeDTO();
						aStatus.FromXML( xStatusList[j] );
						AppointmentRequestStatusList.addItem( aStatus );
					}
					break;	
				case 'Actions':
					var xActionsList:XMLList = x.Action;
					if( xActionsList.length() > 0 )	AppointmentCurrentStatusList = new ArrayCollection();
					
					for( var k:int = 0; k < xActionsList.length(); k ++ )
					{
						var aAction:CurrentTypeDTO = new CurrentTypeDTO();
						aAction.FromXML( xActionsList[k] );
						AppointmentCurrentStatusList.addItem( aAction );
					}
					break;
				case 'Seraches':
					var xSearchFieldList:XMLList = x.Search;
					if( xSearchFieldList.length() > 0 )SearchFieldTypeList = new ArrayCollection();
					
					for( var l:int = 0; l < xSearchFieldList.length(); l ++ )
					{
						var aSearchField:SearchTypeDTO = new SearchTypeDTO();
						aSearchField.FromXML( xSearchFieldList[l] );
						SearchFieldTypeList.addItem( aSearchField );
					}
					break;
				case 'Providers':
					var xProviderClinicIDList:XMLList = x.Provider;
					if( xProviderClinicIDList.length() > 0 )ProviderByClinicIDList = new ArrayCollection();
					

					for( var m:int = 0; m < xProviderClinicIDList.length(); m++ )
					{
						var aProviderList:ProviderDTO = new ProviderDTO();
						aProviderList.FromXML( xProviderClinicIDList[m] );
						ProviderByClinicIDList.addItem( aProviderList );
					}
					break;
				case 'Stations':
					if(StationsByClinicIDList)
						StationsByClinicIDList.removeAll();
					
					StationsByClinicIDList = new ArrayCollection();
					
					var xStationClinicIDList:XMLList = x.Station;
					if( xStationClinicIDList.length() > 0 )StationsByClinicIDList = new ArrayCollection();
					
					for( var n:int = 0; n < xStationClinicIDList.length(); n++ )
					{
						var aSationsList:StationsDTO = new StationsDTO();
						aSationsList.FromXML( xStationClinicIDList[n] );
						StationsByClinicIDList.addItem( aSationsList );
					}
					break;
				default:
					break;
					
			}
		}
		
// ############################## Getter + Setter #####################################################		
		public function get AppointmentTypesList():ArrayCollection
		{
			return m_acAppointmentTypesList;
		}
		
		public function set AppointmentTypesList(value:ArrayCollection):void
		{
			m_acAppointmentTypesList = value;
			trace("seting AppointmentTypesList: length", value.length)
		}
		public function get AppointmentRequestStatusList():ArrayCollection
		{
			return m_acAppointmentRequestStatusList;
		}
		
		public function set AppointmentRequestStatusList(value:ArrayCollection):void
		{
			m_acAppointmentRequestStatusList = value;
		}
		public function get AppointmentCurrentStatusList():ArrayCollection
		{
			return m_acAppointmentCurrentStatusList;
		}
		
		public function set AppointmentCurrentStatusList(value:ArrayCollection):void
		{
			m_acAppointmentCurrentStatusList = value;
		}
		public function get SearchFieldTypeList():ArrayCollection
		{
			return m_acSearchFieldTypeList;
		}
		
		public function set SearchFieldTypeList(value:ArrayCollection):void
		{
			m_acSearchFieldTypeList = value;
		}
		public function get ProviderByClinicIDList():ArrayCollection
		{
			return m_acProviderByClinicIDList;
		}
		
		public function set ProviderByClinicIDList(value:ArrayCollection):void
		{
			m_acProviderByClinicIDList = value;
		}
		public function get StationsByClinicIDList():ArrayCollection
		{
			return m_acStationsByClinicIDList;
		}
		
		public function set StationsByClinicIDList(value:ArrayCollection):void
		{
			m_acStationsByClinicIDList = value;
		}
	}
}