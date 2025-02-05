@Entry
@Component
struct Index {
  @State progress: number = 0
  @State percentage: number = 0
  private gradientColor: LinearGradient =
    new LinearGradient([
      { color: Color.Blue, offset: 0.5 },
      { color: Color.White, offset: 1.0 }
    ])

  build() {
    Stack(){
      Progress({ value: this.progress, total:100, type: ProgressType.Ring })
        .width(200)
        .style({ strokeWidth: 20 })
        .color(this.gradientColor)
      Text(this.percentage.toString()+'%')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
    }
    .height('100%')
    .width('100%')
    .onAppear(()=>{
      this.startProgress()
    })
  }

  startProgress() {
    setInterval(() => {
      if (this.progress < 100) {
        this.progress += 1
        this.percentage = this.progress
      } else {
        clearInterval()
      }
    }, 100);
  }
}