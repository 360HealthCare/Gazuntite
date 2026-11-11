/**
 * LabDTO is recieved from server which will be then wrapped in LabVO
 * The reason of creating separate LabVO is <property>isSelected</property> and <property>serialNo</property>
 * this property tells which record in list is selected
 * */
package com.gazuntite.provider.live.services.elab.view.lab.vo
{
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;

	[Bindable]
	public class LabVO
	{
		private var _labDTO:ELabDTO;
		private var _isSelected:Boolean;
		private var _serialNumber:int;
		private var _inEditMode:Boolean;
		private var _inExpandedMode:Boolean;
		
		public function LabVO()
		{
		}

		public function get labDTO():ELabDTO
		{
			return _labDTO;
		}

		public function set labDTO(value:ELabDTO):void
		{
			_labDTO = value;
		}

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		public function get serialNumber():int
		{
			return _serialNumber;
		}

		public function set serialNumber(value:int):void
		{
			_serialNumber = value;
		}

		public function get inEditMode():Boolean
		{
			return _inEditMode;
		}

		public function set inEditMode(value:Boolean):void
		{
			_inEditMode = value;
		}

		public function get inExpandedMode():Boolean
		{
			return _inExpandedMode;
		}

		public function set inExpandedMode(value:Boolean):void
		{
			_inExpandedMode = value;
		}
	}
}