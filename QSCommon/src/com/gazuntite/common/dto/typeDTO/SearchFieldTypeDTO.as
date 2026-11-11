package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseTypeDTO;

	[Bindable]
	public class SearchFieldTypeDTO extends LiveProviderBaseTypeDTO
	{
		
		private var fieldID				:int;
		private var fieldName			:String;
		
		
		public function SearchFieldTypeDTO()
		{}
		
		
		public function get FieldID():int
		{
			return fieldID;
		}		
		public function set FieldID(value:int):void
		{
			fieldID = value;
		}
		
		public function get label():String
		{
			return fieldName;
		}
		
		public function get FieldName():String
		{
			return fieldName;
		}		
		public function set FieldName(value:String):void
		{
			fieldName = value;
		}
		
	}
}