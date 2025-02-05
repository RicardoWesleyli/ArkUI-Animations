@Entry
@Component
struct Index {
  @State show: boolean = false;

  build() {
    Stack() {
      RotatingCard({show:this.show,imageSrc:$r('app.media.code001'),rotationAngle:-60,yOffset:60})
      RotatingCard({show:this.show,imageSrc:$r('app.media.code002'),rotationAngle:-60,yOffset:0})
      RotatingCard({show:this.show,imageSrc:$r('app.media.code003'),rotationAngle:-60,yOffset:-60})
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct RotatingCard {
  @Link show: boolean
  @Prop imageSrc: Resource;
  @Prop rotationAngle: number
  @Prop yOffset: number

  build() {
    Stack() {
      Image(this.imageSrc)
        .objectFit(ImageFit.Cover)
        .width(200)
        .height(250)
        .borderRadius(16)
        .rotate({
          x: 1,
          y: 0,
          z: 1,
          centerX: '50%',
          centerY: '50%',
          angle: this.show ? Math.abs(this.rotationAngle) : 0
        })
        .translate({ y: this.show ? this.yOffset : 0 })
        .onClick(() => {
          animateTo({
            duration: 500,
            curve: Curve.Smooth
          }, () => {
            this.show = !this.show;
          });
        });
    }
    .height('100%')
    .width('100%')
  }
}
