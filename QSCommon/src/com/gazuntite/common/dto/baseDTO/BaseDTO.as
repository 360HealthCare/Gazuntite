package com.gazuntite.common.dto.baseDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.charts.chartClasses.DataDescription;

	[Bindable]
	public class BaseDTO
	{
			
		private var _IsDeleted 			: Boolean;
		private var _IsDirty 			: Boolean;
		private var _IsRecordEditable 	: Boolean = true;
		private var _CreatedBy 			: int;
		private var _ModifiedBy 		: int;
		private var _PatientID 			: int;
		private var _VisitID 			: int;
		private var _DictationID 		: String = "00000000-0000-0000-0000-000000000000";
		private var _Note 				: String = '';
		private var _NoteSubject 		: String = '';
		private var _CreatedAt 			: Date;
		private var _ModifiedAt 		: Date;
		private var _VisitDate 			: Date;
		private var _IsNewAdded:Boolean;
		
		/**
		 * serialNumber is only related to view
		 * */
		private var _serialNumber:int;
		private var _inEditMode:Boolean;
		
		protected var nodeName:String;
		
		public function BaseDTO()
		{
			VisitDate = new Date();
			ModifiedAt = new Date();
		}
		
		public function get NoteSubject():String
		{
			return _NoteSubject;
		}

		public function set NoteSubject(value:String):void
		{
			_NoteSubject = value;
		}

		public function get Note():String
		{
			return _Note;
		}

		public function set Note(value:String):void
		{
			_Note = value;
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
		
		public function get IsNewAdded():Boolean
		{
			return _IsNewAdded;
		}
		
		public function set IsNewAdded(value:Boolean):void
		{
			_IsNewAdded = value;
		}
		
		public function get serialNumber():int
		{
			return _serialNumber;
		}
		
		public function set serialNumber(value:int):void
		{
			_serialNumber = value;
		}
		
		public function get inEditMode():Boolean
		{
			return _inEditMode;
		}
		
		public function set inEditMode(value:Boolean):void
		{
			_inEditMode = value;
		}
		
		public  function FromXML(x:XML):void
		{
			this.DictationID   		=x.@DictationID;
			this.Note				=x.@Note;
			this.NoteSubject		=x.@NoteSubject;
			this.VisitID    		=x.@VisitID;
			this.PatientID			=x.@PatientID;
			this.ModifiedBy			=x.@ModifiedBy;
			this.CreatedBy			=x.@CreatedBy;
			var modifiat:String 	=x.@ModifiedAt;
			this.ModifiedAt			= new Date(modifiat);
			var visitedate:String	=x.@VisitDate;
			this.VisitDate			= new Date(visitedate);
			
			var createat:String = x.@CreatedAt;
			if(createat=="") // if date is empty string , initizlize it with a null date
				this.CreatedAt = new Date(1901, 00, 01, 17, 0, 0);
			else
				this.CreatedAt = new Date(createat);
			
			this.IsRecordEditable  	= false;
			
			this.IsDirty = UtilityFunctions.StringToBoolean(x.@IsDirty);
			this.IsDeleted = UtilityFunctions.StringToBoolean(x.@IsDeleted);
			this.IsNewAdded = UtilityFunctions.StringToBoolean(x.@IsNewAdded);
			 
		}
		
		public function ToXML():XML
		{
			if(UtilityFunctions.IsNullOrEmpty(nodeName))
			{
				throw("please provide node name");
			}
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			
			x.@DictationID 		=this.DictationID ;
			x.@NoteSubject		=this.NoteSubject;
			x.@Note				=this.Note;
			x.@VisitID 			=this.VisitID;
			x.@PatientID 		=this.PatientID;	
			x.@ModifiedBy		=this.ModifiedBy;	
			x.@CreatedBy 		=this.CreatedBy;	
			x.@ModifiedAt		= UtilityFunctions.FormatDate(ModifiedAt, "MM-DD-YYYY");	
			x.@VisitDate		= UtilityFunctions.FormatDate(VisitDate, "MM-DD-YYYY");	
			x.@CreatedAt		= UtilityFunctions.FormatDate(CreatedAt, "MM-DD-YYYY");	
			x.@IsRecordEditable =this.IsRecordEditable;
			x.@IsDirty 			=this.IsDirty;	
			x.@IsDeleted		=this.IsDeleted; 	
			x.@IsNewAdded = this.IsNewAdded;
			
			return x;
		}
	}
}