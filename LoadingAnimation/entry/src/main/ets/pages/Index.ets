@Entry
@Component
struct Index {
  @State isStart: boolean = false

  build() {
    Stack() {
      Circle()
        .fillOpacity(0)
        .stroke(Color.White)
        .strokeWidth(5)
        .size({ width: 40, height: 40 })
        .offset({ x: this.isStart ? -60 : 60 })
    }
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD])
    .size({width:'100%',height:'100%'})
    .onAppear(()=>{
      animateTo({
        duration: 1000,
        curve: Curve.EaseInOut,
        iterations: -1,
        playMode: PlayMode.Alternate,
      }, () => {
        this.isStart = !this.isStart
        console.log('Animation triggered, isStart:', this.isStart)
      })
    })
  }
}