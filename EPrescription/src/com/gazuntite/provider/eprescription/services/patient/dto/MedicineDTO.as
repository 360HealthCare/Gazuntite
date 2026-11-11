package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.common.dto.MedRXDTO;
	
	import flash.utils.flash_proxy;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class MedicineDTO
	{
		private var _Product:MedicationProductDTO;
		private var _Drug:MedicationDrugDTO;
		private var _NDC:MedicationNdcDTO;
		
		
		private var _STRENGTH_ID:int;
		private var _STRENGTH_DESCRIPTION:String = "";
		
		
		
		public function get NDC():MedicationNdcDTO
		{
			return _NDC;
		}

		public function set NDC(value:MedicationNdcDTO):void
		{
			_NDC = value;
		}

		public function get Drug():MedicationDrugDTO
		{
			return _Drug;
		}

		public function set Drug(value:MedicationDrugDTO):void
		{
			_Drug = value;
		}

		public function get STRENGTH_DESCRIPTION():String
		{
			return _STRENGTH_DESCRIPTION;
		}
		
		public function set STRENGTH_DESCRIPTION(value:String):void
		{
			_STRENGTH_DESCRIPTION = value;
		}
		
		public function get STRENGTH_ID():int
		{
			return _STRENGTH_ID;
		}
		
		public function set STRENGTH_ID(value:int):void
		{
			_STRENGTH_ID = value;
		}
		
		public function FromXML(x:XML):void
		{
			STRENGTH_ID 						= x.@STRENGTH_ID;
			STRENGTH_DESCRIPTION				= x.@STRENGTH_DESCRIPTION;
		}
		
		
		public function MedicineDTO()
		{
			Product = new MedicationProductDTO();
			Drug	= new MedicationDrugDTO();
			NDC		= new MedicationNdcDTO();
		}
		
		

		public function get Product():MedicationProductDTO
		{
			return _Product;
		}

		public function set Product(value:MedicationProductDTO):void
		{
			_Product = value;
		}

		public function LoadMedDTO(value:MedRXDTO):void
		{
			Product.GenericName = value.GenericName;
			Drug.DrugName = value.drugName;
			NDC.NDC = value.NDCCODE;
		}
		
		public function FromXml(x:XML):void
		{
			
			
			/*<Strength STRENGTH_ID="2814" STRENGTH_DESCRIPTION="10 mg">
				<Product GenericName="Torecan" CSA_CODE="0"/>
				<Drug DRUG_ID="d00857" DrugName="thiethylperazine" rownum="1"/>
				<NDC FORMATTED_NDC="00054-4748-25" NDC="00054474825"/>
			</Strength>*/
			
			STRENGTH_ID 			= x.@STRENGTH_ID;
			STRENGTH_DESCRIPTION 	= x.@STRENGTH_DESCRIPTION;
			
			Product.FromXml(x.Product[0]);
			Drug.FromXml(x.Drug[0]);
			NDC.FromXml(x.NDC[0]);
			
			
		}
	}
}