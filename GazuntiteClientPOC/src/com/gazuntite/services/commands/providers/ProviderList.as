package com.gazuntite.services.commands.providers
{
	
	import com.gazuntite.services.valueObjects.provider.ProviderDTO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ProviderList
	{
		private var _AllProviders:ArrayCollection;
		
		public function ProviderList()
		{
			AllProviders = new ArrayCollection();
		}

		public function get AllProviders():ArrayCollection
		{
			return _AllProviders;
		}

		public function set AllProviders(value:ArrayCollection):void
		{
			_AllProviders = value;
		}
		
		public function FromXML(x:XML):void
		{
			var xlist:XMLList = x.ContactSearchDTO;
			AllProviders.removeAll();
			var i:int = 0;
			var dto:ProviderDTO;
			
			for( i = 0; i < xlist.length(); i++ )
			{
				dto = new ProviderDTO();
				dto.FromXML( xlist[i]);
				AllProviders.addItem( dto );
			}
		}

		
		public static const providersXML :XML =<ArrayOfContactSearchDTO xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tes</FirstName>
				<LastName>Final</LastName>
				<MiddleName>Mid</MiddleName>
				<PrefixTypeID>2</PrefixTypeID>
				<Suffix>455</Suffix>
				<UserEmail>shafiq.ahmed@zigron.com</UserEmail>
				<UserId>597</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Malik</FirstName>
				<LastName>Tamjeed</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>tamjeed.hassan@zigron.com</UserEmail>
				<UserId>605</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Barbara</FirstName>
				<LastName>Geater</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>bgeatermd@rentropandgeater.com</UserEmail>
				<UserId>598</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tamara</FirstName>
				<LastName>Howard-Fain</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>tfain@rentropandgeater.com</UserEmail>
				<UserId>599</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Miranda</FirstName>
				<LastName>Johnson</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>mjohnson@rentropandgeater.com</UserEmail>
				<UserId>604</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Kelly</FirstName>
				<LastName>Newell</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>knewell@rentropandgeater.com</UserEmail>
				<UserId>605</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>David</FirstName>
				<LastName>Flatley</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>david.flatley@gmail.com</UserEmail>
				<UserId>605</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Blackely</FirstName>
				<LastName>Weatherford</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>bweatherford@rentropandgeater.com</UserEmail>
				<UserId>606</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Jessica</FirstName>
				<LastName>Hardy</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>jhardy@rentropandgeater.com</UserEmail>
				<UserId>607</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Debbie</FirstName>
				<LastName>Weatherly</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>dweatherly@rentropandgeater.com</UserEmail>
				<UserId>608</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Sheila</FirstName>
				<LastName>Reese</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>sreese@rentropandgeater.com</UserEmail>
				<UserId>609</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tasha</FirstName>
				<LastName>Tate</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>ttate@rentropandgeater.com</UserEmail>
				<UserId>610</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tameka</FirstName>
				<LastName>Williams</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>twilliams@rentropandgeater.com</UserEmail>
				<UserId>611</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Bulk</FirstName>
				<LastName>Uploaded</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>Bulk.Uploaded@quivus.com</UserEmail>
				<UserId>42927</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>JOHN</FirstName>
				<LastName>STULL</LastName>
				<MiddleName>new</MiddleName>
				<PrefixTypeID>1</PrefixTypeID>
				<Suffix>3242</Suffix>
				<UserEmail>test1@quivus.com</UserEmail>
				<UserId>42932</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tahir</FirstName>
				<LastName>Alvi</LastName>
				<MiddleName/>
				<PrefixTypeID>1</PrefixTypeID>
				<Suffix/>
				<UserEmail>test2@quivus.com</UserEmail>
				<UserId>42934</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Production</FirstName>
				<LastName>User</LastName>
				<MiddleName>Middle</MiddleName>
				<PrefixTypeID>2</PrefixTypeID>
				<Suffix/>
				<UserEmail>test3@quivus.com</UserEmail>
				<UserId>42984</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tahir</FirstName>
				<LastName>Alvi</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>tahir.azeem@zigron.com</UserEmail>
				<UserId>43083</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Angela</FirstName>
				<LastName>HEaly</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>aealy@rentropandgeater.com</UserEmail>
				<UserId>43091</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Crystal</FirstName>
				<LastName>Weatherly</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>cweatherly@rentropandgeater.com</UserEmail>
				<UserId>43094</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>gazuntite123</Password>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Daphne</FirstName>
				<LastName>Young</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>dyoung@rentropandgeater.com</UserEmail>
				<UserId>43095</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Danielle</FirstName>
				<LastName>Jones</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>djones@rentropandgeater.com</UserEmail>
				<UserId>43096</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Jennifer</FirstName>
				<LastName>Fain</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>jfain@rentropandgeater.com</UserEmail>
				<UserId>43097</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Sherry</FirstName>
				<LastName>Burton</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>sburton@rentropandgeater.com</UserEmail>
				<UserId>43098</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Stacy</FirstName>
				<LastName>Harris</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>sharris@rentropandgeater.com</UserEmail>
				<UserId>43099</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Terry</FirstName>
				<LastName>Netzel</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>tnetzel@rentropandgeater.com</UserEmail>
				<UserId>43100</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Konya</FirstName>
				<LastName>Schumann</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>kschumann@rentropandgeater.com</UserEmail>
				<UserId>43101</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Adrianna</FirstName>
				<LastName>Weber</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>aweber@rentropandgeater.com</UserEmail>
				<UserId>43102</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>test134</FirstName>
				<LastName>test</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>test123@quivus.com</UserEmail>
				<UserId>43138</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>testPhysician</FirstName>
				<LastName>xyz</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>fsdsfdfTesting@ww.com</UserEmail>
				<UserId>43144</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Kashif</FirstName>
				<LastName>Mueen</LastName>
				<MiddleName/>
				<PrefixTypeID>1</PrefixTypeID>
				<Suffix/>
				<UserEmail>kashif.mueen@zigron.com</UserEmail>
				<UserId>48180</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>alam</FirstName>
				<LastName>aaa</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>alamdar4k@yahoo.om</UserEmail>
				<UserId>48206</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Sami</FirstName>
				<LastName>Sahibzada</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>sahibzada.sami@zigron.com</UserEmail>
				<UserId>48237</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Saba</FirstName>
				<LastName>Riaz</LastName>
				<MiddleName/>
				<PrefixTypeID>0</PrefixTypeID>
				<Suffix/>
				<UserEmail>saba.riaz@zigron.com</UserEmail>
				<UserId>48238</UserId>
			</ContactSearchDTO>
			<ContactSearchDTO>
				<ExtensionData/>
				<IsDeleted>false</IsDeleted>
				<IsDirty>false</IsDirty>
				<FirstName>Tes</FirstName>
				<LastName>Final</LastName>
				<MiddleName>Mid</MiddleName>
				<PrefixTypeID>2</PrefixTypeID>
				<Suffix>455</Suffix>
				<UserEmail>saman.khan@zigron.com</UserEmail>
				<UserId>597</UserId>
				<homePage>http://www.quivus.com/</homePage>
				<gmapPage>https://maps.google.com/</gmapPage>
				<notes>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</notes>
				<address>2286 sunset, some address in US</address>
				<LastUpdated>November 21, 2012</LastUpdated>
				<Password>quivus123</Password>
			</ContactSearchDTO>
						
			</ArrayOfContactSearchDTO>

	}
}