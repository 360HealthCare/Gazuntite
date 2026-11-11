package com.gazuntite.history.dto
{
	import mx.collections.ArrayCollection;

	public class HistoryListDTO
	{
		
		private var _Date:String;
		public var DTOCollection:ArrayCollection = new ArrayCollection();
		
		public function HistoryListDTO()
		{
			
		}

		public function get Date():String
		{
			return _Date;
		}

		public function set Date(value:String):void
		{
			_Date = value;
		}
		
		public function FromXML(xList:XMLList ,ClassType:Class, Date:String):void
		{
			this.Date = Date;
			for(var i:int= 0 ; i < xList.length() ; i++)
			{
				var x :XML = xList[i];
				var obj:* = new ClassType();
				//var innerXml:XMLList = x.HistoryData;
				obj.FromXML(x);
				DTOCollection.addItem(obj);
			}
			
		}

	}
}