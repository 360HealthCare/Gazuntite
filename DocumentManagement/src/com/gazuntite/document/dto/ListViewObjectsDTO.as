package com.gazuntite.document.dto
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ListViewObjectsDTO
	{
		private var _Heading:String;
		public var DTOCollection:ArrayCollection;
		public function ListViewObjectsDTO()
		{
			DTOCollection = new ArrayCollection();
		}

		public function get Heading():String
		{
			return _Heading;
		}

		public function set Heading(value:String):void
		{
			_Heading = value;
		}

	}
}