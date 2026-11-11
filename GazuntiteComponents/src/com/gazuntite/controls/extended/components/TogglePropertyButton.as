package com.gazuntite.controls.extended.components
{
	import flash.events.Event;
	
	import spark.components.ToggleButton;
	
	
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 * 
	 *  Up State of the Button when it has Property set
	 *  
	 */
	[SkinState("upAndHasProperty")]
	
	/**
	 * 
	 *  Over State of the Button when it has Property set
	 *  
	 */
	[SkinState("overAndHasProperty")]
	
	/**
	 * 
	 *  Down State of the Button when it has Property set
	 *  
	 */
	[SkinState("downAndHasProperty")]
	
	/**
	 * 
	 *  Disabled State of the Button when it has Property set
	 *  
	 */
	[SkinState("disabledAndHasProperty")]
	
	/**
	 * 
	 *  Up State of the Button when it has Property set
	 *  
	 */
	[SkinState("upAndSelectedAndHasProperty")]
	
	/**
	 * 
	 *  Over State of the Button when it has Property set
	 *  
	 */
	[SkinState("overAndSelectedAndHasProperty")]
	
	/**
	 * 
	 *  Down State of the Button when it has Property set
	 *  
	 */
	[SkinState("downAndSelectedAndHasProperty")]
	
	/**
	 * 
	 *  Disabled State of the Button when it has Property set
	 *  
	 */
	[SkinState("disabledAndSelectedAndHasProperty")]
	
	
	public class TogglePropertyButton extends ToggleButton
	{
		/**
		 *	indicates if button has its property
		 */		
		private var m_bHasProperty:Boolean;
		
		public function TogglePropertyButton()
		{
			super();
		}

		public function get hasProperty():Boolean
		{
			return m_bHasProperty;
		}

		public function set hasProperty(value:Boolean):void
		{
			m_bHasProperty = value;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  States
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */ 
		override protected function getCurrentSkinState():String
		{
			if (!hasProperty)
				return super.getCurrentSkinState();
			else
				return super.getCurrentSkinState() + "AndHasProperty" ;
		}
		
		/**
		 *  @private
		 */ 
		/*override protected function buttonReleased():void
		{
			super.buttonReleased();
			
			selected = !hasProperty;
			
			dispatchEvent(new Event(Event.CHANGE));
		}*/

	}
}