@Entry
@Component
struct Index {
  @State isStart: boolean = false
  @State isFinish: boolean = false

  build() {
    Column() {
      Blank()

      if (this.isStart) {
        this.savingBtnView()
      } else if (this.isFinish) {
        this.finishedBtnView()
      } else {
        this.startBtnView()
      }

      Blank()
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  startBtnView(){
    Button('Save', { type: ButtonType.Capsule, stateEffect: true })
      .fontColor(0x333333)
      .backgroundColor(0xF1EEE9)
      .width(90)
      .height(40)
      .onClick(() => {
        this.isStart = true

        setTimeout(() => {
          this.isFinish = true
          this.isStart = false
        }, 2000)

      })
  }

  @Builder
  savingBtnView(){
    Button({ type: ButtonType.Capsule, stateEffect: true }) {
      Row() {
        LoadingProgress()
          .width(20)
          .height(20)
          .margin({ left: 12 })
          .color(Color.White)
        Text('Saving')
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ left: 5, right: 12 })
      }
      .alignItems(VerticalAlign.Center)
      .width(90)
      .height(40)
    }
    .backgroundColor(0x333333)
  }

  @Builder
  finishedBtnView() {
    Button({ type: ButtonType.Capsule, stateEffect: true }) {
      Row() {
        SymbolGlyph($r('sys.symbol.checkmark_circle_fill'))
          .fontSize(20)
          .margin({ left: 12 })
          .fontColor([Color.White])
        Text('Done')
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ left: 5, right: 12 })
      }
      .width(90)
      .height(40)
    }
    .backgroundColor(0x333333)
    .onClick(() => {
      this.isFinish = false
    })
  }
}