package com.gazuntite.common.dto.typeDTO
{
	
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseTypeDTO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class DocumentSectionTypeDTO extends LiveProviderBaseTypeDTO
	{
		
		
		private var sectionId			:int;
		public function get SectionId():int
		{
			return sectionId;
		}		
		public function set SectionId(value:int):void
		{
			sectionId = value;
		}
		
		
		
		private var childSectionType			:ArrayCollection;
		public function get ChildSectionType():ArrayCollection
		{
			return childSectionType;
		}		
		public function set ChildSectionType(value:ArrayCollection):void
		{
			childSectionType = value;
		}
		
		
		public function get children():ArrayCollection
		{
			return childSectionType;
		}		
		public function set children(value:ArrayCollection):void
		{
			childSectionType = value;
		}
		
		
		
		
		
		
		
		
		
		private var sectionName			:String;
		public function get SectionName():String
		{
			return sectionName;
		}		
		public function set SectionName(value:String):void
		{
			sectionName = value;
		}
		public function get label():String
		{
			return sectionName;
		}		
		public function set label(value:String):void
		{
			sectionName = value;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		private var parentId			:int;
		public function get ParentId():int
		{
			return parentId;
		}		
		public function set ParentId(value:int):void
		{
			parentId = value;
		}
		
		
		private var orderNo				:int;
		public function get OrderNo():int
		{
			return orderNo;
		}		
		public function set OrderNo(value:int):void
		{
			orderNo = value;
		}
		
		public function DocumentSectionTypeDTO()
		{
		}
	}
}