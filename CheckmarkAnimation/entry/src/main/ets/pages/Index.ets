@Entry
@Component
struct Index {
  @State isTapped: boolean = false
  @State isAnimated:boolean = false

  build() {
    Column() {
      Blank()

      Stack() {
        ForEach(Range(0, 6), (item: number) => {
          Circle()
            .size({ width: 30, height: 30 })
            .fill(Color.White)
            .scale({x:this.isAnimated ? 0 : 1})
            .offset({y:this.isAnimated ? -50 : 0})
            .rotate({
              x:0,
              y:0,
              z:1,
              centerX:'50%',
              centerY:'50%',
              angle:item * 60
            })
            .position({
              x: (this.isAnimated ? 70 * Math.cos((item * 60) * (Math.PI / 180)) : 0),
              y: (this.isAnimated ? 70 * Math.sin((item * 60) * (Math.PI / 180)) : 0)
            })
            .opacity(this.isAnimated ? 1 : 0)
        })

        SymbolGlyph(this.isTapped ? $r('sys.symbol.checkmark_circle_fill') : $r('sys.symbol.checkmark_circle'))
          .fontSize(32)
          .fontColor([Color.White])

      }
      .onClick(() => {
        animateTo({ duration: 1000, curve: Curve.EaseInOut }, () => {
          this.isTapped = !this.isTapped
        })

        animateTo({
          duration: this.isTapped ? 1000 : 0,
          curve: this.isTapped ? Curve.EaseInOut : null
        }, () => {
          this.isAnimated = !this.isAnimated
        })

      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
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