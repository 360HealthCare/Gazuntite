package com.gazuntite.common.util.xml
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
		
		public static function getChildrenByNodeName( xml:XML, nodeName:String, nodeIndex:int = 0 ):XMLList
		{
			var retVal:XMLList;
			try
			{
				retVal = xml[nodeName][nodeIndex].children();
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
		
		public static function getCDATANode(data:String, tagName:String):XML
		{
			var node:XML = getNodeByTagName( tagName );
			var cdata:XML = new XML("<![CDATA[" + data + " ]]>");
			node.appendChild(cdata);
			
			return node;
			//trace("getCDATANode: ", node.toXMLString() );
		}
		public static function getNodeWithData(data:String, tagName:String):XML
		{
			var node:XML = getNodeByTagName( tagName );
			var cdata:XML = new XML(data);
			node.appendChild(cdata);
			
			return node;
			//trace("getCDATANode: ", node.toXMLString() );
		}
	}
}