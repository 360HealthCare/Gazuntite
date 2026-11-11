package com.gazuntite.controls.extended.components
{
	import flash.display.InteractiveObject;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.formats.VerticalAlign;
	
	import mx.collections.ArrayCollection;
	import mx.core.IFactory;
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	import mx.events.ItemClickEvent;
	import mx.utils.NameUtil;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.IItemRenderer;
	import spark.components.SkinnableContainer;
	import spark.components.VGroup;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalLayout;
	
	
	[Event(name="itemClick", type="mx.events.ItemClickEvent")]
	[Event(name="footerClick", type="mx.events.ItemClickEvent")]
	
	[Bindable]
	public class TreeList extends Group
	{
		private var hgrpMain:HGroup;
		private var childGroup:SkinnableContainer = new SkinnableContainer();
		private var m_nMaxRows:int = 9;
		private var m_acDataProvider:ArrayCollection;
		
		private var parentCol:Array;
		
		private var m_iSelectedIndex:int;
		private var m_iChildSelectedIndex:int;
		private var m_oParentSelectedItem:Object;
		private var m_oChildSelectedItem:Object;
		public var itemRenderer:IFactory;
		public var childItemRenderer:IFactory;
		public var footerItemRenderer:IFactory;
		
		public function TreeList()
		{
			super();
			
			childGroup 				= new SkinnableContainer();
			childGroup.percentHeight= 100;
			var vl:VerticalLayout 	= new VerticalLayout();
			vl.gap 					= 5;
			vl.horizontalAlign 		= HorizontalAlign.LEFT;
			vl.verticalAlign   		= VerticalAlign.TOP;
			childGroup.layout  		= vl;
			addEventListener(FlexEvent.CREATION_COMPLETE, function(event:FlexEvent):void
			{
				ParentSelectedIndex = 0;
				InitializeComponent();
			});
		}
		
		public function set skinClass(value:Class):void
		{
			childGroup.setStyle("skinClass", value );
		}
		
		public function get ChildSelectedItem():Object
		{
			return m_oChildSelectedItem;
		}

		public function set ChildSelectedItem(value:Object):void
		{
			m_oChildSelectedItem = value;
		}

		public function get ParentSelectedIndex():int
		{
			return m_iSelectedIndex;
		}

		public function set ParentSelectedIndex(value:int):void
		{
			m_iSelectedIndex = value;
		}

		public function get ParentSelectedItem():Object
		{
			return m_oParentSelectedItem;
		}

		public function set ParentSelectedItem(value:Object):void
		{
			m_oParentSelectedItem = value;
		}
		
		public function get DataProvider():ArrayCollection
		{
			return m_acDataProvider;
		}

		public function set DataProvider(value:ArrayCollection):void
		{
			m_acDataProvider = value;
		}

		public function get MaxRows():int
		{
			return m_nMaxRows;
		}
		
		public function set MaxRows(value:int):void
		{
			m_nMaxRows = value;
		}
		
		protected override function createChildren():void
		{
			super.createChildren();
			/*if( DataProvider )
				InitializeComponent();*/
		}
		
		public function selectItemByIndex(index:int):void
		{
			if( index < 0 )
				index = DataProvider.length - 1;
			else if ( index >= DataProvider.length )
				index = 0;
					
			ParentSelectedIndex = index;
			
			loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
			selectParentByIndex( ParentSelectedIndex );
		}
		
		private function InitializeComponent():void
		{
			hgrpMain = new HGroup();
			//add parent ref
			parentCol = new Array();
			
			hgrpMain.gap = 0;
			var i:int;
			for( i = 0; i < DataProvider.length / MaxRows; i++ )
			{
				hgrpMain.addElement( createColomn( i , m_acDataProvider ) );
			}
			
			this.removeAllElements();
			this.addElement( hgrpMain );
			
			loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
		}
		
		
		private function loadChildren( selectedIndex:int, item:Object ):void
		{
			var childCollection:ArrayCollection;
			if( item.hasOwnProperty( "children" ) )
				childCollection = item.children as ArrayCollection;
			if( childCollection )
			{
				childGroup.removeAllElements();
				
				var childColomn:HGroup = new HGroup();
				childColomn.gap = 0;
				var i:int;
				for( i = 0; i < childCollection.length / MaxRows; i++ )
				{
					childColomn.addElement( createColomn( i , childCollection, item  ) );
				}
				childGroup.addElement( childColomn )
				if( footerItemRenderer )
				{
					var spacer:Group = new Group();
					spacer.percentHeight = 100;
					childGroup.addElement( spacer );
					
					var footer:IVisualElement = footerItemRenderer.newInstance() as IVisualElement;
					footer.addEventListener( MouseEvent.CLICK, onFooterClick );
					childGroup.addElement( footer );
				}
				var colIndex:int = selectedIndex / MaxRows; 	//colomn where selected item is
				colIndex++; 									//colomn where children will go
				if( colIndex < hgrpMain.numChildren )
				{
					hgrpMain.addElementAt( childGroup, colIndex );
				}
				else
				{
					hgrpMain.addElement( childGroup );
				}
			}
		}
		
		private function selectParentByIndex(index:int):void
		{
			if( ParentSelectedItem )
				ParentSelectedItem.selected = false;
			
			ParentSelectedItem = parentCol[ index ] as IItemRenderer;
			ParentSelectedItem.selected = true;
		}
		
		private function createColomn(colNum:int, dataCollection:ArrayCollection, parent:Object = null, startIndex:int = -1, endIndex:int = -1 ):VGroup
		{
			var colGrp:VGroup = new VGroup();
			colGrp.gap = 0;
			var listItem:IItemRenderer;
			
			if( startIndex == -1 )
				startIndex = colNum + ( ( MaxRows - 1 ) * colNum );
			if( endIndex == -1 )
				endIndex = startIndex + ( MaxRows  );
			
			
			var i:int;
			for( i = startIndex; i < endIndex; i++ )
			{
				if( i == dataCollection.length )
					break;
				
				if( parent && childItemRenderer )
				{
					listItem = childItemRenderer.newInstance();
					listItem.addEventListener(MouseEvent.CLICK, onChildItemClick);
				}
				else
				{
					listItem = itemRenderer.newInstance();
					if( i == ParentSelectedIndex )
					{
						listItem.selected 		= true;
						ParentSelectedItem 		= listItem;
					}
					listItem.addEventListener(MouseEvent.CLICK, onParentItemClick);
					
					parentCol.push( listItem );
					
				}
				
				listItem.data 		= dataCollection.getItemAt( i );
				listItem.label 		= dataCollection.getItemAt( i ).label;
				listItem.itemIndex 	= i;
				colGrp.addElement( listItem as IVisualElement );
			}
			
			return colGrp;
		}
		
		private function onParentItemClick(event:MouseEvent):void
		{
			if( ParentSelectedItem )
				ParentSelectedItem.selected = false;
			
			ParentSelectedItem = event.currentTarget;
			ParentSelectedItem.selected = true;
			ParentSelectedIndex = ParentSelectedItem.itemIndex;
			loadChildren( ParentSelectedItem.itemIndex, ParentSelectedItem.data );
			
			var e:ItemClickEvent = new ItemClickEvent(ItemClickEvent.ITEM_CLICK, true );
			e.item = ParentSelectedItem.data;
			e.index = ParentSelectedItem.itemIndex;
			e.relatedObject = event.currentTarget as InteractiveObject;
			dispatchEvent( e );
		}
		
		private function onChildItemClick(event:MouseEvent):void
		{
			if( ChildSelectedItem )
				ChildSelectedItem.selected = false;
			
			ChildSelectedItem = event.currentTarget;
			m_iChildSelectedIndex = ChildSelectedItem.itemIndex + ParentSelectedItem.itemIndex;
			
			var e:ItemClickEvent = new ItemClickEvent(ItemClickEvent.ITEM_CLICK, true );
			e.item = ChildSelectedItem.data;
			e.index = ChildSelectedItem.itemIndex;
			e.relatedObject = event.currentTarget as InteractiveObject;
			dispatchEvent( e );
			
		}
		
		
		private function onFooterClick(event:MouseEvent):void
		{
			var e:ItemClickEvent = new ItemClickEvent("footerClick", true );
			e.item = event.target;
			e.index = -1;
			e.relatedObject = event.currentTarget as InteractiveObject ;
			dispatchEvent( e );
		}
		
	}
}