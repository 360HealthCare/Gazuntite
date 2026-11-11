package com.gazuntite.common.dto.assessment.labOut
{
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	

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