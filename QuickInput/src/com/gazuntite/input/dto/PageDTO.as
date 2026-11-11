package com.gazuntite.input.dto
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	import com.greensock.plugins.EndArrayPlugin;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PageDTO
	{
		private var _isDeleted:Boolean;
		private var _isDirty:Boolean;
		private var _totalRecords:int;
		private var _fromDate:Date;
		private var _toDate:Date;
		private var _pageSize:int;
		private var _pageNumber:int;
		private var _lastVisitNumber:int;
		private var _error:String;
		private var _startDataNumber:int;
		private var _endDataCount:int;
		private var _returnDataCount:int;
		private var _stationIDs:ArrayCollection;
		
		public function PageDTO()
		{
			isDeleted = false;
			isDirty = false;
			totalRecords = 0;
			fromDate = QSConstants.NULL_DATE;
			toDate = QSConstants.NULL_DATE;
			pageSize = 1000;
			pageNumber = 1;
			lastVisitNumber = 0;
			error = "";
			startDataNumber = 0;
			endDataCount = 0;
			returnDataCount = 0;
			
			stationIDs = new ArrayCollection();
		}

		public function toXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PageDTO");
			
			x.@IsDeleted = isDeleted;
			x.@IsDirty = isDirty;
			x.@TotalRecords = totalRecords;
			x.@fromDate = UtilityFunctions.FormatDate(fromDate, "MM-DD-YYYY");
			x.@toDate = UtilityFunctions.FormatDate(toDate, "MM-DD-YYYY");
			x.@pageSize = pageSize;
			x.@pageNumber = pageNumber;
			x.@LastVisitNumber = lastVisitNumber;
			x.@Error = error;
			x.@StartDataNumber = startDataNumber;
			x.@EndDataCount = endDataCount;
			x.@ReturnDataCount = returnDataCount;
			
			for each (var id:int in stationIDs)
			{
				x.appendChild(XmlUtils.getNodeWithData(String(id), "stationIDs"));
			}
			
			return x;
		}
		
		public function fromXML(x:XML):void
		{
			var dateStr:String = "";
			
			isDeleted = x.@IsDeleted;
			isDirty = x.@IsDirty;
			totalRecords = x.@TotalRecords;
			
			dateStr = x.@fromDate;
			fromDate = UtilityFunctions.toDate(dateStr);
			
			dateStr = x.@toDate;
			toDate = UtilityFunctions.toDate(dateStr);
			
			pageSize = x.@pageSize;
			pageNumber = x.@pageNumber;
			lastVisitNumber =x.@LastVisitNumber;
			error = x.@Error;
			startDataNumber = x.@StartDataNumber;
			endDataCount = x.@EndDataCount;
			returnDataCount = x.@ReturnDataCount;
			
			stationIDs = new ArrayCollection();
			
			var xList:XMLList = x.children();
			
			for each( var node:XML in xList)
			{
				stationIDs.addItem(int(node.toString()));
			}
		}
		
		public function get isDeleted():Boolean
		{
			return _isDeleted;
		}

		public function set isDeleted(value:Boolean):void
		{
			_isDeleted = value;
		}

		public function get isDirty():Boolean
		{
			return _isDirty;
		}

		public function set isDirty(value:Boolean):void
		{
			_isDirty = value;
		}

		public function get totalRecords():int
		{
			return _totalRecords;
		}
		
		public function set totalRecords(value:int):void
		{
			_totalRecords = value;
		}
		
		public function get fromDate():Date
		{
			return _fromDate;
		}
		
		public function set fromDate(value:Date):void
		{
			_fromDate = value;
		}
		
		public function get toDate():Date
		{
			return _toDate;
		}
		
		public function set toDate(value:Date):void
		{
			_toDate = value;
		}
		
		public function get pageSize():int
		{
			return _pageSize;
		}
		
		public function set pageSize(value:int):void
		{
			_pageSize = value;
		}
		
		public function get pageNumber():int
		{
			return _pageNumber;
		}
		
		public function set pageNumber(value:int):void
		{
			_pageNumber = value;
		}
		
		public function get lastVisitNumber():int
		{
			return _lastVisitNumber;
		}
		
		public function set lastVisitNumber(value:int):void
		{
			_lastVisitNumber = value;
		}
		
		public function get error():String
		{
			return _error;
		}
		
		public function set error(value:String):void
		{
			_error = value;
		}
		
		public function get startDataNumber():int
		{
			return _startDataNumber;
		}
		
		public function set startDataNumber(value:int):void
		{
			_startDataNumber = value;
		}
		
		public function get endDataCount():int
		{
			return _endDataCount;
		}

		public function set endDataCount(value:int):void
		{
			_endDataCount = value;
		}

		public function get returnDataCount():int
		{
			return _returnDataCount;
		}

		public function set returnDataCount(value:int):void
		{
			_returnDataCount = value;
		}

		public function get stationIDs():ArrayCollection
		{
			return _stationIDs;
		}

		public function set stationIDs(value:ArrayCollection):void
		{
			_stationIDs = value;
		}
	}
}