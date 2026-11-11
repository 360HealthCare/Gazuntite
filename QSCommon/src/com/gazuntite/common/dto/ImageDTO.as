package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;

	public class ImageDTO
	{
		private var _IsUpdated : Boolean;
		private var _IsDeleted : Boolean;
		private var _IsDirty : Boolean;
		//private var _CreatedAt : Date;
		private var _CreatedBy : int;
		private var _ImageCaption : String;
		private var _ImageData : String;
		private var _ImageId : int;
		private var _ImageName : String;
		private var _ImagePath : String;
		private var _ImageThumbnailData : String;
		private var _ImageTypeId : int;
		private var _UserId : int;
		private var _UserTypeID : int;
		
		public function ImageDTO()
		{
		}

		public function ToXML(isForBaseUser:Boolean = false):XML
		{
			var x:XML = XmlUtils.getNodeByTagName("Image");
			
			x.@["UserTypeID"] 				= UserTypeID;
			x.@["UserId"] 					= UserId;
			x.@["ImageId"] 					= ImageId;			
			x.@["ImagePath"] 				= ImagePath;	
			x.@["ImageName"] 				= ImageName;	
			x.@["ImageCaption"] 			= ImageCaption;	
			x.@["ImageData"] 				= new XML(ImageData);	
			x.@["ImageData"] 				= ImageData;	
			x.@["ImageThumbnailData"] 		= ImageThumbnailData;	
			x.@["ImageTypeId"] 				= ImageTypeId;	
			x.@["CreatedBy"] 				= CreatedBy;	
			
			//x.appendChild(XmlUtils.getNodeWithData(ImageData, 'ImageData'));
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			UserTypeID 				= x.@["UserTypeID"];
			UserId 					= x.@["UserId"];
			ImageId 				= x.@["ImageId"];			
			ImagePath 				= x.@["ImagePath"];	
			ImageName				= x.@["ImageName"];
			ImageCaption			= x.@["ImageCaption"];
			ImageData				= x.@["ImageData"];
			ImageThumbnailData		= x.@["ImageThumbnailData"];
			ImageTypeId				= x.@["ImageTypeId"];
			CreatedBy				= x.@["CreatedBy"];
		}
		
		public function get IsUpdated():Boolean
		{
			return _IsUpdated;
		}

		public function set IsUpdated(value:Boolean):void
		{
			_IsUpdated = value;
		}

		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}

		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}

		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}

		public function get CreatedBy():int
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}

		public function get ImageCaption():String
		{
			return _ImageCaption;
		}

		public function set ImageCaption(value:String):void
		{
			_ImageCaption = value;
		}

		public function get ImageData():String
		{
			return _ImageData;
		}

		public function set ImageData(value:String):void
		{
			_ImageData = value;
		}

		public function get ImageId():int
		{
			return _ImageId;
		}

		public function set ImageId(value:int):void
		{
			_ImageId = value;
		}

		public function get ImageName():String
		{
			return _ImageName;
		}

		public function set ImageName(value:String):void
		{
			_ImageName = value;
		}

		public function get ImagePath():String
		{
			return _ImagePath;
		}

		public function set ImagePath(value:String):void
		{
			_ImagePath = value;
		}

		public function get ImageThumbnailData():String
		{
			return _ImageThumbnailData;
		}

		public function set ImageThumbnailData(value:String):void
		{
			_ImageThumbnailData = value;
		}

		public function get ImageTypeId():int
		{
			return _ImageTypeId;
		}

		public function set ImageTypeId(value:int):void
		{
			_ImageTypeId = value;
		}

		public function get UserId():int
		{
			return _UserId;
		}

		public function set UserId(value:int):void
		{
			_UserId = value;
		}

		public function get UserTypeID():int
		{
			return _UserTypeID;
		}

		public function set UserTypeID(value:int):void
		{
			_UserTypeID = value;
		}


	}
}