package com.zigron.gazuntite.model.valueObjects.search
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class SearchEngineList
	{
		private var _ListAll:ArrayCollection;
		
		public function SearchEngineList()
		{
			_ListAll = new ArrayCollection();
			FromXML( xSearchEngineList );
		}
		
		public function get ListAll():ArrayCollection
		{
			return _ListAll;
		}
		
		public function set ListAll(value:ArrayCollection):void
		{
			_ListAll = value;
		}
		
		public function FromXML( x:XML ):void
		{
			var xList:XMLList = x.SearchEngineDTO;
			var eng:SearchEngineDTO;
			var i:int = 0;
			ListAll.removeAll();
			
			for( i = 0; i < xList.length(); i++ )
			{
				eng = new SearchEngineDTO();
				eng.FromXML( xList[i] );
				ListAll.addItem( eng );
			}
			
		}
		
		
		
		private var xSearchEngineList:XML = <SearchEngineList>
	<SearchEngineDTO IsDeleted="false" IsDirty="false" IsActive="true" IsPreferred="false" IsSystemGenerated="false" SearchEngineTypeID="8" Thumbnail="true" URL="http://www.bing.com/search?q=" UserSearchEngineID="0" description="Bing Search" icon="iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAPxSURBVEhLrZRrTJtVGMePiYnGuGSJxvjNLDLjEhdn5oZmbHFZvBCyaIwx+zA/aLyONFMync5lGpzEqQljZncYY11Axq3thoNyaaAM6IVSeqEFSltKS2kL7QptKR3w9zyn0oH7hNjkl+c5p8/zO+c9ec/7ULGqf+OTjz/xwdMbHj3+2CMPP8XW8UvMLwRDs8mTgdi0lEl1bonBG42GEwuIzK0PcpCrgjuZwuwLjEdSGAun4F4n5PBwl9w8EWDN9hCc06n/FXKy1uFpOLh4GfV4AipPAhRXzq8lJydT2qcwHJrP8F6jF3vrxkBx5fxacnKy24MhDHHxMu80uJFT6QDFlfNrycnJGq1B2ILzGfKqRpB9xQaK5skklCMzKO0LoaQnkOGcNohaawR9vsSq3mUPOflb4Yc1kMyQW2HDjvMm7Ck1I1/hxP5rNuRcMiP7ggmvXDSn4fnr5VYcrBnBBU0Aem98lUNhngSTmfyw8J0tk3vZhB2n9Rn2nO3HYfkIzvVM4Kp+UvB9kwtvl5uxs6RP1H1WM4SO0ZmMg5ys3ujjjzwH0z+8ddaAl3/tFeSdN6CmfxKRsAdLXhmWBouw5LiI5NQAjOMRfFFtE3XZv2lwTOGAju+cXORktQYvBvjA6E+zr1iDFwvVePVUN5osQSxFrFhUvYtF5b77tOZiabgM/sgMDlwyiPpdvL7eNCVctf1esBt94zBOzMHgS7P71B1sOd6OnF+64AzGsWgpwT1Z9gMstB1ALBrE0dpBUU9c100KFzlZtd4jdqrnUmJXkRqbvm7GSz+0Q+cMY9FxA6k/tyFVueU+VS/gXmc+wpEpfFhmEPVZR5WQarmYu8jJqnRjYhUtv2nER2V6bPqyEVkFf0FSYcBEcBoLhmKk5HlIlj2D+crtXHoE80ELpGoXtn7bLOp3/9QOmSkkXORklVo3+vmgl0sJqcaHN4tU2JyvwPMSBfb/rMLNnlE4XG64nXa43Q5oLGMo4BvYVtCIZw/Jsf2bJhTK7ehwzgoXOdl1jUsMuvn3geh0zeKy2oODZ7qxNV+OrI/rBDu/uoW93zUJNn+Snnvu03q88WMrCmU2KIfv8v64cJGTSXudMPDBnbFEBlq5bmAKp1tc+LxUj9eO8TOXyDNkF9zC+7934aR8CNc0frTw29nljot+cpGTXeka5ueSEH+sRO2Ko210FreHorhpi0I+eBcyDkUFp9EeFcIOV2xVH7nIyf5oMwcGfDG+WpwfQ5wXPojKGYfKGUP7KIdHyv9dR73kIBc52YmGbkm1dnTG7E/fGuNEkp/T2jHx14wc5DrRoJGww+WqjSQ/02IKlHbacZU/xn+BeslBLnL+DVCaFmeGw1LBAAAAAElFTkSuQmCC" label="Bing" />
	<SearchEngineDTO IsDeleted="false" IsDirty="false" IsActive="true" IsPreferred="false" IsSystemGenerated="false" SearchEngineTypeID="8" Thumbnail="true" URL="http://www.cdc.gov/search.do?queryText=" UserSearchEngineID="0" description="Centers for Disease Control and Prevention" icon="iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAVNJREFUeNq0kTtLA0EUhc/M7DPJJiYuSJQgRFCbgCAIVkKwTGWrna1WWvgL7K2s9Q/YWAopxCqYWCnYJDGiRPLYza5xH7OO8xdSeMrLPecevkuEEJhFFDNqZoOyfnrb7U/CXNEywQgQxRyECvgxMPIDuUFg6wYYBGKRvCmCKfOH1aW0QShabQe1zSI0jcEPOB5eB3j58HC8W8ZT20WjMy4olVKa76zaOLpqYuBGOKmt4fq+i1ZvjIuDDfSdHzzKoMt6G6rJOM2qKhTGYGgqKKWIOEFKlwUSjiDk0OW1SZCAyWqFlAaW394/W7ZNI28YMFiClUULjFFUSnO4ex7gptnF3lYJSRRhyuGS6nndG/phZsFSMZGTkR8iY1J4gcDXNwclv9BlQNlOoTcO35Uo4X4iuXw6IYbTGFlZx5kKuLGAyiR3QUEko0bHQ87SffLvn/4TYABfrIfhfBuaRAAAAABJRU5ErkJggg==" label="CDC" />
	<SearchEngineDTO IsDeleted="false" IsDirty="false" IsActive="true" IsPreferred="false" IsSystemGenerated="false" SearchEngineTypeID="8" Thumbnail="true" URL="https://online.epocrates.com/search/search.jsp?lang=en&amp;query=" UserSearchEngineID="0" description="Medication Monographs" icon="iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAe9JREFUeNpEkTtoFGEUhb9/ZvZBEpcogq6KhCxYJESilTY2QhAkFiqIhYiQQsFGEIt0FtoICgoWoo2I2ImFhSgSkQUlRIwPdJdgNOJGJg8zmZ2dxz8P7+4KXrjNf+8595zzq9dvPpoqt+FcKzTOeK1wZ9OPYy+I8IIYL9R4fmz6oV4PjOKjFw8uX1PV6fr5MO275Xq+DDVOK6LpR+g4ZbUZ4gcanaR4UcKftdX76tX0rw8tPxpZ80IcWVCGYqBcwjAN2jX17idzDQedCkhnq8bVp7PlNmuiUyzLZN9ImflFl8dTc6w4PhdO7qWnJ8e6XPKiKLCevV+Iv9vrHB7awemxXWzsK7CplOfAnm30lwpYpqJXAK4AQrmoOHF3kUBvxTCYuXGcr7UlZmo2RcugKcaX3ABb2pEglnXSsDpCZUgG+ZzBy7nfPJyqU9lSwhSSgniKswwnTrCluwClQJIJxMvE2BD3nn/h0zcbQZATifmcia8TUtkzGT5yiSzrJc2wvYiL47sZHdwsf5AwuL2fs4eGqf1YYWXNbxO7imN35sXJQFuShM/4/gqTR0exhHXBdrn+ZJbq54bo7YhZVpy6fQXfmISuD8KYriFTCFJ5FrkC7lRGVVGp9TP09ibF1kGy7mf9G7Yz/F9pWkerib8CDAAyG+6pjHo15QAAAABJRU5ErkJggg==" label="Epocrates Online" />
	<SearchEngineDTO IsDeleted="false" IsDirty="false" IsActive="true" IsPreferred="false" IsSystemGenerated="false" SearchEngineTypeID="8" Thumbnail="true" URL="http://www.google.com.pk/#fp=1&amp;cad=b&amp;q=" UserSearchEngineID="0" description="Google Search" icon="iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAgFJREFUeNoskU1IVFEUx3/3zRtnRhymERMMGekDLIgiCKSCrE1LqRYFuWgTLSIiokXEbMqdVLTXTUGoK5kw2hT04cZAQwtTKosGv8bB0ffG9/3u7U504ceFe+7/nPM/RygpT1Vd2X/z5br5p+KqZ1c62d+iqFy6TP7zDCnDIAYcIYyoVvuBUmpw7IutOh8vq8y9RXVj5LdqHGd0VDnosCbUWJqyxtBi33YibMvDkIrXc1vs6JTp3l5kaxtagNBIjX52TX1zeLdJYNVxtyJ2cjFGQn+YW6ASWXhdzYRaldnwMd1YmVO/bHr2Zrl7ehfP369xv6+gG64ytjrM4tODLBVaqTiSpp91DkxWEZlrHwb6e9qKfcdaOXe0HTPhU5y8zbKaJZ1uwbIjKr5iRRtZ82LH8DfXGR7/yp2hTzhuSCgbzpqp1mNq2yF2oPB0T8qLEZ7EPN/dxJHuLvbtyeH7O+SzeR6ceMST6UFK5ZJ2nEQXwdYiVyPiWA0YzkSRzRKhNY8T5MgeGkKlOrj69hbv1qeIVQpLl3YC5Zj+xhu82Ytk0+G/oRt1qG5fp/3sK052nGFk6aP2lSRobE8JPSlrNSktgRu36JmbiEiSqG83oizUVpChIOD/IiKRNnNdF77btW+2Xx4XhooVqQLZ4w+ZrizxYn6CBBkIG4shKQM181eAAQCzaA6vPAWxtAAAAABJRU5ErkJggg==" label="Google" />
	<SearchEngineDTO IsDeleted="false" IsDirty="false" IsActive="true" IsPreferred="false" IsSystemGenerated="false" SearchEngineTypeID="8" Thumbnail="true" URL="http://vsearch.nlm.nih.gov/vivisimo/cgi-bin/query-meta?v%3Aproject=medlineplus&amp;query=" UserSearchEngineID="0" description="National Library of Medicines" icon="iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAihJREFUeNoUkd1LU3EYx7+/3/mds3PmrDU3cysWDjczZRWamPYGxYY3FdGbSDchUXhTNwVdRNAfEUQYEoh0M7xQwqKiCyHJshdTbK0ZuEI3Wzvbzo7nrZ93Dzx8vnyfz0NIzyXE77ihOBk4gqIU3uYuV3+qfjiwQUEcsBRAfzDRQHG1DsyxGVZWEoiFR+HYZtCf2DUiuiVwACBAeb2yTbL1e0W1HbmUspVhoqjG8e35EVQeZogCxdgsbcJSTehqDV3evTsUrRfp3AAsup0DgAynEitb0ditq49vnt5zQtTMGgzbQMDtx3DjwMnsbLzDqsltsCteBkouQpAe+SJhcu5sj7RhNGE8PYWqqaHP14X97b1tfccbPmbn1igi3a95JRqAw1znDzRJS+tl5IthHG06CML7J4JJPJkv4tqhEKOyRBFobqX8OEtyUQx3BnD31S88/aTiVOgYkrsPw6iFcXsqDZkRJFu8gKYbFIYp9Lf6oFvATLaEZ0s5NMvdGIoOYuzLX+QLVUx+/4ehzp28DBhDQ2TiQrDW8nK57DbUiievm2feZCxhsKMD41/nuBLyeXQ2+2H6yj6pkWmTDC5Put7Rb1R1mwuzQ9x9/8j8mvKnomNdNQAmpARK7kv8jyKxwSgfNJtiYWNrKXogCq53uTIW8xogcutMrss7FC9+c8Bdz3mB4MH0IhaK/LWOVQDzzkOUoyXNMiG5HMyMvS8VVnF9gkLi8f8FGACSbNuTDLsOgwAAAABJRU5ErkJggg==" label="Medline Plus" />
</SearchEngineList>
		
	}
}