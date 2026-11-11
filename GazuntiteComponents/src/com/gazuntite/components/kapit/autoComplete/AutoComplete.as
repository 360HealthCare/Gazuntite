////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2010 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.gazuntite.components.kapit.autoComplete
{
	import com.gazuntite.components.kapit.advancedTextInput.AdvancedTextInput;
	import com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent;
	import com.gazuntite.components.kapit.list.AdvancedList;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	import mx.events.FlexMouseEvent;
	import mx.events.ListEvent;
	import mx.events.SandboxMouseEvent;
	
	import spark.components.Button;
	import spark.components.DataGroup;
	import spark.components.List;
	import spark.events.DropDownEvent;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	import spark.layouts.VerticalLayout;
	
	//--------------------------------------
	//  Events
	//--------------------------------------
	/**
	 * Dispatched when the wait delay is done and the searched text length is greater than the minCharSearch property 
	 *
	 * @eventType com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent
	 */
	[Event(name="search",type="com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent")]
	
	/**
	 * Dispatched when a value is selected from the drop down 
	 *
	 * @eventType com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent
	 */
	[Event(name="select",type="com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent")]
	
	/**
	 * Dispatched when the selected item property changes 
	 *
	 * @eventType com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent
	 */
	[Event(name="selectedItemChange", type="com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent")]
	
	/**
	 * Dispatched when the autocomplete is opening 
	 *
	 * @eventType com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent
	 */
	[Event(name="open",type="spark.events.DropDownEvent")]
	
	/**
	 * Dispatched when the autocomplete is closing 
	 *
	 * @eventType com.gazuntite.components.kapit.autoComplete.event.AutoCompleteEvent
	 */
	[Event(name="close",type="spark.events.DropDownEvent")]
	
	
	
	//--------------------------------------------------------------------------
	//
	//  Skin states
	//
	//--------------------------------------------------------------------------
	[SkinState("open")]
	[SkinState('normalAndSearching')]
	[SkinState('disabledAnSearching')]
	[SkinState('openAndSearching')]
	/**
	 * The AutoComplete control can be used to provide the user with a list of suggestions when he starts to enter a querry string.
	 * It consists of a textInput where the user can enter the query string and a dropDown list where results are shown.
	 * This autocomplete handles asynchronous retrieval of data.
	 * 
	 * By default, Autocomplete uses AutoCompleteDefaultItemRenderer which underlines the search string in each result.
	 * You might want to replace this behaviour by setting a custom item renderer by setting the dropDownItemRenderer property.
	 * 
	 */
	[Bindable]
	public class AutoComplete extends AdvancedTextInput
	{
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 * A list where results are shown.
		 */
		public var dropDown:AdvancedList;
		
		
		[SkinPart(required="false")]
		/**
		 * Open button
		 */
		public var openButton:Button;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 */
		public function AutoComplete()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private var _isOpen:Boolean = false;
		
		
		//------------------------------------------------------------------------
		//
		//  Properties
		//
		//------------------------------------------------------------------------
		
		//----------------------------------
		//  allowNewValue
		//----------------------------------
		/**
		 * @private
		 */
		private var _allowNewValue:Boolean;
		
		public function get allowNewValue():Boolean
		{
			return _allowNewValue;
		}
		
		/**
		 * Allow a value not present in the dataprovider of the autocomplete field to be selected
		 */
		public function set allowNewValue(value:Boolean):void
		{
			_allowNewValue = value;
		}
		
		//----------------------------------
		//  dataProvider
		//----------------------------------
		/**
		 * @private
		 */
		private var _dataProvider:ArrayCollection;
		
		protected var _dataProviderChanged:Boolean = false;
		
		/**
		 * The dataProvider of the dropDown list, it contains the suggestions that will be displayed to the user based on the string he has entered in the textInput.
		 */
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}
		
		/**
		 * @private
		 */
		public function set dataProvider(value:ArrayCollection):void
		{
			if (_dataProvider == value)
				return;
			
			_dataProvider = value;
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		//----------------------------------
		//  emptyString
		//----------------------------------
		private var _emptyString:String = "No results";
		
		public function get emptyString():String
		{
			return _emptyString;
		}
		
		/**
		 * Label to display empty message
		 */
		public function set emptyString(value:String):void
		{
			_emptyString = value;
			if (dropDown)
				dropDown.emptyString = _emptyString;
		}
		
		//----------------------------------
		//  labelField
		//----------------------------------
		/**
		 * @private
		 */
		private var _labelField:String;
		
		/**
		 * Value used to calculate which property should be taken from the item in the data provider for the text displayed in the item renderer
		 */
		public function set labelField(value:String):void
		{
			if (_labelField == value)
				return;
			
			_labelField = value;
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		
		//----------------------------------
		//  labelFunction
		//----------------------------------
		/**
		 * @private
		 */
		private var _labelFunction:Function;
		
		/**
		 * Value used to set a function that will be used to display the item renderer
		 */
		public function set labelFunction(value:Function) : void
		{
			if (_labelFunction == value)
				return;
			
			_labelFunction = value;
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		//----------------------------------
		//  minCharSearch
		//----------------------------------
		/**
		 * @private
		 */
		private var _minCharSearch:uint = 1;
		
		/**
		 * Specify the minimal number of characters which have to be typed to trigger the search event. 
		 * Only applicable for the 'async' search mode.
		 * 
		 * If you set a negative value or set it to 0, it will behave as if you set it to 1. 
		 */
		public function get minCharSearch():uint
		{
			return _minCharSearch;
		}
		
		/**
		 * @private
		 */
		public function set minCharSearch(value:uint):void
		{
			_minCharSearch = value;
		}
		
		//----------------------------------
		//  searchFunction
		//----------------------------------
		/**
		 * @private
		 */
		private var _searchFunction:Function;
		
		/**
		 * @private
		 */
		private var _searchTimeout:int;
		
		/**
		 * Can be used instead of the default filterFunction in synchrone mode.
		 */
		public function set searchFunction(value:Function):void
		{
			_searchFunction = value;
		}
		
		//----------------------------------
		//  searchMode
		//----------------------------------
		/**
		 * @private
		 */
		private var _searchMode:String = "sync";
		
		/**
		 * Defined the search mode : sync or async.
		 * In sync mode, data are filtered by default filterFuntion or searchFunction if you defined it.
		 * In async mode, you have to listen the <code>SEARCH</code> event.
		 */
		[Inspectable(category="General", enumeration="sync,async", defaultValue="sync")]
		public function set searchMode(value:String):void
		{
			if (_searchMode == value)
				return;
			
			_searchMode = value;
		}
		
		public function get searchMode():String
		{
			return _searchMode;
		}
		
		//----------------------------------
		//  searching
		//----------------------------------
		/**
		 * @private
		 */
		private var _searching:Boolean = false;
		
		//----------------------------------
		//  selectedIndex
		//----------------------------------
		
		/**
		 * The index of the selected item in the dropDown list.
		 */
		public function get selectedIndex():int
		{
			return dropDown.selectedIndex;
		}
		public function set selectedIndex(value:int):void
		{
			dropDown.selectedIndex = value;
		}
		
		//----------------------------------
		//  selectedItem
		//----------------------------------
		
		/**
		 * Holds the value of the current chosen item in the dropDown list.
		 * @private
		 */
		private var _selectedItem:Object;
		
		private var _selectedItemChanged:Boolean = false;
		
		/**
		 * Indicates the last chosenItem from the dropDown list.
		 */
		public function get selectedItem():Object
		{
			return _selectedItem;
		}
		
		/**
		 * @private
		 */
		public function set selectedItem(value:Object):void
		{
			if (_selectedItem == value)
				return;
			
			_selectedItem = value;
			_selectedItemChanged = true;
			invalidateProperties();
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SELECTED_ITEM_CHANGE));
		}
		
		//----------------------------------
		//  requestedRowCount
		//----------------------------------
		/**
		 * Requested row count in the dropDown list.
		 * @private
		 */
		private var _requestedRowCount:int = 5;
		
		private var _requestedRowCountChanged:Boolean = false;
		
		public function set requestedRowCount(value:int):void
		{
			if (_requestedRowCount == value)
				return;
			
			_requestedRowCount = value;
			_requestedRowCountChanged = true;
			invalidateProperties();
		}
		
		public function get requestedRowCount():int
		{
			return _requestedRowCount;
		}
		
		//----------------------------------
		//  waitDelay
		//----------------------------------
		/**
		 * private
		 */
		private var _waitDelay:Number = 500;
		
		/**
		 * Indicates the delay (in milliseconds) that the AutoComplete waits when the query string changes
		 * before dispatching the <code>autoCompleteAsyncSearchEvent</code> event in order to prevent dispaching that event while
		 * the user is still typing the querry string.
		 * 
		 * @default 500
		 */
		public function get waitDelay():Number
		{
			return _waitDelay;
		}
		
		/**
		 * @private
		 */
		public function set waitDelay(value:Number):void
		{
			_waitDelay = value;
		}
		
		//----------------------------------
		//  openOnFocus
		//----------------------------------
		/**
		 * private
		 */
		private var _openOnFocus:Boolean = false;
		
		/**
		 * Auto open dropdown if textInput gets the focus
		 */
		public function get openOnFocus():Boolean
		{
			return _openOnFocus;
		}
		
		/**
		 * @private
		 */
		public function set openOnFocus(value:Boolean):void
		{
			if (value != _openOnFocus)
			{
				_openOnFocus = value;
			}
		}
		
		//----------------------------------
		//  keepFocusOnTab
		//----------------------------------
		/**
		 * private
		 */
		private var _keepFocusOnTab:Boolean = false;
		
		/**
		 * If tab pressed and dropdown is opened, just close the dropdown and do not switch the focus to another component
		 */
		public function get keepFocusOnTab():Boolean
		{
			return _keepFocusOnTab;
		}
		
		/**
		 * @private
		 */
		public function set keepFocusOnTab(value:Boolean):void
		{
			_keepFocusOnTab = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override protected function getCurrentSkinState():String
		{
			var state:String;
			if (_isOpen)
				state = "open";
			else
				state = super.getCurrentSkinState();
			
			var searching:String = _searching ? "AndSearching" : "";
			
			if (skin && skin.hasState(state + searching))
				return state + searching;
			else 
				return state;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			addEventListener(KeyboardEvent.KEY_DOWN, this_keyDownHandler);
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function commitProperties():void
		{
			if (_dataProviderChanged)
			{
				_dataProviderChanged = false;
				dropDown.dataProvider = createDropDownDataProvider(_dataProvider);
				if (_searching)
				{
					setSearching(false);
					open();
				}
				
				_requestedRowCountChanged = true;
			}
			
			if (_requestedRowCountChanged)
			{
				_requestedRowCountChanged = false;
				if (dropDown.layout is VerticalLayout)
				{
					(dropDown.layout as VerticalLayout).requestedRowCount = Math.min(_requestedRowCount, dropDown.dataProvider.length);
				}
			}
			
			if (_selectedItemChanged && null != _selectedItem )
			{
				_selectedItemChanged = false;
				text = getDisplayString(_selectedItem);
				textDisplay.selectRange(text.length, text.length);
				dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SELECT));
			}
			super.commitProperties();
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == dropDown)
			{
				dropDown.addEventListener(IndexChangeEvent.CHANGE, dropDown_changeEvent);
				dropDown.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, dropdown_mouseOutsideHandler);
				dropDown.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, dropdown_mouseOutsideHandler);
				dropDown.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, dropdown_mouseOutsideHandler);
				dropDown.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, dropdown_mouseOutsideHandler);
				dropDown.focusEnabled = false;
				dropDown.emptyString = emptyString;
			}
			else if (openButton == instance)
			{
				openButton.addEventListener(MouseEvent.CLICK, openButton_mouseClickHandler);
			}
			else if (textDisplay == instance)
			{
				textDisplay.addEventListener(MouseEvent.CLICK, textDisplay_clickHandler);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (instance == dropDown)
			{
				dropDown.removeEventListener(IndexChangeEvent.CHANGE, dropDown_changeEvent);
				dropDown.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, dropdown_mouseOutsideHandler);
				dropDown.removeEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, dropdown_mouseOutsideHandler);
				dropDown.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, dropdown_mouseOutsideHandler);
				dropDown.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, dropdown_mouseOutsideHandler);
			}
			else if (openButton == instance)
			{
				openButton.removeEventListener(MouseEvent.CLICK, openButton_mouseClickHandler);
			}
			else if (textDisplay == instance)
			{
				textDisplay.removeEventListener(MouseEvent.CLICK, textDisplay_clickHandler);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods : AdvancedTextInput
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override protected function textDisplay_changeHandler(e:Event):void
		{
			super.textDisplay_changeHandler(e);
			
			if (e is TextOperationEvent)//we verify text has been changed because of a manual operation and not assigned programmatically 
			{
				_selectedItem = null;
				
				if (_searchTimeout)
				{
					clearTimeout(_searchTimeout);
					_searchTimeout = 0;
				}
				
				if (searchAllowed())
				{
					if (_searchMode == "sync")
					{
						_dataProviderChanged = true;
						invalidateProperties();
						open();
					}
					else if (_searchMode == "async")
					{
						_searchTimeout = setTimeout(doSearch, _waitDelay);
					}
				}
				else
				{
					close();
				}
			}
		}
		
		/**
		 * @private
		 */
		override protected function clearButton_clickHandler(event:MouseEvent):void
		{
			super.clearButton_clickHandler(event);
			reset();
		}
		
		/**
		 * @private
		 */
		override public function clear(keepFocusOnClear:Boolean = false):void
		{
			super.clear(keepFocusOnClear);
			reset();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		/**
		 * @private
		 */
		private function selectCurrentItem():void
		{
			var item:Object = dropDown.selectedItem;
			if ((!item && _allowNewValue) || (item && item.hasOwnProperty("item")))
			{
				item = (item && item.hasOwnProperty("item")) ? dropDown.selectedItem.item : text;
				if (_selectedItem != item)
				{
					selectedItem = item;
				}
			}
		}
		
		/**
		 * @private
		 */
		private function this_keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ESCAPE)
			{
				close();
			}
			else if (event.keyCode == Keyboard.ENTER)
			{
				if (text != "" && dataProvider && dataProvider.length > 0)
				{
					if (!dropDown.selectedItem && dropDown.dataProvider.length > 0 && !_allowNewValue)
						selectFirstItem();
					else
						selectCurrentItem();
				}
				close();
			}
			else if (event.keyCode == Keyboard.DOWN)
			{
				if (event.ctrlKey)
				{
					open();
				}
				else
				{
					if (allowSelectItem())
					{
						if (selectedItemIsLastItem())
							selectFirstItem()
						else
							selectNextItem();
					}
				}
			}
			else if (event.keyCode == Keyboard.UP)
			{
				if (event.ctrlKey)
				{
					close();
				}
				else
				{
					if (allowSelectItem())
					{
						if (selectedItemIsFirstItem())
							selectLastItem();
						else
							selectPreviousItem();
					}
				}
			}
			else if (event.keyCode == Keyboard.TAB)
			{
				close();
				if (!keepFocusOnTab)
					callLater(focusManager.setFocus, [focusManager.getNextFocusManagerComponent(event.shiftKey)]);
			}
			
			if (dropDown.selectedItem)
				dropDown.ensureIndexIsVisible(dropDown.selectedIndex);
			//textDisplay.selectRange(text.length, text.length);
		}
		
		/**
		 * It's not allowed to change item if the dropdown is closed
		 * when in async mode 
		 * 
		 * @private
		 **/
		private function allowSelectItem():Boolean
		{
			if (!_isOpen && searchMode=="async")
				return false;
			else
				return true;
		}
		
		/**
		 * @private
		 */
		private function dropdown_mouseOutsideHandler(e:MouseEvent):void
		{
			if (e is MouseEvent)
			{
				var mouseEvent:MouseEvent = MouseEvent(e);
				if (!hitTestPoint(mouseEvent.stageX, mouseEvent.stageY, true) && e.relatedObject != textDisplay)
					close();
			}
			else if (e is SandboxMouseEvent)
			{
				close();
			}
		}
		
		/**
		 * @private
		 */
		private function openButton_mouseClickHandler(event:MouseEvent):void
		{
			if (_isOpen)
				close();
			else
				open();
		}
		
		/**
		 * @private
		 */
		private function dropDown_changeEvent(event:IndexChangeEvent):void
		{
			selectCurrentItem();
			close();
		}
		
		/**
		 * @private
		 */
		private function textDisplay_clickHandler(e:Event):void
		{
			if (_openOnFocus)
				open();
		}
		
		/**
		 * @private
		 */
		private function setSearching(value:Boolean):void
		{
			if (_searching == value)
				return;
			
			_searching = value;
			invalidateSkinState();
		}
		
		/**
		 * @private
		 */
		private function reset():void
		{
			close();
			selectedItem = null;
			dropDown.selectedIndex = -1;
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		/**
		 * @private
		 */
		private function defaultFilterFunction(item:Object):Boolean
		{
			if (!item)
				return false;
			
			var displayString:String = getDisplayString(item).toLowerCase();
			return (displayString.search(text.toLowerCase()) >= 0);
		}
		
		/**
		 * @private
		 */
		private function searchAllowed():Boolean
		{
			return (text.length >= _minCharSearch || _searchMode == "sync");
		}
		
		/**
		 * @private
		 */
		private function getDisplayString(item:Object):String
		{
			var t : String;
			if (_labelFunction != null)
				t = _labelFunction(item);
			else if (_labelField != null && null != item )
				t = item.hasOwnProperty(_labelField) ? item[_labelField] : item.toString();
			else if (item)
				t = item.toString();
			else 
				t = "";
			var lines : Array = t.split("\n");
			if ( lines && lines.length)
				return lines[0];
			return "";
		}
		
		/**
		 * @private
		 */
		private function doSearch():void
		{
			clearTimeout(_searchTimeout);
			_searchTimeout = 0;
			
			setSearching(true);
			dispatchEvent(new AutoCompleteEvent(AutoCompleteEvent.SEARCH, text));
		}
		
		/**
		 * @private
		 */
		private function createDropDownDataProvider(a:ArrayCollection):ArrayCollection
		{
			var result:Array = [];
			
			var useFilter:Boolean = (_searchMode == "sync");
			var filterFunction:Function = (_searchFunction != null) ? _searchFunction : defaultFilterFunction;
			
			for (var i:int=0; a && i<a.length; i++)
			{
				var item:Object = a.getItemAt(i);
				if (!useFilter || (useFilter && filterFunction.call(this, item)))
				{
					if(item)
					{
						var displayString:String = getDisplayString(item);
						result.push({item:item, label:displayString, searchString:text});
					}
					else
					{
						result.push({item:null, label:null, searchString:null});
					}
				}
			}
			
			return new ArrayCollection(result);
		}
		
		/**
		 * @private
		 */
		private function selectedItemIsLastItem():Boolean
		{
			return (dropDown.selectedIndex == dropDown.dataProvider.length - 1);
		}
		
		/**
		 * @private
		 */
		private function selectedItemIsFirstItem():Boolean
		{
			return (dropDown.selectedIndex == 0);
		}
		
		/**
		 * @private
		 */
		private function selectFirstItem():void
		{
			dropDown.selectedIndex = 0;
			selectCurrentItem();
		}
		
		/**
		 * @private
		 */
		private function selectLastItem():void
		{
			dropDown.selectedIndex = dropDown.dataProvider.length - 1;
			selectCurrentItem();
		}
		
		/**
		 * @private
		 */
		private function selectNextItem():void
		{
			dropDown.selectedIndex += 1;
			selectCurrentItem();
		}
		
		/**
		 * @private
		 */
		private function selectPreviousItem():void
		{
			dropDown.selectedIndex -= 1;
			selectCurrentItem();
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Shows the dropDown list.
		 */
		public function open():void
		{
			if (_isOpen || !searchAllowed())
				return;
			
			_isOpen = true;
			invalidateSkinState();
			dispatchEvent(new DropDownEvent(DropDownEvent.OPEN));
			
		}
		
		/**
		 * Hides the dropDown list.
		 */
		public function close():void
		{
			if (!_isOpen)
				return;
			
			_isOpen = false;
			invalidateSkinState();
			dispatchEvent(new DropDownEvent(DropDownEvent.CLOSE));
		}
		
		
	}
}