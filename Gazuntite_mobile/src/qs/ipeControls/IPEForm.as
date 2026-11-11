package qs.ipeControls
{
	import mx.core.UIComponent;
	
	import spark.components.Form;
	import spark.components.SkinnableContainer;

	public class IPEForm extends Form implements IEditable
	{
		private var _editable:Boolean = false;
		
		public function set editable(value:Boolean):void
		{
			_editable = value;
			setChildrenEditable(this,_editable);
		}
		
		private function setChildrenEditable(parent:SkinnableContainer,editable:Boolean):void
		{
			
			for( var i:int = 0;i<parent.numElements;i++)
			{
				var item:UIComponent = UIComponent(parent.getChildAt(i));
				if(item is IEditable)
				{
					IEditable(item).editable = editable;
				}
				else if(item is SkinnableContainer)
				{
					setChildrenEditable(item as SkinnableContainer,editable);
				}
			}
		}
		
		public function get editable():Boolean
		{
			return _editable;
		}
		
	}
}