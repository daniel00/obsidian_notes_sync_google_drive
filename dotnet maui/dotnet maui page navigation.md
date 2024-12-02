---
tags: -maui -csharp -navigation -pushasync -pop
created: 2024-06-03 00:09.13
updated: 2024-06-03 00:50.29
---

## maui에서 page 간 이동 하는 방법

페이지를 push하고, pop하는 방법으로 페이지를 이동 할 수 있다.
```csharp
private async void OnMoveToSearchClicked(object sender, EventArgs e)
{
	MyDebug.Log("Move to search trains page");
	await Navigation.PushAsync(new ContentPageSearchTrains());
}
```

### page 간 이동시 파라메터 주고 받는 방법

페이지 이동간 정보(파라메터)를 주거나 받아야 한다면, 아래처럼 새로운 페이지의 생성자를 이용해서 정보를 주고 받을 수 있다.
아래 예 에서는 SelectStationPage에서 [역이름] 을 선택하면,
현재 페이지의 btnArrival에 **역이름**을 표시하기 위해서
SelectStationPage를 push할때 btnArrival을 **SelectStationPage**의 생성자의 파라메터로 넘기고 있다.

```csharp
private async void btnArrival_Clicked(object sender, EventArgs e)
{
	// btnDeparture.BackgroundColor = Colors.Gray;
	// btnArrival.BackgroundColor = Colors.Green;

	isDepatureSelected = false;
	isArrivalSelected = true;
	MyDebug.Log("Move to select stations 2");

	var selectStationPage = new SelectStationPage(btnArrival);
	await Navigation.PushAsync(selectStationPage);
}
```

SelectStationPage의 생성자에서는 파라메터를 멤버변수에 할당하여 선택된 "역이름"을 할당하면 된다.

```csharp
public partial class SelectStationPage : ContentPage
{
	public Button btnSel;

	public SelectStationPage(Button b)
	{
		InitializeComponent();
		
		//입력 파라메터를 멤버변수에 할당
		this.btnSel = b;
	}

	private async void btnStationClicked(object sender, EventArgs e)
	{
		Button btnStation = sender as Button;
		
		//역정보를 할당
		btnSel.Text = btnStation.Text;
		
		MyDebug.Log("station button clicked");

		//back to SearchTrainsPage
		await Navigation.PopAsync();
	}
}

```


![[Pasted image 20240603004615.png | 500]]


![[Pasted image 20240603004821.png | 500]]


![[Pasted image 20240603004923.png | 500]]




