@Entry
@Component
struct Index {
  @State counter: number = 0;

  build() {
    Column() {
      Blank()

      SymbolGlyph($r('sys.symbol.bolt_filled_on_circle'))
        .fontSize(150)
        .fontColor([Color.White])
        .symbolEffect(new ReplaceSymbolEffect(EffectScope.WHOLE), this.counter)
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          centerX: '50%',
          centerY: '50%',
          angle: this.counter
        })

      Blank()

      Button('Active')
        .size({width:120,height:48})
        .onClick(() => {
          animateTo({
            duration: 1000,
            curve: Curve.Smooth,
            iterations: 1,
            playMode: PlayMode.Normal
          }, () => {
          this.counter += 360
          })
        })

      Blank()
    }
    .backgroundColor(Color.Black)
    .height('100%')
    .width('100%')
  }
}