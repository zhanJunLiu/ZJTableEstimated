*  一. 设置 estimatedRowHeight 

> 一般来讲计算`cell`的高度需根据数据模型的内容长度，决定单元格高度，按照常规的方式，需要先给出单元格高度，代理才会执行`cellForRow`函数，如果`height`为0的话，`cellForRow`函数就不执行了，而我们的计算却发生在`cellForRow`函数中，计算完成后再刷新，但是这样不可行。

> 正确方式: 首先设置`tableView`的预估高度，这样的话，代理就会首先执行`cellForRow`函数，这样就可以先计算，计算完成后保存起来，然后再执行`heightForRow`函数，读取刚才保存的值。

```
    tableView.estimatedRowHeight = 500
```

* 二. 设置 `beginUpdates` 以及 `endUpdates` 函数

>   对于`cell`中有按钮或者其他出发事件时动态修改`cell`高度的情况，可以在触发事件中调用 `beginUpdates` 和 `endUpdates` 两个函数，<font color=#0099ff size=3 face="黑体">该函数的作用区别于调用 `reloadData`，刷新时只会更新高度，而不会重新调用 `cellForRow` 函数。</font>

```
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let key = String(format: "ip:(%u,%u)", indexPath.section, indexPath.row)
        allHeight[key] = 200
        tableView.endUpdates()
    }
```
