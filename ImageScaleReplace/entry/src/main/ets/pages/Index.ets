@Entry
@Component
struct Index {
  @State showImage: boolean = false

  build() {
    Column({space:32}){
      if (this.showImage) {
        Image($r('app.media.Image01'))
          .objectFit(ImageFit.Contain)
          .height(200)
          .width(300)
          .borderRadius(16)
          .transition(TransitionEffect.SLIDE_SWITCH.animation({duration:1000}))
      } else {
        Image($r('app.media.Image02'))
          .objectFit(ImageFit.Contain)
          .height(200)
          .width(300)
          .borderRadius(16)
          .transition(TransitionEffect.SLIDE_SWITCH.animation({duration:1000}))
      }

      Button('Next',{ type: ButtonType.Capsule, stateEffect: true })
        .onClick(() => {
          this.showImage = !this.showImage
        })
    }
    .height('100%')
    .width('100%')
  }
}