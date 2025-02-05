@Entry
@Component
struct Index {
  @State isStart: boolean = false

  build() {
    Stack() {

      Text('Loading...')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)

      Text('Loading...')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .size({width:200,height:50})
        .backgroundColor(Color.Black)
        .borderRadius(8)
        .maskShape(
          new Circle({width: 40, height: 40})
            .offset({ x: this.isStart ? -60 : 60 })
            .fill(Color.White)
        )

      Circle()
        .fillOpacity(0)
        .stroke(Color.White)
        .strokeWidth(5)
        .size({ width: 40, height: 40 })
        .offset({ x: this.isStart ? -60 : 60 })
    }
    .backgroundColor(Color.Gray)
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