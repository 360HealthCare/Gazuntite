package com.gazuntite.utils
{
	import com.gazuntite.model.SharedModel;
	import com.gazuntite.services.valueObjects.rosPhysical.ROSPhysicalBaseDTO;
	
	import mx.collections.ArrayCollection;

	public class QSUtilityFunctions
	{
		//ROS Function
		
		public static var RosDTOList:ArrayCollection;		
		public static var PhysicalDTOList:ArrayCollection;
		
		public static var DTOList:ArrayCollection;
	
	
		public static function setMainCategoryToNormal(DTOList:ArrayCollection, mainCategoryId:int,setNotesToNormal:Boolean, subCategoryId:int=-1): Boolean
		{
			var retVal:Boolean;
		
			if(DTOList !=null && DTOList.length>0)
			{
				var i:int;
				for(i=0;i<DTOList.length;i++)
				{
					var dto:ROSPhysicalBaseDTO = DTOList.getItemAt(i) as ROSPhysicalBaseDTO ; 
					var forceNormal:Boolean = ! IsAllChildNormal( dto );
					if(dto.MainCategoryTypeID == mainCategoryId && subCategoryId==-1)
					{
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:ROSPhysicalBaseDTO = dto.children.getItemAt(j) as ROSPhysicalBaseDTO ;
							if(child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:ROSPhysicalBaseDTO  = child.children.getItemAt(k) as ROSPhysicalBaseDTO;
									retVal = ToggleNormal( subChild, forceNormal );
								} //end for --- subChild
							}
							retVal = ToggleNormal( child, forceNormal );
						} //end for --- Child
						retVal = ToggleNormal( dto, forceNormal );
						break;//finish on current Node 
					} //end if --- Current Child
					else if(dto.MainCategoryTypeID == mainCategoryId && subCategoryId!=-1)
					{
						var l:int;
						for(l=0;l<dto.children.length;l++)
						{
							var child:ROSPhysicalBaseDTO = dto.children.getItemAt(l) as ROSPhysicalBaseDTO ;
							if(child.children!=null && child.children.length>0)
							{
								if(subCategoryId == child.SubCategoryTypeID)
								{
									forceNormal = ! IsAllChildNormal( child );
									var m:int;
									for(m=0;m<child.children.length;m++)
									{
										var subChild:ROSPhysicalBaseDTO  = child.children.getItemAt(m) as ROSPhysicalBaseDTO;
										retVal = ToggleNormal( subChild, forceNormal );
									} 
								}
							}
						}
					}
				}//end for --- dto
			}
			
			return retVal
		}
		
		public static function setToNormal(ROSPhysicalBaseDTOList:ArrayCollection, setNotesToNormal:Boolean ): Boolean
		{
			var retVal:Boolean 	= false;
			if(ROSPhysicalBaseDTOList !=null && ROSPhysicalBaseDTOList.length>0)
			{
				var dto:ROSPhysicalBaseDTO = ROSPhysicalBaseDTOList.getItemAt(0) as ROSPhysicalBaseDTO;
				var forceNormal:Boolean = ! IsAllChildNormal( dto );
				
				var i:int;
				for(i=0;i<ROSPhysicalBaseDTOList.length;i++)
				{
					dto = ROSPhysicalBaseDTOList.getItemAt(i) as ROSPhysicalBaseDTO;
					
					var j:int;
					for(j=0;j<dto.children.length;j++)
					{
						var child:ROSPhysicalBaseDTO = dto.children.getItemAt(j) as ROSPhysicalBaseDTO ;
						
						if(child.children!=null && child.children.length>0)
						{
							var k:int;
							for(k=0;k<child.children.length;k++)
							{
								var subChild:ROSPhysicalBaseDTO  = child.children.getItemAt(k) as ROSPhysicalBaseDTO;
								retVal = ToggleNormal( subChild, forceNormal );
							}//end for subChild
						}
						retVal = ToggleNormal( child, forceNormal );
					}//end for Child
					retVal = ToggleNormal( dto, forceNormal );
				}//end for dto
			}
			
			return retVal;
		}
		
		private static function ToggleNormal( dto:ROSPhysicalBaseDTO, forceNormal:Boolean = false ):Boolean
		{
			var retVal:Boolean 	= false;
			
			if( UtilityFunctions.IsNullOrEmpty( dto.IsNormal ) || forceNormal  )
			{
				dto.IsNormal = Constants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else if( dto.IsDirty == false && dto.IsNormal == Constants.STRING_FALSE )
			{
				dto.IsNormal = Constants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else
			{
				dto.IsNormal 	= Constants.STRING_FALSE;
				dto.IsDirty 	= false;
			}
			
			dto.Notes 		= Constants.EMPTY_STRING;
			dto.DictationID = Constants.GUID_FORMAT;
			dto.IsAbNormal 	= Constants.STRING_FALSE;
			
			return retVal;
		}
		
		public static function checkMainCategoryNotes(ROSPhysicalBaseDTOList:ArrayCollection, mainCategoryId:int, SubCatID:int = -1): Boolean
		{
			var notesExists:Boolean		= false;
			if(ROSPhysicalBaseDTOList !=null && ROSPhysicalBaseDTOList.length>0)
			{
				var i:int;
				for(i=0;i<ROSPhysicalBaseDTOList.length;i++)
				{
					var dto:ROSPhysicalBaseDTO = ROSPhysicalBaseDTOList.getItemAt(i) as ROSPhysicalBaseDTO ; 
					if(dto.MainCategoryTypeID == mainCategoryId)
					{
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:ROSPhysicalBaseDTO = dto.children.getItemAt(j) as ROSPhysicalBaseDTO ;
							//if(child.Notes!=null && child.Notes.length>0)
							//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
							if(child.Notes!=null && child.Notes.length>0)
							{
								notesExists=true;
								break;
							}
							
							if(child.DictationID!=null && child.DictationID.length>0 && child.DictationID != Constants.GUID_FORMAT )
							{
								notesExists=true;
								break;
							}
							
							if( SubCatID != -1 && child.SubCategoryTypeID == SubCatID )
							{
								if(child.children!=null && child.children.length>0)
								{
									var k:int;
									for(k=0;k<child.children.length;k++)
									{
										var subChild:ROSPhysicalBaseDTO = child.children.getItemAt(k) as ROSPhysicalBaseDTO ;
										
										//if(subChild.Notes!=null && subChild.Notes.length>0)
										//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
										if(subChild.Notes!=null && subChild.Notes.length>0 )
										{
											notesExists=true;
											break;
										}
										
										if(subChild.DictationID!=null && subChild.DictationID.length>0  && child.DictationID != Constants.GUID_FORMAT )
										{
											notesExists=true;
											break;
										}
									}
								}
							}
							else if(SubCatID == -1 && child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:ROSPhysicalBaseDTO = child.children.getItemAt(k) as ROSPhysicalBaseDTO ;
									
									//if(subChild.Notes!=null && subChild.Notes.length>0)
									//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
									if(subChild.Notes!=null && subChild.Notes.length>0 )
									{
										notesExists=true;
										break;
									}
									
									if(subChild.DictationID!=null && subChild.DictationID.length>0 && subChild.DictationID != Constants.GUID_FORMAT )
									{
										notesExists=true;
										break;
									}
								}
							}
							if( notesExists )
								break;
						}
						if( notesExists )
							break;
					}
					if( notesExists )
						break;
				}			 
			}		
			return notesExists;
		}
		
		public static function checkMainCategoryNotesForAbnormal(DTOList:ArrayCollection, mainCategoryId:int, SubCatID:int = -1): Boolean
		{
			var notesExists:Boolean		= false;
			if(DTOList !=null && DTOList.length>0)
			{
				var i:int;
				for(i=0;i<DTOList.length;i++)
				{
					var dto:ROSPhysicalBaseDTO = DTOList.getItemAt(i) as ROSPhysicalBaseDTO ; 
					if(dto.MainCategoryTypeID == mainCategoryId)
					{
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:ROSPhysicalBaseDTO = dto.children.getItemAt(j) as ROSPhysicalBaseDTO ;
							//if(child.Notes!=null && child.Notes.length>0)
							//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
							if(child.Notes!=null && child.Notes.length>0 && child.IsAbNormal == Constants.STRING_TRUE)
							{
								notesExists=true;
								break;
							}
							
							if(child.DictationID!=null && child.DictationID.length>0 && child.DictationID != Constants.GUID_FORMAT && child.IsAbNormal == Constants.STRING_TRUE)
							{
								notesExists=true;
								break;
							}
							
							if( SubCatID != -1 && child.SubCategoryTypeID == SubCatID )
							{
								if(child.children!=null && child.children.length>0)
								{
									var k:int;
									for(k=0;k<child.children.length;k++)
									{
										var subChild:ROSPhysicalBaseDTO = child.children.getItemAt(k) as ROSPhysicalBaseDTO ;
										
										//if(subChild.Notes!=null && subChild.Notes.length>0)
										//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
										if(subChild.Notes!=null && subChild.Notes.length>0 && subChild.IsAbNormal == Constants.STRING_TRUE)
										{
											notesExists=true;
											break;
										}
										
										if(subChild.DictationID!=null && subChild.DictationID.length>0  && child.DictationID != Constants.GUID_FORMAT && subChild.IsAbNormal == Constants.STRING_TRUE)
										{
											notesExists=true;
											break;
										}
									}
								}
							}
							else if(SubCatID == -1 && child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:ROSPhysicalBaseDTO = child.children.getItemAt(k) as ROSPhysicalBaseDTO ;
									
									//if(subChild.Notes!=null && subChild.Notes.length>0)
									//Tahir Alvi - only check notes in Abnormal case, if notes exsist in Normal ignore
									if(subChild.Notes!=null && subChild.Notes.length>0 && subChild.IsAbNormal == Constants.STRING_TRUE)
									{
										notesExists=true;
										break;
									}
									
									if(subChild.DictationID!=null && subChild.DictationID.length>0 && subChild.DictationID != Constants.GUID_FORMAT && subChild.IsAbNormal == Constants.STRING_TRUE)
									{
										notesExists=true;
										break;
									}
								}
							}
							if( notesExists )
								break;
						}
						if( notesExists )
							break;
					}
					if( notesExists )
						break;
				}			 
			}		
			return notesExists;
		}
		
		public static function checkNormal(DTOList:ArrayCollection): Boolean
		{
			var retVal:Boolean = true;
			
			if(DTOList !=null && DTOList.length>0)
			{
				var i:int;
				for(i=0;i<DTOList.length;i++)
				{
					var dto:ROSPhysicalBaseDTO = DTOList.getItemAt(i) as ROSPhysicalBaseDTO ;
					retVal = IsAllChildNormal( dto );
					if( ! retVal )
						break;
				}
			}
			
			return retVal;
		}
		
		public static function checkNotes(DTOList:ArrayCollection): Boolean
		{
			var notesExists:Boolean 	= false;
			if(DTOList !=null && DTOList.length>0)
			{
				var i:int;
				for(i=0;i<DTOList.length;i++)
				{
					var dto:ROSPhysicalBaseDTO = DTOList.getItemAt(i) as ROSPhysicalBaseDTO ; 
					
					var j:int;
					for(j=0;j<dto.children.length;j++)
					{
						var child:ROSPhysicalBaseDTO = dto.children.getItemAt(j) as ROSPhysicalBaseDTO ;
						if( ! UtilityFunctions.IsNullOrEmpty( child.Notes ) || (! UtilityFunctions.IsNullOrEmpty( child.DictationID ) && child.DictationID != Constants.GUID_FORMAT) )
						{
							notesExists=true;
							break;
						}
						
						if(child.children!=null && child.children.length>0)
						{
							var k:int;
							for(k=0;k<child.children.length;k++)
							{
								var subChild:ROSPhysicalBaseDTO  = child.children.getItemAt(k) as ROSPhysicalBaseDTO;
								if( ! UtilityFunctions.IsNullOrEmpty( subChild.Notes ) || (! UtilityFunctions.IsNullOrEmpty( subChild.DictationID ) && child.DictationID != Constants.GUID_FORMAT) )
								{
									notesExists=true;
									break;
								}
							}//end for subChild
						}
						
					}//end for Child
					
				}//end for parent		 
			}		
			return notesExists;
		}
		
		public static function IsAllChildNormal( dto:ROSPhysicalBaseDTO ):Boolean
		{
			var retVal:Boolean = true;
			var i:int;
			for( i = 0; i < dto.children.length; i++ )
			{
				var child:ROSPhysicalBaseDTO = dto.children.getItemAt(i) as ROSPhysicalBaseDTO ;
				retVal = child.IsNormal == Constants.STRING_TRUE ;
				if( ! retVal )
					break;
				if( child.Notes )
				{
					retVal = child.Notes.length == 0;
					if( ! retVal )
						break;
				}
			}
			
			return retVal;
		}
	}
}