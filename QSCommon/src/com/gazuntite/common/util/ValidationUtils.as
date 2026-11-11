package com.gazuntite.common.util
{
	//import com.adobe.Quivus.model.AppModelLocator;
	import com.gazuntite.controls.extended.components.LabelComboBox;
	import com.gazuntite.controls.extended.components.LabelTextInput;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.core.FlexGlobals;
	import mx.formatters.DateFormatter;
	import mx.utils.ObjectUtil;
	
	import spark.components.ComboBox;
	import spark.components.TextInput;

	public class ValidationUtils
	{
		
		public static function isValidBPSys( value:int ):Boolean 
		{
			if (value != 0 && (value < 70 || value > 140))
			{
				return false;
			}
			
			return true
		}
		
		public static function isValidBPDys( value:int ):Boolean 
		{
			if ( value != 0 && ( value < 50 || value > 95 ) )
			{
				return false;
			}
			
			return true
		}
		
		public static function Trim(txt:TextInput):void 
		{
			txt.text = txt.text.replace(/^\s+|\s+$/g, "");
		}
		
		//Mansoor
		//19 Mar 2011
		public static function TrimString(text:String):String 
		{
			return text.replace(/^\s+|\s+$/g, "");
		}
		
		
		public static function isValidPhone( txt:LabelTextInput ):Boolean
		{
			if( ! isValidPhoneNoFormat( txt ) )
			{
				/*Alert.show("please provide valid phone number.","phone number", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
					txt.setFocus();
				});*/
				return false;
			}
			return true;
		}
		public static function isValidPhone2( txt:String ):Boolean
		{
			if( ! isValidPhoneNoFormat2( txt ) )
			{
				/*Alert.show("please provide valid phone number.","phone number", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
					txt.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		public static function isValidPhoneType( cmbo:ComboBox ):Boolean
		{
			if( cmbo.selectedIndex == -1 )
			{
				/*Alert.show("please select phone type.","select phone type", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
					cmbo.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		public static function isValidRelationType( cmbo:ComboBox ):Boolean
		{
			if( cmbo.selectedIndex == -1 )
			{
				Alert.show("please select relation type.","select relation type", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event):void{
					cmbo.setFocus();
				});
				return false;
			}
			return true;
		}
		
		public static function isValidPhoneExt( txt:LabelTextInput ):Boolean
		{
			var objPhone:* = txt.text;
			var re:* = new RegExp("^\\d{1,4}$");
			var m:* = re.exec(objPhone);
			
			if (m == null) 
			{
				/*Alert.show("please provide 4 digit extention.","phone extention", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event){
					txt.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		public static function isValidEmail(txt:LabelTextInput):Boolean
		{
			var isValid:Boolean = true;
			
			if (txt.text.length)
			{
				var regExp:RegExp = new RegExp("([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}", "ig");
				var result:* = regExp.exec(txt.text);
				
				if (result == null || (result && result.index))
					isValid = false;
				
				if (regExp.lastIndex < txt.text.length)
					isValid = false;
			}
			else
				isValid = false;
				
			return isValid;
		}
		
		public static function isValidPhoneNoFormat(txt:LabelTextInput):Boolean
		{
			var objPhone:String = txt.text;
			var re:RegExp = new RegExp("^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$");
			var m:* = re.exec(objPhone);
			
			if (m == null && objPhone != '') 
			{
				re = new RegExp("^[0-9]*$"); // /^\d{20}$/ ^\d{1,5}
				m = re.exec(objPhone);
				
				if (objPhone.length < 10)
					m = null;
			}
			
			return m != null;
		}
		public static function isValidPhoneNoFormat2(txt:String):Boolean
		{
			var objPhone:String = txt;
			var re:RegExp = new RegExp("^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$");
			var m:* = re.exec(objPhone);
			
			if (m == null && objPhone != '') 
			{
				re = new RegExp("^[0-9]*$"); // /^\d{20}$/ ^\d{1,5}
				m = re.exec(objPhone);
				
				if (objPhone.length < 10)
					m = null;
			}
			
			return m != null;
		}
		
		public static function isValidState( cmbo:ComboBox ):Boolean
		{
			if( cmbo.selectedIndex == -1 )
			{
				/*Alert.show("please select state.","select state", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event){
					cmbo.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		public static function isValidCity( cmbo:ComboBox ):Boolean
		{
			if( cmbo.selectedIndex == -1 )
			{
				/*Alert.show("please select city.","select city", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event){
					cmbo.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		public static function isValidZip( cmbo:ComboBox ):Boolean
		{
			if( cmbo.selectedIndex == -1 )
			{
				/*Alert.show("please select zip.","select zip", 4, FlexGlobals.topLevelApplication.mainContainer, function(event:Event){
					cmbo.setFocus();
				});*/
				return false;
			}
			return true;
		}
		
		 
		public static function isValidName35(str:String = ""):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp =/[a-zA-Z0-9,.']{1,35}/ig;
			//var reg:RegExp =/[a-zA-Z0-9,.-']{1,100}/ig;  //included hyphen
			var result:Object;
			
			do
			{
				result = reg.exec(str);
				if ((result == null) || (result && result.index !=0))
				{
					isValid = false;
					break;
				}
				
			}while (reg.lastIndex < str.length)
			
			return isValid;
		}
		public static function isValidName(str:String = ""):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp =/[a-zA-Z0-9,.']{1,100}/ig;
			//var reg:RegExp =/[a-zA-Z0-9,.-']{1,100}/ig;  //included hyphen
			var result:Object;
			
			do
			{
				result = reg.exec(str);
				if ((result == null) || (result && result.index !=0))
				{
					isValid = false;
					break;
				}
				
			}while (reg.lastIndex < str.length)
				
			return isValid;
		}
		
		public static function isValidAlphaNumericWithSpaces(str:String = ""):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp = /[a-zA-Z0-9,.'()\/\s]{3,200}/ig;
			var result:Object;
			
			do
			{
				result = reg.exec(str);
				
				if ((result == null) || (result && result.index !=0))
				{
					isValid = false;
					break;
				}
				
			}while (reg.lastIndex < str.length)
			
			return isValid;
		}
		
		public static function isValidAlphaNumericWithoutSpaces(str:String):Boolean	
		{
			var isValid:Boolean = true;
			
			var reg:RegExp = /[a-zA-Z0-9]{0,200}/ig;
			var result:Object;
			
			result = reg.exec(str);
				
			if ((result == null) || (result && result.index != 0))
				isValid = false;
			
			if (reg.lastIndex < str.length)
				isValid = false;
			
			return isValid;
		}
		
		public static function isValidUserName(str:String):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp = /[a-zA-Z0-9]{4,8}/ig;
			var result:Object;
			result = reg.exec(str);
			
			if ((result == null) || (result && result.index != 0))
				isValid = false;
			
			if (reg.lastIndex < str.length)
				isValid = false;
			
			return isValid;
		}
		
		public static function isValidDateFormat(dateStr:String):Boolean
		{
			var isValid:Boolean = true;
			
			if (dateStr.length)
			{
				var regExp:RegExp = new RegExp("[0-9]{2}\/[0-9]{2}\/[0-9]{4}", "ig");
				
				var result:* = regExp.exec(dateStr);
				
				if (result == null || (result && result.index != 0))
					isValid = false;
				
				if (regExp.lastIndex < dateStr.length)
					isValid = false;
				
			}
			else
				isValid = false;
			
			return isValid;
		}
		
		public static function isValidDate(dateField:DateField):Boolean
		{
			var isValid:Boolean = true;
			
			if (dateField)
			{
				var dateStr:String = dateField.text;
				
				isValid = isValidDateFormat(dateStr);
				
				if (isValid)
				{
					var initial:Number = new Date(1901, 1, 1).getTime();
					var now:Number = new Date().getTime();
					var dob:Number = Date.parse(dateStr);
					
					if (!(dob >= initial && dob <= now))
						isValid = false;
				}
			}
			else
			{
				isValid = false;
			}
			
			return isValid;
		}
		
		public static function isValidDateText(text:String):Boolean
		{
			var isValid:Boolean = true;
			
			if (text)
			{
				var dateStr:String = text;
				
				isValid = isValidDateFormat(dateStr);
				
				if (isValid)
				{
					var initial:Number = new Date(1901, 1, 1).getTime();
					var now:Number = new Date().getTime();
					var dob:Number = Date.parse(dateStr);
					
					if (!(dob >= initial && dob <= now))
						isValid = false;
				}
			}
			else
			{
				isValid = false;
			}
			
			return isValid;
		}
		
		/**
		 * Ayesha: 16th March 2011
		 * */
		public static function isValidFutureDate(dateField:DateField):Boolean
		{
			var isValid:Boolean = true;
			
			if (dateField)
			{
				var dateStr:String = dateField.text;
				
				isValid = isValidDateFormat(dateStr);
				
				if (isValid)
				{
					var now:Number = new Date().getTime();
					var future:Number = Date.parse(dateStr);
					
					if (future <= now)
						isValid = false;
				}
			}
			else
			{
				isValid = false;
			}
			
			return isValid;
		}
		
		public static function isValidNumber(num:String):Boolean
		{
			if( num == "" || num == null )
				return false;
			
			var isValid:Boolean = true;
			
			try
			{
				var numStr:String = String(num);
				
				for (var i:int = 0; i < numStr.length; i++)
				{
					var char:int = numStr.charCodeAt(i);
					
					if (!((char >= 48 && char <= 57) || char == 46))
					{
						isValid = false;
						break;
					}
				}
			}
			catch(e:Error)
			{
				isValid = false;
			}
			
			return isValid;
		}

		public static function isIDNumberValid(value:String):Boolean
		{
			
			var isValid:Boolean = isSSNValid( value );
			
			if( ! isValid && value.length <= 14 )
			{
				isValid = isValidNumber( value );
			}
			
			if( ! isValid && value.length <= 17 )
			{
				var arr:Array = value.split( '-' );
				
				if( arr.length != 1 && arr.length < 5 )
				{
					for( var i:int = 0 ; i < arr.length; i ++ )
					{
						isValid = isValidNumber( arr[ i ] );
						if( ! isValid )
							break;
					}
				}
			}
			
			return isValid;
		}
		
		public static function isRepeatingChars(startInd:int, value:String, repeatingChars:int=7):Boolean
		{
			
			var chc:String = value.charAt(startInd);
			var isValid:Boolean = false;
			var noOfRepeatingChars:int = 0;
			
			if(value.length >= repeatingChars)
			{
			
				for(var i:int=startInd; i<value.length; i++)
				{
					if(chc == value.charAt(i))
					{
						noOfRepeatingChars++;					
					}
				}
			
				if(noOfRepeatingChars >= repeatingChars)
				{
					isValid = true;
				}
			}
			
			
				
			return isValid;
		}
		
		
		public static function isSSNValid(value:String):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp = new RegExp("[0-9]{9}", "ig");
			//var reg:RegExp = new RegExp("[0-9]{3}[- ][0-9]{2}[- ][0-9]{4}", "ig");
			
			var result:Object;
			
			do 
			{
				result = reg.exec(value);
				
				if ((result == null) || (result && result.index))
				{
					isValid = false;
					break;
				}
				
			}while(reg.lastIndex < value.length);
			
			return isValid;
		}
		
		public static function isValidValueSelected(comboBox:LabelComboBox):Boolean
		{
			var isValid:Boolean = false;
			
			if (comboBox)
			{
				if (comboBox.selectedIndex > -1 || (comboBox.selectedItem && comboBox.selectedIndex != -3))
				{
					isValid = true;
				}
			}
	
			return isValid;
		}
		
		public static function fieldLengthValidation(field:String, maxLen:int, minLen:int = 0):Boolean
		{
			return true;
		}
		
		public static function formatDate(date:Date):String
		{
			var dateStr:String = "";
			
			if (date)
			{
				var formatDateTime:DateFormatter = new DateFormatter();
				dateStr = formatDateTime.format(date);
			}
			
			return dateStr;
		}
		
		/*public static function displayVisitDateForGrid(item:Object, icol:int):String
		{
			var model:AppModelLocator = AppModelLocator.getInstance();
			var formatDateTime:DateFormatter = new DateFormatter();
			//H
			if(model.visitDTO!=null && model.visitDTO.VisitDate!=null)
			{
				var visitDate:String = formatDateTime.format(model.visitDTO.VisitDate.toDateString());	
				return String(visitDate);
			}
			
			return "";
		}*/
		
		//by shahid munir on 06/18/2012
		public static function isValidNameString(str:String = ""):Boolean
		{
			var isValid:Boolean = true;
			
			//var reg:RegExp =/[A-Za-z][A-Za-z0-9]*/ig; //for checking string, starting with space is ignored
			var reg:RegExp =/^[A-Za-z][A-Za-z0-9]*$/ig; //for checking string start with space
			var result:Object;
			
			do
			{
				result = reg.exec(str);
				if ((result == null) || (result && result.index !=0))
				{
					isValid = false;
					break;
				}
				
			}while (reg.lastIndex < str.length)
			
			return isValid;
		}
		
		//by shahid munir on 05/30/2012
		public static function isValidDateRange(startDate:Date, endDate2:Date):Boolean
		{
			var ret:int = ObjectUtil.dateCompare(startDate, endDate2);
			
			if (ret == 0)//if the strat date is equal to end date
			{
				return true;
			}else if( ret == -1)//if the strat date is earlier than end date
			{
				return true;
			} 
			else // 1 - if the start date is later than end date
			{
				return false;
			}
		}
		
		//by shahid munir on 06/04/2012
		public static function isValidDateString(dateStr:String, checkMaxYearIsCurrentYear:Boolean = false, dateFormat:String = "MM/DD/YYYY"):Boolean
		{
			
			var isValid:Boolean = true;
			
			if (dateStr.length)
			{
				var delimiter:String = dateFormat.substring(dateFormat.indexOf("MM")+3,2); 
				var dateArray:Array = dateStr.split(delimiter);
				var formatArray:Array = dateFormat.split(delimiter);
				
				var dayNumber:int = 0;
				var monthNumber:int = 0;
				var yearNumber:int = 0;
				for(var i:int = 0; i < formatArray.length; i++)
				{
					switch(formatArray[i])
					{
						case "MM":
						{
							if(parseInt(dateArray[i]) > 12)
								return false;
							monthNumber = parseInt(dateArray[i]);								
							break;
						}
						case "DD":
						{
							dayNumber = parseInt(dateArray[i]);	
							break;
						}
						case "YYYY":
						{
							yearNumber = parseInt(dateArray[i]);	
							break;
						}							
					}
				}					
				
				if( ! isValidDaysOfMonth(monthNumber,dayNumber,yearNumber))
					isValid = false;
				else if (checkMaxYearIsCurrentYear == true)
				{
					var today:Date = new Date();
					if(today.fullYear < yearNumber)
						isValid = false;
					//else if( ! isValidDaysOfMonth(monthNumber,dayNumber,yearNumber))
						//isValid = false;
				}	
			}
			else
				isValid = false;
			
			return isValid;
		}
		
		//by shahid munir on 06/04/2012
		public static function isValidAndNotFutureDate(dateStr:String, dateFormat:String = "MM/DD/YYYY"):String
		{
			
			var isValid:String = "true";
			
			if (dateStr.length)
			{
				var delimiter:String = dateFormat.substring(dateFormat.indexOf("MM")+3,2); 
				var dateArray:Array = dateStr.split(delimiter);
				var formatArray:Array = dateFormat.split(delimiter);
				
				var dayNumber:int = 0;
				var monthNumber:int = 0;
				var yearNumber:int = 0;
				for(var i:int = 0; i < formatArray.length; i++)
				{
					switch(formatArray[i])
					{
						case "MM":
						{
							if(parseInt(dateArray[i]) > 12)
								return "false";
							monthNumber = parseInt(dateArray[i]);								
							break;
						}
						case "DD":
						{
							dayNumber = parseInt(dateArray[i]);	
							break;
						}
						case "YYYY":
						{
							yearNumber = parseInt(dateArray[i]);	
							break;
						}							
					}
				}			
				
				var today:Date = new Date();
				
				if( ! isValidDaysOfMonth(monthNumber,dayNumber,yearNumber))
					isValid = "false";
				else if(today.fullYear < yearNumber 
					|| (today.fullYear >= yearNumber && today.month + 1 < monthNumber ) 
					|| (today.fullYear >= yearNumber && today.month + 1 >= monthNumber && today.date < dayNumber) )
					isValid = "future";			
				
			}
			else
				isValid = "false";
			
			return isValid;
		}
		
		private static function isValidDaysOfMonth(month:int,days:int,year:int):Boolean
		{
			var isValid:Boolean = true;
			if(month == 2)
			{
				var isLeapYear:Boolean = false;
				//if(year % 4 == 0 && (year % 100 == 0 && year % 400 == 0) )
				if(year % 4 == 0 )
				{
					isLeapYear =true;
				}
				
				if(isLeapYear == true && days > 29)
					isValid =false;
				else if(isLeapYear == false && days > 28)
					isValid =false;
				
			}
			else
			{
				var days31:String  = "*1*3*5*7*8*10*12*";				
				var days30:String  = "*4*6*9*11*";
				
				if(days31.indexOf("*"+month.toString()+"*") > -1 && days > 31)
					isValid =false;
				else if(days30.indexOf("*"+month.toString()+"*") > -1 && days > 30)
					isValid =false;
			}
			return isValid;
		}
		
		//by shahid munir on 08/02/2012
		public static function isValidEmailString(txt:String):Boolean
		{
			var isValid:Boolean = true;
			
			if (txt.length)
			{
				var regExp:RegExp = new RegExp("([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}", "ig");
				var result:* = regExp.exec(txt);
				
				if (result == null || (result && result.index))
					isValid = false;
				
				if (regExp.lastIndex < txt.length)
					isValid = false;
			}
			else
				isValid = false;
			
			return isValid;
		}
		
		//by shahid munir on 08/02/2012
		public static function isValidURL(txt:String):Boolean
		{
			var isValid:Boolean = true;
			
			if (txt.length)
			{
				//var regExp:RegExp = new RegExp("((ht|f)tp(s?)\:\/\/|~/|/)?([-\w\.]+)+(:\d+)?(:\w+)?(@\d+)?(@\w+)?([-\w\.]+)(/([\w/_\.]*(\?\S+)?)?)?", "ig");
				//var regExp:RegExp = new RegExp("((ht|f)tp(s?)\:\/\/|~/|/)?([-\w\.]+)+(:\d+)?(:\w+)?(@\d+)?(@\w+)?([-\w\.]+)(/([\w/_\.]*(\?\S+)?)?)?");
				var regExp:RegExp = new RegExp("(http(s)?:\/\/)?(([a-z]+[a-z0-9\-]*[.])?([a-z0-9]+[a-z0-9\-]*[.])+[a-z]{2,3}|localhost)(\/[a-z0-9_-]+[a-z0-9_ -]*)*\/?(\\?[a-z0-9_-]+=[a-z0-9 ',.-]*(&amp;[a-z0-9_-]+=[a-z0-9 ',.-]*)*)?(#[a-z0-9/_-]*)?$", "ig");
				var result:* = regExp.exec(txt);
				
				if (result == null || (result && result.index))
					isValid = false;
				
				if (regExp.lastIndex < txt.length)
					isValid = false;
			}
			else
				isValid = false;
			
			return isValid;
		}
		
		// for Name that has may one 2 chracter
		public static function isValidAlphaNumericWithSpaces2(str:String = ""):Boolean
		{
			var isValid:Boolean = true;
			
			var reg:RegExp = /[a-zA-Z0-9,.'()\/\s]{2,200}/ig;
			var result:Object;
			
			do
			{
				result = reg.exec(str);
				
				if ((result == null) || (result && result.index !=0))
				{
					isValid = false;
					break;
				}
				
			}while (reg.lastIndex < str.length)
			
			return isValid;
		}
		
		//TA - remove masking on the phone number
		public static function getPhoneNumberWithoutMasking(text:String):String
		{
			var val1:String = text;
			var val2:String = val1.replace('(','');
			var val3:String = val2.replace(')','');
			var val4:String = val3.replace('-','');
			
			return val4;
		}
		//TA - apply masking on the phone number at load time
		public static function setPhoneNumberMasking(val:String):String
		{
			if(val == '')
				return'';
			
			var val_Format:String = '(' + val.substring(0,3) + ')' + val.substring(3,6) + '-' + val.substring(6,10);
			return val_Format;
		}
		public static function setSSNMasking(val:String):String
		{
			var val_Format:String = val.substring(0,3)+'-'+val.substring(3,5)+'-'+val.substring(5,9);
			return val_Format;
		}
		public static function getSSNWithoutMasking(pram:String):String
		{
			var result:String = '';
			var val1:String = pram;
			var val2:String = val1.replace('-','');
			result = val2.replace('-','');
			
			return result;
		}
	}
}