package com.gazuntite.provider.eprescription.services.patient.util
{
	public class XmlUtils
	{
		public static function getNodeByTagName(tagName:String):XML
		{
			return new XML(  "<" + tagName + "/>" );
		}
		
		public static function getPropertyValueByName( propertyName:String, xml:XML, keyName:String = 'name', valName:String = 'value' ):*
		{
			var retVal:*;
			try
			{
				retVal = xml.property.( @[keyName] == propertyName )[0].@[valName];
			}
			catch(e:Error)
			{
				retVal = undefined;
			}
			finally
			{
				return retVal;
			}
		}
		
	}
}