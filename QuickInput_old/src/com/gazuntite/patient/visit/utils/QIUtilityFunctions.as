package com.gazuntite.patient.visit.utils
{
	import com.gazuntite.common.dto.ICDCodeDTO;
	import com.gazuntite.common.dto.ch.MedicalHistoryDTO;
	import com.gazuntite.common.dto.common.GeneralTypeDTO;
	import com.gazuntite.patient.visit.dto.HPITypeDTO;
	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;
	import com.gazuntite.patient.visit.dto.ModuleNoteDTO;
	import com.gazuntite.patient.visit.dto.ModuleTypeDTO;
	import com.gazuntite.patient.visit.dto.PhysicalDTO;
	import com.gazuntite.patient.visit.dto.ROSDTO;
	import com.gazuntite.patient.visit.dto.SocialHistoryDTO;
	import com.gazuntite.patient.visit.dto.ch.FamilyHistoryDTO;
	import com.gazuntite.patient.visit.dto.ch.FamilyHistoryTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.MedicalHistoryTypeDTO;
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryAddictionDTO;
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryAddictionTypeDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.view.itemrenderers.OptionButton;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;
	
	import spark.components.supportClasses.GroupBase;

	public class QIUtilityFunctions
	{
		//##################################### for Comprehensive history NEW IMPL ########################################
		//#################################################################################################################
		//#################################################################################################################
		public static function EnableSelection(fromParent:GroupBase, onButton:OptionButton ):void
		{
			for( var i:int = 0; i < fromParent.numChildren; i++ )
			{
				var elm:OptionButton = fromParent.getElementAt( i ) as OptionButton;
				if( elm == onButton )
				{
					elm.id_MainButton.selected = true; 
				}
				else
				{
					elm.id_MainButton.selected = false; 
				}
			}
		}
		
		public static function getButtonByLabel(fromParent:GroupBase, labe:String ):OptionButton
		{
			for( var i:int = 0; i < fromParent.numChildren; i++ )
			{
				var elm:OptionButton = fromParent.getElementAt( i ) as OptionButton;
				if( elm.Label == labe )
				{
					return elm;
				}
			}
			return null;
		}
		
		public static function getGeneralHistoryDTO(moduleName:String):MedicalHistoryDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:MedicalHistoryDTO = new MedicalHistoryDTO();
			if(model.LoggedInUserId)
			{
				var module:GeneralTypeDTO = getGeneralSectionMedicaHistoryTypeDTOByName(moduleName);
				if( module && model.GeneralMedicalHistoryList)
				{
					var i:int;
					var found:Boolean=false;
					for(i=0;i<model.GeneralHistoryTypeDTOList.length>0;i++)
					{
						var dto:MedicalHistoryTypeDTO = model.GeneralHistoryTypeDTOList.getItemAt(i) as MedicalHistoryTypeDTO ; 
						if(module.ID == dto.ID)
						{
							dtoToReturn.medicalhistorytype = dto;
							if(dtoToReturn.ID==0)
							{
								dtoToReturn.CreatedBy = model.LoggedInUserId;
								dtoToReturn.CreatedAt = new Date();
							}	
							else if(dtoToReturn.medicalhistorytype.ID>0)
							{
								dtoToReturn.ModifiedBy = model.LoggedInUserId;
								dtoToReturn.ModifiedAt = new Date();
							}
							
							found= true;
							model.GeneralMedicalHistoryList.addItem(dtoToReturn);
							break;
						}
					}
					if(!found)
					{
						dtoToReturn = new MedicalHistoryDTO();
						//dtoToReturn.MedicalHistoryTypeID = module.MedicalHistoryTypeID;
						dtoToReturn.CreatedBy = model.LoggedInUserId;
						dtoToReturn.CreatedAt = new Date();
						//dtoToReturn.VisitID = model.visitId;
						dtoToReturn.ModifiedAt = Constants.NULL_DATE;
						dtoToReturn.DictationID = Constants.GUID_FORMAT;
						
						dtoToReturn.VisitDate	= Constants.NULL_DATE;
						
						//var objICDdto:ICDCodeDTO =new ICDCodeDTO();
						
						//dtoToReturn.ICDCodeList =new ArrayCollection();
						
						model.GeneralMedicalHistoryList.addItem(dtoToReturn);
						
					}
				}
				else if(module)
				{
					if( null == model.GeneralMedicalHistoryList )
					{
						model.GeneralMedicalHistoryList = new ArrayCollection();
					}
					dtoToReturn = new MedicalHistoryDTO();
					dtoToReturn.medicalhistorytype = module;
					dtoToReturn.CreatedBy = model.LoggedInUserId;
					dtoToReturn.CreatedAt = new Date();
					dtoToReturn.VisitID = model.VisitID;
					dtoToReturn.ModifiedAt = Constants.NULL_DATE;
					dtoToReturn.DictationID = Constants.GUID_FORMAT;
					
					dtoToReturn.VisitDate	= Constants.NULL_DATE;
					
					dtoToReturn.ICDDTO =new ICDCodeDTO();
					model.GeneralMedicalHistoryList.addItem(dtoToReturn);
				}
				
			}
			
			return dtoToReturn;
		}
		
		public static function getFamilyHistoryDTO(moduleName:String):FamilyHistoryDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:FamilyHistoryDTO = new FamilyHistoryDTO();
			if(model.LoggedInUserId)
			{
				var module:GeneralTypeDTO = getFamilyHistoryTypeDTOByName(moduleName);
				if( module && model.FamilyHistoryList )
				{
					var i:int;
					var found:Boolean=false;
					for( i=0; i<model.FamilyHistoryTypeDTOList.length>0; i++ )
					{
						var dto:FamilyHistoryTypeDTO = model.FamilyHistoryTypeDTOList.getItemAt(i) as FamilyHistoryTypeDTO ; 
						if(module.ID == dto.ID)
						{
							dtoToReturn.id = dto.ID;
							if(dtoToReturn.id==0)
							{
								dtoToReturn.CreatedBy = model.LoggedInUserId;
								dtoToReturn.CreatedAt = new Date();
							}	
							else if(dtoToReturn.id>0)
							{
								dtoToReturn.ModifiedBy = model.LoggedInUserId;
								dtoToReturn.ModifiedAt = new Date();
							}
							found= true;
							break;
						}
					}
					if(!found)
					{
						dtoToReturn = new FamilyHistoryDTO();
						//dtoToReturn.FamilyHistoryTypeID = module.FamilyHistoryTypeID;
						//dtoToReturn.CreatedBy = model.loggedInUserDTO.UserId;
						dtoToReturn.CreatedAt = new Date();
						dtoToReturn.ModifiedAt = Constants.NULL_DATE;
						dtoToReturn.DictationID = Constants.GUID_FORMAT;
						
						dtoToReturn.VisitDate = Constants.NULL_DATE;
						/*dtoToReturn.PatientDiseaseList =new ArrayCollection();
						model.familyHistoryList.addItem(dtoToReturn);*/
						
					}
				}
				else
				{
					/*if( null == model.familyHistoryList )
					{
						model.familyHistoryList = new ArrayCollection();
					}
					dtoToReturn = new FamilyHistoryDTO();
					dtoToReturn.FamilyHistoryTypeID = module.FamilyHistoryTypeID;
					dtoToReturn.CreatedBy = model.loggedInUserDTO.UserId;
					dtoToReturn.CreatedAt = new Date();
					dtoToReturn.ModifiedAt = Constants.NULL_DATE;
					dtoToReturn.DictationID = Constants.GUID_FORMAT;
					
					dtoToReturn.VisitDate = Constants.NULL_DATE;
					
					
					dtoToReturn.PatientDiseaseList =new ArrayCollection();
					model.familyHistoryList.addItem(dtoToReturn);*/
				}
				
			}
			
			return dtoToReturn;
		}
		
		public static function getSocialHistoryAddictionDTOByName(name:String): SocialHistoryAddictionDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var obj:SocialHistoryAddictionTypeDTO = new SocialHistoryAddictionTypeDTO();		 
			var dtoToReturn:SocialHistoryAddictionDTO = new SocialHistoryAddictionDTO();
			if(model.LoggedInUserId)
			{
				if(model.SocialHistoryAddictionTypeDTOList!=null && model.SocialHistoryAddictionTypeDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.SocialHistoryAddictionTypeDTOList.length;i++)
					{
						var dto:SocialHistoryAddictionTypeDTO = model.SocialHistoryAddictionTypeDTOList.getItemAt(i) as SocialHistoryAddictionTypeDTO ; 
						if(StringUtil.trim(dto.Name).toLowerCase() == StringUtil.trim(name).toLowerCase())
						{
							obj = dto;
							break;
						}
					}			 
				}
				
				if(obj!=null)
				{
					
					if(model.socialHistoryDTO!=null && model.socialHistoryDTO.SocialHistoryAddictionList!=null && model.socialHistoryDTO.SocialHistoryAddictionList.length>0)
					{
						
						var i:int;
						var found:Boolean=false;
						for(i=0;i<model.socialHistoryDTO.SocialHistoryAddictionList.length;i++)
						{
							var listDTO:SocialHistoryAddictionDTO = model.socialHistoryDTO.SocialHistoryAddictionList.getItemAt(i) as SocialHistoryAddictionDTO;
							if(obj.ID == listDTO.SocialHistoryAddictionTypeID)
							{
								dtoToReturn = listDTO;
								found= true;
								break;
							}
							
						}
						if(!found)
						{
							dtoToReturn = new SocialHistoryAddictionDTO();
							dtoToReturn.SocialHistoryAddictionTypeID = obj.ID;
							dtoToReturn.CreatedBy = model.LoggedInUserId;
							dtoToReturn.CreatedAt = new Date();
							dtoToReturn.ModifiedAt = Constants.NULL_DATE;
							dtoToReturn.DictationID = Constants.GUID_FORMAT;
							
							if(model.socialHistoryDTO.SocialHistoryAddictionList==null)
								model.socialHistoryDTO.SocialHistoryAddictionList= new ArrayCollection();
							
							
							model.socialHistoryDTO.SocialHistoryAddictionList.addItem(dtoToReturn);
							
						}
						
					}
					else
					{
						dtoToReturn = new SocialHistoryAddictionDTO();
						dtoToReturn.SocialHistoryAddictionTypeID = obj.ID;
						dtoToReturn.CreatedBy = model.LoggedInUserId;
						dtoToReturn.CreatedAt = new Date();
						dtoToReturn.ModifiedAt = Constants.NULL_DATE;
						//dtoToReturn.VisitId = model.visitDTO.VisitId;
						dtoToReturn.DictationID = Constants.GUID_FORMAT;
						
						if(model.SocialHistoryAddictionTypeDTOList==null)
							model.socialHistoryDTO.SocialHistoryAddictionList= new ArrayCollection();
						
						if(model.socialHistoryDTO == null)
							model.socialHistoryDTO = new SocialHistoryDTO();
							
						model.socialHistoryDTO.SocialHistoryAddictionList.addItem(dtoToReturn);
					}
					
					
				}
			}
			return dtoToReturn;
		}
		
		// user for comprehensive history
		public static function getFamilyHistoryTypeDTOByName(name:String): FamilyHistoryTypeDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var obj:FamilyHistoryTypeDTO ;		 
			if(model.LoggedInUserId)
			{	
				if(model.FamilyHistoryTypeDTOList!=null && model.FamilyHistoryTypeDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.FamilyHistoryTypeDTOList.length;i++)
					{
						var dto:FamilyHistoryTypeDTO = model.FamilyHistoryTypeDTOList.getItemAt(i) as FamilyHistoryTypeDTO ; 
						if(dto.Name == name)
						{
							obj = dto;
							break;
						}
					}			 
				}
			}
			return obj;
			
			return new FamilyHistoryTypeDTO();
		}
		public static function getFamilyHistoryTypeDTOById(id:int): FamilyHistoryTypeDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var obj:FamilyHistoryTypeDTO ;		 
			if(model.LoggedInUserId)
			{	
				if(model.FamilyHistoryTypeDTOList!=null && model.FamilyHistoryTypeDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.FamilyHistoryTypeDTOList.length;i++)
					{
						var dto:FamilyHistoryTypeDTO = model.FamilyHistoryTypeDTOList.getItemAt(i) as FamilyHistoryTypeDTO ; 
						if(dto.ID == id)
						{
							obj = dto;
							break;
						}
					}			 
				}
			}
			return obj;
			
			return new FamilyHistoryTypeDTO();
		}
		
		// for Comprehensive history family section 
		public static function getFamilyHistoryDTO_old(moduleName:String): FamilyHistoryDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var i:int;
			var dtoToReturn:FamilyHistoryDTO;
			if(model.LoggedInUserId)
			{
				var module:FamilyHistoryTypeDTO = getFamilyHistoryTypeDTOByName(moduleName);
					var found:Boolean=false;
				if(model.FamilyHistoryList && model.FamilyHistoryList.length>0)
				{
					for(var i:int = 0;i<model.FamilyHistoryList.length;i++)
					{
						var dto:FamilyHistoryDTO = model.FamilyHistoryList.getItemAt(i) as FamilyHistoryDTO ; 
						/*if(module.FamilyHistoryTypeID == dto.FamilyHistoryTypeID)
						{
							dtoToReturn = dto;
							if(dtoToReturn.PatientFamilyHistoryID==0)
							{
								dtoToReturn.CreatedBy = model.loggedInUserDTO.UserId;
								dtoToReturn.CreatedAt = new Date();
							}	
							else if(dtoToReturn.PatientFamilyHistoryID>0)
							{
								dtoToReturn.ModifiedBy = model.loggedInUserDTO.UserId;
								dtoToReturn.ModifiedAt = new Date();
							}
							found= true;
							break;
						}*/
					}
					if(!found)
					{
						dtoToReturn = new FamilyHistoryDTO();
						//dtoToReturn.FamilyHistoryTypeID = module.FamilyHistoryTypeID;
						dtoToReturn.CreatedBy = model.LoggedInUserId;
						dtoToReturn.CreatedAt = new Date();
						dtoToReturn.ModifiedAt = Constants.NULL_DATE;
						dtoToReturn.DictationID = Constants.GUID_FORMAT;
						
						//M 4 Apr 2011
						//dtoToReturn.VisitDate = model.createdVisitDate;
						
						//dtoToReturn.VisitID = model.visitDTO.VisitId;
						dtoToReturn.VisitDate = Constants.NULL_DATE;
						/*if(model.quickInputDTO.PMH==null)
							model.quickInputDTO.PMH = new PMHDTO();
						
						if(model.quickInputDTO.PMH.ComprehensiveHistory==null)
							model.quickInputDTO.PMH.ComprehensiveHistory = new ComprehensiveHistoryDTO();
						
						if(model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory==null)
							model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory = new ArrayCollection();
						
						model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory.addItem(dtoToReturn);*/
						
					}
				}
				/*else
				{
					dtoToReturn = new FamilyHistoryDTO();
					//Todo: commited by baber to get rid fo the exception for the time being
					dtoToReturn.FamilyHistoryTypeID = module.FamilyHistoryTypeID;
					dtoToReturn.CreatedBy = model.loggedInUserDTO.UserId;
					dtoToReturn.CreatedAt = new Date();
					dtoToReturn.ModifiedAt = Constants.NULL_DATE;
					dtoToReturn.DictationID = Constants.GUID_FORMAT;
					//dtoToReturn.VisitID = model.visitDTO.VisitId;
					
					
					
					dtoToReturn.VisitDate = Constants.NULL_DATE;
					
					//M 4 Apr 2011
					//dtoToReturn.VisitDate = model.createdVisitDate;
					
					if(model.quickInputDTO.PMH==null)
						model.quickInputDTO.PMH = new PMHDTO();
					
					if(model.quickInputDTO.PMH.ComprehensiveHistory==null)
						model.quickInputDTO.PMH.ComprehensiveHistory = new ComprehensiveHistoryDTO();
					
					if(model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory==null)
						model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory = new ArrayCollection();
					
					model.quickInputDTO.PMH.ComprehensiveHistory.FamilyHistory.addItem(dtoToReturn);
				}*/
				
			}
			
			return dtoToReturn;
		}
		
		public static function getGeneralSectionMedicaHistoryTypeDTOByName(name:String): MedicalHistoryTypeDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var obj:MedicalHistoryTypeDTO;		 
			if(model.LoggedInUserId)
			{
				if(model.GeneralHistoryTypeDTOList!=null && model.GeneralHistoryTypeDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.GeneralHistoryTypeDTOList.length;i++)
					{
						var dto:MedicalHistoryTypeDTO = model.GeneralHistoryTypeDTOList.getItemAt(i) as MedicalHistoryTypeDTO ; 
						if(dto.Name == name)
						{
							obj = dto;
							break;
						}
					}			 
				}
			}
			return obj;
			//return new MedicalHistoryTypeDTO();
		}
		
		
		public static function checkSession(code:int): Boolean
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var valid:Boolean =true;
			if(code == Constants.SESSION_INVALID_CODE)
			{
				valid=false;
				
			}
			
			if(model.LoggedInUserId && !valid)
			{
				/*model.UserLoggedIn=false;
				model.quicklinkEnabled =false;
				Alert.show(Messages.SESSION_ID_VALID,  Messages.INFO,4, FlexGlobals.topLevelApplication.mainContainer);
				//signOut();
				FlexGlobals.topLevelApplication.mainContainer.SignOutApplication();*/
			}
			return valid;
		}
		
		public static function getModuleIDByName(moduleName:String): int
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleTypeDTO;
			if(model.LoggedInUserId)
			{
				var i:int;
				
				for(i=0;i<model.moduleType.length;i++)
				{
					var dto:ModuleTypeDTO = model.moduleType.getItemAt(i) as ModuleTypeDTO ; 
					if(moduleName == dto.ModuleName)
					{
						dtoToReturn = dto;
						break;
					}
					
				}
				
			}
			return dtoToReturn.ModuleTypeId;
		}
		
		public static function getModuleNoteDTO(moduleName:String): ModuleNoteDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleNoteDTO;
			if(model.LoggedInUserId)
			{
				
				
				var module:ModuleTypeDTO = getModuleTypeDTOByName(moduleName);
				if(model.moduleNotes!=null && model.moduleNotes.length>0)
				{
					var i:int;
					var found:Boolean=false;
					for(i=0;i<model.moduleNotes.length>0;i++)
					{
						var dto:ModuleNoteDTO = model.moduleNotes.getItemAt(i) as ModuleNoteDTO ; 
						if(module.ModuleTypeId == dto.ModuleTypeId)
						{
							dtoToReturn = dto;
							found= true;
							break;
						}
					}
					if(!found)
					{
						dtoToReturn = new ModuleNoteDTO();
						dtoToReturn.ModuleTypeId = module.ModuleTypeId;
						dtoToReturn.ManagedByUserId = model.LoggedInUserId;
						dtoToReturn.IsDeleted = false;
						dtoToReturn.VisitID = model.VisitID;
						dtoToReturn.VisitDate = model.VisitDate;
						
						if(model.moduleNotes==null)
							model.moduleNotes = new ArrayCollection();
						
						model.moduleNotes.addItem(dtoToReturn);
					}
				}
				else
				{
					dtoToReturn = new ModuleNoteDTO();
					dtoToReturn.ModuleTypeId = module.ModuleTypeId;
					dtoToReturn.ManagedByUserId = model.LoggedInUserId;
					dtoToReturn.VisitID = model.VisitID;
					dtoToReturn.VisitDate = model.VisitDate;
					dtoToReturn.IsDeleted = false;
					
					if(model.moduleNotes==null)
						model.moduleNotes = new ArrayCollection();
					
					model.moduleNotes.addItem(dtoToReturn);
				}
				
				
				
			}
			return dtoToReturn;
		}
		
		/*public static function NotesDTOBYModuleName(moduleName:String):ModuleNoteDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleNoteDTO = new ModuleNoteDTO();
			var moduleID:int = getModuleIDByName(moduleName);
			if(model.LoggedInUserId)
			{
				var i:int;
				
				for(i=0;i<model.moduleNotes.length;i++)
				{
					var dto:ModuleNoteDTO = model.moduleNotes.getItemAt(i) as ModuleNoteDTO ; 
					if(moduleID == dto.ModuleTypeId)
					{
						dtoToReturn = dto;
						break;
					}
					
				}
				
			}
			return dtoToReturn;
		}*/
		
		public static function getModuleDictationDTO(moduleName:String): ModuleDictationDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleDictationDTO;
			if(model.LoggedInUserId)
			{
				
				
				var module:ModuleTypeDTO = getModuleTypeDTOByName(moduleName);
				if(model.moduleDictationList!=null && model.moduleDictationList.length>0)
				{
					var i:int;
					var found:Boolean=false;
					for(i=0;i<model.moduleDictationList.length>0;i++)
					{
						var dto:ModuleDictationDTO = model.moduleDictationList.getItemAt(i) as ModuleDictationDTO ; 
						if(module.ModuleTypeId == dto.ModuleTypeID)
						{
							dtoToReturn = dto;
							found= true;
							break;
						}
					}
					if(!found)
					{
						dtoToReturn = new ModuleDictationDTO();
						dtoToReturn.ModuleTypeID = module.ModuleTypeId;
						dtoToReturn.ManagedByUserId = model.LoggedInUserId;
						dtoToReturn.IsDeleted = false;
						dtoToReturn.VisitID = model.VisitID;
						dtoToReturn.VisitDate = model.VisitDate;
						//dtoToReturn.DictationTimeStamp= new Date();
						
						if(model.moduleNotes==null)
							model.moduleNotes = new ArrayCollection();
						
						model.moduleDictationList.addItem(dtoToReturn);
					}
				}
				else
				{
					dtoToReturn = new ModuleDictationDTO();
					dtoToReturn.ModuleTypeID = module.ModuleTypeId;
					dtoToReturn.ManagedByUserId = model.LoggedInUserId;
					dtoToReturn.VisitID = model.VisitID;
					dtoToReturn.VisitDate = model.VisitDate;
					//dtoToReturn.DictationTimeStamp= new Date();
					dtoToReturn.IsDeleted = false;
					
					if(model.moduleNotes==null)
						model.moduleDictationList = new ArrayCollection();
					
					model.moduleDictationList.addItem(dtoToReturn);
				}
				
				
				
			}
			return dtoToReturn;
		}
		
		private static function getModuleTypeDTOByName(moduleName:String): ModuleTypeDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleTypeDTO;
			if(model.LoggedInUserId)
			{
				var i:int;
				
				for(i=0;i<model.moduleType.length;i++)
				{
					var dto:ModuleTypeDTO = model.moduleType.getItemAt(i) as ModuleTypeDTO ; 
					if(moduleName == dto.ModuleName)
					{
						dtoToReturn = dto;
						break;
					}
					
				}
				
			}
			return dtoToReturn;
		}
	//////////////////////////// ROS/Physical Utility Functions Start /////////////////////
		
		public static function setROSToNormal( setNotesToNormal:Boolean ): Boolean
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var retVal:Boolean 	= false;
			if(model.LoggedInUserId)
			{
				if(model.rosDTOList !=null && model.rosDTOList.length>0)
				{
					var dto:ROSDTO = model.rosDTOList.getItemAt(0) as ROSDTO;
					var forceNormal:Boolean = ! IsROSAllChildNormal( dto );
					
					var i:int;
					for(i=0;i<model.rosDTOList.length;i++)
					{
						dto = model.rosDTOList.getItemAt(i) as ROSDTO;
						
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:ROSDTO = dto.children.getItemAt(j) as ROSDTO ;
							
							if(child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:ROSDTO  = child.children.getItemAt(k) as ROSDTO;
									retVal = ROSToggleNormal( subChild, forceNormal );
								}//end for subChild
							}
							retVal = ROSToggleNormal( child, forceNormal );
						}//end for Child
						retVal = ROSToggleNormal( dto, forceNormal );
					}//end for dto
				}
			}
			
			return retVal;
		}
		
		private static function ROSToggleNormal( dto:ROSDTO, forceNormal:Boolean = false ):Boolean
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
			
			dto.Note		= Constants.EMPTY_STRING;
			dto.DictationID = Constants.GUID_FORMAT;
			dto.IsAbNormal 	= Constants.STRING_FALSE;
			
			return retVal;
		}
		
		public static function IsROSAllChildNormal( dto:ROSDTO ):Boolean
		{
			var retVal:Boolean = true;
			var i:int;
			for( i = 0; i < dto.children.length; i++ )
			{
				var child:ROSDTO = dto.children.getItemAt(i) as ROSDTO ;
				retVal = child.IsNormal == Constants.STRING_TRUE ;
				if( ! retVal )
					break;
				if( child.Note )
				{
					retVal = child.Note.length == 0;
					if( ! retVal )
						break;
				}
			}
			
			return retVal;
		}
		
		
		public static function checkROSNotes(): Boolean
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var notesExists:Boolean 	= false;
			if(model.LoggedInUserId)
			{
				if(model.rosDTOList !=null && model.rosDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.rosDTOList.length;i++)
					{
						var dto:ROSDTO = model.rosDTOList.getItemAt(i) as ROSDTO ; 
						
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:ROSDTO = dto.children.getItemAt(j) as ROSDTO ;
							if( ! UtilityFunctions.IsNullOrEmpty( child.Note ) || (! UtilityFunctions.IsNullOrEmpty( child.DictationID ) && child.DictationID != Constants.GUID_FORMAT) )
							{
								notesExists=true;
								break;
							}
							
							if(child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:ROSDTO  = child.children.getItemAt(k) as ROSDTO;
									if( ! UtilityFunctions.IsNullOrEmpty( subChild.Note ) || (! UtilityFunctions.IsNullOrEmpty( subChild.DictationID ) && child.DictationID != Constants.GUID_FORMAT) )
									{
										notesExists=true;
										break;
									}
								}//end for subChild
							}
							
						}//end for Child
						
					}//end for parent		 
				}		
			}	
			return notesExists;
		}
		
		
		
		public static function checkPhysicalsNotes( ): Boolean
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var notesExists:Boolean		= false;
			if(model.LoggedInUserId)
			{
				
				if(model.physicalDTOList !=null && model.physicalDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.physicalDTOList.length;i++)
					{
						var dto:PhysicalDTO = model.physicalDTOList.getItemAt(i) as PhysicalDTO ; 
						
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:PhysicalDTO = dto.children.getItemAt(j) as PhysicalDTO ; 
							if(child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:PhysicalDTO = child.children.getItemAt(k) as PhysicalDTO ; 
									if(subChild.Note!=null && subChild.Note.length>0 && ! UtilityFunctions.IsNullOrEmpty( subChild.DictationID ) && subChild.DictationID != Constants.GUID_FORMAT)
									{
										notesExists =true;
										break;
									}
									
									
								}
								
								
							}
							else
							{
								if(child.Note!=null && child.Note.length>0 && ! UtilityFunctions.IsNullOrEmpty( child.DictationID ) && child.DictationID != Constants.GUID_FORMAT)
								{
									notesExists =true;
									break;
								}
							}
						}
						
					}			 
				}	
			}
			return notesExists;
		}
		
		public static function setPhysicalsToNormal( setNotesToNormal:Boolean ): Boolean
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var retVal:Boolean 	= false;
			if(model.LoggedInUserId)
			{
				if(model.physicalDTOList !=null && model.physicalDTOList.length>0)
				{
					var dto:PhysicalDTO = model.physicalDTOList.getItemAt(0) as PhysicalDTO;
					var forceNormal:Boolean = ! IsPhysicalsAllChildNormal( dto );
					
					var i:int;
					for(i=0;i<model.physicalDTOList.length;i++)
					{
						dto = model.physicalDTOList.getItemAt(i) as PhysicalDTO;
						
						var j:int;
						for(j=0;j<dto.children.length;j++)
						{
							var child:PhysicalDTO = dto.children.getItemAt(j) as PhysicalDTO ;
							
							if(child.children!=null && child.children.length>0)
							{
								var k:int;
								for(k=0;k<child.children.length;k++)
								{
									var subChild:PhysicalDTO  = child.children.getItemAt(k) as PhysicalDTO;
									retVal = PhysicalsToggleNormal( subChild, forceNormal );
								}//end for subChild
							}
							retVal = PhysicalsToggleNormal( child, forceNormal );
						}//end for Child
						retVal = PhysicalsToggleNormal( dto, forceNormal );
					}//end for dto
				}
			}
			
			return retVal;
		}
		
		
		private static function PhysicalsToggleNormal( dto:PhysicalDTO, forceNormal:Boolean = false ):Boolean
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
			
			dto.Note 		= Constants.EMPTY_STRING;
			dto.DictationID = Constants.GUID_FORMAT;
			
			return retVal;
		}
		
		private static function IsPhysicalsAllChildNormal( dto:PhysicalDTO ):Boolean
		{
			var retVal:Boolean = true;
			var i:int;
			for( i = 0; i < dto.children.length; i++ )
			{
				var child:PhysicalDTO = dto.children.getItemAt(i) as PhysicalDTO ;
				retVal = child.IsNormal == Constants.STRING_TRUE ;
				
				if( ! retVal )
					break;
				
				if( child.Note )
				{
					retVal = child.Note.length == 0;
					if( ! retVal )
						break;
				}
			}
			
			return retVal;
		}
		//////////////////////////// ROS/Physical Utility Functions Ends/////////////////////
		

		
		public static function getHPIDetailTypeIdByName(name:String): int
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var idToReturn:int ;		 
			if(model.LoggedInUserId)
			{
				if(model.hpiDetailTypesList!=null && model.hpiDetailTypesList.length>0)
				{
					var i:int;
					for(i=0;i<model.hpiDetailTypesList.length;i++)
					{
						var dto:HPITypeDTO = model.hpiDetailTypesList.getItemAt(i) as HPITypeDTO ; 
						if(dto.Name == name)
						{
							idToReturn = dto.ID;
							break;
						}
					}			 
				}
			}
			return idToReturn;
		}
		
		//////////////////////////// follow up /////////////////
		
		public static function getFollowupMethodTypeDTOByName(name:String): GeneralTypeDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var objToReturn:GeneralTypeDTO;		 
			if(model.LoggedInUserId)
			{
				if(model.followUpMethodTypeList !=null && model.followUpMethodTypeList.length>0)
				{
					var i:int;
					for(i=0;i<model.followUpMethodTypeList.length;i++)
					{
						var dto:GeneralTypeDTO = model.followUpMethodTypeList.getItemAt(i) as GeneralTypeDTO ; 
						if(dto.Name == name)
						{
							objToReturn = dto;
							break;
						}
					}			 
				}
			}
			return objToReturn;
		}
		
		
		public static function getModuleFamilyNamebyID(id:int):String
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			
			var objToReturn:GeneralTypeDTO;		 
			if(model.LoggedInUserId)
			{
				if(model.FamilyHistoryTypeDTOList !=null && model.FamilyHistoryTypeDTOList.length>0)
				{
					var i:int;
					for(i=0;i<model.FamilyHistoryTypeDTOList.length;i++)
					{
						var dto:GeneralTypeDTO = model.FamilyHistoryTypeDTOList.getItemAt(i) as GeneralTypeDTO ; 
						if(dto.ID == id)
						{
							objToReturn = dto;
							break;
						}
					}			 
				}
			}
			return objToReturn.Name;
		}
		
	}
}