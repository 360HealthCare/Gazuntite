package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;

	[Bindable]
	public class PatientRecommendationDTO extends BaseDTO
	{ 
		private var _plantype:GeneralTypeDTO;
		private var _methodtype:GeneralTypeDTO;
		private var _patientDiagnosis:GeneralTypeDTO;
		private var _DurationType:GeneralTypeDTO;
		private var _Diagnosistype:GeneralTypeDTO;
		
		private var _IsDiscussedWithPatient:Boolean;
		private var _Description:String;
		private var _ClinicBranchID:int;
		private var _Links:String;
		
		private var _IsActive:Boolean;
		private var _PatientRecommendationID:int;
		private var _CreatedByUserTypeID:int;
		private var _ModifiedByUserTypeID:int;
		private var _ID:int
		
		
		private var _DiagnosisInfo:String;
		
		public function PatientRecommendationDTO()
		{
			plantype 				= new GeneralTypeDTO();
			methodtype				= new GeneralTypeDTO();
			patientDiagnosis 		= new GeneralTypeDTO();
			DurationType 			= new GeneralTypeDTO();
			Diagnosistype 			= new GeneralTypeDTO();
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

		public function get Diagnosistype():GeneralTypeDTO
		{
			return _Diagnosistype;
		}

		public function set Diagnosistype(value:GeneralTypeDTO):void
		{
			_Diagnosistype = value;
		}

		public function get DurationType():GeneralTypeDTO
		{
			return _DurationType;
		}

		public function set DurationType(value:GeneralTypeDTO):void
		{
			_DurationType = value;
		}

		public function get patientDiagnosis():GeneralTypeDTO
		{
			return _patientDiagnosis;
		}

		public function set patientDiagnosis(value:GeneralTypeDTO):void
		{
			_patientDiagnosis = value;
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
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			
			this.IsDiscussedWithPatient  			=StringToBoolean( x.@IsDiscussedWithPatient);
			this.Description						=x.@Description;
			this.ClinicBranchID						=x.@ClinicBranchID;
			this.IsActive							=StringToBoolean(x.@IsActive);
			this.PatientRecommendationID			=x.@PatientRecommendationID;
			this.CreatedByUserTypeID				=x.@CreatedByUserTypeID;
			this.ModifiedByUserTypeID				=x.@ModifiedByUserTypeID;
			this.ID									=x.@ID;
	
			this.Links								=x.@Links;
			
			this.plantype.FromXML(x.Plan[0]); 				
			this.methodtype.FromXML(x.Method[0]); 							
			this.DurationType.FromXML(x.Duration[0]); 	 			
			
		}
		
		public override function ToXML():XML
		{
			nodeName = "PatientRecommendationDTO";
			var x:XML = super.ToXML();
			x.@IsDiscussedWithPatient   = this.IsDiscussedWithPatient; 
			x.@Description				=this.Description;
			x.@ClinicBranchID			=this.ClinicBranchID;
			x.@IsActive					=this.IsActive;
			x.@PatientRecommendationID	=this.PatientRecommendationID;
			x.@CreatedByUserTypeID		=this.CreatedByUserTypeID	
			x.@ModifiedByUserTypeID		=this.ModifiedByUserTypeID;
			x.@ID						=this.ID;
			x.@Links =this.Links;
			
			if (!plantype)
				plantype = new GeneralTypeDTO();
			
			plantype.NodeName = "Plan";
			x.appendChild(plantype.ToXML());
			
			if (!methodtype)
				methodtype = new GeneralTypeDTO();
			
			methodtype.NodeName = "Method";
			x.appendChild(methodtype.ToXML());
			
			if (!DurationType)
				DurationType = new GeneralTypeDTO();
			
			DurationType.NodeName = "Duration";
			x.appendChild(DurationType.ToXML());
			
			return x;
		}
		
		
		/*public function ToXML():XML
		{
			if(UtilityFunctions.IsNullOrEmpty(nodeName))
			{
				throw("please provide node name");
			}
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			
			x.@DictationID 		=this.DictationID ; 
			x.@VisitID 			=this.VisitID;
			x.@PatientID 		=this.PatientID;	
			x.@ModifiedBy		=this.ModifiedBy;	
			x.@CreatedBy 		=this.CreatedBy;	
			x.@ModifiedAt		= UtilityFunctions.FormatDate(ModifiedAt, "MM-DD-YYYY");	
			//x.@ModifiedAt 		=this.ModifiedAt;
			//x.@VisitDate 		=this.VisitDate;
			x.@VisitDate		= UtilityFunctions.FormatDate(VisitDate, "MM-DD-YYYY");	
			x.@CreatedAt		= UtilityFunctions.FormatDate(CreatedAt, "MM-DD-YYYY");	
			//x.@CreatedAt 		=this.CreatedAt;	
			x.@IsRecordEditable =this.IsRecordEditable;
			x.@IsDirty 			=this.IsDirty;	
			x.@IsDeleted		=this.IsDeleted; 	
			
			return x;
		}*/

	}
}