package com.gazuntite.input.utils
{
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.dto.ModuleTypeDTO;
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.dto.assessment.diagnosis.ICDCodeDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.dto.physical.ccHpi.HPITypeDTO;
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.dto.physical.ros.ROSDTO;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryAddictionDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryAddictionTypeDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryDTO;
	import com.gazuntite.common.view.components.CustomSaveAndMoveNextAlert;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;

	public class QIUtilityFunctions
	{
		public static function AskMoveNextAlert(onOk:Function, onCancel:Function = null, hideOption:String = ''):void
		{
			var alert:CustomSaveAndMoveNextAlert = new CustomSaveAndMoveNextAlert();
			alert.show( function():void
			{
				if( null != onOk )
					onOk(alert.selectedValue)
			}, 
			function():void
			{
				if(null != onCancel)
					onCancel.call(null);
			});
			
			if( hideOption.length > 0)
				alert.hideOption( hideOption );
		}
		
		//##################################### for Comprehensive history NEW IMPL ########################################
		//#################################################################################################################
		//#################################################################################################################
		
		public static function getGeneralHistoryDTO(moduleName:String): MedicalHistoryDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:MedicalHistoryDTO = new MedicalHistoryDTO();
			if(model.LoggedInUserId)
			{
				var module:GeneralTypeDTO = getGeneralSectionMedicaHistoryTypeDTOByName(moduleName);
				if( module && model.GeneralHistoryList)
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
							model.GeneralHistoryList.addItem(dtoToReturn);
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
						dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
						dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
						
						dtoToReturn.VisitDate	= QIConstants.NULL_DATE;
						
						//var objICDdto:ICDCodeDTO =new ICDCodeDTO();
						
						//dtoToReturn.ICDCodeList =new ArrayCollection();
						
						model.GeneralHistoryList.addItem(dtoToReturn);
						
					}
				}
				else if(module)
				{
					if( null == model.GeneralHistoryList )
					{
						model.GeneralHistoryList = new ArrayCollection();
					}
					dtoToReturn = new MedicalHistoryDTO();
					dtoToReturn.medicalhistorytype = module;
					dtoToReturn.CreatedBy = model.LoggedInUserId;
					dtoToReturn.CreatedAt = new Date();
					dtoToReturn.VisitID = model.VisitID;
					dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
					dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
					
					dtoToReturn.VisitDate	= QIConstants.NULL_DATE;
					
					dtoToReturn.ICDDTO =new ICDCodeDTO();
					model.GeneralHistoryList.addItem(dtoToReturn);
				}
				
			}
			
			return dtoToReturn;
		}
		
		public static function getFamilyHistoryDTO(moduleName:String): FamilyHistoryDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:FamilyHistoryDTO = new FamilyHistoryDTO();
			if(model.LoggedInUserId)
			{
				var module:FamilyHistoryTypeDTO = getFamilyHistoryTypeDTOByName(moduleName);
				if( module && model.FamilyHistoryList )
				{
					var i:int;
					var found:Boolean=false;
					for( i=0; i<model.FamilyHistoryTypeDTOList.length>0; i++ )
					{
						var dto:FamilyHistoryTypeDTO = model.FamilyHistoryTypeDTOList.getItemAt(i) as FamilyHistoryTypeDTO ; 
						if(module.ID == dto.ID)
						{
							dtoToReturn.FamilyHistoryType = dto;
							if(dtoToReturn.ID==0)
							{
								dtoToReturn.CreatedBy = model.LoggedInUserId;
								dtoToReturn.CreatedAt = new Date();
							}	
							else if(dtoToReturn.ID>0)
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
						dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
						dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
						
						dtoToReturn.VisitDate = QIConstants.NULL_DATE;
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
							dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
							dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
							
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
						dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
						//dtoToReturn.VisitId = model.visitDTO.VisitId;
						dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
						
						//if(model.SocialHistoryAddictionTypeDTOList==null)
						//	model.socialHistoryDTO.SocialHistoryAddictionList= new ArrayCollection();
						
						if(model.socialHistoryDTO == null)
							model.socialHistoryDTO = new SocialHistoryDTO();
						
						if(model.socialHistoryDTO.SocialHistoryAddictionList==null)
							model.socialHistoryDTO.SocialHistoryAddictionList= new ArrayCollection();
							
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
						dtoToReturn.ModifiedAt = QIConstants.NULL_DATE;
						dtoToReturn.DictationID = QIConstants.GUID_FORMAT;
						
						//M 4 Apr 2011
						//dtoToReturn.VisitDate = model.createdVisitDate;
						
						//dtoToReturn.VisitID = model.visitDTO.VisitId;
						dtoToReturn.VisitDate = QIConstants.NULL_DATE;
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
			
			var obj:MedicalHistoryTypeDTO ;		 
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
			if(code == QIConstants.SESSION_INVALID_CODE)
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
		
		public static function getModuleNoteDTO(moduleName:String):ModuleNoteDTO
		{
			var model : QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleNoteDTO;
			
			if (model.LoggedInUserId)
			{
				var module:ModuleTypeDTO = getModuleTypeDTOByName(moduleName);
				
				if (!module)
					return dtoToReturn;
				
				if (model.moduleNotes != null && model.moduleNotes.length > 0)
				{
					var i:int;
					var found:Boolean = false;
					
					for (i = 0; i < model.moduleNotes.length > 0; i++)
					{
						var dto:ModuleNoteDTO = model.moduleNotes.getItemAt(i) as ModuleNoteDTO;
						if (module.ModuleTypeId == dto.ModuleTypeId)
						{
							dtoToReturn = dto;
							found = true;
							break;
						}
					}
					
					if (!found)
					{
						dtoToReturn = new ModuleNoteDTO();
						dtoToReturn.ModuleTypeId = module.ModuleTypeId;
						dtoToReturn.ManagedByUserId = model.LoggedInUserId;
						dtoToReturn.IsDeleted = false;
						dtoToReturn.VisitID = model.VisitID;
						dtoToReturn.VisitDate = model.VisitDate;
						
						if (model.moduleNotes == null)
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
					dtoToReturn.CreatedAt = new Date();
					
					if (model.moduleNotes == null)
						model.moduleNotes = new ArrayCollection();
					
					model.moduleNotes.addItem(dtoToReturn);
				}	
			}
			
			dtoToReturn.ModifiedAt = new Date();
			
			return dtoToReturn;
		}
		
		public static function getModuleDictationDTO(moduleName:String):ModuleDictationDTO
		{
			var model:QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleDictationDTO;
			
			if (model.LoggedInUserId)
			{
				var module:ModuleTypeDTO = getModuleTypeDTOByName(moduleName);
				
				if (!module)
					return dtoToReturn;
				
				if (model.moduleDictationList != null && model.moduleDictationList.length > 0)
				{
					var i:int;
					var found:Boolean = false;
					for (i = 0; i < model.moduleDictationList.length > 0; i++)
					{
						var dto:ModuleDictationDTO = model.moduleDictationList.getItemAt(i) as ModuleDictationDTO ; 
						if (module.ModuleTypeId == dto.ModuleTypeID)
						{
							dtoToReturn = dto;
							found= true;
							break;
						}
					}
					
					if (!found)
					{
						dtoToReturn = new ModuleDictationDTO();
						dtoToReturn.ModuleTypeID = module.ModuleTypeId;
						dtoToReturn.ManagedByUserId = model.LoggedInUserId;
						dtoToReturn.IsDeleted = false;
						dtoToReturn.VisitID = model.VisitID;
						dtoToReturn.VisitDate = model.VisitDate;
						
						if (model.moduleDictationList == null)
							model.moduleDictationList = new ArrayCollection();
						
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
					
					dtoToReturn.IsDeleted = false;
					
					if (model.moduleDictationList == null)
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
		
		public static function getModuleTypeDTOByID(moduleTypeID:int):ModuleTypeDTO
		{
			var model:QIModelLocator = QIModelLocator.getInstance();
			var dtoToReturn:ModuleTypeDTO;
			
			if (!model.moduleType)
				return dtoToReturn;
			
			if (model.LoggedInUserId)
			{
				for (var i:int = 0; i < model.moduleType.length; i++)
				{
					var dto:ModuleTypeDTO = model.moduleType.getItemAt(i) as ModuleTypeDTO;
					
					if (moduleTypeID == dto.ModuleTypeId)
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
				dto.IsNormal = QIConstants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else if( dto.IsDirty == false && dto.IsNormal == QIConstants.STRING_FALSE )
			{
				dto.IsNormal = QIConstants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else
			{
				dto.IsNormal 	= QIConstants.STRING_FALSE;
				dto.IsDirty 	= false;
			}
			
			dto.Note		= QIConstants.EMPTY_STRING;
			dto.DictationID = QIConstants.GUID_FORMAT;
			dto.IsAbNormal 	= QIConstants.STRING_FALSE;
			
			return retVal;
		}
		
		public static function IsROSAllChildNormal( dto:ROSDTO ):Boolean
		{
			var retVal:Boolean = true;
			var i:int;
			for( i = 0; i < dto.children.length; i++ )
			{
				var child:ROSDTO = dto.children.getItemAt(i) as ROSDTO ;
				retVal = child.IsNormal == QIConstants.STRING_TRUE ;
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
							if( ! UtilityFunctions.IsNullOrEmpty( child.Note ) || (! UtilityFunctions.IsNullOrEmpty( child.DictationID ) && child.DictationID != QIConstants.GUID_FORMAT) )
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
									if( ! UtilityFunctions.IsNullOrEmpty( subChild.Note ) || (! UtilityFunctions.IsNullOrEmpty( subChild.DictationID ) && child.DictationID != QIConstants.GUID_FORMAT) )
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
									if(subChild.Note!=null && subChild.Note.length>0 && ! UtilityFunctions.IsNullOrEmpty( subChild.DictationID ) && subChild.DictationID != QIConstants.GUID_FORMAT)
									{
										notesExists =true;
										break;
									}
									
									
								}
								
								
							}
							else
							{
								if(child.Note!=null && child.Note.length>0 && ! UtilityFunctions.IsNullOrEmpty( child.DictationID ) && child.DictationID != QIConstants.GUID_FORMAT)
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
				dto.IsNormal = QIConstants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else if( dto.IsDirty == false && dto.IsNormal == QIConstants.STRING_FALSE )
			{
				dto.IsNormal = QIConstants.STRING_TRUE;
				dto.IsDirty = true;
				
				retVal = true;
			}
			else
			{
				dto.IsNormal 	= QIConstants.STRING_FALSE;
				dto.IsDirty 	= false;
			}
			
			dto.Note 		= QIConstants.EMPTY_STRING;
			dto.DictationID = QIConstants.GUID_FORMAT;
			
			return retVal;
		}
		
		private static function IsPhysicalsAllChildNormal( dto:PhysicalDTO ):Boolean
		{
			var retVal:Boolean = true;
			var i:int;
			for( i = 0; i < dto.children.length; i++ )
			{
				var child:PhysicalDTO = dto.children.getItemAt(i) as PhysicalDTO ;
				retVal = child.IsNormal == QIConstants.STRING_TRUE ;
				
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
		
		public static function isDiabetesPaitent():void
		{
			var model:QIModelLocator = QIModelLocator.getInstance();
			var retVal:Boolean  = false;
			
			var chkCode:Function = function ( diagnosisList:ArrayCollection ):Boolean 
			{
				if( null == diagnosisList ) 
					return false;
				
				var i:int = 0;
				for( i = 0; i < diagnosisList.length; i++ )
				{
					var diagnosisDTO:DiagnosisDTO = diagnosisList.getItemAt( i ) as DiagnosisDTO;
					var IcdCodeName:Number = Number( diagnosisDTO.IcdDto.IcdCodeName );
					switch( IcdCodeName )
					{
						case 250.01:    //250.01 	Diabetes I, uncomplicated
						case 250.03:    //250.03 	Diabetes I, uncontrolled
						case 250.23:    //250.23 	Diabetes I, w/ hyperosmolarity, uncontrolled
						case 250.41:    //250.41 	Diabetes I, w/ renal changes
						case 250.91:    //250.91 	Diabetes I, w/ unspec. complications
						case 250.00:    //250.00 	Diabetes II, uncomplicated
						case 250.90:    //250.90 	Diabetes II, w/ unspec. complications
						case 250.62:    //250.62 	Diabetes II/unspec., w/neurological manifestations, uncontrolled
						case 250.02:    //250.02 	Diabetes II/unspec., w/o complications, uncontrolled
						case 250.13:    //250.13 	Diabetic ketoacidosis, uncontrolled
						case 250.51:    //250.51 	Diabetic retinopathy, background
						case 362.01:    //362.01 	Retinopathy, diabetic, background
						case 362.02:    //362.02 	Retinopathy, diabetic, proliferative
						case 648.83:    //648.83 	Gestational diabetes, antepartum
							return true;
							break;
					}
				}
				
				return false
			}
			
			retVal = chkCode( model.diagnosisDTOAcuteHistoryList );
			
			if( false == retVal ) 
				retVal = chkCode( model.diagnosisDTOChronicHistoryList );
			
			if( false == retVal ) 
				retVal = chkCode( model.diagnosisDTOList );
			
			model.ShowDiabeticControl =  retVal;
			//return retVal;
		}
		
		/**
		 * sortOnComplexDataFields() method sort an array collection on the basis of 
		 * complex data fields e.g in InHouseLabDTO InHouseLabTestType.Name
		 * after sorting, it reassigns serialnumbers accordingly
		 * */
		public static function sortOnComplexDataFields(arrCol:ArrayCollection, property:String):ArrayCollection
		{
			var fields:Array = property.split(".");
			
			if (!arrCol)
				return arrCol;
			
			var value1:String;
			var value2:String;
			
			for (var i:int = 0; i < arrCol.length; i++)
			{
				for (var j:int = i + 1; j < arrCol.length; j++)
				{
					value1 = deriveComplexData(arrCol[i], fields);
					
					value2 = deriveComplexData(arrCol[j], fields);
					
					if (value1 && value1.length > 0 && value2 && value2.length > 0)
					{
						if (value1 > value2)
							arrCol = swap(i, j, arrCol);
					}
				}
			}
			
			reAssignSerialNumbers(arrCol);
			
			return arrCol;
		}
		
		private static function swap(i:int, j:int, arrCol:ArrayCollection):ArrayCollection
		{
			var valueAtI:Object = arrCol[i];
			var valueAtJ:Object = arrCol[j];
			
			var tempArrCol:ArrayCollection = new ArrayCollection();
			
			for (var x:int = 0; x < arrCol.length; x++)
			{
				if (x == i)
				{
					tempArrCol.addItemAt(valueAtJ, x);
				}
					
				else if (x == j)
				{
					tempArrCol.addItemAt(valueAtI, x);
				}
					
				else
				{
					tempArrCol.addItemAt(arrCol[x], x);
				}
			}
			
			return tempArrCol;
		}
		
		private static function deriveComplexData(value:*, fields:Array):*
		{
			var obj:* = value;
			
			for (var i:int = 0; i < fields.length; i++)
			{
				obj = obj[fields[i]];
			}
			
			return obj;
		}
		
		public static function reAssignSerialNumbers(arrCol:ArrayCollection):void
		{
			if (!arrCol)
				return;
			
			for (var i:int = 0; i < arrCol.length; i++)
			{
				var obj:Object = arrCol[i];
				
				if (obj && obj.hasOwnProperty("serialNumber"))
					obj.serialNumber = i + 1;
			}
		}
		
		
		public static function setNoPagingAndFiltering(page:PageDTO):void
		{
			page.fromDate = QIConstants.NULL_DATE;
			page.toDate = QIConstants.NULL_DATE;
			page.pageSize = 0;
			page.lastVisitNumber = 0;
		}
	}
}