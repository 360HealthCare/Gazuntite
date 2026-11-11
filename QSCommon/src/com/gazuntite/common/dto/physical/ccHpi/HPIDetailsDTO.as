package com.gazuntite.common.dto.physical.ccHpi
{
	import com.gazuntite.common.util.xml.XmlUtils;
	

	[Bindable]
	public class HPIDetailsDTO
	{
		private var _Symptom:String = '';
		private var _Location:String = '';
		private var _Severity:String = '';
		private var _ModifyingFactors:String = '';
		private var _Progression:String = '';
		private var _Onset:String = '';
		private var _Duration:String = '';
		private var _Quality:String = '';
		private var _Context:String = '';
		private var _Exacerbating:String = '';
		private var _Radiation:String = '';

		
		public function HPIDetailsDTO()
		{
			
		}
		
		public function get Radiation():String
		{
			return _Radiation;
		}

		public function set Radiation(value:String):void
		{
			_Radiation = value;
		}

		public function get Exacerbating():String
		{
			return _Exacerbating;
		}

		public function set Exacerbating(value:String):void
		{
			_Exacerbating = value;
		}

		public function get Context():String
		{
			return _Context;
		}

		public function set Context(value:String):void
		{
			_Context = value;
		}

		public function get Quality():String
		{
			return _Quality;
		}

		public function set Quality(value:String):void
		{
			_Quality = value;
		}

		public function get Duration():String
		{
			return _Duration;
		}

		public function set Duration(value:String):void
		{
			_Duration = value;
		}

		public function get Onset():String
		{
			return _Onset;
		}

		public function set Onset(value:String):void
		{
			_Onset = value;
		}

		public function get Progression():String
		{
			return _Progression;
		}

		public function set Progression(value:String):void
		{
			_Progression = value;
		}

		public function get ModifyingFactors():String
		{
			return _ModifyingFactors;
		}

		public function set ModifyingFactors(value:String):void
		{
			_ModifyingFactors = value;
		}

		public function get Severity():String
		{
			return _Severity;
		}

		public function set Severity(value:String):void
		{
			_Severity = value;
		}

		public function get Location():String
		{
			return _Location;
		}

		public function set Location(value:String):void
		{
			_Location = value;
		}

		public function get Symptom():String
		{
			return _Symptom;
		}

		public function set Symptom(value:String):void
		{
			_Symptom = value;
		}
			
		public  function FromXML(x:XML):void
		{
			this.Symptom  =x.@Symptom;
			this.Location  =x.@Location;
			this.Severity  =x.@Severity;
			this.ModifyingFactors  =x.@ModifyingFactors;
			this.Progression  =x.@Progression;
			this.Onset  =x.@Onset;
			this.Duration  =x.@Duration;
			this.Quality  =x.@Quality;
			this.Context  =x.@Context;
			this.Exacerbating  =x.@Exacerbating;
			this.Radiation  =x.@Radiation;

		}
		
		public  function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("Fields");
			
			x.@Symptom 	=this.Symptom;
			x.@Location =this.Location;
			x.@Severity =this.Severity;
			x.@ModifyingFactors	=this.ModifyingFactors;
			x.@Progression	=this.Progression;
			x.@Onset			=this.Onset ;
			x.@Duration			=this.Duration;
			x.@Quality			=this.Quality ;
			x.@Context			=this.Context ;
			x.@Exacerbating		=this.Exacerbating;
			x.@Radiation		=this.Radiation ;
				
			return x;
		}
	}
}