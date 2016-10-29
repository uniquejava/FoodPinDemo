# FoodPinDemo
My exercises while reading the appcoda book.

![](foodpin_v1.png)

## Some notes

### tags
I will create git tag for some milestones

1. `chapter12_pretty_coo`: list view with a very simple detail view.
2. `plain_detail_view`: a usable detail view(table like)
3. `polished-app`: a beautiful app.

### basic
1. change cell style from basic to custom.
2. change table view row height from default(44) to 80
3. change cell row height to 80 (只要勾上custom会自动变成80)
4. drag an image view to the cell (14,10) 60*60
5. Add 3 labels: Name(Headline), Location(Light, 14, Dark Gray), Type(Light, 13)
6. Stackview the 3 labels, spacing: 0 -> 1
7. Stackview the image and above stackview, spacing: 0 -> 10, Alignment: Top
8. 设置最外层的stack view 和cell边距的上左下右分别为2, 6, 1.5, 0这时stackview会填充整个cell, 但是图片被横向拉伸了
9. 在outline中ctrl水平拖动image view到自身, 设置width和height为60

### basic 2

1. 在outline的tableviewCell上点右键可以看到这个cell中定义的所有outlet
2. UIKit中所有View都自带CALayer, 这个layer对象可以控制view的背景色,边框, 透明度, 圆角

### basic 3
1. 将image view在outline中拖动到cell之上
2. aspect fill + clip to bounds
3. cell中加两个Label: Field(Medium) + Value
4. stackview这两个label
5. 见251页,给stackview设置constraints(spacing以及垂直居中)
6. 这时会产生一个layout warning: 不能给两个label设置相同的hugging priority, 原因是我们只给stack view设置了constraints,而让stack view自动管理它所包含label的constraints, 结果是Field被拉伸了, Value大小保持正常. 这是因为Field和Value有相同的hugging priority:251, 只要把Field的priority设置的更高比如261, 那么Field就会保持自己的本来大小(intrinsic size), 而Value则被拉伸.

### 设置圆角:

```swift
cell.thumbnailImageView.layer.cornerRadius = 30.0
cell.thumbnailImageView.clipsToBounds = true                                                                                             
```
或者选中image view在identity inspector中新增一个runtime属性layer.cornerRadius值为Number:30
并在attributes inspector中勾选clip to bounds

### 美化tableview/表格线
```swift
// set table view bg color
tableView.backgroundColor = UIColor(white: 240.0/255, alpha: 0.2)
// remove empty rows
tableView.tableFooterView = UIView(frame: CGRect.zero)
//set separator color
tableView.separatorColor = UIColor(white: 240.0/255, alpha: 0.8)

```

## 美化nav bar
1) 在didFinishLaunchingWithOptions设置nav bar的背景色

```swift
// nav bar bg color
UINavigationBar.appearance().barTintColor = UIColor(red: 216.0/255, green: 74.0/255, blue: 32.0/255, alpha: 1.0)

// nav bar button style(可以点击的)
UINavigationBar.appearance().tintColor = UIColor.white

// nav title style
if let barFont = UIFont(name: "Avenir-Light", size: 24.0) {

UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: barFont]
}
```
Navbar的背景色为UINavigationBar.appearance().barTintColor, 但是它还有一个backgroundColor属性,呃.

2) 在segue.source这边viewDidLoad中重新定义后退按钮(不带文字)

```swift
navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
```

3) 在detail view的viewDidLoad中设置nav bar title

```swift
title = restaurant.name
```

## 美化status bar
修改status bar黑色文字为白色, 两种方式:

1) ViewController逐个修改, 覆盖preferredStatusBarStyle即可(.lightContent),我设置了但是不起作用, 参考这里的[solution][1], 在 viewDidLoad加上`navigationController?.navigationBar.barStyle = .blackTranslucent`


2) 全局修改

1. Info.plist设置`View controller-based status bar appearance=NO`
2. AppDelegate中`UIApplication.shared.statusBarStyle = .lightContent`

### 自适应大小的cell
1. 将Value label的Lines从1改成0, 这样Label可以显示多行文字
2. tableView.estimatedHeight改成它的预计行高值(36/44), 以优化性能, 默认值是0
3. tableView.rowHeight = UITableViewAutomaticDimension, 从iOS10开始, 这已经是默认值
4. 这时console会有个layout warning, 解决办法是给这个cell中包含的那个stack view设置top和bottom约束(之前已经给它设定了leading/trailing和center vertically的约束,但是对于自适应大小的cell来说还不够)

### Keywords

1. 取选中行的行号: tableView.indexPathForSelectedRow
2. editActionsForRowAt
3. UITableViewRowAction
4. UIActivityViewController
5. prepare(for:sender:)
6. segue.destination/segue.identifier
7. UINavigationBar.appearance().barTintColor
8. UIApplication.shared.statusBarStyle
9. Dynamic Type - use a text style instead of a fixed font type.

### Xcode tricks (my findings!)

#### 1. how to switch between storyboard and swift file
View > Show Tab Bar, create a new tab, for one tab, you can open storyboard, for the other, you can open the swift file, then you can use `shift+cmd+]` to switch between interface builder and source code file, pretty cool!



[1]: http://stackoverflow.com/questions/19108513/uistatusbarstyle-preferredstatusbarstyle-does-not-work-on-ios-7

