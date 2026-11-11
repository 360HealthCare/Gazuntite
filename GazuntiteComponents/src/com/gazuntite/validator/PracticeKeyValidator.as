package com.gazuntite.validator
{
	import mx.events.ValidationResultEvent;
	import mx.utils.StringUtil;
	import mx.validators.EmailValidator;
	import mx.validators.ValidationResult;
	
	/**
	 * The PracticeKeyValidator class validates a practice key
	 * if key does not exist then error message is shown
	 *  
	 * @see mx.validators.Validator
	 */
	
	public class PracticeKeyValidator  extends EmailValidator
	{
		/**
		 * Indicates the error code. 
		 */
		
		private const PRACTICE_KEY_DOES_NOT_EXIST:String = "practiceKeyDoesNotExist"; 
		
		/**
		 * Array stores the return value of doValidation(). 
		 */
		
		private var _results:Array;
		
		/**
		 * Class constructor.
		 */
		
		public function PracticeKeyValidator()
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
		
		private var _isPracticeKeyDoesNotExist:Boolean = false; 
		
		public function get isPracticeKeyInvalid():Boolean
		{
			return _isPracticeKeyDoesNotExist;
		}
		
		public function set isPracticeKeyInvalid(value:Boolean):void
		{
			_isPracticeKeyDoesNotExist = value;
			
			internalProcessValidation();//fource validation again
		}
		
		
		private var _practiceKeyDoesNotExistMessage:String;
		private var _practiceKeyMustBeNonZeroMessage:String;
		private var _practiceKeyIsMandatoryField:String;

		public function get practiceKeyIsMandatoryField():String
		{
			return _practiceKeyIsMandatoryField;
		}

		public function set practiceKeyIsMandatoryField(value:String):void
		{
			_practiceKeyIsMandatoryField = value;
		}


		/**
		 * Provides a custom error message if practice key is zero.
		 */
		
		public function get practiceKeyMustBeNonZeroMessage():String
		{
			return _practiceKeyMustBeNonZeroMessage;
		}

		public function set practiceKeyMustBeNonZeroMessage(value:String):void
		{
			_practiceKeyMustBeNonZeroMessage = value;
		}

		
		/**
		 * Provides a custom error message if practice key does not exist.
		 */
		
		public function get practiceKeyDoesNotExistMessage():String {
			return _practiceKeyDoesNotExistMessage;
		}
		
		public function set practiceKeyDoesNotExistMessage(value:String):void {
			_practiceKeyDoesNotExistMessage = value;
		}
		
		
		public static function validatePracticeKey(validator:PracticeKeyValidator,	 value:Object, baseField:String):Array
		{
			var results:Array = [];
			
			if( validator.isPracticeKeyInvalid )
			{
				results.push(new ValidationResult(
					true, baseField, "practiceKeyDoesNotExist",
					validator.practiceKeyDoesNotExistMessage));
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
			var inputValue:String = StringUtil.trim(String(value));
			// Clear the results array.
			_results = [];
			
			if( inputValue.length == 0 )
			{
				_results.push(new ValidationResult(
					true, null, "practiceKeyDoesNotExist",
					""));
				
				return _results;
			}
			if( parseInt(value.toString()) == 0 )
			{
				_results.push(new ValidationResult(
					true, null, "practiceKeyDoesNotExist",
					this.practiceKeyMustBeNonZeroMessage));
				
				return _results;
			}
			
			internalValue = value;
			// Convert value to a String.
			
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
			return PracticeKeyValidator.validatePracticeKey(this, internalValue, null);
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