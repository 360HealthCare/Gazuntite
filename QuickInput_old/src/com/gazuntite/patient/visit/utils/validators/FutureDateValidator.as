package com.gazuntite.patient.visit.utils.validators
{
	
	import com.gazuntite.common.util.ValidationUtils;
	
	import mx.controls.DateField;
	import mx.messaging.channels.StreamingAMFChannel;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	public class FutureDateValidator extends Validator
	{
		private var _error:String;
		private var results:Array;
		
		public function FutureDateValidator()
		{
			super();
		}
		
		public function set error(value:String):void
		{
			_error = value;
		}
		
		override protected function doValidation(value:Object):Array
		{
			var dateStr:String = String(value);
			results = [];
			
			if (!ValidationUtils.isValidFutureDate(source as DateField))
			{
				if (dateStr.length)
				{
					var err:ValidationResult = new ValidationResult(true, "", "", _error);
					
					results.push(err);
				}
			}
			
			return results;
		}
	}
}