@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State onScroll: boolean = true

  build() {
    Scroll(this.scroller) {
      Column({space:15}){
        ForEach(Range(0, 50), (item: number) => {
          TextCardView({
            text:item.toString(),
            onScroll: this.onScroll
          })
        })
      }
      .margin(10)
    }
    .backgroundColor(Color.Black)
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)

    // 滚动监听
    .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
      animateTo({
        duration: 300,
        curve: Curve.EaseIn,
      }, () => {
        this.onScroll = false
      })

      console.info(xOffset + ' ' + yOffset)
    })

    // 到底部
    .onScrollEdge((side: Edge) => {
      console.info('To the edge')
    })

    // 停止
    .onScrollStop(() => {
      animateTo({
        duration: 300,
        curve: Curve.EaseOut,
      }, () => {
        this.onScroll = true
      })

      console.info('Scroll Stop')
    })
  }
}

// 创建数组
function Range(start: number, end: number): number[] {
  const result: number[] = [];
  for (let i = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}

@Component
struct TextCardView {
  @Prop text:string
  @Prop onScroll: boolean

  build() {
    Stack() {
      Text(this.text.toString())
        .fontSize(60)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .width('100%')
    .height(100)
    .backgroundColor(Color.Blue)
    .borderRadius(24)
    .scale({x: this.onScroll ? 1 : 0.85})
    .opacity(this.onScroll ? 1 : 0.85)
  }
}
