@Entry
@Component
struct Index {
  @State isTapped: boolean = false
  @State isAnimated: boolean = false

  build() {
    Column() {
      Blank()

      Stack(){
        ForEach(Range(0, 6), (item: number) => {
          SymbolGlyph($r('sys.symbol.heart_fill'))
            .fontSize(Math.random() * 20 + 10)
            .fontColor([Color.Red])
            .offset({y:this.isAnimated ? -40 : 0})
            .rotate({
              x: 0,
              y: 0,
              z: 1,
              angle: 60 * item
            })
            .position({
              x: (this.isAnimated ? 70 * Math.cos((item * 60) * (Math.PI / 180)) : 0),
              y: (this.isAnimated ? 70 * Math.sin((item * 60) * (Math.PI / 180)) : 0)
            })
            .scale({
              x: this.isAnimated ? 1 :0,
              y: this.isAnimated ? 1 :0
            })
            .opacity(this.isAnimated ? 0 :1)
        })

        SymbolGlyph(this.isTapped ? $r('sys.symbol.heart_fill') : $r('sys.symbol.heart'))
          .fontSize(32)
          .fontColor([this.isTapped ? Color.Red : Color.Pink])
          .effectStrategy(1)
          .onClick(()=>{
            animateTo({
              duration: 800,
              curve: Curve.Smooth,
            }, () => {
              this.isTapped = !this.isTapped
            })

            animateTo({
              duration: this.isTapped ? 800 : 0,
            }, () => {
              this.isAnimated = !this.isAnimated
            })

          })
      }

      Blank()
    }
    .height('100%')
    .width('100%')
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
