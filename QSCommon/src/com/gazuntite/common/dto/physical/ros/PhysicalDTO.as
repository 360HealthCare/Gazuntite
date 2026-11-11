package com.gazuntite.common.dto.physical.ros
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class PhysicalDTO extends ROSPhysicalBaseDTO
	{
		public function PhysicalDTO()
		{
			super();
		}
		
		private var _PatientPhysicalID : int;
		
		
		public function get PatientPhysicalID():int
		{
			return _PatientPhysicalID;
		}
		
		public function set PatientPhysicalID(value:int):void
		{
			_PatientPhysicalID = value;
		}
		
		public function get PhysicalSubLevel3CategoryTypeID():int
		{
			return super.SubLevel3CategoryTypeID;
		}
		
		public function set PhysicalSubLevel3CategoryTypeID(value:int):void
		{
			super.SubLevel3CategoryTypeID = value;
		}
		
		public function get PhysicalSubCategoryTypeID():int
		{
			return super.SubCategoryTypeID;
		}
		
		public function set PhysicalSubCategoryTypeID(value:int):void
		{
			super.SubCategoryTypeID = value;
		}
		
		public function get PhysicalMainCategoryTypeID():int
		{
			return super.MainCategoryTypeID;
		}
		
		public function set PhysicalMainCategoryTypeID(value:int):void
		{
			super.MainCategoryTypeID = value;
		}
		
		public function get PhysicalSubLevel3CategoryName():String
		{
			return super.SubLevel3CategoryName;
		}
		
		public function set PhysicalSubLevel3CategoryName(value:String):void
		{
			super.SubLevel3CategoryName = value;
		}
		
		public function get FilterFeild():String
		{
			if(PhysicalSubLevel3CategoryName == null || PhysicalSubLevel3CategoryName == '')
				return MainCategoryName +' :' + SubCategoryName;
			else
				return SubCategoryName +' :' + PhysicalSubLevel3CategoryName;
			
			
			return '';
		}
		
		
		public override function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PhysicalsDTO");
			
			x.@label				= label;
			x.@SubCategoryID		= PhysicalSubCategoryTypeID;
			x.@MainCategoryName		= MainCategoryName;
			x.@Level3CategoryID		= PhysicalSubLevel3CategoryTypeID;
			x.@MainCategoryID		= PhysicalMainCategoryTypeID;
			
			x.@IsDeleted			= IsDeleted; 
			x.@IsDirty				= IsDirty;
			
			x.@PatientID			= PatientID;
			x.@PatientPhysicalID	= PatientPhysicalID;
			
			x.@VisitID				= VisitID;
			x.@VisitDate			= UtilityFunctions.FormatDate(VisitDate, "MM-DD-YYYY");
			
			x.@CreatedBy			= CreatedBy;
			x.@CreatedAt			= UtilityFunctions.FormatDate(CreatedAt, "MM-DD-YYYY");
			x.@ModifiedBy			= ModifiedBy;
			x.@ModifiedAt			= UtilityFunctions.FormatDate(ModifiedAt, "MM-DD-YYYY");
			
			x.@IsRecordEditable		= IsRecordEditable;
			x.@IsNormal				= this.IsNormal;
			x.@IsAbNormal			= this.IsAbNormal;
			
			x.@DictationID 			= this.DictationID;
			x.@Notes				= this.Note;
			x.@NoteSubject			= this.NoteSubject;
			
			
			var xchildren:XML = XmlUtils.getNodeByTagName("children");
			
			for each( var cdto:ROSDTO in children )
			{
				var c:XML = cdto.ToXML();
				xchildren.appendChild( c );
			}
			
			if( xchildren.children().length() > 0 )
				x.appendChild( xchildren );
			
			return x;
		}
		
		
		public override function FromXML(x:XML):void
		{
			this.label 								= x.@label;
			this.PhysicalSubLevel3CategoryTypeID 	= x.@Level3CategoryID;
			this.PhysicalSubLevel3CategoryName 	= x.@Level3CategoryName;
			this.MainCategoryTypeID 			= x.@MainCategoryID;
			this.SubCategoryTypeID 				= x.@SubCategoryID;
			this.MainCategoryName 				= x.@MainCategoryName;
			this.SubCategoryName 				= x.@SubCategoryName;
			
			this.PatientID 						= x.@PatientID;
			this.PatientPhysicalID				= x.@PatientPhysicalID;
			
			this.DictationID 					= x.@DictationID;
			this.Note							= x.@Notes;
			this.NoteSubject					= x.@NoteSubject;
			
			this.IsDeleted 						= x.@IsDeleted == QSConstants.STRING_TRUE; 
			this.IsDirty 						= x.@IsDirty == QSConstants.STRING_TRUE;
			
			this.VisitID 						= x.@VisitID;
			var visitDate:String				= x.@VisitDate;
			this.VisitDate 						= new Date( visitDate );
			
			this.CreatedBy 						= x.@CreatedBy;
			var createdAt:String 				= x.@CreatedAt; 
			this.CreatedAt 						= new Date( createdAt );
			this.ModifiedBy 					= x.@ModifiedBy;
			var modifiedAt:String				= x.@ModifiedAt
			this.ModifiedAt 					= new Date( modifiedAt );
			
			this.IsRecordEditable 				= x.@IsRecordEditable;
			this.IsNormal 						= x.@IsNormal;
			this.IsAbNormal 					= x.@IsAbNormal;
			
			children = new ArrayCollection();
			
			var xlist:XMLList = x.children.children();
			
			for each (var c:XML in xlist)
			{
				var cdto:PhysicalDTO = new PhysicalDTO();
				cdto.FromXML(c);
				trace(label, "adding child:", cdto.label);
				children.addItem( cdto );
			}
		}
	}
}