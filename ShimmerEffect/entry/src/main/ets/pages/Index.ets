import { curves } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  private curve = curves.cubicBezierCurve(0.33, 0, 0.67, 1);
  @State private linePositionX: number = -200;
  @State private imageWidth: number = 200;
  @State btnColor: string = '#E1E4E9'

  startupAnimate() {
    animateTo({
      duration: 1500,
      curve: this.curve,
      iterations: -1
    }, () => {
      this.linePositionX = this.imageWidth;
    });
  }

  build() {
    Column() {
      Stack() {
        Text('Get Started')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)

        Button()
          .width(this.imageWidth)
          .position({ x: this.linePositionX, y: 0 })
          .linearGradient({
            direction: GradientDirection.Right,
            repeating: false,
            colors: [[this.btnColor, 0], [0xFFFFFF, 0.75], [this.btnColor, 1]]
          })
          .opacity(0.5);
      }
      .backgroundColor(this.btnColor)
      .borderRadius(32)
      .clip(true)
      .onAppear(() => {
        this.startupAnimate();
      });
    }
    .width('100%')
    .height('100%')
  }
}

