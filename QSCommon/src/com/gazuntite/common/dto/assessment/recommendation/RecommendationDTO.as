package com.gazuntite.common.dto.assessment.recommendation
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.utils.UtilityFunctions;
	

	[Bindable]
	public class RecommendationDTO extends BaseDTO
	{ 
		private var _plantype:GeneralTypeDTO;
		private var _methodtype:GeneralTypeDTO;
		private var _DurationType:GeneralTypeDTO;
		
		private var _PatientDiagnosisID:int;
		private var _DiagnosisInfo:String;
		
		private var _IsDiscussedWithPatient:Boolean;
		private var _Description:String;
		private var _ClinicBranchID:int;
		private var _Links:String;
		
		private var _IsActive:Boolean;
		private var _PatientRecommendationID:int;
		private var _CreatedByUserTypeID:int;
		private var _ModifiedByUserTypeID:int;
		private var _ID:int
		
		public function RecommendationDTO()
		{
			plantype = new GeneralTypeDTO();
			methodtype = new GeneralTypeDTO();
			DurationType = new GeneralTypeDTO();
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public function get ModifiedByUserTypeID():int
		{
			return _ModifiedByUserTypeID;
		}
		public function get label():String
		{
			return this.plantype.Name;
		}

		public function set ModifiedByUserTypeID(value:int):void
		{
			_ModifiedByUserTypeID = value;
		}

		public function get CreatedByUserTypeID():int
		{
			return _CreatedByUserTypeID;
		}

		public function set CreatedByUserTypeID(value:int):void
		{
			_CreatedByUserTypeID = value;
		}

		public function get PatientRecommendationID():int
		{
			return _PatientRecommendationID;
		}

		public function set PatientRecommendationID(value:int):void
		{
			_PatientRecommendationID = value;
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get Links():String
		{
			return _Links;
		}

		public function set Links(value:String):void
		{
			_Links = value;
		}

		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get IsDiscussedWithPatient():Boolean
		{
			return _IsDiscussedWithPatient;
		}

		public function set IsDiscussedWithPatient(value:Boolean):void
		{
			_IsDiscussedWithPatient = value;
		}

		public function get PatientDiagnosisID():int
		{
			return _PatientDiagnosisID;
		}
		
		public function set PatientDiagnosisID(value:int):void
		{
			_PatientDiagnosisID = value;
		}
		
		public function get DiagnosisInfo():String
		{
			return _DiagnosisInfo;
		}
		
		public function set DiagnosisInfo(value:String):void
		{
			_DiagnosisInfo = value;
		}

		public function get DurationType():GeneralTypeDTO
		{
			return _DurationType;
		}

		public function set DurationType(value:GeneralTypeDTO):void
		{
			_DurationType = value;
		}

		public function get methodtype():GeneralTypeDTO
		{
			return _methodtype;
		}

		public function set methodtype(value:GeneralTypeDTO):void
		{
			_methodtype = value;
		}

		public function get plantype():GeneralTypeDTO
		{
			return _plantype;
		}

		public function set plantype(value:GeneralTypeDTO):void
		{
			_plantype = value;
		}
		
		public function get FilterFeild():String
		{
			return plantype.Name;
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.IsDiscussedWithPatient = UtilityFunctions.StringToBoolean( x.@IsDiscussedWithPatient);
			this.Description = x.@Description;
			this.ClinicBranchID	= x.@ClinicBranchID;
			this.IsActive = UtilityFunctions.StringToBoolean(x.@IsActive);
			this.PatientRecommendationID = x.@PatientRecommendationID;
			this.CreatedByUserTypeID = x.@CreatedByUserTypeID;
			this.ModifiedByUserTypeID = x.@ModifiedByUserTypeID;
			this.ID	= x.@ID;
			//this.PatientDiagnosisID = x.@PatientDiagnosisID;
			this.PatientDiagnosisID = x.@ID;
			this.DiagnosisInfo = x.@DiagnosisInfo;
			this.Links = x.@Links;
			
			var xPlan:XML = x.Plan[0];
			if( null != xPlan )
				this.plantype.FromXML(xPlan);		
			
			var xMethod:XML = x.Method[0];
			if( null != xMethod )
				this.methodtype.FromXML(xMethod); 							

			var xDuration:XML = x.Duration[0];
			if( null != xDuration )
				this.DurationType.FromXML(xDuration);
		}
		
		public override function ToXML():XML
		{
			nodeName = "PatientRecommendationDTO";
			
			var x:XML = super.ToXML();
			
			x.@IsDiscussedWithPatient = this.IsDiscussedWithPatient; 
			x.@Description = this.Description;
			x.@ClinicBranchID = this.ClinicBranchID;
			x.@IsActive = this.IsActive;
			x.@PatientRecommendationID = this.PatientRecommendationID;
			x.@CreatedByUserTypeID = this.CreatedByUserTypeID	
			x.@ModifiedByUserTypeID = this.ModifiedByUserTypeID;
			x.@ID = this.ID;
			//x.@PatientDiagnosisID = this.PatientDiagnosisID;
			x.@ID = this.PatientDiagnosisID;
			x.@DiagnosisInfo = this.DiagnosisInfo;
			x.@Links = this.Links;
			
			if (plantype)
			{
				plantype.NodeName = "Plan";
				x.appendChild(plantype.ToXML());
			}
			
			if (methodtype)
			{
				methodtype.NodeName = "Method";
				x.appendChild(methodtype.ToXML());
			}
			
			if (DurationType)
			{
				DurationType.NodeName = "Duration";
				x.appendChild(DurationType.ToXML());
			}
			
			return x;
		}
	}
}