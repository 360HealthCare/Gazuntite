package com.gazuntite.validator
{
	import mx.events.ValidationResultEvent;
	import mx.utils.StringUtil;
	import mx.validators.EmailValidator;
	import mx.validators.ValidationResult;
	
	/**
	 * The UserNameValidator class validates user name
	 * if username already exists then error message is shown
	 *  
	 * @see mx.validators.Validator
	 */
	
	public class UserNameValidator  extends EmailValidator
	{
		/**
		 * Indicates the error code. 
		 */
		
		private const USER_NAME_ALREADY_EXISTS:String = "userNameAlreadyExists"; 
		
		/**
		 * Array stores the return value of doValidation(). 
		 */
		
		private var _results:Array;
		
		/**
		 *  @private
		 */
		private static const DISALLOWED_LOCALNAME_CHARS:String =
			"()<>,;:\\\"[] `~!#$%^&*={}|/?'";
		
		/**
		 * Class constructor.
		 */
		public function UserNameValidator()
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
		
		private var _isUserNameExists:Boolean = false; 
		
		public function get isUserNameExists():Boolean
		{
			return _isUserNameExists;
		}
		
		public function set isUserNameExists(value:Boolean):void
		{
			_isUserNameExists = value;
			
			internalProcessValidation();//fource validation again
		}
		
		
		private var _userNameAlreadyExistsMessage:String = "User Name already exists.";

		public function get userNameAlreadyExistsMessage():String
		{
			return _userNameAlreadyExistsMessage;
		}

		public function set userNameAlreadyExistsMessage(value:String):void
		{
			_userNameAlreadyExistsMessage = value;
		}

		//----------------------------------
		//  invalidCharError
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the invalidCharError property.
		 */
		private var _invalidCharErrorInUserNameMessage:String = "User Name contains invalid characters.";
				
		public function get invalidCharErrorInUserNameMessage():String
		{
			return _invalidCharErrorInUserNameMessage;
		}
		
		/**
		 *  @private
		 */
		public function set invalidCharErrorInUserNameMessage(value:String):void
		{
			_invalidCharErrorInUserNameMessage = value;
		}
		
		public static function validateUserName(validator:UserNameValidator,	 value:Object, baseField:String):Array
		{
			var results:Array = [];
			
			if( validator.isUserNameExists )
			{
				results.push(new ValidationResult(
					true, baseField, "userNameAlreadyExists",
					validator.userNameAlreadyExistsMessage));
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
			
			var username:String = String(value);
			
			if( inputValue.length == 0 )
			{
				_results.push(new ValidationResult(
					true, null, "userNameAlreadyExists",
					""));
				
				return _results;
			}
			
			for (var i:int = 0; i < username.length; i++)
			{
				if (DISALLOWED_LOCALNAME_CHARS.indexOf(username.charAt(i)) != -1)
				{
					_results.push(new ValidationResult(
						true, null, "userNameAlreadyExists",
						this.invalidCharErrorInUserNameMessage));
					return _results;
				}
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
			return UserNameValidator.validateUserName(this, internalValue, null);
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