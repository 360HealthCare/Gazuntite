////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2010 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.gazuntite.components.kapit.autoComplete.event
{
import flash.events.Event;

/**
 *  The AutoCompleteEvent class represents the event object passed to 
 *  the event listener for the <code>search</code>, <code>select</code> and <code>selectedItemChange</code> events.
 */
public class AutoCompleteEvent extends Event
{
	//--------------------------------------------------------------------------
	//
	//  Class constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  The <code>AutoCompleteEvent.SEARCH</code> constant defines the value of the 
	 *  <code>type</code> property of the event object for a <code>search</code> event.
	 * 
	 *  @eventType search
	 */
	public static const SEARCH:String = "search";
	
	/**
	 *  The <code>AutoCompleteEvent.SELECT</code> constant defines the value of the 
	 *  <code>type</code> property of the event object for a <code>select</code> event.
	 * 
	 *  Triggered when a value is chosen from the drop down
	 * 
	 *  @eventType search
	 */
	public static const SELECT:String = "select";
	
	/**
	 *  The <code>AutoCompleteEvent.SELECTED_ITEM_CHANGE</code> constant defines the value of the 
	 *  <code>type</code> property of the event object for a <code>selectedItemChange</code> event.
	 * 
	 *  Triggered when selected item is set programmatically
	 * 
	 *  @eventType search
	 */
	public static const SELECTED_ITEM_CHANGE:String = "selectedItemChange";
	
	private var _text:String;
	
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 *
	 *  @param type The event type; indicates the action that caused the event.
	 *
	 *  @param bubbles Specifies whether the event can bubble
	 *  up the display list hierarchy.
	 *
	 *  @param cancelable Specifies whether the behavior
	 *  associated with the event can be prevented.
	 */
	public function AutoCompleteEvent(type:String, text:String=null,  bubbles:Boolean=false, cancelable:Boolean=false)
	{
		_text = text;
		super(type, bubbles, cancelable);
	}
	
	/**
	 * Text entered in the input field
	 */
	public function get text():String
	{
		return _text;
	}
	
	override public function clone():Event
	{
		return new AutoCompleteEvent(type, text, bubbles, cancelable);
	}
}
}