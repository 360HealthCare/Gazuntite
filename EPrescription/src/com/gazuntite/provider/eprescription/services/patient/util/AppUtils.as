package com.gazuntite.provider.eprescription.services.patient.util
{
	import com.gazuntite.common.util.ValidationUtils;
	
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	

	public class AppUtils
	{
		
		
		public static const NULL_DATE	 					:Date	= new Date(1901, 01, 01, 12, 0, 0);
		
		public static function TitleCase( value:String ):String
		{
			var s:String = value.toLowerCase();
			var tokens:Array = s.split(' ');
			var ret:String = '';
			for( var i:int = 0; i < tokens.length; i++ )
			{
				var token:String = tokens[ i ];
				var sep:String = (tokens.length == 1 )? '':' ';
				ret += token.charAt().toUpperCase() + token.substr( 1 ) + sep;
			}
				
			return ValidationUtils.TrimString( ret );
		}
		
		
		public static function getByteArray(val:String):ByteArray
		{
			var base64Dec:Base64Decoder;
			var byteArr:ByteArray;
			base64Dec = new Base64Decoder();
			base64Dec.decode(val);
			byteArr = base64Dec.toByteArray();
			
			return byteArr;
		}
		
		public static function getBase64String(val:ByteArray):String
		{
			var base64Enco:Base64Encoder = new Base64Encoder();
			base64Enco.encodeBytes(val, 0, val.length);
			
			return base64Enco.toString();
		}
		
		
		public static function getToday():String
		{
			var d:Date = new Date();				
			var month:String = (d.month + 1).toString();
			var date:String = d.date.toString();
			if(month.length == 1)
			{
				month = "0"+month;
			}
			
			if(date.length == 1)
			{
				date = "0"+date;
			}
			
			var today:String = d.fullYear.toString() +"-"+ month +"-"+ date+"T00:00:00";
			
			
			return today;
			
		}
		
		
		public static function formatDate(date:String):String
		{
			//2012-01-01T00:00:00
			var year:String = date.substr(0, 4);
			var month:String = date.substr(5,2);
			var day:String = date.substr(8,2);
			
			return month +"/"+ day +"/"+ year;
			
		}
		public static function formatTime(date:String):String
		{
			//2012-01-01T00:00:00
			var hour:String = date.substr(11, 2);
			var min:String = date.substr(14,2);
			
			return hour +":"+ min ;
			
		}
		
		
		public static function removeDefaultNamespaceFromXML(xml:XML):XML
		{
			var rawXMLString:String = xml.toXMLString();
			
			/* Define the regex pattern to remove the default namespace from the 
			String representation of the XML result. */
			var xmlnsPattern:RegExp = 
				new RegExp("xmlns=[^\"]*\"[^\"]*\"", "gi");
			
			/* Replace the default namespace from the String representation of the 
			result XML with an empty string. */
			var cleanXMLString:String = rawXMLString.replace(xmlnsPattern, "");
			
			// Create a new XML Object from the String just created
			return new XML(cleanXMLString);
		}
		



	}
}