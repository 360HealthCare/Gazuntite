package com.gazuntite.controls.extended.components
{
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sampler.getInvocationCount;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.core.IFactory;
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	import mx.events.ItemClickEvent;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.IItemRenderer;
	import spark.components.SkinnableContainer;
	import spark.components.VGroup;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.HorizontalLayout;
	import spark.layouts.VerticalAlign;
	import spark.layouts.VerticalLayout;
	import spark.layouts.supportClasses.LayoutBase;
	
	[Event(name="layoutCompleted", type="flash.events.Event")]
	[Event(name="itemClick", type="mx.events.ItemClickEvent")]
	[Event(name="footerClick", type="mx.events.ItemClickEvent")]
	
	[Bindable]
	public class ListTree  extends Group
	{
		private var hgrpMain:HGroup;
		private var m_nMaxRows:int = 9;
		private var m_acDataProvider:ArrayCollection;
		private var m_cSkinClass:Class;
		//private var childGroup:SkinnableContainer = new SkinnableContainer();
		private var childGroup:HGroup = new HGroup();
		private var childColomn:HGroup = new HGroup();
		
		private var m_iSelectedIndex:int;
		private var m_iChildSelectedIndex:int;
		private var m_oParentSelectedItem:IItemRenderer;
		private var m_oParentSelectedItem2:IItemRenderer;
		private var m_oChildSelectedItem:IItemRenderer;
		public var itemRenderer:IFactory;
		public var childItemRenderer:IFactory;
		public var footerItemRenderer:IFactory;
		
		//private var clearChildFlag:Boolean = false;
		
		private var level:Dictionary 	= new Dictionary();
		private var parentCol:Array 	= new Array();
		
		public function ListTree()
		{
			super();
			
			addEventListener(FlexEvent.CREATION_COMPLETE, function(event:FlexEvent):void
			{
				ParentSelectedIndex = 0;
				InitializeComponent();
			});
		}
		
		public function set skinClass(value:Class):void
		{
			m_cSkinClass = value;
			/*childGroup.setStyle("skinClass", m_cSkinClass );
			childGroup.layout = new HorizontalLayout();*/
		}
		
		public function get ChildSelectedItem():IItemRenderer
		{
			return m_oChildSelectedItem;
		}
		
		public function set ChildSelectedItem(value:IItemRenderer):void
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
		
		public function get ParentSelectedItem():IItemRenderer
		{
			return m_oParentSelectedItem;
		}
		
		public function get ParentSelectedItem2level():IItemRenderer
		{
				return m_oParentSelectedItem2;
		}
		
		public function set ParentSelectedItem(value:IItemRenderer):void
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
			InitializeComponent();
		}
		
		public function get MaxRows():int
		{
			return m_nMaxRows;
		}
		
		public function set MaxRows(value:int):void
		{
			m_nMaxRows = value;
		}
		
		public function getParentIndexByItem(item:Object):int
		{
			return DataProvider.getItemIndex( level[ item ].data );
		}
		
		private function InitializeComponent():void
		{
			//childGroup = CreateBG();
			if( DataProvider )
				LayoutTree();
		}
		
		private function LayoutTree():void
		{
			hgrpMain = new HGroup();
			hgrpMain.gap 	= 0;
			childColomn.gap = 0;
			childGroup.gap 	= 0;
			
			var i:int, startIndex:int = -1, endIndex:int = -1, colNum:int = -1;
			for( i = 0; i < DataProvider.length / MaxRows; i++ )
			{
				colNum = i;
				startIndex = colNum + ( ( MaxRows - 1 ) * colNum );
				endIndex = startIndex + ( MaxRows  );
				
				hgrpMain.addElement( CreateColumn( DataProvider, startIndex, endIndex ) );
			}
			
			this.removeAllElements();
			this.addElement( hgrpMain );
			
			loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
			selectParentByIndex( ParentSelectedIndex );
			
			dispatchEvent( new Event("layoutCompleted", true ) );
		}
		
		public function selectItemByIndex(index:int):void
		{
			if( null == m_oParentSelectedItem2 )
			{
				if( index < 0 )
					index = DataProvider.length - 1;
				else if ( index >= DataProvider.length )
					index = 0;
				
				ParentSelectedIndex = index;
				
				selectParentByIndex( ParentSelectedIndex );
				//loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
			}
			else
			{
				var item:Object = m_oParentSelectedItem.data;
				
				if( index < 0 )
					index = item.children.length - 1;
				else if ( index >= item.children.length )
					index = 0;
				
				ParentSelectedIndex = index;
				
				selecteParent2ByIndex( ParentSelectedIndex );
				//loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
				
			}
			
		}
		
		private function selecteParent2ByIndex(index:int):void
		{
			var parent:Object = m_oParentSelectedItem.data;
			var isDir:Boolean = true;
			
			if( parent.children.contains(m_oParentSelectedItem2.data) && parent.children.getItemIndex( m_oParentSelectedItem2.data ) != parent.children.length -1 )
			{
				if( m_oParentSelectedItem2 )
					m_oParentSelectedItem2.selected = false; //deselect the old one
				
				m_oParentSelectedItem2 				= getParentItemRenderer( parent.children.getItemAt( m_iChildSelectedIndex++ ) );
				if( m_iChildSelectedIndex > parent.children.length - 1 )
					m_iChildSelectedIndex = 0;
				
				loadChildren( index, m_oParentSelectedItem2.data, isDir );
				
				if( m_oParentSelectedItem2 )
					m_oParentSelectedItem2.selected 	= true;// select this one
				m_oParentSelectedItem.selected 	= true;// select parent
			}
			else
			{
				selectParentByIndex( index );
			}
		}
		
		private function getParentItemRenderer( item:Object ):IItemRenderer
		{
			var i:int;
			for( i = 0; i<parentCol.length; i++ )
			{
				var r:IItemRenderer = parentCol[ i ] ;
				if( r.data == item )
				{
					return r;
				}
			}
			
			return null;
		}
		
		private function selectParentByIndex(index:int):void
		{
			if( ParentSelectedItem )
				ParentSelectedItem.selected = false;
			
			ParentSelectedItem = parentCol[ index ] as IItemRenderer;
			
			loadChildren( ParentSelectedIndex, m_acDataProvider [ ParentSelectedIndex ] );
			
			ParentSelectedItem.selected = true;
		}
		
		private function CreateColumn(  dataCollection:ArrayCollection, startIndex:int, endIndex:int ):VGroup
		{
			var colGrp:VGroup = new VGroup();
			colGrp.percentHeight	= 100;
			colGrp.gap = 0;
			var item:Object
			var renderer:IItemRenderer;
			var i:int;
			for( i = startIndex; i < endIndex; i++ )
			{
				if( i == dataCollection.length )
					break;
				
				item 				= dataCollection.getItemAt( i );
				
				renderer 			= getItemRendererFor( item );
				renderer.itemIndex 	= i;
				
				colGrp.addElement( renderer );
			}
			
			return colGrp;
		}
		
		private function createFooter(g:SkinnableContainer):void
		{
			if( footerItemRenderer )
			{
				var spacer:Group = new Group();
				spacer.percentHeight = 100;
				g.addElement( spacer );
				
				var footer:IItemRenderer = footerItemRenderer.newInstance() as IItemRenderer;
				footer.addEventListener( MouseEvent.CLICK, onFooterClick );
				g.addElement( footer );
			}
		}
		
		private function CreateChildColumns( childCollection:ArrayCollection ):HGroup
		{
			var colGroup:HGroup = new HGroup();
			colGroup.percentHeight	= 100;
			colGroup.gap = 0;
			var i:int, startIndex:int = -1, endIndex:int = -1, colNum:int = -1;
			for( i = 0; i < childCollection.length / MaxRows; i++ )
			{
				colNum = i;
				startIndex = colNum + ( ( MaxRows - 1 ) * colNum );
				endIndex = startIndex + ( MaxRows  );
				
				colGroup.addElement( CreateColumn( childCollection, startIndex, endIndex ) );
			}
			
			return colGroup;
		}
		
		private function IsItemHasChildren( item:Object ):Boolean
		{
			return ( item != null && item.hasOwnProperty( "children" ) && item.children && item.children.length > 0 )
		}
		
		private function loadChildren( selectedIndex:int, item:Object, isDir:Boolean = false ):void
		{
			var childCollection:ArrayCollection = item.children as ArrayCollection;
			if( null == childCollection ) return;
			
			var childContainer:SkinnableContainer = CreateBG();
			childContainer.addElement( CreateChildColumns( childCollection ) );
			
			var colIndex:int = selectedIndex / MaxRows; 	//colomn where selected item is
			colIndex++; 									//colomn where children will go
			
			if( isDir == false )
			{
				childColomn.removeAllElements();
				childGroup.removeAllElements();
			}
			else if( childColomn.numElements > 1 )
			{
				childColomn.removeElementAt( childColomn.numElements - 1 );
			}
			
			createFooter( childContainer );
			childColomn.addElement( childContainer );
			
			if( !childGroup.contains( childColomn ) )
				childGroup.addElement( childColomn );
			
			addNewChildrenAt( childGroup, colIndex );
		}
		
		private function addNewChildrenAt( elem:IVisualElement, index:int ):void
		{
			if( index < hgrpMain.numChildren )
			{
				hgrpMain.addElementAt( elem, index );
			}
			else
			{
				hgrpMain.addElement( elem );
			}
		}
		
		private function getItemRendererFor( item:Object ):IItemRenderer
		{
			var renderer:IItemRenderer;
			if( item.hasOwnProperty( "children" ) && item.children && item.children.length > 0 )
			{
				renderer =  itemRenderer.newInstance() as IItemRenderer;
				renderer.addEventListener(MouseEvent.CLICK, onParentItemClick);
				
				parentCol.push( renderer );
			}
			else
			{
				level[ item ] = ParentSelectedItem;
				
				if( level[ item ] )
					trace( item.label, "item['Parent']", level[ item ].label) ;
				
				renderer =  childItemRenderer.newInstance() as IItemRenderer;
				renderer.addEventListener(MouseEvent.CLICK, onChildItemClick);
			}
			
			renderer.data 		= item;
			renderer.label 		= item.label;
			
			return renderer;
		}
		
		private function onParentItemClick(event:MouseEvent):void
		{
			var item:Object = m_oParentSelectedItem.data;
			var isDir:Boolean = false;
			
			if( item.children.contains(event.currentTarget.data) )
			{
				if( m_oParentSelectedItem2 )
					m_oParentSelectedItem2.selected = false; //deselect the old one
				m_oParentSelectedItem2 				= event.currentTarget as IItemRenderer;
				m_oParentSelectedItem2.selected 	= true;// select this one
				
				isDir = true;
			}
			else
			{
				m_oParentSelectedItem.selected 	= false; //deselect the old one
				m_oParentSelectedItem 			= event.currentTarget as IItemRenderer;
				m_oParentSelectedItem.selected 	= true;// select this one
				ParentSelectedIndex 			= m_oParentSelectedItem.itemIndex;
				
				m_oParentSelectedItem2 = null;
				
				isDir = false;
			}
			
			
			var p:IItemRenderer = level[ event.currentTarget.data ] as IItemRenderer;
			if( p != null )
				p.selected = true;
			
			trace( event.currentTarget.label, "selected = true"  )
			
			loadChildren( event.currentTarget.itemIndex, event.currentTarget.data, isDir );
			
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
			
			ChildSelectedItem = event.currentTarget as IItemRenderer;
			m_iChildSelectedIndex = ChildSelectedItem.itemIndex ;// + ParentSelectedItem.itemIndex;
			
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
		
		private function CreateBG():SkinnableContainer
		{
			var sc:SkinnableContainer	= new SkinnableContainer();
			sc.percentHeight	= 100;
			
			var vl:VerticalLayout	 	= new VerticalLayout();
			vl.gap 						= 0;
			vl.horizontalAlign 			= HorizontalAlign.LEFT;
			vl.verticalAlign   			= VerticalAlign.TOP;
			sc.layout  					= vl;
			
			sc.setStyle("skinClass", m_cSkinClass );
			
			return sc;
		}
		
	}
}