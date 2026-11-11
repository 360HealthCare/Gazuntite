package com.gazuntite.common.dto.baseDTO
{
	[Bindable]
	public class LiveProviderBaseDTO
	{
		private var isDeleted		:Boolean;
		private var isDirty			:Boolean;
		
		public function LiveProviderBaseDTO()
		{
		}
		
		public function get IsDeleted():Boolean
		{
			return isDeleted;
		}		
		public function set IsDeleted(value:Boolean):void
		{
			isDeleted = value;
		}
		
		
		
		public function get IsDirty():Boolean
		{
			return isDirty;
		}		
		public function set IsDirty(value:Boolean):void
		{
			isDirty = value;
		}
	}
}