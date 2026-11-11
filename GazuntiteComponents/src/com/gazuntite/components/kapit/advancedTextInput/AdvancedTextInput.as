////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2010 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.gazuntite.components.kapit.advancedTextInput
{

import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;

import spark.components.Button;
import spark.components.Label;
import spark.components.TextInput;
import spark.events.TextOperationEvent;
import spark.primitives.BitmapImage;

//--------------------------------------
//  Styles
//--------------------------------------
/**
 * The icon source of the component.
 */
[Style(name="icon", type="Class", inherit="no")]


/**
 *  Dispatched when the user presses the clearButton Button and component clears the text property.
 *
 *  @eventType mx.events.Event textCleared
 *  
 */
[Event(name="textCleared", type="flash.events.Event")]

/**
 *  The AdvancedTextInput contains a button that clears the current text
 *  and an optional icon. 
 *  
 *  @see fr.kapit.flex.ui.spark.advancedTextInput.AdvancedTextInputSkin
 **/
public class AdvancedTextInput extends TextInput
{
	
	//--------------------------------------------------------------------------
	//
	//  Skin parts
	//
	//--------------------------------------------------------------------------
	
	[SkinPart(required="false", type="spark.components.Button")]
	/**
	 *  A skin part that defines the clear button. 
	 */
	public var clearButton:Button;	
	
	[SkinPart(required="false", type="spark.primitives.BitmapImage")]
	/**
	 *  A skin part that defines the icon of the component. 
	 */
	public var iconBitmapImage:BitmapImage;


	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor. 
	 */
	public function AdvancedTextInput()
	{
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 */
	override protected function partAdded(partName:String, instance:Object):void
	{
		super.partAdded(partName, instance);
		
		if (instance == textDisplay)
		{
			textDisplay.addEventListener(TextOperationEvent.CHANGE, textDisplay_changeHandler);		
			addEventListener("textChanged", textDisplay_changeHandler);		
		}
		
		if (instance == clearButton)
		{
			clearButton.addEventListener(MouseEvent.CLICK, clearButton_clickHandler);
			checkClearButtonVisibility();
		}
	}
	
	/**
	 *  @private
	 */
	override protected function partRemoved(partName:String, instance:Object):void
	{
		super.partRemoved(partName, instance);
		
		if (instance == textDisplay)
		{
			textDisplay.removeEventListener(TextOperationEvent.CHANGE, textDisplay_changeHandler);
			removeEventListener("textChanged", textDisplay_changeHandler);
		}
		
		if (instance == clearButton)
			clearButton.removeEventListener(MouseEvent.CLICK, clearButton_clickHandler);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	/**
	 * @private
	 */
	protected function textDisplay_changeHandler(e:Event):void
	{
		checkClearButtonVisibility();
	}
	
	/**
	 * @private
	 **/
	protected function clearButton_clickHandler(e:MouseEvent):void
	{
		clear(true);
		dispatchEvent( new Event("textCleared", true ) );
	}
	
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	private function checkClearButtonVisibility():void
	{
		if (clearButton)
			clearButton.visible = text.length >= 1;
	}
	
	/**
	 * Clear the text displayed 
	 * @param keepFocusOnClear Whether or not displaying the prompt text after the clear
	 */		
	public function clear(keepFocusOnClear:Boolean = false):void
	{
		text = "";
		if (keepFocusOnClear && textDisplay)
			textDisplay.setFocus();
			
	}
	
	
}
}