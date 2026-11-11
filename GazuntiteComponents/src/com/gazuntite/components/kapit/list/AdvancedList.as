////////////////////////////////////////////////////////////////////////////////
//
//  Kap IT  -  Copyright 2011 Kap IT  -  All Rights Reserved.
//
//  This component is distributed under the GNU LGPL v2.1 
//  (available at : http://www.hnu.org/licences/old-licenses/lgpl-2.1.html)
//
////////////////////////////////////////////////////////////////////////////////
package com.gazuntite.components.kapit.list
{
	import flash.events.Event;
	
	import mx.collections.IList;
	
	import spark.components.Label;
	import spark.components.List;
	
	//--------------------------------------------------------------------------
	//
	//  Skin states
	//
	//--------------------------------------------------------------------------
	/**
	 *  Normal and empty State
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState('normalAndEmpty')]
	
	/**
	 *  Disabled and empty State
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState('disabledAndEmpty')]
	
	/**
	 * AdvancedList displays a custom message when no data is shown.
	 **/
	public class AdvancedList extends List
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function AdvancedList()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts
		//
		//--------------------------------------------------------------------------
		[SkinPart(required="false")]
		/**
		 * Label to display empty message
		 */
		public var emptyLabel:Label;
		
		
		//------------------------------------------------------------------------
		//
		//  Properties
		//
		//------------------------------------------------------------------------
		
		//----------------------------------
		//  emptyString
		//----------------------------------
		/**
		 * @private
		 */
		protected var _emptyString:String;
		
		/**
		 * @private
		 */
		protected var _emptyStringChanged:Boolean = false;
		
		/**
		 * Specify the empty message
		 */
		public function get emptyString():String
		{
			return _emptyString
		}
		
		/**
		 * @private
		 */
		public function set emptyString(value:String):void
		{
			if (_emptyString == value)
				return;
			
			_emptyString = value;
			_emptyStringChanged = true;
			invalidateProperties();
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (emptyLabel == instance)
			{
				_emptyStringChanged = true;
				invalidateProperties();
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState() + ((!dataProvider || dataProvider.length == 0) ? "AndEmpty" : "");
		}
		
		override public function set dataProvider(value:IList):void
		{
			super.dataProvider = value;
			invalidateSkinState();
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function commitProperties():void
		{
			if (_emptyStringChanged)
			{
				_emptyStringChanged = false;
				if (emptyLabel)
					emptyLabel.text = _emptyString;
			}
			
			super.commitProperties();
		}

		/**
		 * @inheritDoc
		 */
		override protected function dataProvider_collectionChangeHandler(event:Event):void
    	{
    		super.dataProvider_collectionChangeHandler(event);
    		invalidateSkinState();
    	}
	}
}