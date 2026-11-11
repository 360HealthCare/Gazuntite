package com.gazuntite.common.dto.baseDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class GeneralLabelDTO
	{
		private var _label: String;
		protected var nodeName:String;
		public function GeneralLabelDTO()
		{
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}
		
		public function ToXML():XML
			{
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			x.@["string"] 	= this.label;
			
			return x;
			
		}
		
		public function FromXML( x:XML ):void
		{
			label 		= x.@["string"];
			
			if( label.length == 0 && x.localName() == "string")
			{
				label = x.text();
			}
			
		}
		

	}
}