package com.zigron.gazuntite.model.valueObjects.common
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.zigron.gazuntite.utils.Constants;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class BaseDTO
	{
		private var _IsDeleted : Boolean;
		private var _IsDirty : Boolean;
		private var _IsRecordEditable : Boolean;
		private var _CreatedBy : int;
		private var _ModifiedBy : int;
		private var _ID : int;
		private var _VisitID : int;
		private var _DictationID : String;
		private var _CreatedAt : Date;
		private var _ModifiedAt : Date;
		private var _VisitDate : Date;
		
		protected var nodeName:String;
		
		public function BaseDTO()
		{
			_DictationID = Constants.GUID_FORMAT;
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
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(value:int):void
		{
			_ID = value;
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
		
		public  function FromXML(x:XML):void
		{
			this.DictationID   		=x.@DictationID;
			this.VisitID    		=x.@VisitId;
			this.ID					=x.@ID;
			this.ModifiedBy			=x.@ModifiedBy;
			this.CreatedBy			=x.@CreatedBy;
			var modifiat:String 	=x.@ModifiedAt;
			this.ModifiedAt			= new Date(modifiat);
			var visitedate:String	=x.@VisitDate;
			this.VisitDate			=new Date(visitedate);
			
			var createat:String 	=x.@CreatedAt;
			if(createat=="") // if date is empty string , initizlize it with a null date
				this.CreatedAt 		= Constants.NULL_DATE;
			else
				this.CreatedAt		= new Date(createat);
			
			this.IsRecordEditable  	= StringToBoolean(x.@IsRecordEditable);
			this.IsDirty			= StringToBoolean(x.@IsDirty);
			this.IsDeleted 			= StringToBoolean(x.@IsDeleted);
			 
		}
		
		
		
		public function ToXML():XML
		{
			if(UtilityFunctions.IsNullOrEmpty(nodeName))
			{
				throw("please provide node name");
			}
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			
			x.@DictationID 		=this.DictationID ; 
			x.@VisitID 			=this.VisitID;
			x.@ID 				=this.ID;	
			x.@ModifiedBy		=this.ModifiedBy;	
			x.@CreatedBy 		=this.CreatedBy;	
			x.@ModifiedAt		= UtilityFunctions.FormatDate(ModifiedAt, "MM-DD-YYYY");	
			//x.@ModifiedAt 		=this.ModifiedAt;
			//x.@VisitDate 		=this.VisitDate;
			x.@VisitDate		= UtilityFunctions.FormatDate(VisitDate, "MM-DD-YYYY");	
			x.@CreatedAt		= UtilityFunctions.FormatDate(CreatedAt, "MM-DD-YYYY");	
			//x.@CreatedAt 		=this.CreatedAt;	
			x.@IsRecordEditable =this.IsRecordEditable;
			x.@IsDirty 			=this.IsDirty;	
			x.@IsDeleted		=this.IsDeleted; 	
			
			return x;
		}
		
		public function StringToBoolean(val:String):Boolean  //by moeen , for the annoying behaviour of flex while assigning the value to boolean
		{
			if(val == "false")
				return false;
				
			else if(val =="true")
				return true;
			
			return true;
		}
	}
}