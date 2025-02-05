@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State showOnePage: boolean = false
  @State showTwoPage: boolean = false
  @State scaleValue: number = 1

  build() {
    Stack() {
      Scroll(){
        Grid(){
          ForEach(Range(0, 15), (item: number) => {
            GridItem(){
              Rect({width:'100%',height:200,radius:16})
                .fill(Color.Gray)
                .opacity(0.3)
              }
          })
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .margin(20)
      }.visibility(this.showTwoPage ? Visibility.Visible : Visibility.None)

      SymbolGlyph($r('sys.symbol.worldclock_fill_2'))
        .fontSize(96)
        .fontColor([Color.White])
        .scale({x:this.scaleValue,y:this.scaleValue})
        .opacity(this.showOnePage ? 0 : 1)
    }
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    .height('100%')
    .width('100%')
    .onAppear(()=>{

      animateTo({
        duration: 1000,
        curve: Curve.EaseInOut,
        delay:500
      }, () => {
          this.showOnePage = !this.showOnePage
          this.scaleValue = 0.8
        })

      animateTo({
        duration: 1000,
        curve: Curve.EaseInOut,
        delay:1000
      }, () => {
        this.showTwoPage = !this.showTwoPage
        this.scaleValue = 20
      })

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