package com.gazuntite.controls.extended.components
{
	import mx.controls.DataGrid;
	import mx.core.mx_internal;
	import mx.events.DataGridEvent;
	
	use namespace mx_internal;
	public class LabelDataGrid extends DataGrid
	{
		private var _percentColWidths:Object;
		private var _explicitColWidths:Object;
		private var _columnsAdjusted:Boolean = false;
		private var _columnWidths:Array = new Array();
		private var _columnWidthsChanged:Boolean = false;
		
		/**
		 * Sets the widths of each of the columns. The widths can either be percentages or
		 * explicit widths. For each column in the DataGrid, there should be a column width
		 * value. The column widths should be expressed as strings.
		 * 
		 * If there are 4 columns and we want the 1st column to be 40% width, the 2nd column 
		 * to be 60% width, the 3rd column to be a fixed width of 200, and the 4th column to
		 * be a fixed width of 300. Then we would set the columnWidths property to be: 
		 * ['40%', '60%', 200, 300]
		 */
		public function set columnWidths(values:Array):void
		{
			if (_columnWidths != values)
			{
				_columnWidths = values;
				_columnWidthsChanged = true;
				
				invalidateProperties();
				invalidateDisplayList();
			}
		}
		
		public function get columnWidths():Array
		{
			return _columnWidths;
		}
		public function LabelDataGrid()
		{
			super();
			addEventListener(DataGridEvent.COLUMN_STRETCH, onColumnStretch);
		}
		
		/**
		 * @private
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_columnWidthsChanged)
			{
				splitPercentWidths(columnWidths);
				_columnWidthsChanged = false;
			}
		}
		
		/**
		 * @private
		 * Sizes each of the columns in the DataGrid based on the columnWidths property,
		 * unless the user has manually resized the columns, then the column widths will
		 * not be adjusted.
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// Determine how much width is left over for percentage calculations after the fixed
			// widths are allocated.
			var leftoverWidth:Number = unscaledWidth;
			for each (var explicitColWidth:Number in _explicitColWidths)
			{
				leftoverWidth -= explicitColWidth;
			}
			
			// Manually adjust the column width before doing super.updateDisplayList. This way when 
			// super.updateDisplayList is called, it can perform any minor adjustments to the columns, 
			// but the column widths will still be pretty consistant with the specified widths.
			if (columns && columnWidths && !_columnsAdjusted && columns.length == columnWidths.length) 
			{
				for (var i:int = 0; i < columnWidths.length; i++) 
				{
					var w:Number = 0;
					if (_explicitColWidths[i])
					{
						w = _explicitColWidths[i];
					}
					else
					{
						w = leftoverWidth * (_percentColWidths[i] / 100);
					}
					
					// Adjust the column's width. After digging through the DataGridColumn, I found 
					// 3 different properties that need to be set to override the default column width 
					// calculations performed by DataGrid and DataGridColumn. They are _width (changed 
					// in the setWidth method), explicitWidth, and preferredWidth.
					columns[i].setWidth(w);
					columns[i].explicitWidth = w;
					columns[i].preferredWidth = w;
				}
			}
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
		
		/**
		 * Called from the <code>commitProperties()</code> method to break up the columnWidths
		 * into percentage based widths and explicit widths.
		 * 
		 * When we calculate the percentage widths in <code>updateDisplayList()</code> we need
		 * to know the remaining available width after explicit widths are subtracted.
		 */
		private function splitPercentWidths(values:Array):void
		{
			if (columns && columnWidths && columnWidths.length > 0)
			{
				_percentColWidths = new Object();
				_explicitColWidths = new Object();
				
				for (var i:uint = 0; i < columnWidths.length; i++)
				{
					var columnWidth:String = columnWidths[i] + "";
					
					// If columnWidth contains a '%' then it is a percentage width, otherwise
					// it is an explicit width.
					if (columnWidth.indexOf("%") == -1)
					{
						_explicitColWidths[i] = Number(columnWidth);
					}
					else 
					{
						_percentColWidths[i] = Number(columnWidth.substr(0, columnWidth.length - 1));
					}
				}
			}
		}
		
		/**
		 * @private
		 */
		private function onColumnStretch(event:DataGridEvent):void 
		{
			_columnsAdjusted = true;
		}
	}
}