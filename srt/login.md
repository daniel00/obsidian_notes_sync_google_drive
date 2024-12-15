---
created: 2024-12-16 00:21
updated: 2024-12-16 00:21
tags: [srt, login, maui, postasync]
alias: []
---

created: 2024-12-16 00:21
updated: 2024-12-16 00:21

#### 닷넷마우이에서 srt페이지에 로그인 하는 방법

필요한 필드를 채우고, postAsync()로 날린다.

```csharp
	private async Task Login()
	{
		try
		{

			var formContent = new FormUrlEncodedContent(new[]
			{
				new KeyValuePair<string, string>("auto", "Y"),
				new KeyValuePair<string, string>("check", "Y"),
				new KeyValuePair<string, string>("page", "menu"),
				new KeyValuePair<string, string>("deviceKey", "-"),
				new KeyValuePair<string, string>("customerYn", ""),
				new KeyValuePair<string, string>("login_referer", "https://app.srail.or.kr:443/main/main.do"),
				new KeyValuePair<string, string>("srchDvCd", "3"),
				new KeyValuePair<string, string>("srchDvNm", "01027109207"),
				new KeyValuePair<string, string>("hmpgPwdCphd", "daeun0901@"),
			});

			Uri uri = new Uri("https://app.srail.or.kr:443/apb/selectListApb01080_n.do");

			//header
			client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Linux; Android 5.1.1; LGM-V300K Build/N2G47H) AppleWebKit/537.36");
			client.DefaultRequestHeaders.Add("User-Agent", "(KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36SRT-APP-Android V.1.0.6");
			client.DefaultRequestHeaders.Add("Accept", "application/json");

			//로그인
			HttpResponseMessage responseMessage = client.PostAsync(uri, formContent).Result;

			Console.WriteLine(responseMessage.ToString());
			// MyDebug.Log(responseMessage.ToString());

			//로그인 페이지 내용 출력
			string resultBody = await responseMessage.Content.ReadAsStringAsync();
			Console.WriteLine(resultBody);
			// MyDebug.Log(resultBody);

			//수신데이터 파싱
			dynamic json = JValue.Parse(resultBody);
			string rtncd = json.userMap.RTNCD;	//return code
			string msg;
			string userName;

			string strResult = json.strResult;
			if(strResult == "FAIL")
			{
				MyDebug.Log("로그인 실패");
				msg = json.MSG;		//message
				System.Console.WriteLine(msg);
				MyDebug.Log(msg);
			}
			else
			{
				MyDebug.Log("로그인 성공");
				msg = json.userMap.MSG;		//message
				userName = json.userMap.CUST_NM;
				System.Console.WriteLine(msg);
				MyDebug.Log($"{userName}님 {msg}");

				MoveToSearchTrainPage.IsEnabled = true;
				await Navigation.PushAsync(new ContentPageSearchTrains());
			}

			// if(resultBody.Contains("존재하지않는 회원입니다"))
			// 	System.Console.WriteLine("로그인 실패");
			// else if(resultBody.Contains("비밀번호 오류"))
			// 	System.Console.WriteLine("로그인 실패");
			// else if(resultBody.Contains("Your IP Address Blocked due to abnormal access."))
			// 	System.Console.WriteLine("로그인 실패");
			// else if(resultBody.Contains("정상적으로 로그인되었습니다"))
			// {
			// 	System.Console.WriteLine("로그인 성공");
			// 	MoveToSearchTrainPage.IsEnabled = true;
			// }

			// var obj = JObject.Parse(resultBody);
			// var msg = JObject.Parse(resultBody)["MSG"].ToString();
			// System.Console.WriteLine(msg);


		}
		catch (HttpRequestException e)
		{
			Console.WriteLine("\nException Caught!");
			Console.WriteLine("Message :{0} ", e.Message);
		}
	}
```