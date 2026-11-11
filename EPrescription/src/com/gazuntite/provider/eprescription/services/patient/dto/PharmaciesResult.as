package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.provider.eprescription.services.patient.util.XmlConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.XmlUtils;
	
	import mx.collections.ArrayCollection;
	import mx.controls.dataGridClasses.DataGridColumn;
	
	
	[Bindable]
	public class PharmaciesResult
	{
		public function PharmaciesResult()
		{
		}
		
		private var _PharmaciesID			:int;
		private var _rownum					:String;
		private var _NCPDPID				:String;
		private var _StoreName				:String;
		
		private var _StoreNumber			:String;
		private var _AddressLine1			:String;
		private var _AddressLine2			:String;
		private var _Phone					:String;
		private var _Zip					:String;
		private var _Notes					:String = "";
		private var _ServiceLevel			:int;
		
	
		private var _inEditMode:Boolean;
		
		
		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get Zip():String
		{
			return _Zip;
		}

		public function set Zip(value:String):void
		{
			_Zip = value;
		}

		public function get ServiceLevel():int
		{
			return _ServiceLevel;
		}

		public function set ServiceLevel(value:int):void
		{
			_ServiceLevel = value;
		}

		public function get Phone():String
		{
			return _Phone;
		}

		public function set Phone(value:String):void
		{
			_Phone = value;
		}

		public function get AddressLine2():String
		{
			return _AddressLine2;
		}

		public function set AddressLine2(value:String):void
		{
			_AddressLine2 = value;
		}

		public function get AddressLine1():String
		{
			return _AddressLine1;
		}

		public function set AddressLine1(value:String):void
		{
			_AddressLine1 = value;
		}

		public function get StoreNumber():String
		{
			return _StoreNumber;
		}

		public function set StoreNumber(value:String):void
		{
			_StoreNumber = value;
		}

		public function get PharmaciesID():int
		{
			return _PharmaciesID;
		}
		
		public function set PharmaciesID(value:int):void
		{
			_PharmaciesID = value;
		}
		
		public function get rownum():String
		{
			return _rownum;
		}
		
		public function set rownum(value:String):void
		{
			_rownum = value;
		}
		
		public function get NCPDPID():String
		{
			return _NCPDPID;
		}
		
		public function set NCPDPID(value:String):void
		{
			_NCPDPID = value;
		}
		
		public function get StoreName():String
		{
			return _StoreName;
		}
		
		public function set StoreName(value:String):void
		{
			_StoreName = value;
		}
		
		/**
		 * Ayesha: 21/5/2013
		 * inEditMode is only related to view, it shows renderer either in edit mode or in view mode
		 * */
		public function get inEditMode():Boolean
		{
			return _inEditMode;
		}
		
		public function set inEditMode(value:Boolean):void
		{
			_inEditMode = value;
		}
		
		public function FromXML(x:XML):void
		{
			PharmaciesID 	= x.@["ID"];
			rownum 			= x.@["rownum"];
			NCPDPID 		= x.@["NCPDPID"];
			
			StoreName 		= x.@["StoreName"];
			StoreNumber 	= x.@["StoreNumber"];
			AddressLine1 	= x.@["AddressLine1"];
			AddressLine2 	= x.@["AddressLine2"];
			Phone 			= x.@["Phone"];
			Zip 			= x.@["Zip"];
			ServiceLevel 	= x.@["ServiceLevel"];
			
			 
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Pharmacy" );
			xml.@["ID"]						= PharmaciesID;
			xml.@["rownum"]					= rownum;
			xml.@["NCPDPID"]				= NCPDPID;
			xml.@["StoreName"]				= StoreName;
			xml.@["StoreNumber"]			= StoreNumber;
			xml.@["AddressLine1"]			= AddressLine1;
			xml.@["AddressLine2"]			= AddressLine2;
			xml.@["Phone"]					= Phone;
			xml.@["Zip"]					= Zip;
			xml.@["ServiceLevel"]			= ServiceLevel;
		//	xml.@["OldServiceLevel"]			= OldServiceLevel;
		//	xml.@["TextServiceLevel"]			= TextServiceLevel;
			
			
			
			return xml;
		}
		
		
	/*	public function toArrayCollection:ArrayCollection
		{
				
		}
		
		private function generateCols(input:XMLList, useAttributes:Boolean = false):Array 
		{
			var e1:XML = input[0];
			var columns:Array = [];
			var children:XMLList ;
			if (useAttributes) {
				children = e1.attributes();
			}
			else {
				children = e1.children();
			}
			for each(var child:XML in children) {
				var col:DataGridColumn = new DataGridColumn();
				col.dataField = child.name();
				columns.push(col);
			}
			return columns;
		}*/
	}
}