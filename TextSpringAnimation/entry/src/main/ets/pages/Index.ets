@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isAnimation: boolean = false

  build() {
    Column() {
      Row({ space: 0 }) {
        ForEach(this.message.split(''), (letter: string, index: number) => {
          Text(letter)
            .fontSize(23)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
            .offset({ y: this.isAnimation ? -40 : 0 })
            .animation({
              duration: 1000,
              curve: Curve.Smooth,
              delay: index * 50,
              iterations: -1,
              playMode: PlayMode.Alternate,
            })
        })
      }
      .height(50)
      .clip(true)
      .onAppear(() => {
        this.isAnimation = true
      })
    }
    .width('100%')
    .height('100%')
  }
}