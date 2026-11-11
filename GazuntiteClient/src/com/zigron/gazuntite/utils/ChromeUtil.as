package com.zigron.gazuntite.utils
{
	
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowResize;
	import flash.display.NativeWindowSystemChrome;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.events.NativeWindowBoundsEvent;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import spark.components.Window;
	import spark.components.WindowedApplication;
	import spark.primitives.Rect;

	[Bindable]
	public class ChromeUtil
	{
		public function ChromeUtil()
		{
			throw("invalid! this class is a utility class, you can't instantiate it, use static methods instead...")
		}
		/**
		 * 
		 * Top Level Window, AIR provides access to Native OS window called Native window
		 * stores your window reference as top level window.
		 * 
		 */		
		public static var topLevelWindow:NativeWindow;
		
		public static var topLevelMainContainer:UIComponent;
		public static var topLevelApplication:WindowedApplication;
		
		public static var topLevelWindowXpos:Number;
		public static var topLevelWindowYpos:Number;
		
		public var openedWindowsCount:Number = 0;

		/**
		 * 
		 * booloean to see if window was maximised
		 * 
		 */		
		public static var isMaximized:Boolean = false;

		/**
		 * 
		 *  booloean to see if window was resized
		 * 
		 */		
		public static var isInConstraintWidth:Boolean = true;
		
		private static var _isInConstraintScreen:Boolean = true;

		/**
		 * 
		 * booloean to see if window was in side screen
		 * 
		 */
		public static function get isInConstraintScreen():Boolean
		{
			return _isInConstraintScreen;
		}

		/**
		 * @private
		 */
		public static function set isInConstraintScreen(value:Boolean):void
		{
			_isInConstraintScreen = value;
		}

		private static var _isResized:Boolean = false;

		/**
		 * 
		 * booloean to see if window was resized
		 * 
		 */
		public static function get isResized():Boolean
		{
			return _isResized;
		}

		/**
		 * @private
		 */
		public static function set isResized(value:Boolean):void
		{
			_isResized = value;
		}

		private static var _isMoved:Boolean = false;

		/**
		 * 
		 * booloean to see if window was moved
		 * 
		 */
		public static function get isMoved():Boolean
		{
			return _isMoved;
		}

		/**
		 * @private
		 */
		public static function set isMoved(value:Boolean):void
		{
			_isMoved = value;
		}
		
		
		
		/**
		 * 
		 * Maximise the Top Level Window, AIR provides access to Native OS window called Native window
		 * this static function restores/Maximises the Native window.
		 * 
		 */		
		/*public static function setWindowsCount():void
		{
			openedWindowsCount++;
			
		}
		public static function removeWindowsCount():void
		{
			openedWindowsCount--;
			
		}
		public static function getWindowsCount():Number
		{
			return openedWindowsCount;
			
		}*/
		
		public static function get AppWidth():int
		{
			return topLevelMainContainer.width;
		}
		
		public static function get AppHeight():int
		{
			return topLevelMainContainer.height;
		}
		
		public static function restoreDefault():void
		{
			var screenWidth:Number = Capabilities.screenResolutionX;//ChromeUtil.getScreenRect().width; //restore functionality...functional requirement change
			ChromeUtil.topLevelWindow.width = screenWidth;
			//ChromeUtil.topLevelWindow.y = 0;
			
			//topLevelWindow.y = 40; //topLevelQuivusClient.appY;
					
			//ChromeUtil.topLevelWindow.x = 0;
			topLevelWindow.x = topLevelWindowXpos;
			topLevelWindow.y = topLevelWindowYpos;
			
			isMaximized = false;
			isMoved		= false;
			isResized	= false;
			
		}
		
		public static function toggleMaximizeWindow():void
		{
			if( isMaximized )//don't delete this commented code ... tamjeed
			{
				topLevelWindow.restore();
				//restoreDefault();
				isMaximized = false;
			}
			else
			{
				
				topLevelWindow.maximize();
				isMaximized = true;
				
			}
			
			//restoreDefault();
		}
		
		/**
		 * 
		 * Maximise the Top Level Window, AIR provides access to Native OS window called Native window
		 * this static function minimize the Native window.
		 * 
		 */
		public static function minimizeWindow():void
		{
			topLevelWindow.minimize();
		}
		
		/**
		 * 
		 * Moves the Top Level Window, AIR provides access to Native OS window called Native window
		 * this static function moves the Native window.
		 * 
		 */
		public static function moveWindow():void
		{
			topLevelWindow.startMove();
			//topLevelWindow.addEventListener(NativeWindowBoundsEvent.MOVING, TestWindowBounds );
		}
		
		/**
		 * 
		 * Maximise the Top Level Window, AIR provides access to Native OS window called Native window
		 * this static function closes the Native window.
		 * 
		 */
		public static function closeWindow():void
		{
			/*
				A close event is dispatched as soon as the close operation is complete. A closing event will not be dispatched. 
				If cancellation of the close operation should be allowed, dispatch a closing event and check whether any registered listeners cancel 
				the default behavior before calling the close() method. 
			*/
			
			topLevelWindow.addEventListener(Event.CLOSING, function(event:Event):void
			{
			
				if(! event.isDefaultPrevented() )
					topLevelWindow.close();
			
			});

			topLevelWindow.dispatchEvent( new Event( Event.CLOSING, true, true ) );
		}
		
		/**
		 * 
		 * this static function resizes the Native window.
		 * @param fromTop
		 * 
		 */		
		/*public static function resizeWindow(fromTop:Boolean = false):void
		{
			//var resizeFrom:String = fromTop ? NativeWindowResize.TOP_RIGHT: NativeWindowResize.BOTTOM_RIGHT;

			//topLevelWindow.startResize( resizeFrom );
			topLevelWindow.startResize();
			topLevelWindow.addEventListener(NativeWindowBoundsEvent.RESIZING, checkWindowSize);

		}*/
		/*public static function checkWindowSize(event:NativeWindowBoundsEvent):void
		{
			var screenWidth:Number = Capabilities.screenResolutionX; //ChromeUtil.getScreenRect().width;
			var mContainer:mainContainer = FlexGlobals.topLevelApplication.mainContainer;
			if( mContainer )
			{
				if( mContainer.width >  ( screenWidth / 2 ) )
				{					
					trace("do not resize.")
					//mContainer.width =  ( screenWidth / 2 );
					//mContainer.percentWidth =  50;
				}
				
			}
		}*/
		/**
		 *
		 * static method to get screen resolution. 
		 * @returns a rectangle object containing screen bounds
		 * 
		 */		
		public static function getScreenRect():Rectangle 
		{
			//set the window options before creating the window...
			//create invisible window so we can find the top of the taskbar
			//blow up the window to take up the full size of the monitor...
			//copy the dimensions to var screenRect...
			//get rid of invisible window
			
			var options:NativeWindowInitOptions = new NativeWindowInitOptions()
			options.systemChrome 				= NativeWindowSystemChrome.NONE;
			options.transparent					= true;
			var tmpWindow:NativeWindow 			= new NativeWindow(options);
			tmpWindow.maximize();
			var rect:Rectangle 					= tmpWindow.bounds.clone();
			tmpWindow.close();
			
			return rect;
		}
		
		/*public static function TestWindowBounds(event:NativeWindowBoundsEvent):void
		{
			var screen:Rectangle = ChromeUtil.getScreenRect();
			var mContainer:mainContainer = FlexGlobals.topLevelApplication.mainContainer
			if( mContainer )
			{
				if( ( event.currentTarget.x + mContainer.width ) > screen.width )
				{
					trace("out of width...");
					event.currentTarget.x -= event.currentTarget.x + mContainer.width - screen.width;
					event.preventDefault();
				}
				else if( event.currentTarget.x  < 0 )
				{
					trace("out of x...");
					event.currentTarget.x = 2;
					event.preventDefault();
				}
				if( ( event.currentTarget.y + mContainer.height ) > screen.height )
				{
					trace("out of height...");
					event.currentTarget.y -= ( event.currentTarget.y + mContainer.height ) - screen.height
					event.preventDefault();
				}
				else if( event.currentTarget.y  < 0 )
				{
					trace("out of y...");
					event.currentTarget.y = 2;
					event.preventDefault();
				}
			}
		}
		
		public static function TestConstraintWidth():void
		{
			var screenWidth:Number = Capabilities.screenResolutionX; //ChromeUtil.getScreenRect().width;
			var mContainer:mainContainer = FlexGlobals.topLevelApplication.mainContainer
			if( mContainer )
			{
				trace("screenWidth", screenWidth, "mainContainerWidth", mContainer.width, "ConstraintWidth",( screenWidth / 2 ) );
				if( mContainer.width <=  ( screenWidth / 2 ) )
				{
					ChromeUtil.isInConstraintWidth = true;
					trace("allow slide out...")
				}
				else
				{
					ChromeUtil.isInConstraintWidth = false;
					trace("not in constraints", "no slide out");
				}
			}
		}*/

		
	}
}