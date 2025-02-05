@Entry
@Component
struct Index {
  @State isAdd:boolean = false

  build() {
    Column(){
      Blank()
      Row({space:10}){
        SymbolGlyph(this.isAdd ? $r('sys.symbol.heart_fill') : $r('sys.symbol.heart'))
          .fontSize(23)
          .fontColor([this.isAdd ? Color.Red : Color.Black])
          .effectStrategy(1)

        Column() {
          if (this.isAdd) {
            Text('loved')
              .transition(TransitionEffect.translate({ y: -40 }))
              .fontColor(Color.Red)
          } else {
            Text('love')
              .transition(TransitionEffect.translate({ y: 40 }))
          }
        }
        .clip(true)
      }
      .padding(10)
      .onClick(()=>{
        animateTo({
          duration:500,
          curve:Curve.Linear
        }, () => {
          this.isAdd = !this.isAdd
        })
      })
      Blank()
    }
    .height('100%')
    .width('100%')
  }
}