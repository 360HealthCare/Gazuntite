package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	
	
	[Bindable]
	public class FamilyHistoryTypeDTO extends GeneralTypeDTO
	{
		public function FamilyHistoryTypeDTO()
		{
			super();
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML( x );
			this.label = x.@Description;
		}
	}
}