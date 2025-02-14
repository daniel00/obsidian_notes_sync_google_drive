---
created: 2025-02-15 03:13
updated: 2025-02-15 03:13
tags: []
alias: []
---

created: 2025-02-15 03:13
updated: 2025-02-15 03:13

#### 제목을 입력 하세요

내용을 입력 하세요


### 프로젝트로 사용 될 디렉토리를 만들고 이동한다.
mkdir CsvGraphPlotter
cd CsvGraphPlotter

### 프로젝트를 만든다.
```bash
dotnet new console
```

### 필요한 패키지를 설치한다.
```bash
dotnet add package Plotly.NET
```

### 코드를 작성한다.
```csharp
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Microsoft.VisualBasic;
using Plotly.NET;

public class DataRecord
{
    // public DateTime Date { get; set; }
    public int Index { get; set; }
    public double Value { get; set; }
}

class Program
{
    static void Main(string[] args)
    {
        //make data.csv, 백만개
        using (var writer = new StreamWriter("data.csv"))
        {
            writer.WriteLine("Date,Value");
            var random = new Random();
            // var startDate = new DateTime(2020, 1, 1);

            for (int i = 0; i < 10000000; i++)
            {
               var value = random.Next(1, 101);
               writer.WriteLine($"{i},{value}");

                // var date = startDate.AddDays(i);
                // var value = random.NextDouble() * 100; // 0 to 100 사이의 랜덤 값 생성
                // writer.WriteLine($"{date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)},{value:F2}");

            }
        }
        Console.WriteLine("data.csv 파일이 생성되었습니다.");


        //read data.csv
        System.Console.WriteLine("read csv...");

        var records = ReadCsv("data.csv");
        // var dates = new List<DateTime>();
        // var values = new List<double>();
        var dates = new List<int>();
        var values = new List<double>();

        foreach (var record in records)
        {
            dates.Add(record.Index);
            values.Add(record.Value);
        }


        //차트에 출력하기

        var chart = Chart2D.Chart.Line<int, double, string>(dates, values)
            .WithTitle("CSV Data Graph")
            .WithXAxisStyle(Title.init("Date"))
            .WithYAxisStyle(Title.init("Value"));

        chart.Show();
    }

    static List<DataRecord> ReadCsv(string filePath)
    {
        var records = new List<DataRecord>();
        using (var reader = new StreamReader(filePath))
        {
            var header = reader.ReadLine(); // Skip header line
        //    string line;

            System.Console.WriteLine("draw graph...");
            while (true)
            {
                var line = reader.ReadLine();
                if(line == null)
                    break;
                
                var values = line.Split(',');
                var record = new DataRecord
                {
                    // Date = DateTime.Parse(values[0], CultureInfo.InvariantCulture),
                    // Date = DateTime.Parse(values[0], CultureInfo.InvariantCulture),
                    Index = int.Parse(values[0], CultureInfo.InvariantCulture),
                    Value = double.Parse(values[1], CultureInfo.InvariantCulture)
                };
                records.Add(record);
            }
        }
        return records;
    }
}
```



### 프로그램 실행
```bash
dotnet run
```


###  실행결과가 웹브라우저에 출력된다.

![[Pasted image 20250215033730.png]]


