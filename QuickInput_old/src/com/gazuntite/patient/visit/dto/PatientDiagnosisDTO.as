package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.common.dto.ICDCodeDTO;
	import com.gazuntite.patient.visit.dto.common.BaseDTO;

	[Bindable]
	public class PatientDiagnosisDTO extends BaseDTO
	{
		
		private var _OnSet:String = "";
		private var _IsChronic:Boolean;
		private var _IsActive:Boolean;
		private var _IsNA:Boolean;
		private var _ID:String = "0";
		private var _DiagnosisId:String = "0";
		private var _IcdDto:ICDCodeDTO;
		
		
		public function PatientDiagnosisDTO()
		{
			IcdDto = new ICDCodeDTO();
		}

		public function get IcdDto():ICDCodeDTO
		{
			return _IcdDto;
		}

		public function set IcdDto(value:ICDCodeDTO):void
		{
			_IcdDto = value;
		}

		public function get DiagnosisId():String
		{
			return _DiagnosisId;
		}

		public function set DiagnosisId(value:String):void
		{
			_DiagnosisId = value;
		}

		

		public function get ID():String
		{
			return _ID;
		}

		public function set ID(value:String):void
		{
			_ID = value;
		}

		public function get IsNA():Boolean
		{
			return _IsNA;
		}

		public function set IsNA(value:Boolean):void
		{
			_IsNA = value;
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get IsChronic():Boolean
		{
			return _IsChronic;
		}

		public function set IsChronic(value:Boolean):void
		{
			_IsChronic = value;
		}

		public function get OnSet():String
		{
			return _OnSet;
		}

		public function set OnSet(value:String):void
		{
			_OnSet = value;
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			this.OnSet         	=x.@OnSet;
			this.IsChronic     	=StringToBoolean(x.@IsChronic);
			this.IsActive       =StringToBoolean(x.@IsActive);
			this.IsNA         	=StringToBoolean(x.@IsNA);
			this.ID         	=x.@ID;
			this.DiagnosisId  	=x.ICDCode[0].@DiagnosisId;
				
				IcdDto.FromXML(x.ICDCode[0]);
				
			
		}
		
		public override  function ToXML():XML
		{
			this.nodeName = "PatientDiagnosisDTO ";
			var x:XML = super.ToXML();
			
			x.@OnSet			=this.OnSet ;
			x.@IsChronic		=this.IsChronic ;
			x.@IsActive			=this.IsActive ;
			x.@IsNA				=this.IsNA ;
			x.@ID				=this.ID ;
			//x.@DiagnosisId		=this.DiagnosisId ;
			
			
			IcdDto.nodename = "ICDCode";
			x.appendChild( IcdDto.ToXML() )
			x.ICDCode[0].@DiagnosisId = this.DiagnosisId;
			
			return x;
		}
	
	}
}