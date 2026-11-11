package com.gazuntite.patient.visit.utils.validators
{
	import mx.validators.ValidationResult;
	import mx.validators.Validator;

	public class FreeTextValidator extends Validator
	{
		private var _error:String;
		private var _maxLength:int;
		private var _minLength:int;
		private var results:Array;
		
		public function FreeTextValidator(arg_error:String = "", arg_minLength:int = 0, arg_maxLength:int = 0)
		{
			super();
			
			_error = arg_error;
			_minLength = arg_minLength;
			_maxLength = arg_maxLength;
		}
		
		public function set error(value:String):void
		{
			_error = value;
		}
		
		public function set maxLength(value:int):void
		{
			_maxLength = value;
		}
		
		public function set minLength(value:int):void
		{
			_minLength = value;
		}

		override protected function doValidation(value:Object):Array
		{
			var str:String = String(value);
			results = null;
			results = [];
			
			if (str.length < _minLength || str.length > _maxLength)
			{
				var err:ValidationResult = new ValidationResult(true, "", "", _error);
				results.push(err);
			}
			
			return results;
		}

	}
}