package com.gazuntite.controls.extended.components
{
	import flash.events.MouseEvent;
	
	import spark.components.Button;Button;
	import spark.components.Panel;
	import spark.components.ToggleButton;
	
	[SkinState("collapsed")]
	/**
	 * The CollapsiblePanel class adds support for collapsing (minimizing) to the Spark Panel.
	 */
	public class CollapsiblePanel extends Panel
	{
		[SkinPart(required="false")]
		/**
		 *  The skin part that defines the appearance of the 
		 *  button responsible for collapsing/uncollapsing the panel.
		 */
		public var collapseButton:Button;
		public var _hasChange:Boolean ;
		private var indicatorButton:ToggleButton;
		public var _isSelected:Boolean = false ;
		
		public function get hasChange():Boolean
		{
			return _hasChange;
		}
		[Bindable]
		public function set hasChange(value:Boolean):void
		{
			_hasChange = value;
		}

		/**
		 * @private
		 * storage variable for <code>collapsed</code>property.
		 * Add collapeButton click listener.
		 */
		protected var _collapsed:Boolean;
		
		/**
		 * Flag indicating whether this panel is collapsed (minimized) or not.
		 */ 
		public function get collapsed():Boolean
		{
			return _collapsed;
		}
		/**
		 * @private
		 */
		[Bindable]
		public function set collapsed(value:Boolean):void
		{
			_collapsed = value;
			invalidateSkinState();
		}
		
		/**
		 * @private
		 * Toggle collapsed state on collapseButton click event.
		 */
		protected function collapseButtonClickHandler(event:MouseEvent):void
		{
			collapsed = !collapsed;
		}
		
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			
			if (instance == collapseButton)
			{
				Button(instance).addEventListener(MouseEvent.CLICK, collapseButtonClickHandler);
			}
		}
		
		/**
	     * @private
	     * Remove collapeButton click listener.
	     */
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			if (instance == collapseButton)
			{
				Button(instance).removeEventListener(MouseEvent.CLICK, collapseButtonClickHandler);
			}
			super.partRemoved(partName, instance);
		}
		
		/**
	     *  @private
	     */
		override protected function getCurrentSkinState():String
		{
			return collapsed ? "collapsed" : super.getCurrentSkinState();
		}
		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		[Bindable]
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

	}
}