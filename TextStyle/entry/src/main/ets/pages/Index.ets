@Extend(Text)
function textStyle() {
  .fontSize(23) // 设置字体大小为 23
  .minFontSize(14) // 设置最小字体大小为 14
  .maxFontSize(32) // 设置最大字体大小为 32
  .fontWeight(FontWeight.Bold) // 设置字体粗细为加粗
  .fontColor(Color.Blue) // 设置字体颜色为蓝色
  .fontStyle(FontStyle.Italic) // 设置字体风格为斜体
  .textCase(TextCase.Normal) // 设置文本大小写为正常（不转换大小写）
  .letterSpacing(5) // 设置字符间距为 5
  .wordBreak(30) // 设置单词换行的宽度阈值为 30
  .maxLines(2) // 设置文本最大显示行数为 2 行
  .decoration({ // 设置文本装饰
    type: TextDecorationType.Underline, // 装饰线类型为下划线
    color: Color.Red, // 装饰线颜色为红色
    style: TextDecorationStyle.WAVY // 装饰线风格为波浪线
  })
  .textOverflow({ // 设置文本溢出时的处理方式
    overflow: TextOverflow.Ellipsis // 当文本溢出时显示省略号
  })
  .textShadow({ // 设置文本阴影
    radius: 5, // 阴影模糊半径为 5
    color: Color.Gray, // 阴影颜色为灰色
    offsetX: 0, // 阴影水平偏移量为 0
    offsetY: 0 // 阴影垂直偏移量为 0
  })
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .textStyle()
    }
    .height('100%')
    .width('100%')
  }
}

