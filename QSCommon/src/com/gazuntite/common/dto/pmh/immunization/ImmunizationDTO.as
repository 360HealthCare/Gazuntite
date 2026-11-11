package com.gazuntite.common.dto.pmh.immunization
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class ImmunizationDTO extends BaseDTO
	{
		private var _DateAdmin : String = '';
		private var _ImmunizationType : GeneralTypeDTO;
		private var _Dose : String = '';
		private var _LotNumber : String = '';
		private var _NextDoseDue : String = '';
		private var _Manufacturer : String = '';
		private var _Rout : String = '';
		private var _RefusalReason : String = '';
		private var _Site : String = '';
		private var _Series : String ='';
		private var _ExpiryDate : String = '';
		private var _UpdatedAt : Date ;
		private var _IsNA:Boolean ; 
		private var _ManagedBy: int;
		private var _ID: int;
		private var _AssociateType: String = '';
		
		
		public function ImmunizationDTO()
		{
		}

		public function get immunizationTypeName():String // for sorting purpose
		{
			return ImmunizationType.Name;
		}


		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public function get ManagedBy():int
		{
			return _ManagedBy;
		}

		public function set ManagedBy(value:int):void
		{
			_ManagedBy = value;
		}

		public function get UpdatedAt():Date
		{
			return _UpdatedAt;
		}

		public function set UpdatedAt(value:Date):void
		{
			_UpdatedAt = value;
		}

		public function get ExpiryDate():String
		{
			return _ExpiryDate;
		}

		public function set ExpiryDate(value:String):void
		{
			_ExpiryDate = value;
		}

		public function get Series():String
		{
			return _Series;
		}

		public function set Series(value:String):void
		{
			_Series = value;
		}

		public function get Site():String
		{
			return _Site;
		}

		public function set Site(value:String):void
		{
			_Site = value;
		}

		public function get RefusalReason():String
		{
			return _RefusalReason;
		}

		public function set RefusalReason(value:String):void
		{
			_RefusalReason = value;
		}

		public function get Rout():String
		{
			return _Rout;
		}

		public function set Rout(value:String):void
		{
			_Rout = value;
		}

		public function get Manufacturer():String
		{
			return _Manufacturer;
		}

		public function set Manufacturer(value:String):void
		{
			_Manufacturer = value;
		}

		public function get IsNA():Boolean
		{
			return _IsNA;
		}

		public function set IsNA(value:Boolean):void
		{
			_IsNA = value;
		}

		public function get NextDoseDue():String
		{
			return _NextDoseDue;
		}

		public function set NextDoseDue(value:String):void
		{
			_NextDoseDue = value;
		}

		public function get LotNumber():String
		{
			return _LotNumber;
		}

		public function set LotNumber(value:String):void
		{
			_LotNumber = value;
		}

		public function get Dose():String
		{
			return _Dose;
		}

		public function set Dose(value:String):void
		{
			_Dose = value;
		}

		public function get ImmunizationType():GeneralTypeDTO
		{
			return _ImmunizationType;
		}

		public function set ImmunizationType(value:GeneralTypeDTO):void
		{
			_ImmunizationType = value;
		}

		public function get DateAdmin():String
		{
			return _DateAdmin;
		}

		public function set DateAdmin(value:String):void
		{
			_DateAdmin = value;
		}
		
		public function get FilterFeild():String
		{
			return ImmunizationType.Name;
		}

		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.DateAdmin						=x.@DateAdmin;
			this.ID								= x.@ID;
			this.Dose 							= x.@Dose;
			this.LotNumber 						= x.@LotNumber;
			this.NextDoseDue 					= x.@NextDoseDue;
			this.Manufacturer 					= x.@Manufacturer;
			this.Rout 							= x.@Rout;
			this.RefusalReason 					= x.@RefusalReason;
			this.Site 							= x.@Site;
			this.Series 						= x.@Series;
			this.ExpiryDate 					= x.@ExpiryDate;
			this.AssociateType					= x.@AssociateType;
			var updateAt:String 				= x.@UpdatedAt; 
			
			if(updateAt=="") // if date is empty string , initizlize it with a null date
				this.UpdatedAt 				= QSConstants.NULL_DATE;
			else
				this.UpdatedAt 				= new Date( updateAt );
			
			if(x.@IsNA == "false")
				this.IsNA = false;
			else if(x.@IsNA == "true")
				this.IsNA = true;
			this.ManagedBy = x.@ManagedBy;
			
			ImmunizationType = new GeneralTypeDTO();
			ImmunizationType.FromXML(x.Type[0]);
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "ImmunizationDTO ";
			var x:XML = super.ToXML();
			
			x.@ID					=this.ID ;
			x.@DateAdmin			=this.DateAdmin ;
			x.@Dose					=this.Dose ;
			x.@LotNumber			=this.LotNumber ;
			x.@NextDoseDue			=this.NextDoseDue  ;
			x.@Manufacturer			=this.Manufacturer ;
			x.@Rout					=this.Rout ;
			x.@RefusalReason		=this.RefusalReason ;
			x.@Site					=this.Site ;
			x.@Series				=this.Series ;
			x.@ExpiryDate			=this.ExpiryDate ;
			x.@UpdatedAt			= UtilityFunctions.FormatDate(UpdatedAt, "MM-DD-YYYY");	
			x.@IsNA					=this.IsNA ;
			x.@ManagedBy			=this.ManagedBy ;
			x.@AssociateType		=this.AssociateType;
				
			ImmunizationType.NodeName = "Type"
			x.appendChild( ImmunizationType.ToXML() )
			
			return x;
		}

		public function get AssociateType():String
		{
			return _AssociateType;
		}

		public function set AssociateType(value:String):void
		{
			_AssociateType = value;
		}

	}
}