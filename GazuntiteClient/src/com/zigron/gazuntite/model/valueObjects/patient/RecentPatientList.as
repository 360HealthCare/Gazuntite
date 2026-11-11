package com.zigron.gazuntite.model.valueObjects.patient
{
	import com.gazuntite.common.dto.PatientDTO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class RecentPatientList
	{
		private var _AllPatients:ArrayCollection;
		
		public function RecentPatientList()
		{
			_AllPatients = new ArrayCollection();
		}
		
		public function get ListAll():ArrayCollection
		{
			return _AllPatients;
		}
		
		public function set ListAll(value:ArrayCollection):void
		{
			_AllPatients = value;
		}
		
		public function FromXML(x:XML):void
		{
			var xlist:XMLList = x.MostRecentPatientsResponseData.RecentPatientList.RecentPatientDTO;
			_AllPatients.removeAll();
			var i:int = 0;
			var dto:PatientDTO;
			
			for( i = 0; i < xlist.length(); i++ )
			{
				dto = new PatientDTO();
				dto.FromXML( xlist[i]);
				_AllPatients.addItem( dto );
			}
		}

		
		
		
		
		public static const recentPatientsXML :XML = <RecentPatientResponse ErrorCode="" ErrorDetails="" ResponseCode="" ResponseMessage="" ResponseStatus="true" ResponseWarning="">
			<MostRecentPatientsResponseData FirstRecord="1" LastRecord="5" TotalRecords="5">
				<RecentPatientList>
				  <RecentPatientDTO ID="48241" FirstName="Lilly" LastName="Potter" MiddleName="James" DOB="1989-07-30" SSN="456-78-7656" QuivusID="Ga-043619" UserID="48344" Gender="Female" IsSnailAvailable="false" IsSMSAvalable="false" IsPhoneAvailable="false" IsEmailAvailable="false" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2012-04-13T00:00:00" RecGuid="C6A5A478-1C7E-4217-A265-427919AF771E" GAXENID="GXP-122"/>
				  <RecentPatientDTO ID="42923" FirstName="Marie" LastName="Acuri" MiddleName="D" DOB="1982-01-02" SSN="" QuivusID="Ga-040789" UserID="43010" Gender="Female" IsSnailAvailable="false" IsSMSAvalable="true" IsPhoneAvailable="false" IsEmailAvailable="true" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2011-10-22T00:00:00" RecGuid="C019943D-6A64-47CC-82E5-4E662ED67DEC" GAXENID=""/>
				  <RecentPatientDTO ID="42924" FirstName="Jessica" LastName="Web" MiddleName="" DOB="1982-09-13" SSN="" QuivusID="Ga-040790" UserID="43011" Gender="Female" IsSnailAvailable="false" IsSMSAvalable="true" IsPhoneAvailable="false" IsEmailAvailable="false" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2011-10-22T00:00:00" RecGuid="4E39729C-4559-4B9D-AB7A-AAD8DD0CD28B" GAXENID=""/>
				  <RecentPatientDTO ID="42940" FirstName="Shah" LastName="G" MiddleName="" DOB="2011-06-10" SSN="123-12-1234" QuivusID="Ga-040806" UserID="43027" Gender="Male" IsSnailAvailable="false" IsSMSAvalable="false" IsPhoneAvailable="false" IsEmailAvailable="true" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2011-22-01T00:00:00" RecGuid="C028A4F8-FFA4-4AB0-B1AF-7B62AC487E73" GAXENID=""/>
				  <RecentPatientDTO ID="42977" FirstName="Jane" LastName="Johnson" MiddleName="N" DOB="2011-10-03" SSN="" QuivusID="Ga-040843" UserID="43065" Gender="Female" IsSnailAvailable="false" IsSMSAvalable="false" IsPhoneAvailable="false" IsEmailAvailable="true" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2011-10-24T00:00:00" RecGuid="D517499D-B53A-40FD-8882-44E241235F65" GAXENID=""/>
				  <RecentPatientDTO ID="42992" FirstName="Marie" LastName="Test" MiddleName="" DOB="1982-11-21" SSN="" QuivusID="Ga-040858" UserID="43083" Gender="Female" IsSnailAvailable="false" IsSMSAvalable="false" IsPhoneAvailable="false" IsEmailAvailable="false" IsChatAvailable="false" IsAuthorized="true" CreatedAt="2011-11-25T00:00:00" RecGuid="1D7241FC-C919-43CE-B592-F51A92884D94" GAXENID=""/>
				</RecentPatientList>
		    </MostRecentPatientsResponseData>
		</RecentPatientResponse>
	}
}