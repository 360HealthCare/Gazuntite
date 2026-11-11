package com.gazuntite.patient.visit.dto
{
	
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import com.gazuntite.patient.visit.dto.common.BaseDTO;

	[Bindable]
	public class ROSPhysicalBaseDTO extends BaseDTO
	{
		
		
		
		private var _IsAbNormal : String;
		private var _IsNormal : String;
		private var _label : String;
		private var _children : ArrayCollection;
		
		private var _MainCategoryName : String;
		private var _SubCategoryName : String;
		private var _SubLevel3CategoryName : String;
		
		private var _MainCategoryTypeID : int;
		private var _SubCategoryTypeID : int;
		private var _SubLevel3CategoryTypeID : int;
		
		public function ROSPhysicalBaseDTO()
		{
			//trace("ROSPhysicalBaseDTO contructor called");
			
			
			/*_IsAbNormal = "";
			_IsNormal = "";
			_NoteSubject = "";
			_Notes = "";*/
			//_label = "";
			
		}
		
		public function get children():ArrayCollection
		{
			return _children;
		}
		
		public function set children(value:ArrayCollection):void
		{
			_children = value;
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
		}
		
		public function get SubCategoryName():String
		{
			return _SubCategoryName;
		}
		
		public function set SubCategoryName(value:String):void
		{
			_SubCategoryName = value;
		}
		
		public function get SubLevel3CategoryName():String
		{
			return _SubLevel3CategoryName;
		}
		
		public function set SubLevel3CategoryName(value:String):void
		{
			_SubLevel3CategoryName = value;
		}
		
		
		
		public function get MainCategoryName():String
		{
			return _MainCategoryName;
		}
		
		public function set MainCategoryName(value:String):void
		{
			_MainCategoryName = value;
		}
		
		public function get IsNormal():String
		{
			return _IsNormal;
		}
		
		public function set IsNormal(value:String):void
		{
			_IsNormal = value;
		}
		
		public function get IsAbNormal():String
		{
			return _IsAbNormal;
		}
		
		public function set IsAbNormal(value:String):void
		{
			_IsAbNormal = value;
		}
		
		public function get SubLevel3CategoryTypeID():int
		{
			return _SubLevel3CategoryTypeID;
		}
		
		public function set SubLevel3CategoryTypeID(value:int):void
		{
			_SubLevel3CategoryTypeID = value;
		}
		
		public function get MainCategoryTypeID():int
		{
			return _MainCategoryTypeID;
		}
		
		public function set MainCategoryTypeID(value:int):void
		{
			_MainCategoryTypeID = value;
		}
		
		public function get SubCategoryTypeID():int
		{
			return _SubCategoryTypeID;
		}
		
		public function set SubCategoryTypeID(value:int):void
		{
			_SubCategoryTypeID = value;
		}
		
		
	}
}