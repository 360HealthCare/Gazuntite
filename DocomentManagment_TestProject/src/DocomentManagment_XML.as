package
{
	import modelDto.DocomentDTO;
	
	import mx.collections.ArrayCollection;
	import mx.messaging.management.Attribute;

	public class DocomentManagment_XML
	{
		public var docomentCollection:ArrayCollection = new ArrayCollection();
		
		public function DocomentManagment_XML()
		{
		}
		
		public function GetDocoments():ArrayCollection
		{
			var xlist:XMLList = DocomentXML.PatientDocumentDTO;
			
			var DocDTO:DocomentDTO;
			
			for( var i:int = 0; i < xlist.length(); i++ )
			{
				DocDTO = new DocomentDTO();
				DocDTO.FromXML( xlist[i] );
				docomentCollection.addItem( DocDTO);
			}
			
			return docomentCollection;
		}
		
		public static const DocomentXML :XML = 
			<PatientDocumentDTOList>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6050</DocumentId>
					<DocumentName>ROS Phy Visit.docx</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>a6c6d473-d283-4152-add5-d2bb36b06877</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Ayn</PatientFirstName>
					<PatientFullName>Ayn Rand</PatientFullName>
					<PatientID>48451</PatientID>
					<PatientLastName>Rand</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043814</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC//48451/Forms/a6c6d473-d283-4152-add5-d2bb36b06877.docx</ServerFilePath>
					<StrUploadedDate>2/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Wadeeaa</UploadedByUserFirstName>
					<UploadedByUserFullName>Wadeeaa Kamaal</UploadedByUserFullName>
					<UploadedByUserId>42984</UploadedByUserId>
					<UploadedByUserLastName>Kamaal</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6048</DocumentId>
					<DocumentName>ayn.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>b748464c-d98b-44b1-8292-a5420813ff62</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Ayn</PatientFirstName>
					<PatientFullName>Ayn Rand</PatientFullName>
					<PatientID>48451</PatientID>
					<PatientLastName>Rand</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043814</QuivusId>
					<SectionId>8</SectionId>
					<SectionName>Forms</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC//48451/Forms/b748464c-d98b-44b1-8292-a5420813ff62.jpg</ServerFilePath>
					<StrUploadedDate>2/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Bulk</UploadedByUserFirstName>
					<UploadedByUserFullName>Bulk Uploaded</UploadedByUserFullName>
					<UploadedByUserId>42927</UploadedByUserId>
					<UploadedByUserLastName>Uploaded</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6049</DocumentId>
					<DocumentName>labin_review.png</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>b968ea01-55fb-4b45-8934-c0ae0cb8d97c</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Ayn</PatientFirstName>
					<PatientFullName>Ayn Rand</PatientFullName>
					<PatientID>48451</PatientID>
					<PatientLastName>Rand</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043814</QuivusId>
					<SectionId>8</SectionId>
					<SectionName>Forms</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC//48451/Forms/b968ea01-55fb-4b45-8934-c0ae0cb8d97c.png</ServerFilePath>
					<StrUploadedDate>2/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Bulk</UploadedByUserFirstName>
					<UploadedByUserFullName>Bulk Uploaded</UploadedByUserFullName>
					<UploadedByUserId>42927</UploadedByUserId>
					<UploadedByUserLastName>Uploaded</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6051</DocumentId>
					<DocumentName>vitals.png</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>5e56babd-d98d-7afc-5b6e-961812ddc0cd</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Ayn</PatientFirstName>
					<PatientFullName>Ayn Rand</PatientFullName>
					<PatientID>48451</PatientID>
					<PatientLastName>Rand</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043814</QuivusId>
					<SectionId>9</SectionId>
					<SectionName>Other</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48451/Other/5e56babd-d98d-7afc-5b6e-961812ddc0cd.png</ServerFilePath>
					<StrUploadedDate>2/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Wadeeaa</UploadedByUserFirstName>
					<UploadedByUserFullName>Wadeeaa Kamaal</UploadedByUserFullName>
					<UploadedByUserId>42984</UploadedByUserId>
					<UploadedByUserLastName>Kamaal</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>5953</DocumentId>
					<DocumentName>Desert.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>ac375b3a-7311-a1ef-316a-973bda23becd</DocumentVirtualName>
					<GenderName>Male</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>WENDEL</PatientFirstName>
					<PatientFullName>WENDEL J CHUDY</PatientFullName>
					<PatientID>20110</PatientID>
					<PatientLastName>CHUDY</PatientLastName>
					<PatientMiddleName>J</PatientMiddleName>
					<QuivusId>Ga-018672</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/20110/MISC/ac375b3a-7311-a1ef-316a-973bda23becd.jpg</ServerFilePath>
					<StrUploadedDate>10/25/2012</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>10/25/2012 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>5963</DocumentId>
					<DocumentName>Basic Info.png</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>27210da0-7678-e483-4bb0-941907b0af68</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>helloworld</PatientFirstName>
					<PatientFullName>helloworld test</PatientFullName>
					<PatientID>48406</PatientID>
					<PatientLastName>test</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043769</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48406/MISC/27210da0-7678-e483-4bb0-941907b0af68.png</ServerFilePath>
					<StrUploadedDate>12/13/2012</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>12/13/2012 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6055</DocumentId>
					<DocumentName>Penguins.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>2411d85f-04ac-0092-8ec7-af3edd45aac9</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>build</PatientFirstName>
					<PatientFullName>build test</PatientFullName>
					<PatientID>48459</PatientID>
					<PatientLastName>test</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043822</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48459/MISC/2411d85f-04ac-0092-8ec7-af3edd45aac9.jpg</ServerFilePath>
					<StrUploadedDate>2/6/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/6/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6060</DocumentId>
					<DocumentName>Chrysanthemum.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>6c8c6d13-6031-9eeb-b093-f275ac59565a</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Kruela</PatientFirstName>
					<PatientFullName>Kruela James</PatientFullName>
					<PatientID>48389</PatientID>
					<PatientLastName>James</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043753</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48389/MISC/6c8c6d13-6031-9eeb-b093-f275ac59565a.jpg</ServerFilePath>
					<StrUploadedDate>2/19/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/19/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6061</DocumentId>
					<DocumentName>Test Document.docx</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>ef365153-a6e4-3d49-83dd-f74cc4f4b2e0</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Kruela</PatientFirstName>
					<PatientFullName>Kruela James</PatientFullName>
					<PatientID>48389</PatientID>
					<PatientLastName>James</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043753</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48389/MISC/ef365153-a6e4-3d49-83dd-f74cc4f4b2e0.docx</ServerFilePath>
					<StrUploadedDate>2/20/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/20/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6064</DocumentId>
					<DocumentName>2.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>61c54db3-4a6d-6bfc-ef2f-c5a809e2b3ca</DocumentVirtualName>
					<GenderName>Male</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>test01</PatientFirstName>
					<PatientFullName>test01 user01</PatientFullName>
					<PatientID>528</PatientID>
					<PatientLastName>user01</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-000002</QuivusId>
					<SectionId>1</SectionId>
					<SectionName>MISC</SectionName>
					<SectionParentId>0</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/528/MISC/61c54db3-4a6d-6bfc-ef2f-c5a809e2b3ca.jpg</ServerFilePath>
					<StrUploadedDate>4/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>4/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>5952</DocumentId>
					<DocumentName>Desert.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>16ac66aa-0437-2f6a-5fb1-968195d31ed3</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>WENDELIN</PatientFirstName>
					<PatientFullName>WENDELIN A JOY</PatientFullName>
					<PatientID>10554</PatientID>
					<PatientLastName>JOY</PatientLastName>
					<PatientMiddleName>A</PatientMiddleName>
					<QuivusId>Ga-009725</QuivusId>
					<SectionId>8</SectionId>
					<SectionName>Forms</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/10554/Forms/16ac66aa-0437-2f6a-5fb1-968195d31ed3.jpg</ServerFilePath>
					<StrUploadedDate>10/25/2012</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>10/25/2012 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6040</DocumentId>
					<DocumentName>Basic Info.png</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>eaadb409-590e-b424-52b7-2df070ba7c66</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>sunshine</PatientFirstName>
					<PatientFullName>sunshine dark</PatientFullName>
					<PatientID>48446</PatientID>
					<PatientLastName>dark</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043809</QuivusId>
					<SectionId>6</SectionId>
					<SectionName>Insurance</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48446/Insurance/eaadb409-590e-b424-52b7-2df070ba7c66.png</ServerFilePath>
					<StrUploadedDate>1/12/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>1/12/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6062</DocumentId>
					<DocumentName>testing pic.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>d35160e5-2c18-19be-7b68-f751526dcf63</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Kruela</PatientFirstName>
					<PatientFullName>Kruela James</PatientFullName>
					<PatientID>48389</PatientID>
					<PatientLastName>James</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043753</QuivusId>
					<SectionId>8</SectionId>
					<SectionName>Forms</SectionName>
					<SectionParentId>2</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48389/Forms/d35160e5-2c18-19be-7b68-f751526dcf63.jpg</ServerFilePath>
					<StrUploadedDate>2/20/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>2/20/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
				<PatientDocumentDTO>
					<IsDeleted />
					<IsDirty >false</IsDirty>
					<ClientFilePath/>
					<CommentId>0</CommentId>
					<CommentNote/>
					<CreatedBy>0</CreatedBy>
					<DocumentId>6065</DocumentId>
					<DocumentName>3.jpg</DocumentName>
					<DocumentTypeId>1</DocumentTypeId>
					<DocumentTypeName>Labs</DocumentTypeName>
					<DocumentVirtualName>4a4dc6a2-d3f3-b8a8-5c68-c5a92d888850</DocumentVirtualName>
					<GenderName>Female</GenderName>
					<IsDocumentFileUploaded>false</IsDocumentFileUploaded>
					<LastSeenByUserId>0</LastSeenByUserId>
					<PatientFirstName>Kruela</PatientFirstName>
					<PatientFullName>Kruela James</PatientFullName>
					<PatientID>48389</PatientID>
					<PatientLastName>James</PatientLastName>
					<PatientMiddleName/>
					<QuivusId>Ga-043753</QuivusId>
					<SectionId>4</SectionId>
					<SectionName>Referral</SectionName>
					<SectionParentId>3</SectionParentId>
					<ServerFilePath>http://quivus.com/Documents/Quivus/Drs Rentrop and Geater PLLC/2245 South Lauderdale St/48389/Referral/4a4dc6a2-d3f3-b8a8-5c68-c5a92d888850.jpg</ServerFilePath>
					<StrUploadedDate>4/1/2013</StrUploadedDate>
					<UploadedByClinicBranchId>0</UploadedByClinicBranchId>
					<UploadedByUserFirstName>Saba</UploadedByUserFirstName>
					<UploadedByUserFullName>Saba Riaz</UploadedByUserFullName>
					<UploadedByUserId>48238</UploadedByUserId>
					<UploadedByUserLastName>Riaz</UploadedByUserLastName>
					<UploadedByUserMiddleName/>
					<UploadedByUserTypeId>0</UploadedByUserTypeId>
					<UploadedDate>4/1/2013 12:00:00 AM</UploadedDate>
				</PatientDocumentDTO>
			</PatientDocumentDTOList>
		
	}
}