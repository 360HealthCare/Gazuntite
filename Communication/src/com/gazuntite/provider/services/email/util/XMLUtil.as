/*
*Class: XMLUtil
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.util
{
	public class XMLUtil
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