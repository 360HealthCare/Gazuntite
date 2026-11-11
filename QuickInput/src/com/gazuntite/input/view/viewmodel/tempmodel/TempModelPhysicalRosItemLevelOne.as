package com.gazuntite.input.view.viewmodel.tempmodel
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class TempModelPhysicalRosItemLevelOne
	{
		public var label:String;
		public var isHeent:Boolean = false;
		public var itemList:ArrayCollection = new ArrayCollection(); // list of level 2 items
		public function TempModelPhysicalRosItemLevelOne()
		{
		}
		
	}
}