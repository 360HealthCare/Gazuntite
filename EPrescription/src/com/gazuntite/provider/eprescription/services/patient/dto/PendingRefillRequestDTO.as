package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.provider.eprescription.services.patient.dto.PharmacyDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.PharmacyPatientDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.PrescriberDTO;

	[Bindable]
	public class PendingRefillRequestDTO
	{
		//constructor method
		public function PendingRefillRequestDTO()
		{
			prescriberDTO 			= new PrescriberDTO();
			pharmacyDTO   			= new PharmacyDTO();
			pharmacyPatientDTO   	= new PharmacyPatientDTO();
		}
		
		private var m_oprescriberDTO:PrescriberDTO;
		private var m_opharmacyDTO:PharmacyDTO;
		private var m_opharmacyPatientDTO:PharmacyPatientDTO;
		
		private var m_sSentTime:String;
		private var m_sRxReferenceNumber:String;
		private var m_sPON:String;
		private var m_sPreDrugDescription:String;
		private var m_sPrescriberMedNDCCODE:String;
		private var m_sPrescriberMedNDCCODEQualifier:String;
		private var m_sPreQuantity:String;
		private var m_sPreCodeListQual:String;
		private var m_sPreUnitSourceCode:String;
		private var m_sPresPotenctUnit:String;
		private var m_sPresciberDaysSupply:String;
		private var m_sPresDirection:String;
		private var m_sPreRefill:String;
		private var m_sPreisPRN:String;
		private var m_sPreSubstitution:String;
		private var m_sPreWrittenDate:String;
		private var m_sDispDrugDescription:String;
		private var m_sDispNDCCODE:String;
		private var m_sDispNDCCODEQualifier:String;
		private var m_sDisQuantity:String;
		private var m_sDisCodeListQualifier:String;
		private var m_sDisUnitSourceCode:String;
		private var m_sDisPotencyUnit:String;
		private var m_sDisDaysSupplied:String;
		private var m_sDisDirection:String;
		private var m_sDisRefill:String;
		private var m_sDisisPRN:String;
		private var m_sDisSubstitution:String;
		private var m_sDisWrittenDate:String;
		private var m_sDisLastFIllDate:String;
		private var m_sGaxenRefillRequestID:String;
		private var m_sDoseForm:String;
		private var m_sStrength:String;
		private var m_sVisitDate:String;
		private var m_sRoute:String;
		private var m_sfrequency:String;
		
		public function FromXML( x:XML ):void
		{
			var x1:XML = x.PendingRefillRequest[0];
			SentTime 						= x1.@['SentTime'];
			RxReferenceNumber   			= x1.@['RxReferenceNumber'];
			PON   							= x1.@['PON'];
			PreDrugDescription   			= x1.@['PreDrugDescription'];
			PrescriberMedNDCCODE   			= x1.@['PrescriberMedNDCCODE'];
			PrescriberMedNDCCODEQualifier   = x1.@['PrescriberMedNDCCODEQualifier'];
			PreQuantity   					= x1.@['PreQuantity'];
			PreCodeListQual   				= x1.@['PreCodeListQual'];
			PreUnitSourceCode   			= x1.@['PreUnitSourceCode'];
			PresPotenctUnit   				= x1.@['PresPotenctUnit'];
			PresciberDaysSupply   			= x1.@['PresciberDaysSupply'];
			PresDirection   				= x1.@['PresDirection'];
			PreRefill   					= x1.@['PreRefill'];
			PreisPRN   						= x1.@['PreisPRN'];
			PreSubstitution   				= x1.@['PreSubstitution'];
			PreWrittenDate   				= x1.@['PreWrittenDate'];
			DispDrugDescription   			= x1.@['DispDrugDescription'];
			DispNDCCODE   					= x1.@['DispNDCCODE'];
			DispNDCCODEQualifier   			= x1.@['DispNDCCODEQualifier'];
			DisQuantity   					= x1.@['DisQuantity'];
			DisCodeListQualifier   			= x1.@['DisCodeListQualifier'];
			DisUnitSourceCode   			= x1.@['DisUnitSourceCode'];
			DisPotencyUnit   				= x1.@['DisPotencyUnit'];
			DisDaysSupplied   				= x1.@['DisDaysSupplied'];
			DisDirection   					= x1.@['DisDirection'];
			DisRefill   					= x1.@['DisRefill'];
			DisisPRN   						= x1.@['DisisPRN'];
			DisSubstitution   				= x1.@['DisSubstitution'];
			DisWrittenDate   				= x1.@['DisWrittenDate'];
			DisLastFIllDate   				= x1.@['DisLastFIllDate'];
			GaxenRefillRequestID   			= x1.@['GaxenRefillRequestID'];
			DoseForm   						= x1.@['DoseForm'];
			Strength   						= x1.@['Strength'];
			VisitDate   					= x1.@['VisitDate'];
			Route   						= x1.@['Route'];
			frequency   					= x1.@['frequency'];
			
			prescriberDTO.FromXML(x.Prescriber[0]);
			pharmacyDTO.FromXML(x.Pharmacy[0]);
			pharmacyPatientDTO.FromXML(x.Patient[0]);
		}
		
		public function ToXML(data:Object):XML
		{
			var xml:XML /*= SchedulerXmlUtils.getNodeByTagName( "Type" );
			xml.@[SchedulerXmlConstants.ID]						= data.Type.ID;
			xml.@[SchedulerXmlConstants.NAME]					= data.Type.Name;*/
			return xml;
		}
		//********************** GETTER & SETTER *****************************
		public function get SentTime():String
		{
			return m_sSentTime;
		}
		
		public function set SentTime(value:String):void
		{
			m_sSentTime = value;
		}

		public function get RxReferenceNumber():String
		{
			return m_sRxReferenceNumber;
		}

		public function set RxReferenceNumber(value:String):void
		{
			m_sRxReferenceNumber = value;
		}

		public function get PON():String
		{
			return m_sPON;
		}

		public function set PON(value:String):void
		{
			m_sPON = value;
		}

		public function get PreDrugDescription():String
		{
			return m_sPreDrugDescription;
		}

		public function set PreDrugDescription(value:String):void
		{
			m_sPreDrugDescription = value;
		}

		public function get PrescriberMedNDCCODE():String
		{
			return m_sPrescriberMedNDCCODE;
		}

		public function set PrescriberMedNDCCODE(value:String):void
		{
			m_sPrescriberMedNDCCODE = value;
		}

		public function get PrescriberMedNDCCODEQualifier():String
		{
			return m_sPrescriberMedNDCCODEQualifier;
		}

		public function set PrescriberMedNDCCODEQualifier(value:String):void
		{
			m_sPrescriberMedNDCCODEQualifier = value;
		}

		public function get PreQuantity():String
		{
			return m_sPreQuantity;
		}

		public function set PreQuantity(value:String):void
		{
			m_sPreQuantity = value;
		}

		public function get PreCodeListQual():String
		{
			return m_sPreCodeListQual;
		}

		public function set PreCodeListQual(value:String):void
		{
			m_sPreCodeListQual = value;
		}

		public function get PreUnitSourceCode():String
		{
			return m_sPreUnitSourceCode;
		}

		public function set PreUnitSourceCode(value:String):void
		{
			m_sPreUnitSourceCode = value;
		}

		public function get PresPotenctUnit():String
		{
			return m_sPresPotenctUnit;
		}

		public function set PresPotenctUnit(value:String):void
		{
			m_sPresPotenctUnit = value;
		}

		public function get PresciberDaysSupply():String
		{
			return m_sPresciberDaysSupply;
		}

		public function set PresciberDaysSupply(value:String):void
		{
			m_sPresciberDaysSupply = value;
		}

		public function get PresDirection():String
		{
			return m_sPresDirection;
		}

		public function set PresDirection(value:String):void
		{
			m_sPresDirection = value;
		}

		public function get PreRefill():String
		{
			return m_sPreRefill;
		}

		public function set PreRefill(value:String):void
		{
			m_sPreRefill = value;
		}

		public function get PreisPRN():String
		{
			return m_sPreisPRN;
		}

		public function set PreisPRN(value:String):void
		{
			m_sPreisPRN = value;
		}

		public function get PreSubstitution():String
		{
			return m_sPreSubstitution;
		}

		public function set PreSubstitution(value:String):void
		{
			m_sPreSubstitution = value;
		}

		public function get PreWrittenDate():String
		{
			return m_sPreWrittenDate;
		}

		public function set PreWrittenDate(value:String):void
		{
			m_sPreWrittenDate = value;
		}

		public function get DispDrugDescription():String
		{
			return m_sDispDrugDescription;
		}

		public function set DispDrugDescription(value:String):void
		{
			m_sDispDrugDescription = value;
		}

		public function get DispNDCCODE():String
		{
			return m_sDispNDCCODE;
		}

		public function set DispNDCCODE(value:String):void
		{
			m_sDispNDCCODE = value;
		}

		public function get DispNDCCODEQualifier():String
		{
			return m_sDispNDCCODEQualifier;
		}

		public function set DispNDCCODEQualifier(value:String):void
		{
			m_sDispNDCCODEQualifier = value;
		}

		public function get DisQuantity():String
		{
			return m_sDisQuantity;
		}

		public function set DisQuantity(value:String):void
		{
			m_sDisQuantity = value;
		}

		public function get DisCodeListQualifier():String
		{
			return m_sDisCodeListQualifier;
		}

		public function set DisCodeListQualifier(value:String):void
		{
			m_sDisCodeListQualifier = value;
		}

		public function get DisUnitSourceCode():String
		{
			return m_sDisUnitSourceCode;
		}

		public function set DisUnitSourceCode(value:String):void
		{
			m_sDisUnitSourceCode = value;
		}

		public function get DisPotencyUnit():String
		{
			return m_sDisPotencyUnit;
		}

		public function set DisPotencyUnit(value:String):void
		{
			m_sDisPotencyUnit = value;
		}

		public function get DisDaysSupplied():String
		{
			return m_sDisDaysSupplied;
		}

		public function set DisDaysSupplied(value:String):void
		{
			m_sDisDaysSupplied = value;
		}

		public function get DisDirection():String
		{
			return m_sDisDirection;
		}

		public function set DisDirection(value:String):void
		{
			m_sDisDirection = value;
		}

		public function get DisRefill():String
		{
			return m_sDisRefill;
		}

		public function set DisRefill(value:String):void
		{
			m_sDisRefill = value;
		}

		public function get DisisPRN():String
		{
			return m_sDisisPRN;
		}

		public function set DisisPRN(value:String):void
		{
			m_sDisisPRN = value;
		}

		public function get DisSubstitution():String
		{
			return m_sDisSubstitution;
		}

		public function set DisSubstitution(value:String):void
		{
			m_sDisSubstitution = value;
		}

		public function get DisWrittenDate():String
		{
			return m_sDisWrittenDate;
		}

		public function set DisWrittenDate(value:String):void
		{
			m_sDisWrittenDate = value;
		}

		public function get DisLastFIllDate():String
		{
			return m_sDisLastFIllDate;
		}

		public function set DisLastFIllDate(value:String):void
		{
			m_sDisLastFIllDate = value;
		}

		public function get GaxenRefillRequestID():String
		{
			return m_sGaxenRefillRequestID;
		}

		public function set GaxenRefillRequestID(value:String):void
		{
			m_sGaxenRefillRequestID = value;
		}

		public function get DoseForm():String
		{
			return m_sDoseForm;
		}

		public function set DoseForm(value:String):void
		{
			m_sDoseForm = value;
		}

		public function get Strength():String
		{
			return m_sStrength;
		}

		public function set Strength(value:String):void
		{
			m_sStrength = value;
		}

		public function get VisitDate():String
		{
			return m_sVisitDate;
		}

		public function set VisitDate(value:String):void
		{
			m_sVisitDate = value;
		}

		public function get Route():String
		{
			return m_sRoute;
		}

		public function set Route(value:String):void
		{
			m_sRoute = value;
		}

		public function get frequency():String
		{
			return m_sfrequency;
		}

		public function set frequency(value:String):void
		{
			m_sfrequency = value;
		}

		public function get prescriberDTO():PrescriberDTO
		{
			return m_oprescriberDTO;
		}

		public function set prescriberDTO(value:PrescriberDTO):void
		{
			m_oprescriberDTO = value;
		}

		public function get pharmacyDTO():PharmacyDTO
		{
			return m_opharmacyDTO;
		}

		public function set pharmacyDTO(value:PharmacyDTO):void
		{
			m_opharmacyDTO = value;
		}

		public function get pharmacyPatientDTO():PharmacyPatientDTO
		{
			return m_opharmacyPatientDTO;
		}

		public function set pharmacyPatientDTO(value:PharmacyPatientDTO):void
		{
			m_opharmacyPatientDTO = value;
		}

		
	}
}