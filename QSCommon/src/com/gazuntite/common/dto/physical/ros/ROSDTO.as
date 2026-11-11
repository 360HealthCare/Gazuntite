package com.gazuntite.common.dto.physical.ros
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ROSDTO extends ROSPhysicalBaseDTO
	{
		private var _PatientROSID : int;
		
		public function ROSDTO()
		{
			super();
		}

		public function get PatientROSID():int
		{
			return _PatientROSID;
		}
		
		public function set PatientROSID(value:int):void
		{
			_PatientROSID = value;
		}
		
		public function get ROSSubLevel3CategoryTypeID():int
		{
			return super.SubLevel3CategoryTypeID;
		}

		public function set ROSSubLevel3CategoryTypeID(value:int):void
		{
			super.SubLevel3CategoryTypeID = value;
		}

		public function get ROSSubCategoryTypeID():int
		{
			return super.SubCategoryTypeID;
		}

		public function set ROSSubCategoryTypeID(value:int):void
		{
			super.SubCategoryTypeID = value;
		}

		public function get ROSMainCategoryTypeID():int
		{
			return super.MainCategoryTypeID;
		}

		public function set ROSMainCategoryTypeID(value:int):void
		{
			super.MainCategoryTypeID = value;
		}

		public function get ROSSubLevel3CategoryName():String
		{
			return super.SubLevel3CategoryName;
		}

		public function set ROSSubLevel3CategoryName(value:String):void
		{
			super.SubLevel3CategoryName = value;
		}
		
		public function get FilterFeild():String
		{
			if(SubLevel3CategoryName == null || SubLevel3CategoryName == '')
				return MainCategoryName +' :' + SubCategoryName;
			else
				return SubCategoryName +' :' + SubLevel3CategoryName;
			
				return '';
		}
		
		public override function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("ROSDTO");
			
			x.@label				= label;
			x.@SubCategoryID		= ROSSubCategoryTypeID;
			x.@MainCategoryName		= MainCategoryName;
			x.@Level3CategoryID		= ROSSubLevel3CategoryTypeID;
			x.@MainCategoryID		= ROSMainCategoryTypeID;
			
			x.@IsDeleted			= IsDeleted; 
			x.@IsDirty				= IsDirty;

			x.@PatientID			= PatientID;
			x.@PatientROSID			= PatientROSID;
			
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
			this.label 							= x.@label;
			this.ROSSubLevel3CategoryTypeID 	= x.@Level3CategoryID;
			this.SubLevel3CategoryName 			= x.@Level3CategoryName;
			this.MainCategoryTypeID 			= x.@MainCategoryID;
			this.SubCategoryTypeID 				= x.@SubCategoryID;
			this.SubCategoryName				= x.@SubCategoryName;
			this.MainCategoryName 				= x.@MainCategoryName;
			
			this.PatientID 						= x.@PatientID;
			this.PatientROSID					= x.@PatientROSID;
			
			this.DictationID 					= x.@DictationID;
			this.Note							= x.@Notes;
			this.NoteSubject					= x.@NoteSubject;
			
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
			
			this.IsDeleted 						= x.@IsDeleted == QSConstants.STRING_TRUE; 
			this.IsDirty 						= x.@IsDirty == QSConstants.STRING_TRUE;
			
			children = new ArrayCollection();
			
			var xlist:XMLList = x.children.children();
			
			for each( var c:XML in xlist )
			{
				var cdto:ROSDTO = new ROSDTO();
				cdto.FromXML( c );
				trace(label, "adding child:", cdto.label);
				children.addItem( cdto );
			}
		}
	}
}