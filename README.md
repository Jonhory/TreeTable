# TreeTable
### 简单逻辑实现的多级列表

* 最新的逻辑是一次性加载全部的数据源，只显示第一级。过一段时间再写点击时才加载并显示数据的逻辑。（如果有人有需要，可以邮件催一下我= =）

![](http://ww1.sinaimg.cn/large/c6a1cfeagy1fgzux62hitj20dj0m9wfu.jpg)

#### 数据源结构

```
{
"data": [
			{"name" : "No.11",
			"id" : "11",
			"fatherID" : "",
			"level" : 1,
			"sons": [
						{"name" : "No.21",
						"id" : "21",
						"level" : 2,
						"fatherID" : "11",
						"sons": [
									{"name" : "No.31",
									"id" : "31",
									"level" : 3,
									"fatherID" : "21",
									"sons": [
												{
												"name" : "No.41",
												"id" : "41",
												"level" : 4,
												"fatherID" : "31",
												"sons" : []
												},
												{
												"name" : "No.42",
												"id" : "42",
												"level" : 4,
												"fatherID" : "31",
												"sons" : []
												},
												{
												"name" : "No.42",
												"id" : "42",
												"level" : 4,
												"fatherID" : "31",
												"sons" : []
												},
												{
												"name" : "No.43",
												"id" : "43",
												"level" : 4,
												"fatherID" : "31",
												"sons" : []
												}
											  ]
									},
									{"name" : "No.32",
									"id" : "32",
									"level" : 3,
									"fatherID" : "21",
									"sons": []
									},
									{"name" : "No.33",
									"id" : "33",
									"level" : 3,
									"fatherID" : "21",
									"sons": [
												{
												"name" : "No.44",
												"id" : "44",
												"level" : 4,
												"fatherID" : "33",
												"sons" : []
												},
												{
												"name" : "No.45",
												"id" : "45",
												"level" : 4,
												"fatherID" : "33",
												"sons" : []
												},
												{
												"name" : "No.46",
												"id" : "46",
												"level" : 4,
												"fatherID" : "33",
												"sons" : []
												},
												{
												"name" : "No.47",
												"id" : "47",
												"level" : 4,
												"fatherID" : "33",
												"sons" : []
												}
											  ]
									}
					   			  ]
						},
						{"name" : "No.22",
						"id" : "22",
						"level" : 2,
						"fatherID" : "11",
						"sons": []
						},
						{"name" : "No.23",
						"id" : "23",
						"level" : 2,
						"fatherID" : "11",
						"sons": []
						}
					 ]
			},
			{"name" : "No.12",
			"id" : "12",
			"level" : 1,
			"fatherID" : "",
			"sons": [
						{"name" : "No.24",
						"id" : "24",
						"fatherID" : "12",
						"level" : 2,
						"sons": []
						},
						{"name" : "No.25",
						"id" : "25",
						"level" : 2,
						"fatherID" : "12",
						"sons": []
						},
						{"name" : "No.26",
						"id" : "26",
						"level" : 2,
						"fatherID" : "12",
						"sons": [
									{"name" : "No.34",
									"id" : "34",
									"level" : 3,
									"fatherID" : "26",
									"sons": [
												{
												"name" : "No.48",
												"id" : "48",
												"level" : 4,
												"fatherID" : "34",
												"sons" : []
												},
												{
												"name" : "No.49",
												"id" : "49",
												"level" : 4,
												"fatherID" : "34",
												"sons" : []
												},
												{
												"name" : "No.50",
												"id" : "50",
												"level" : 4,
												"fatherID" : "34",
												"sons" : []
												},
												{
												"name" : "No.51",
												"id" : "50",
												"level" : 4,
												"fatherID" : "34",
												"sons" : []
												}
											  ]
									},
									{"name" : "No.35",
									"id" : "35",
									"level" : 3,
									"fatherID" : "26",
									"sons": []
									},
									{"name" : "No.36",
									"id" : "36",
									"level" : 3,
									"fatherID" : "26",
									"sons": [
												{
												"name" : "No.52",
												"id" : "52",
												"level" : 4,
												"fatherID" : "36",
												"sons" : []
												},
												{
												"name" : "No.53",
												"id" : "53",
												"level" : 4,
												"fatherID" : "36",
												"sons" : []
												},
												{
												"name" : "No.54",
												"id" : "54",
												"level" : 4,
												"fatherID" : "36",
												"sons" : []
												},
												{
												"name" : "No.55",
												"id" : "55",
												"level" : 4,
												"fatherID" : "36",
												"sons" : []
												}
											  ]
									}
					   			  ]
						}
					 ]
			}
		],
"code" : "success"
}
```

本demo实现了类似qq列表，但能自行扩展的多级列表（demo中实现了4级列表）。满足每次点击cell才发起网络请求获取数据的思路（demo中在每次点击cell的时候创建并加载了更多的model）。满足自定义各级cell。

在网上搜了一些多级列表的demo，也看了部分，使用起来确实有方便的地方，但是不太符合开发中遇到的实际需求。


需要一个类似qq列表的功能，但是需要更多子级。~~点击一个cell，才获取下一级列表的数据（网上许多demo都是要求一次性创建全部数据源）（下个版本增加demo）~~，并展开该cell下的下一级列表，再次点击同一个cell，收缩该cell下的全部子列表。同级cell之间无关联。

联系邮箱 Jonhory@163.com
