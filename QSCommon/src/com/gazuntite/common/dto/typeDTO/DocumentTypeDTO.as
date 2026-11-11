package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseTypeDTO;

	[Bindable]
	public class DocumentTypeDTO extends LiveProviderBaseTypeDTO
	{
		
		private var documentTypeId				:int;
		private var documentTypeName			:String;
		
		
		public function DocumentTypeDTO()
		{}
		
		
		public function get DocumentTypeId():int
		{
			return documentTypeId;
		}		
		public function set DocumentTypeId(value:int):void
		{
			documentTypeId = value;
		}
		
		
		
		public function get DocumentTypeName():String
		{
			return documentTypeName;
		}		
		public function set DocumentTypeName(value:String):void
		{
			documentTypeName = value;
		}
		
	}
}