package com.gazuntite.common.dto.assessment.diagnosis
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.utils.UtilityFunctions;
	
	
	[Bindable]
	public class DiagnosisDTO extends BaseDTO
	{	
		private var _OnSet:String 		= "";
		private var _IsChronic:Boolean;
		private var _IsActive:Boolean;
		private var _IsNA:Boolean = false;
		private var _ID:int;
		private var _DiagnosisId:String = "0";
		private var _IcdDto:ICDCodeDTO;
		private var _ResolvedDate:String='';
		private var _DiagnosisType:String;
		private var _AssociateType: String = '';
		
		/**
		 * showActiveField controls the visibility of active buttons
		 * */
		private var _showActiveField:Boolean;
		private var _isSelected:Boolean;
		
		public function DiagnosisDTO()
		{
			IcdDto = new ICDCodeDTO();
		}

		public function get DiagnosisType():String
		{
			return _DiagnosisType;
		}
		public function get label():String
		{
			return IcdDto.IcdCodeDescription;
		}

		public function set DiagnosisType(value:String):void
		{
			_DiagnosisType = value;
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

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
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
		
		public function get ResolvedDate():String
		{
			return _ResolvedDate;
		}
		
		public function set ResolvedDate(value:String):void
		{
			_ResolvedDate = value;
		}
		
		public function get showActiveField():Boolean
		{
			return _showActiveField;
		}
		
		public function set showActiveField(value:Boolean):void
		{
			_showActiveField = value;
		}
		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		public function get FilterFeild():String
		{
			return IcdDto.IcdCodeDescription;
			
		}
		
		public function get AssociateType():String
		{
			return _AssociateType;
		}
		
		public function set AssociateType(value:String):void
		{
			_AssociateType = value;
		}

		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.DiagnosisType 			= x.@DiagnosisType;
			this.OnSet 					= x.@OnSet;
			this.IsChronic 				= UtilityFunctions.StringToBoolean(x.@IsChronic);
			this.IsActive 				= UtilityFunctions.StringToBoolean(x.@IsActive);
			this.IsNA 					= UtilityFunctions.StringToBoolean(x.@IsNA);
			this.ID 					= x.@ID;
			this.DiagnosisId 			= x.ICDCode[0].@DiagnosisId;
			this.ResolvedDate 			= x.@ResolvedDate;
			this.AssociateType			= x.@AssociateType;
			
			IcdDto.FromXML(x.ICDCode[0]);
		}
		
		public override  function ToXML():XML
		{
			this.nodeName 		= "PatientDiagnosisDTO ";
			var x:XML 			= super.ToXML();
			
			x.@OnSet 			= this.OnSet;
			x.@IsChronic 		= this.IsChronic;
			x.@IsActive			= this.IsActive;
			x.@IsNA				= this.IsNA;
			x.@ID 				= this.ID;
			x.@ResolvedDate 	= this.ResolvedDate;
			x.@AssociateType	= this.AssociateType;
			
			IcdDto.nodename 	= "ICDCode";
			x.appendChild(IcdDto.ToXML());
			x.ICDCode[0].@DiagnosisId = this.DiagnosisId;
			
			return x;
		}
	}
}