package com.gazuntite.history.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.charts.chartClasses.DataDescription;

	[Bindable]
	public class BaseDTO
	{
		
		private var _IsDeleted 			: Boolean 	= false;
		private var _IsDirty 			: Boolean 	= false;
		private var _IsRecordEditable 	: Boolean	= true;
		private var _CreatedBy 			: int		=42934;
		private var _ModifiedBy 		: int		=0;
		private var _PatientID 			: int		=0;
		private var _VisitID 			: int		=4279 ;
		private var _DictationID 		: String 	= "00000000-0000-0000-0000-000000000000";
		private var _Note 				: String 	= '';
		private var _NoteSubject 		: String 	= '';
		private var _CreatedAt 			: String		="1/22/2013";
		private var _ModifiedAt 		: String		="1/22/2013";
		private var _VisitDate 			: String		="6/19/2013";
		private var _IsNewAdded:Boolean				= false;
		
		/**
		 * serialNumber is only related to view
		 * */
		private var _serialNumber:int;
		private var _inEditMode:Boolean;
		
		protected var nodeName:String;
		
		public function BaseDTO()
		{
			/*VisitDate = new Date();
			ModifiedAt = new Date();*/
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
		
		public function get VisitDate():String
		{
			return _VisitDate;
		}
		
		public function set VisitDate(value:String):void
		{
			_VisitDate = value;
		}
		
		public function get ModifiedAt():String
		{
			return _ModifiedAt;
		}
		
		public function set ModifiedAt(value:String):void
		{
			_ModifiedAt = value;
		}
		
		public function get CreatedAt():String
		{
			return _CreatedAt;
		}
		
		public function set CreatedAt(value:String):void
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
			this.ModifiedAt			= new Date(modifiat).toString();
			var visitedate:String	=x.@VisitDate;
			this.VisitDate			= new Date(visitedate).toString();
			
			var createat:String = x.@CreatedAt;
			if(createat=="") // if date is empty string , initizlize it with a null date
				this.CreatedAt = new Date(1901, 00, 01, 17, 0, 0).toString();
			else
				this.CreatedAt = new Date(createat).toString();
			
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