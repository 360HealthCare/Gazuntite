package com.gazuntite.input.view.viewmodel.tempmodel
{
	[Bindable]
	public class TempBasicItemModel
	{
		protected static var count:Number = 0;
		public var id:Number = 0;
		public var label:String = "";
		public var isNew:Boolean = false;
		public var showtimer:Boolean = false;
		
		public function TempBasicItemModel(labelValue:String = "", isNewValue:Boolean = false)
		{
			label = labelValue;
			isNew = isNewValue;
			count ++;
			id = count;
		}
	}
}