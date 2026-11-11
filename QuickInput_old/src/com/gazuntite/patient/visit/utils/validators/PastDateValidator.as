package com.gazuntite.patient.visit.utils.validators
{
	import com.gazuntite.patient.visit.utils.ValidationUtils;
	
	import mx.controls.DateField;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	public class PastDateValidator extends Validator
	{
		private var _error:String;
		private var results:Array;
		
		public function PastDateValidator(arg_error:String = "")
		{
			super();
			
			_error = arg_error;
		}
		
		public function set error(value:String):void
		{
			_error = value;
		}
		
		override protected function doValidation(value:Object):Array
		{
			var dateStr:String = String(value);
			results = [];
			
			if (!ValidationUtils.isValidDate(source as DateField))
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