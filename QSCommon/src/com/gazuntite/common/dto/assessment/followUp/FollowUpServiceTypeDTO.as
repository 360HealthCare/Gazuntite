package com.gazuntite.common.dto.assessment.followUp
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class FollowUpServiceTypeDTO
	{
		
		private var _id:int; 
		private var _cliniciBranchID:int; 
		private var _followUpService:String;
		
		public function FollowUpServiceTypeDTO()
		{
		}
		
		public function get followUpService():String
		{
			return _followUpService;
		}

		public function set followUpService(value:String):void
		{
			_followUpService = value;
		}

		public function get cliniciBranchID():int
		{
			return _cliniciBranchID;
		}

		public function set cliniciBranchID(value:int):void
		{
			_cliniciBranchID = value;
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("objServiceTypeDTO");
			
			x.@["ID"] = this.id;
			x.@["ClinicBranchID"] = this.cliniciBranchID;
			x.@["FollowupService"] = this.followUpService;
			
			return x;
		}
		
		public function FromXML( x:XML ):void
		{
			id = x.@["ID"];
			cliniciBranchID = x.@["ClinicBranchID"];
			followUpService = x.@["FollowupService"];
		}
	}
}