package com.zigron.gazuntite.model.valueObjects.search
{
	import com.zigron.gazuntite.model.valueObjects.common.BaseDTO;
	
	public class SearchEngineDTO extends BaseDTO
	{
		private var _Description:String;
		private var _URL:String;
		private var _IconBase64:String;
		private var _label:String;
		
		private var _IsSystemGenerated:Boolean;
		private var _IsPreferred:Boolean;
		private var _Thumbnail:Boolean;
		private var _IsActive:Boolean;
		
		public function SearchEngineDTO()
		{
			super();
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get Thumbnail():Boolean
		{
			return _Thumbnail;
		}

		public function set Thumbnail(value:Boolean):void
		{
			_Thumbnail = value;
		}

		public function get IsPreferred():Boolean
		{
			return _IsPreferred;
		}

		public function set IsPreferred(value:Boolean):void
		{
			_IsPreferred = value;
		}

		public function get IsSystemGenerated():Boolean
		{
			return _IsSystemGenerated;
		}

		public function set IsSystemGenerated(value:Boolean):void
		{
			_IsSystemGenerated = value;
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}

		public function get IconBase64():String
		{
			return _IconBase64;
		}

		public function set IconBase64(value:String):void
		{
			_IconBase64 = value;
		}

		public function get URL():String
		{
			return _URL;
		}

		public function set URL(value:String):void
		{
			_URL = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}
		
		override public function FromXML(x:XML):void
		{
			super.FromXML( x );
			
			this.ID 				= x.@["UserSearchEngineID"];
			this.label 				= x.@["label"];
			this.Description 		= x.@["description"];
			this.IconBase64 		= x.@["icon"];
			this.IsActive 			= x.@["IsActive"];
			this.IsPreferred 		= x.@["IsPreferred"];
			this.IsSystemGenerated 	= x.@["IsSystemGenerated"];
			this.Thumbnail 			= x.@["Thumbnail"];
			this.URL 				= x.@["URL"];
			
		}

	}
}