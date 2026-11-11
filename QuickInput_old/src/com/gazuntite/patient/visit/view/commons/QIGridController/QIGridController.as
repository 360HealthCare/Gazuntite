package com.gazuntite.patient.visit.view.commons.QIGridController
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	import com.gazuntite.common.view.events.DataGridActionsEvent;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.events.Event;
	
	import mx.controls.DataGrid;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.events.DataGridEvent;
	import mx.events.ListEvent;

	public class QIGridController
	{
		private var _dataGrid:DataGrid;
		private var _saveRecordCallBack:Function;
		private var _editRecordCallBack:Function;
		private var _deleteRecordCallBack:Function;
		private var _editBeginCallBack:Function;
		private var _editEndCallBack:Function;
		
		private var _recordInEditableModeIndex:int;
		private var _recordToBeEditableIndex:int;
		private var _actionButtonsColumnIndex:int;
		private var _firstColToBeEditableIndex:int;
		private var _firstColDataField:String;
		
		private var isOnlyDestroyEditors:Boolean;
		
		public function QIGridController(dataGridVal:DataGrid=null, saveRecordCallBackVal:Function=null, editRecordCallBackVal:Function=null,
										 deleteRecordCallBackVal:Function=null, editBeginCallBackVal:Function=null, editEndCallBackVal:Function=null, actionButtonsColumnIndexVal:int = 0,
										firstColToBeEditableIndexVal:int = 0, firstColDataFieldVal:String="")
		{
			_dataGrid = dataGridVal;
			_saveRecordCallBack = saveRecordCallBackVal;
			_editRecordCallBack = editRecordCallBackVal;
			_deleteRecordCallBack = deleteRecordCallBackVal;
			_editBeginCallBack = editBeginCallBackVal;
			_editEndCallBack = editEndCallBackVal;
			_actionButtonsColumnIndex = actionButtonsColumnIndexVal;
			_firstColToBeEditableIndex = firstColToBeEditableIndexVal;
			_firstColDataField = firstColDataFieldVal;
			
			registerEvents();
		}
		
		public function get dataGrid():DataGrid
		{
			return _dataGrid;
		}

		public function set dataGrid(value:DataGrid):void
		{
			if (dataGrid != value)
			{
				_dataGrid = value;
				registerEvents();
			}
		}
		
		public function get saveRecordCallBack():Function
		{
			return _saveRecordCallBack;
		}
		
		public function set saveRecordCallBack(value:Function):void
		{
			_saveRecordCallBack = value;
		}
		
		public function get editRecordCallBack():Function
		{
			return _editRecordCallBack;
		}
		
		public function set editRecordCallBack(value:Function):void
		{
			_editRecordCallBack = value;
		}
		
		public function get deleteRecordCallBack():Function
		{
			return _deleteRecordCallBack;
		}
		
		public function set deleteRecordCallBack(value:Function):void
		{
			_deleteRecordCallBack = value;
		}
		
		public function get editBeginCallBack():Function
		{
			return _editBeginCallBack;
		}
		
		public function set editBeginCallBack(value:Function):void
		{
			_editBeginCallBack = value;
		}
		
		public function get editEndCallBack():Function
		{
			return _editEndCallBack;
		}
		
		public function set editEndCallBack(value:Function):void
		{
			_editEndCallBack = value;
		}

		public function get recordInEditableModeIndex():int
		{
			return _recordInEditableModeIndex;
		}
		
		private function setRecordInEditableModeIndex(value:int):void
		{
			_recordInEditableModeIndex = value;
			
			if (dataGrid && _recordInEditableModeIndex == -1)
				dataGrid.enabled = false;
		}
		
		public function get recordToBeEditableIndex():int
		{
			return _recordToBeEditableIndex;
		}
		
		public function get actionButtonsColumnIndex():int
		{
			return _actionButtonsColumnIndex;
		}
		
		public function set actionButtonsColumnIndex(value:int):void
		{
			_actionButtonsColumnIndex = value;
		}
		
		public function get firstColToBeEditableIndex():int
		{
			return _firstColToBeEditableIndex;
		}
		
		public function set firstColToBeEditableIndex(value:int):void
		{
			_firstColToBeEditableIndex = value;
		}
		
		public function get firstColDataField():String
		{
			return _firstColDataField;
		}
		
		public function set firstColDataField(value:String):void
		{
			_firstColDataField = value;
		}
		
		private function registerEvents():void
		{
			if (!dataGrid)
				return;
			
			dataGrid.addEventListener(DataGridActionsEvent.SAVE_RECORD_CLICK, saveRecordClickHandler, false, 0, true);
			dataGrid.addEventListener(DataGridActionsEvent.EDIT_RECORD_CLICK, editRecordClickHandler, false, 0, true);
			dataGrid.addEventListener(DataGridActionsEvent.DELETE_RECORD_CLICK, deleteRecordClickHandler, false, 0, true);
			
			
			dataGrid.addEventListener(DataGridEvent.ITEM_EDIT_BEGIN, dataGridItemEditBeginHandler, false, 0, true);
			dataGrid.addEventListener(DataGridEvent.ITEM_EDIT_END, dataGridItemEditEndHandler, false, 0, true);
		}
		
		private function saveRecordClickHandler(event:DataGridActionsEvent):void
		{
			if (null == saveRecordCallBack)
				return;
			
			saveRecordCallBack(event);
			
			if (dataGrid)
				dataGrid.editable = false;
		}
		
		private function editRecordClickHandler(event:DataGridActionsEvent):void
		{
			if (null != editRecordCallBack)
			{
				editRecordCallBack(event);
			}
		}
		
		private function deleteRecordClickHandler(event:DataGridActionsEvent):void
		{
			if (null != deleteRecordCallBack)
				deleteRecordCallBack(event);
		}
		
		private function dataGridItemEditBeginHandler(event:DataGridEvent):void
		{
			if (null == editBeginCallBack)
				return;
			
			editBeginCallBack(event);
		}
		
		private function dataGridItemEditEndHandler(event:DataGridEvent):void
		{
			if (null != editEndCallBack)
				editEndCallBack(event);
		}
	}
}