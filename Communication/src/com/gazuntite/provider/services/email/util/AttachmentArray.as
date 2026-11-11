package com.gazuntite.provider.services.email.util
{
	[Bindable]
	public class AttachmentArray
	{
		public var isSelected:Boolean;
		public var fileName:String;
		public function AttachmentArray(isSelected:Boolean, fileName:String)
		{
			this.isSelected = isSelected;
			this.fileName = fileName;
		}
	}
}