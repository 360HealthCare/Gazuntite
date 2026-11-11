package com.gazuntite.patient.visit.dto.ch
{
	import com.gazuntite.common.dto.common.GeneralTypeDTO;
	
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