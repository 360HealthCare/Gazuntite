package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class LabOutTestTypeDTO extends GeneralTypeDTO
	{
		private var _labnatureCode :String;

		public function get labnatureCode():String
		{
			return _labnatureCode;
		}

		public function set labnatureCode(value:String):void
		{
			_labnatureCode = value;
		}
		
		
		public function LabOutTestTypeDTO()
		{
		}
		

		public override function ToXML():XML
		{
			//nodeName = "LabNatureResponse";
			var x:XML = super.ToXML();
			
			x.@["Code"] = this.labnatureCode;

			
			return x;
			
		}
		
		public override function FromXML( x:XML ):void
		{
			ID 								= x.@["ID"];
			Name 							= x.@["Name"];
			labnatureCode 					= x.@["Code"]
			
		
		}
	}
}