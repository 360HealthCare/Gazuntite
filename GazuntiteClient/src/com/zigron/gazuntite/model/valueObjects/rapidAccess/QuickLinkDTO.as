package com.zigron.gazuntite.model.valueObjects.rapidAccess
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class QuickLinkDTO 
	{
		public function QuickLinkDTO() 
		{
		}
		
		private var _ExtensionData:String;
		private var _IsDeleted:Boolean;
		private var _IsDirty:Boolean;
		private var _IsNewRecord:Boolean;
		private var _ClinicBranchId:int;
		private var _CreatedAt:String;
		private var _CreatedBy:int;
		private var _IsDefault:Boolean;
		private var _ListOrder:int;
		private var _ModifiedAt:String;
		private var _ModifiedBy:int;
		private var _QuickLinkTypeID:int;
		private var _UserId:int;
		private var _UserQuickLinks:int;
		private var _description:String;
		private var _icon:String;
		private var _label:String;

		
		public function FromXml(x:XML):void
		{
			ExtensionData					= x.ExtensionData;
			IsDeleted						= x.IsDeleted;
			IsDirty							= x.IsDirty;
			IsNewRecord						= x.IsNewRecord;
			ClinicBranchId					= x.ClinicBranchId;
			CreatedAt						= x.CreatedAt;
			CreatedBy						= x.CreatedBy;
			IsDefault						= x.IsDefault;
			ListOrder						= x.ListOrder;
			ModifiedAt						= x.ModifiedAt;
			ModifiedBy						= x.ModifiedBy;
			QuickLinkTypeID					= x.QuickLinkTypeID;
			UserId							= x.UserId;
			UserQuickLinks					= x.UserQuickLinks;
			description						= x.description;
			icon							= x.icon;
			label							= x.label;
		}
		
		/*public override function ToXML():XML
		{
			var x:XML = super.ToXML();
			
			var x:XML = XmlUtils.getNodeByTagName('QuickLinkDTO');
			
			x.ExtensionData                   	 	= ExtensionData;            
			x.IsNewRecord                       	= IsNewRecord;               
			x.IsDefault              				= IsDefault;      
			x.ClinicBranchId         				= ClinicBranchId; 
			x.ListOrder         					= ListOrder; 
			x.QuickLinkTypeID         				= QuickLinkTypeID; 
			x.UserId         						= UserId; 
			x.UserQuickLinks         				= UserQuickLinks; 
			x.description         					= description; 
			x.icon         							= icon; 
			x.label         						= label; 
			
			return x;
		}*/
		
		
		
		public function get ExtensionData():String
		{
			return _ExtensionData;
		}

		public function set ExtensionData(value:String):void
		{
			_ExtensionData = value;
		}

		public function get IsNewRecord():Boolean
		{
			return _IsNewRecord;
		}

		public function set IsNewRecord(value:Boolean):void
		{
			_IsNewRecord = value;
		}

		public function get ClinicBranchId():int
		{
			return _ClinicBranchId;
		}

		public function set ClinicBranchId(value:int):void
		{
			_ClinicBranchId = value;
		}

		public function get IsDefault():Boolean
		{
			return _IsDefault;
		}

		public function set IsDefault(value:Boolean):void
		{
			_IsDefault = value;
		}

		public function get ListOrder():int
		{
			return _ListOrder;
		}

		public function set ListOrder(value:int):void
		{
			_ListOrder = value;
		}

		public function get QuickLinkTypeID():int
		{
			return _QuickLinkTypeID;
		}

		public function set QuickLinkTypeID(value:int):void
		{
			_QuickLinkTypeID = value;
		}

		public function get UserId():int
		{
			return _UserId;
		}

		public function set UserId(value:int):void
		{
			_UserId = value;
		}

		public function get UserQuickLinks():int
		{
			return _UserQuickLinks;
		}

		public function set UserQuickLinks(value:int):void
		{
			_UserQuickLinks = value;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}

		public function get icon():String
		{
			return _icon;
		}

		public function set icon(value:String):void
		{
			_icon = value;
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}

		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}

		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}

		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}

		public function get CreatedAt():String
		{
			return _CreatedAt;
		}

		public function set CreatedAt(value:String):void
		{
			_CreatedAt = value;
		}

		public function get CreatedBy():int
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}

		public function get ModifiedAt():String
		{
			return _ModifiedAt;
		}

		public function set ModifiedAt(value:String):void
		{
			_ModifiedAt = value;
		}

		public function get ModifiedBy():int
		{
			return _ModifiedBy;
		}

		public function set ModifiedBy(value:int):void
		{
			_ModifiedBy = value;
		}

	}
}