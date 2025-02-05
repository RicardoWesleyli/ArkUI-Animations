@Extend(Button)
function btnStyle(isPressed:boolean) {
  .size({height:60})
  .padding({left:30,right:30})
  .fontColor(Color.White)
  .backgroundColor(Color.Blue)
  .borderWidth(2)
  .borderColor(Color.White)
  .scale({x:isPressed ? 0.95 : 1,y:isPressed ? 0.95 : 1})
  .animation({
    duration: 300,
    curve: Curve.Smooth,
    iterations: 1,
    playMode: PlayMode.Alternate
  })
}

@Entry
@Component
struct Index {
  @State isPressed: boolean = false

  build() {
    Column() {
      Blank()

      Button('Subscribe', { type: ButtonType.Capsule, stateEffect: true })
        .btnStyle(this.isPressed)

      Blank()
    }
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD])
    .height('100%')
    .width('100%')
  }
}

