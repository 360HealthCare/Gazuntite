// -----------------------------------------------------------
// LabelViewStack.as
// -----------------------------------------------------------

/**
 * Copyright (c) 2009 Todd Anderson. All Right Reserved.
 * 
 * Changes by Malik Tamjeed ( pk.linkedin.com/in/maliktamjeed )
 * I've changed CBViewStack class of Tod Anderson and Implemented ISelectableList interface so that 
 * It can be used directly as mx Viewstack can be used.
 * This class is specialy designed to be used in mxml code. 
 */
package com.gazuntite.controls.extended.components
{
	import mx.collections.ArrayList;
	import mx.core.ISelectableList;
	import mx.core.IVisualElement;
	import mx.states.OverrideBase;
	
	import spark.components.BorderContainer;
	import spark.components.SkinnableContainer;
	import spark.core.IViewport;
	import spark.events.IndexChangeEvent;
	
	/**
	 * Dispatched on change to selectedIndex property value. 
	 */
	[Event(name="change", type="spark.events.IndexChangeEvent")]

	[DefaultProperty("content")]
	
	/**
	 * <p>Basic implementation of a ViewStack container targeting the Spark environment, this class implements 
	 * ISelectableList interface so that it can be used directly as mx Viewstack was used. This class is specialy 
	 * designed to be used in mxml code. </p>
	 * 
	 * <p>Child content cannot be added in markup due to the black-boxing of the mxmlContent and 
	 * mxmlContentFactory properties and corresponding methods. As such, supply content to the
	 * LabelViewStack using the <b>content</b> property. The <b>content</b> property is an array
	 * of declared IVisibleElement instances.</p>
	 * 
	 * LabelViewStack inherently supports deferred instantiation. All methods and properties
	 * have been made protected in order to subclass and implement any desired creation 
	 * policy.
	 * 
	 * <p>To enable scrolling of content added to the display list of LabelViewStack, 
	 * it is recommended the either programatically control the viewport with an external scrollbar or 
	 * wrap the container in a &lt;s:Scroller&gt; instance.</p>
	 * 
	 * <p>The <b>content</b> and <b>selectedIndex</b> properties can be set in-line in MXML.
	 * The <b>selectedChild</b> property can only be set within ActionScript.</p>
	 * 
	 * <b>EXAMLE:</b>
	 * <pre><code>
	 * &lt;ns:LabelViewStack id="id_Views" width="100%" height="100%" &gt;
	 *	&lt;s:ArrayList&gt;
	 *		&lt;ns:LoginView id="id_LoginView" name="Login" width="100%" height="100%" /&gt;
	 *		&lt;ns:MainContainer id="id_MainContainer" name="Content" width="100%" height="100%" &gt;
	 *	&lt;/s:ArrayList&gt;
	 *&lt;/ns:LabelViewStack&gt;
	 * </code>
	 * </pre>
	 */	
	public class LabelViewStack extends BorderContainer implements ISelectableList
	{
		/**
		 * Represents the collection of IVisualElement instances to be displayed. 
		 */
		[ArrayElementType("mx.core.IVisualElement")]
		protected var _content:ArrayList;
		/**
		 * The index within the colleciton of IVisualElements to be added to the display list. 
		 */
		protected var _selectedIndex:int = -1;
		/**
		 * Represents the current IVisualElement on the display list. 
		 */
		protected var _selectedChild:IVisualElement
		
		/**
		 * Held value for selectedIndex.
		 */
		protected var _pendingSelectedIndex:int = -1;
		
		/**
		 * @private 
		 * 
		 * Override to update selectedIndex and subsequently content on the display list.
		 */
		override protected function commitProperties() : void
		{
			super.commitProperties();
			// if pending change to selectedIndex property.
			if( _pendingSelectedIndex != -1 )
			{
				// commit the change.
				updateSelectedIndex( _pendingSelectedIndex );
				// set pending back to default.
				_pendingSelectedIndex = -1;
			}
		}
		
		/**
		 * Updates the selectedIndex value and subsequent display. 
		 * @param index int The value representing the selected child index within the content property.
		 */
		protected function updateSelectedIndex( index:int ):void
		{
			// store old for event.
			var oldIndex:int = _selectedIndex;
			// set new.
			_selectedIndex = index;
			
			// remove old element.
			if( numElements > 0 ) 
				removeElementAt( 0 );
			
			// add new element.
			selectedChild = _content.getItemAt( selectedIndex ) as IVisualElement;//_content[_selectedIndex];
			addElement( _selectedChild );
			
			// dispatch index change.
			dispatchEvent( new IndexChangeEvent( IndexChangeEvent.CHANGE, false, false, oldIndex, _selectedIndex ) );
		}
		
		/**
		 * Returns the elemental index of the IVisualElement from the content array. 
		 * @param element IVisualElement The IVisualElement instance to find in the content array.
		 * @return int The elemental index in which the IVisualElement resides. If not available returns -1.
		 * 
		 */
		private function getElementIndexFromContent( element:IVisualElement ):int
		{
			if( _content == null ) return -1;
			
			var i:int = _content.length;
			var contentElement:IVisualElement;
			while( --i > -1 )
			{
				contentElement = _content.getItemAt( selectedIndex ) as IVisualElement;//_content[i] as IVisualElement;
				if( contentElement == element )
				{
					break;
				}
			}
			return i;
		}
		
		[Bindable]
		/**
		 * Sets the array of IVisualElement instances to display based on selectedIndex and selectedChild.
		 * LabelViewStack inherently supports deferred instantiation, creating and adding only IVisualElements
		 * that are requested for display. 
		 * @return Array
		 */
		public function get content():ArrayList /*IVisualElement*/
		{
			return _content;
		}
		public function set content( value:ArrayList /*IVisualElement*/ ):void
		{
			_content = value;
			// update selected index based on pending operations.
			selectedIndex = _pendingSelectedIndex == -1 ? 0 : _pendingSelectedIndex;
		}
		
		[Bindable]
		/**
		 * Sets the selectedIndex to be used to add an IVisualElement instance from the content property
		 * to the display list. 
		 * @return int
		 */
		public function get selectedIndex():int
		{
			return _pendingSelectedIndex != -1 ? _pendingSelectedIndex : _selectedIndex;
		}
		public function set selectedIndex( value:int ):void
		{
			if( _selectedIndex == value ) return;
			
			_pendingSelectedIndex = value;
			invalidateProperties();
		}
		
		[Bindable]
		/**
		 * Sets the selectedChild to be added to the display list form the content array.
		 * SelectedChild can only be set in ActionScript and will not be properly updated
		 * if added inline in MXML declaration. 
		 * @return IVisualElement
		 */
		public function get selectedChild():IVisualElement
		{
			return _selectedChild;
		}
		public function set selectedChild( value:IVisualElement ):void
		{
			if( _selectedChild == value ) return;
			
			// if not pending operation on selectedIndex, induce.
			if( _pendingSelectedIndex == -1 )
			{
				var proposedIndex:int = getElementIndexFromContent( value );
				selectedIndex = proposedIndex;
			}
				// else just hold a reference for binding update.
			else _selectedChild = value;
		}
		
		/** 
		 * @inheritDoc 
		 **/
		public function get length():int
		{
			return _content.length;
		}
		
		public function addItem(item:Object):void
		{
			_content.addItem(item);
		}
		
		/** 
		 * @inheritDoc 
		 **/
		public function addItemAt(item:Object, index:int):void
		{
			_content.addItemAt(item,index);
		}
		
		public function getItemAt(index:int, prefetch:int=0):Object
		{
			return _content.getItemAt(index, prefetch);
		}
		
		public function getItemIndex(item:Object):int
		{
			return _content.getItemIndex( item );
		}
		
		public function itemUpdated(item:Object, property:Object=null, oldValue:Object=null, newValue:Object=null):void
		{
			_content.itemUpdated( item, property, oldValue, newValue );
		}
		
		/**
		 *@Inharit 
		 * 
		 */		
		public function removeAll():void
		{
			_content.removeAll();
		}
		
		public function removeItemAt(index:int):Object
		{
			return _content.removeItemAt(index);
		}
		
		public function setItemAt(item:Object, index:int):Object
		{
			return _content.setItemAt(item, index);
		}
		
		public function toArray():Array
		{
			return _content.toArray();
		}
		
	}
}