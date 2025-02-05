@Entry
@Component
struct Index {
  @State flip: boolean = false
  @State flip2: boolean = false
  @State angle: number = 0

  build() {
    Column() {
      Blank()
      Stack() {
        Image($r('app.media.image01'))
          .objectFit(ImageFit.Cover)
          .size({ width: 300, height: 400 })
          .borderRadius(24)
          .opacity(this.flip2 ? 1 : 0)
          .zIndex(this.flip2 ? 1 : 0)

        Image($r('app.media.image02'))
          .objectFit(ImageFit.Cover)
          .size({ width: 300, height: 400 })
          .borderRadius(24)
          .opacity(this.flip2 ? 0 : 1)
          .zIndex(this.flip2 ? 0 : 1)
      }
      .rotate({
        x: 0,
        y: 1,
        z: 0,
        angle: this.angle
      })
      .onClick(() => this.startFlipAnimation())
      Blank()
    }
    .width('100%')
    .height('100%')
  }

  private startFlipAnimation() {
    animateTo({ duration: 1000, curve: Curve.EaseInOut }, () => {
      this.angle = this.flip ? 0 : 180
      this.flip = !this.flip
    })

    setTimeout(() => {
      animateTo({ duration: 500 }, () => {
        this.flip2 = !this.flip2
      })
    }, 260)
  }
}