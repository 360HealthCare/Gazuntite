package com.gazuntite.services.valueObjects.rosPhysical
{
	import com.gazuntite.utils.Constants;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ROSPhysicalBaseDTO
	{
		private var _IsDeleted : Boolean;
		private var _IsDirty : Boolean;
		private var _IsRecordEditable : Boolean;
		private var _CreatedAt : Date;
		private var _ModifiedAt : Date;
		private var _VisitDate : Date;
		private var _CreatedBy : int;
		private var _ModifiedBy : int;
		private var _PatientID : int;
		private var _PatientROSID : int;
		private var _VisitID : int;
		private var _DictationID : String;
		private var _IsAbNormal : String;
		private var _IsNormal : String;
		private var _NoteSubject : String;
		private var _Notes : String;
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
			
			_DictationID = Constants.GUID_FORMAT;
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
		
		public function get Notes():String
		{
			return _Notes;
		}
		
		public function set Notes(value:String):void
		{
			_Notes = value;
		}
		
		public function get NoteSubject():String
		{
			return _NoteSubject;
		}
		
		public function set NoteSubject(value:String):void
		{
			_NoteSubject = value;
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
		
		public function get DictationID():String
		{
			return _DictationID;
		}
		
		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}
		
		public function get VisitID():int
		{
			return _VisitID;
		}
		
		public function set VisitID(value:int):void
		{
			_VisitID = value;
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
		
		public function get PatientROSID():int
		{
			return _PatientROSID;
		}
		
		public function set PatientROSID(value:int):void
		{
			_PatientROSID = value;
		}
		
		public function get PatientID():int
		{
			return _PatientID;
		}
		
		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}
		
		public function get ModifiedBy():int
		{
			return _ModifiedBy;
		}
		
		public function set ModifiedBy(value:int):void
		{
			_ModifiedBy = value;
		}
		
		public function get CreatedBy():int
		{
			return _CreatedBy;
		}
		
		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}
		
		public function get VisitDate():Date
		{
			return _VisitDate;
		}
		
		public function set VisitDate(value:Date):void
		{
			_VisitDate = value;
		}
		
		public function get ModifiedAt():Date
		{
			return _ModifiedAt;
		}
		
		public function set ModifiedAt(value:Date):void
		{
			_ModifiedAt = value;
		}
		
		public function get CreatedAt():Date
		{
			return _CreatedAt;
		}
		
		public function set CreatedAt(value:Date):void
		{
			_CreatedAt = value;
		}
		
		public function get IsRecordEditable():Boolean
		{
			return _IsRecordEditable;
		}
		
		public function set IsRecordEditable(value:Boolean):void
		{
			_IsRecordEditable = value;
		}
		
		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}
		
		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}
		
		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}
		
		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}
		
	}
}