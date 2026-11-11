package com.zigron.gazuntite.model.valueObjects.rapidAccess
{
	[Bindable]
	public class QuickLinksAllDTO
	{
		public function QuickLinksAllDTO()
		{
		}
		
		private var _QuickLinkTypeID:int;
		private var _QuickLinkName:String;
		private var _isSelected:Boolean = false;

		
		public function FromXml(x:XML):void
		{
			QuickLinkTypeID					= x.@QuickLinkTypeID;
			QuickLinkName					= x.@QuickLinkName;
		}
		
		
		public function get QuickLinkTypeID():int
		{
			return _QuickLinkTypeID;
		}

		public function set QuickLinkTypeID(value:int):void
		{
			_QuickLinkTypeID = value;
		}

		public function get QuickLinkName():String
		{
			return _QuickLinkName;
		}

		public function set QuickLinkName(value:String):void
		{
			_QuickLinkName = value;
		}

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}


	}
}