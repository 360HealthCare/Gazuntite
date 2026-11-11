package com.gazuntite.validator
{
	import mx.events.ValidationResultEvent;
	import mx.utils.StringUtil;
	import mx.validators.EmailValidator;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	/**
	 * The EmailValidatorWithEmailExists class validates an email address
	 * if address already exists then error message is shown
	 *  
	 * @see mx.validators.Validator
	 */
	
	public class EmailValidatorWithEmailExists extends EmailValidator
	{
		
		/**
		 * Indicates the error code. 
		 */
		
		private const ERROR_EMAIL_EXISTS:String = "emailAlreadyExists"; 
		
		/**
		 * Array stores the return value of doValidation(). 
		 */
		
		private var _results:Array;
		
		/**
		 * Class constructor.
		 */
		
		public function EmailValidatorWithEmailExists()
		{
			// Call the base class' constructor.
			super();
			
		} 
		
		private var _ASyncValidationCallBack:Function;

		public function get ASyncValidationCallBack():Function
		{
			return _ASyncValidationCallBack;
		}

		public function set ASyncValidationCallBack(value:Function):void
		{
			_ASyncValidationCallBack = value;
		}
		
		private var _isEmailExists:Boolean = false; 

		public function get isEmailExists():Boolean
		{
			return _isEmailExists;
		}

		public function set isEmailExists(value:Boolean):void
		{
			_isEmailExists = value;
			
			internalProcessValidation();//fource validation again
		}
		
		
		private var _emailAlreadyExistsMessage:String;
		
		/**
		 * Provides a custom error message if email already exists.
		 */
		
		public function get emailAlreadyExistsMessage():String {
			return _emailAlreadyExistsMessage;
		}
		
		public function set emailAlreadyExistsMessage(value:String):void {
			_emailAlreadyExistsMessage = value;
		}
		
		
		public static function validateEmail(validator:EmailValidatorWithEmailExists,	 value:Object, baseField:String):Array
		{
			var results:Array = [];
			
			if( validator.isEmailExists )
			{
				results.push(new ValidationResult(
					true, baseField, "emailAlreadyExists",
					validator.emailAlreadyExistsMessage));
			}
			

			return results;
		}
			
		/**
		 * Overrides the superclass' doValidation() method and defines 
		 * a custom implementation.
		 *
		 * @param value Object to validate.
		 * @return Array containing a ValidationResult object for each error.
		 */
		
		override protected function doValidation(value:Object):Array 
		{
			isEmailExists = false;
			internalValue = value;
			// Convert value to a String.
			var inputValue:String = StringUtil.trim(String(value));
			// Clear the results array.
			_results = [];
			
			if( inputValue.length == 0 )
			{
				_results.push(new ValidationResult(
					true, null, "emailAlreadyExists",
					""));
				
				return _results;
			}
			// Call base class doValidation().
			_results = super.doValidation(inputValue);
			// Return if there are errors.
			// or if the required property is set to false and length is 0.
			var val:String = internalValue ? String(internalValue) : "";
			if (_results.length > 0 || ((val.length == 0) && !required))
				return _results;
			
			// If the string is empty, return.
			if (inputValue.length == 0)
				return _results;
			// Check the server callback validation
			
			if( null == ASyncValidationCallBack )
				throw("ASyncValidationCallBack function is null");
			
			
			ASyncValidationCallBack();
			
			return _results;              
		}
		
		private var internalValue:Object;
		protected function doInternalValidation():Array
		{
			var results:Array = super.doValidation(internalValue);			
			return EmailValidatorWithEmailExists.validateEmail(this, internalValue, null);
		}
		
		
		/** 
		 *  @private 
		 *  Main internally used function to handle validation process.
		 */ 
		private function internalProcessValidation():ValidationResultEvent
		{   
			var resultEvent:ValidationResultEvent;
			
			var errorResults:Array = doInternalValidation();
			
			resultEvent = handleResults(errorResults);
			
			dispatchEvent(resultEvent);
			
			
			return resultEvent;
		}
	}	
}