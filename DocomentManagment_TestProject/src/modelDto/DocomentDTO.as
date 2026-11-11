package modelDto
{
	public class DocomentDTO
	{
		
		private var _DocumentId:int;
		private var _PatientID:int;
		private var _UploadedByUserId:int;
		private var _UploadedByUserTypeId:int;
		private var _SectionId:int;
		
		private var _PatientLastName:String;
		private var _DocumentName:String;
		private var _DocumentTypeName:String;
		private var _DocumentVirtualName:String;
		private var _PatientFirstName:String;
		private var _PatientFullName:String;
		private var _SectionName:String;
		private var _StrUploadedDate:String;
		private var _UploadedByUserFirstName:String;
		private var _UploadedByUserFullName:String;
		private var _UploadedByUserLastName:String;
		private var _UploadedByUserMiddleName:String;
		private var _UploadedDate:String;
		
		public function DocomentDTO()
		{
		}
		
		
		public function FromXML(x:XML):void
		{
			DocumentId					=x.@DocumentId;
			DocumentName				=x.@DocumentName;
			DocumentTypeName			=x.@DocumentTypeName;
			DocumentVirtualName			=x.@DocumentVirtualName;
			PatientFirstName			=x.@PatientFirstName;
			PatientFullName				=x.@PatientFullName;
			PatientID					=x.@PatientID;
			PatientLastName				=x.@PatientLastName;
			SectionId					=x.@SectionId;
			SectionName					=x.@SectionName;
			StrUploadedDate				=x.@StrUploadedDate;
			UploadedByUserFirstName		=x.@UploadedByUserFirstName;
			UploadedByUserFullName		=x.@UploadedByUserFullName;
			UploadedByUserId			=x.@UploadedByUserId;
			UploadedByUserLastName		=x.@UploadedByUserLastName;
			UploadedByUserMiddleName	=x.@UploadedByUserMiddleName;
			UploadedByUserTypeId		=x.@UploadedByUserTypeId;
			UploadedDate				=x.@UploadedDate;
		}
		
		
		public function get UploadedDate():String
		{
			return _UploadedDate;
		}

		public function set UploadedDate(value:String):void
		{
			_UploadedDate = value;
		}

		public function get UploadedByUserMiddleName():String
		{
			return _UploadedByUserMiddleName;
		}

		public function set UploadedByUserMiddleName(value:String):void
		{
			_UploadedByUserMiddleName = value;
		}

		public function get UploadedByUserLastName():String
		{
			return _UploadedByUserLastName;
		}

		public function set UploadedByUserLastName(value:String):void
		{
			_UploadedByUserLastName = value;
		}

		public function get UploadedByUserFullName():String
		{
			return _UploadedByUserFullName;
		}

		public function set UploadedByUserFullName(value:String):void
		{
			_UploadedByUserFullName = value;
		}

		public function get UploadedByUserFirstName():String
		{
			return _UploadedByUserFirstName;
		}

		public function set UploadedByUserFirstName(value:String):void
		{
			_UploadedByUserFirstName = value;
		}

		public function get StrUploadedDate():String
		{
			return _StrUploadedDate;
		}

		public function set StrUploadedDate(value:String):void
		{
			_StrUploadedDate = value;
		}

		public function get SectionName():String
		{
			return _SectionName;
		}

		public function set SectionName(value:String):void
		{
			_SectionName = value;
		}

		public function get PatientFullName():String
		{
			return _PatientFullName;
		}

		public function set PatientFullName(value:String):void
		{
			_PatientFullName = value;
		}

		public function get PatientFirstName():String
		{
			return _PatientFirstName;
		}

		public function set PatientFirstName(value:String):void
		{
			_PatientFirstName = value;
		}

		public function get DocumentVirtualName():String
		{
			return _DocumentVirtualName;
		}

		public function set DocumentVirtualName(value:String):void
		{
			_DocumentVirtualName = value;
		}

		public function get DocumentTypeName():String
		{
			return _DocumentTypeName;
		}

		public function set DocumentTypeName(value:String):void
		{
			_DocumentTypeName = value;
		}

		public function get DocumentName():String
		{
			return _DocumentName;
		}

		public function set DocumentName(value:String):void
		{
			_DocumentName = value;
		}

		public function get PatientLastName():String
		{
			return _PatientLastName;
		}

		public function set PatientLastName(value:String):void
		{
			_PatientLastName = value;
		}

		public function get SectionId():int
		{
			return _SectionId;
		}

		public function set SectionId(value:int):void
		{
			_SectionId = value;
		}

		public function get UploadedByUserTypeId():int
		{
			return _UploadedByUserTypeId;
		}

		public function set UploadedByUserTypeId(value:int):void
		{
			_UploadedByUserTypeId = value;
		}

		public function get UploadedByUserId():int
		{
			return _UploadedByUserId;
		}

		public function set UploadedByUserId(value:int):void
		{
			_UploadedByUserId = value;
		}

		public function get PatientID():int
		{
			return _PatientID;
		}

		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}

		public function get DocumentId():int
		{
			return _DocumentId;
		}

		public function set DocumentId(value:int):void
		{
			_DocumentId = value;
		}

		
		
	}
}