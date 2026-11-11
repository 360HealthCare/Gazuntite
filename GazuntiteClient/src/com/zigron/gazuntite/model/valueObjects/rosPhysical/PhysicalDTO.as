package com.zigron.gazuntite.model.valueObjects.rosPhysical
{
	public class PhysicalDTO extends ROSPhysicalBaseDTO
	{
		public function PhysicalDTO()
		{
			super();
		}
		
		public function get PhysicalSubLevel3CategoryTypeID():int
		{
			return super.SubLevel3CategoryTypeID;
		}
		
		public function set PhysicalSubLevel3CategoryTypeID(value:int):void
		{
			super.SubLevel3CategoryTypeID = value;
		}
		
		public function get PhysicalSubCategoryTypeID():int
		{
			return super.SubCategoryTypeID;
		}
		
		public function set PhysicalSubCategoryTypeID(value:int):void
		{
			super.SubCategoryTypeID = value;
		}
		
		public function get PhysicalMainCategoryTypeID():int
		{
			return super.MainCategoryTypeID;
		}
		
		public function set PhysicalMainCategoryTypeID(value:int):void
		{
			super.MainCategoryTypeID = value;
		}
		
		public function get PhysicalSubLevel3CategoryName():String
		{
			return super.SubLevel3CategoryName;
		}
		
		public function set PhysicalSubLevel3CategoryName(value:String):void
		{
			super.SubLevel3CategoryName = value;
		}
		
	}
}