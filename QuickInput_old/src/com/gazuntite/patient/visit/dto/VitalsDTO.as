package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;

	[Bindable]
	public class VitalsDTO extends BaseDTO
	{
		
		private var _Height:String;
		private var _Weight:String;
		private var _Temperature:String;
		private var _Pulse:String;
		private var _Respiration:String;
		private var _BPSys:String;
		private var _BPDys:String;
		private var _Oxygen:String;
		private var _Editable:String;
		private var _ID:int;
		private var _IsMetricDisplaySelected:Boolean;
		
		
		public function VitalsDTO()
		{
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public function get Editable():String
		{
			return _Editable;
		}

		public function set Editable(value:String):void
		{
			_Editable = value;
		}

		public function get IsMetricDisplaySelected():Boolean
		{
			return _IsMetricDisplaySelected;
		}

		public function set IsMetricDisplaySelected(value:Boolean):void
		{
			_IsMetricDisplaySelected = value;
		}

		public function get BPDys():String
		{
			return _BPDys;
		}

		public function set BPDys(value:String):void
		{
			_BPDys = value;
		}

		public function get Oxygen():String
		{
			return _Oxygen;
		}

		public function set Oxygen(value:String):void
		{
			_Oxygen = value;
		}

		public function get BPSys():String
		{
			return _BPSys;
		}

		public function set BPSys(value:String):void
		{
			_BPSys = value;
		}

		public function get Respiration():String
		{
			return _Respiration;
		}

		public function set Respiration(value:String):void
		{
			_Respiration = value;
		}

		public function get Pulse():String
		{
			return _Pulse;
		}

		public function set Pulse(value:String):void
		{
			_Pulse = value;
		}

		public function get Temperature():String
		{
			return _Temperature;
		}

		public function set Temperature(value:String):void
		{
			_Temperature = value;
		}

		public function get Weight():String
		{
			return _Weight;
		}

		public function set Weight(value:String):void
		{
			_Weight = value;
		}

		public function get Height():String
		{
			return _Height;
		}

		public function set Height(value:String):void
		{
			_Height = value;
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "VitalDTO";
			var x:XML = super.ToXML();
			
			x.@Weight					=this.Weight ;
			x.@Height					=this.Height ;
			x.@Temperature				=this.Temperature ;
			x.@Pulse					=this.Pulse ;
			x.@Respiration				=this.Respiration  ;
			x.@BPSys					=this.BPSys ;
			x.@BPDys					=this.BPDys ;
			x.@Oxygen					=this.Oxygen ;
			x.@IsMetricDisplaySelected	=this.IsMetricDisplaySelected ;
			x.@Editable					=this.Editable ;
			x.@ID						=this.ID;
			
			return x;

		}
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			this.Weight = x.@Weight;
			this.Height = x.@Height;
			this.Temperature = x.@Temperature;
			this.Pulse = x.@Pulse;
			this.Respiration = x.@Respiration;
			this.BPSys = x.@BPSys;
			this.BPDys = x.@BPDys;
			this.Oxygen = x.@BPDys;
			this.IsMetricDisplaySelected =StringToBoolean( x.@IsMetricDisplaySelected);
		}
	}
}