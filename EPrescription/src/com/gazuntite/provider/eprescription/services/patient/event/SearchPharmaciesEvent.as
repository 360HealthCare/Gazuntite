package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class SearchPharmaciesEvent extends CairngormEvent
	{
		public var pageNo : int = 0;
		public var npcid:String;
		public var Name:String;
		public var address:String;
		public var zipcode:String;
		public var state:String;
		public var city:String;
		public var phone:String;
		public var fax:String;
		public var serviceLevel:int;
		public var changelevel:String;
		public var activated:Boolean;
		public var callBack:Function;
		
		//SearchPharmacies/{StartNumber}/{NPCID}/{name}/{address}/{zipcode}/{state}/{city}/{phone}/{Fax}/{servicelevel}/{Changelevel}/{Activated}
		public function SearchPharmaciesEvent(pageNo:int, npcid:String, Name:String, address:String, zipcode:String, state:String, city:String, phone:String, fax:String, serviceLevel:int,  changelevel:String, activated:Boolean,callBack:Function)
		{
			super(EPrescriptionController.LOAD_PHARMACY_INFO);		
			
			this.pageNo 		= pageNo;
			this.npcid 			= npcid;
			this.Name 			= Name;
			this.address 		= address;
			this.zipcode 		= zipcode;
			this.state 			= state;
			this.city 			= city;
			this.phone			= phone;
			this.fax			= fax;
			this.serviceLevel 	= serviceLevel;
			this.changelevel 	= changelevel;
			this.activated 		= activated;
			this.callBack 		= callBack;
		}
	}
}