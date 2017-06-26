# TreeTable
### 简单逻辑实现的多级列表

![](http://ww1.sinaimg.cn/large/c6a1cfeagy1fgyqiq8aa3j20dj0m9dh1.jpg)


目前有一个想要改进的地方：每次删除或者加载数据之后，都是reloadData，希望使用reloadRowsAtIndexPaths：withRowAnimation：的方法，但能力不足，希望有人帮助，作出改进。

本demo实现了类似qq列表，但能自行扩展的多级列表（demo中实现了4级列表）。满足每次点击cell才发起网络请求获取数据的思路（demo中在每次点击cell的时候创建并加载了更多的model）。满足自定义各级cell。

在网上搜了一些多级列表的demo，也看了部分，使用起来确实有方便的地方，但是不太符合开发中遇到的实际需求。
需要一个类似qq列表的功能，但是需要更多子级。点击一个cell，才获取下一级列表的数据（网上许多demo都是要求一次性创建全部数据源），并展开该cell下的下一级列表，再次点击同一个cell，收缩该cell下的全部子列表。同级cell之间无关联。

联系邮箱 Jonhory@163.com
