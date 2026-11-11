package com.gazuntite.common.view.components.reviewofsystem
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.view.components.reviewofsystem.skin.ATB1;
	import com.gazuntite.common.view.components.reviewofsystem.skin.ATB1Bubble;
	import com.gazuntite.common.view.components.reviewofsystem.skin.NTB1;
	import com.gazuntite.common.view.components.reviewofsystem.skin.NTB1Bubble;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.ToggleButton;

	public class ReviewOfSystemHelper
	{
		// singleton model used for PatientInputPhysicalReviewOfSystemViewModel was a culprit, 
		// after removing singleton ... was forced to use following ugly horrible width impl. 
		[Bindable]
		public static var heentListItemWidth:Number = 300;
		
		public static function setNormal(item:IReviewOfSystemItem, setEmpty:Boolean):Boolean
		{
			setTrueOrEmptyProperty( item, "IsAbNormal", true );// clear abnormal status if any
			return setTrueOrEmptyProperty( item, "IsNormal", setEmpty );
		}
		
		public static function setAbnormal(item:IReviewOfSystemItem, setEmpty:Boolean):Boolean
		{
			setTrueOrEmptyProperty( item, "IsNormal", true );// clear normal status if any
			return setTrueOrEmptyProperty( item, "IsAbNormal", setEmpty );
		}

		public static function clearNotes(item:IReviewOfSystemItem):Boolean
		{
			return setTrueOrEmptyProperty( item, "Note", true );
		}

		public static function IsAllChildrenNormal( dto:IReviewOfSystemItem ):Boolean
		{
			var retVal:Boolean = true;
			if( null == dto.children || 0 == dto.children.length )
			{
				retVal = dto.IsNormal == QSConstants.STRING_TRUE;
			}
			else
			{
				var i:int;
				for( i = 0; i < dto.children.length; i++ )
				{
					var child:IReviewOfSystemItem = dto.children.getItemAt(i) as IReviewOfSystemItem ;
					retVal = child.IsNormal == QSConstants.STRING_TRUE ;
					if( ! retVal )
						break;
					
					retVal = IsAllChildrenNormal( child );
					if( ! retVal )
						break;
					
					/*if( child.Note )
					{
						retVal = child.Note.length == 0;
						if( ! retVal )
							break;
					}*/
				}
			}
			
			return retVal;
		}
		
		public static function IsAnyChildAbnormal( dto:IReviewOfSystemItem ):Boolean
		{
			var retVal:Boolean = true;
			if( null == dto.children || 0 == dto.children.length )
			{
				retVal = dto.IsAbNormal == QSConstants.STRING_TRUE
			}
			else
			{
				var i:int;
				for( i = 0; i < dto.children.length; i++ )
				{
					var child:IReviewOfSystemItem = dto.children.getItemAt(i) as IReviewOfSystemItem ;
					retVal = child.IsAbNormal == QSConstants.STRING_TRUE ;
					if( retVal )
						break;
					
					retVal = IsAnyChildAbnormal( child );
					if( retVal )
						break;
					
					/*if( child.Note )
					{
					retVal = child.Note.length == 0;
					if( ! retVal )
					break;
					}*/
				}
			}
			
			return retVal;
		}
		
		protected static function setTrueOrEmptyProperty(item:IReviewOfSystemItem, property:String, setEmpty:Boolean):Boolean
		{
			var retValue:Boolean;
			
			retValue = setTrueOrEmptyChildren( item, property, setEmpty)
			retValue = setTrueOrEmpty(item, property, setEmpty) || retValue;
			
			return retValue;
		}
		
		private static function setTrueOrEmpty(item:IReviewOfSystemItem, property:String, setEmpty:Boolean):Boolean
		{
			setEmpty ?  item[property] = QSConstants.EMPTY_STRING : item[property] = QSConstants.STRING_TRUE;
			return true; // this function always modifies a property, so returns true
		}
		
		private static function setTrueOrEmptyChildren(item:IReviewOfSystemItem, property:String, setEmpty:Boolean):Boolean
		{
			var retValue:Boolean;
			if( null != item.children )
			{
				var i:int;
				var children:ArrayCollection = item.children;
				for( i = 0; i < children.length; i++ )
				{
					var dto:IReviewOfSystemItem = children.getItemAt(i) as IReviewOfSystemItem ; 
					var cRetValue:Boolean = setTrueOrEmptyChildren( dto, property, setEmpty);
					cRetValue = setTrueOrEmpty(dto, property, setEmpty) || cRetValue;
					dto.IsDirty = cRetValue;
					retValue = cRetValue || retValue;
				}
			}
			
			return retValue;
		}
		
		public static function setButtonSkin(dataItem:IReviewOfSystemItem, normalButton:ToggleButton, AbnormalButton:ToggleButton ):void
		{
			if( null == dataItem ) return;
			
			var allowInput:Boolean = ( dataItem.IsNormal == QSConstants.STRING_TRUE ) || ( dataItem.IsAbNormal == QSConstants.STRING_TRUE );
			
			normalButton.setStyle( "skinClass", NTB1 );
			AbnormalButton.setStyle( "skinClass", ATB1 );
			
			var hasDictation:Boolean = dataItem.DictationID && dataItem.DictationID.length > 5 && dataItem.DictationID != QSConstants.GUID_FORMAT;
			var hasNotes:Boolean = dataItem.Note.length > 0;
			
			if( allowInput && ( hasNotes || hasDictation )  )
			{
				if( normalButton.selected )
				{
					normalButton.setStyle( "skinClass", NTB1Bubble );
				}
				else if(AbnormalButton.selected)
				{
					AbnormalButton.setStyle( "skinClass", ATB1Bubble );
				}
			}
		}
		
		/*private static function checkAllChildrenForValue(item:IReviewOfSystemItem, property:String, value:*, returnOnFirstMach:Boolean = false):Boolean
		{
			var retValue:Boolean;
			if( null != item.children )
			{
				var i:int;
				var children:ArrayCollection = item.children;
				for( i = 0; i < children.length; i++ )
				{
					var dto:IReviewOfSystemItem = children.getItemAt(i) as IReviewOfSystemItem ; 
					var cRetValue:Boolean = checkAllChildrenForValue( dto, property, value);
					
					if( returnOnFirstMach && 
				}
			}
			else
			{
				retValue = checkPropertyForValue(dto, property, value) || cRetValue;
			}
			
			return retValue;
		}
		
		private static function checkPropertyForValue(item:IReviewOfSystemItem, property:String, value:*):Boolean
		{
			return item[property] == value; 
		}*/
	}
}