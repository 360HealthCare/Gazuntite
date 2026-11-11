package com.zigron.gazuntite.model.valueObjects.rosPhysical
{
	[Bindable]
	public class ROSDTO extends ROSPhysicalBaseDTO
	{
		
		public function ROSDTO()
		{
			super();
		}

		public function get ROSSubLevel3CategoryTypeID():int
		{
			return super.SubLevel3CategoryTypeID;
		}

		public function set ROSSubLevel3CategoryTypeID(value:int):void
		{
			super.SubLevel3CategoryTypeID = value;
		}

		public function get ROSSubCategoryTypeID():int
		{
			return super.SubCategoryTypeID;
		}

		public function set ROSSubCategoryTypeID(value:int):void
		{
			super.SubCategoryTypeID = value;
		}

		public function get ROSMainCategoryTypeID():int
		{
			return super.MainCategoryTypeID;
		}

		public function set ROSMainCategoryTypeID(value:int):void
		{
			super.MainCategoryTypeID = value;
		}

		public function get ROSSubLevel3CategoryName():String
		{
			return super.SubLevel3CategoryName;
		}

		public function set ROSSubLevel3CategoryName(value:String):void
		{
			super.SubLevel3CategoryName = value;
		}

	}
}