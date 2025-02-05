@Entry
@Component
struct Index {
  @State scaleArray: number[] = Array(5).fill(1.0)
  circles = [1, 2, 3, 4, 5];

  build() {
    Stack() {
      ForEach(this.circles, (index: number) => {
        Circle()
          .fill(Color.Gray)
          .size({ width: 50 * index, height: 50 * index })
          .opacity(1 - 0.2 * index) // 透明度层次
          .shadow({ radius: 10, color: Color.Black, offsetX: 0, offsetY: 5 }) // 阴影效果
          .scale({ x: this.scaleArray[index], y: this.scaleArray[index] }) // 动态绑定 scale
          .animation({
            duration: 1000, // 动画时长
            curve: Curve.Smooth, // 使用平滑曲线
            iterations: -1, // 无限循环
            delay: 0.1 * index, // 延迟间隔
            playMode: PlayMode.Alternate, // 放大和缩小交替播放
          });
      });
    }
    .backgroundColor(Color.Black)
    .height('100%')
    .width('100%')
    .onAppear(() => {
      this.startWaveAnimation() // 启动波浪动画
    })
  }

  startWaveAnimation() {
    setInterval(() => {
      this.scaleArray = this.scaleArray.map((value, i) =>
      value === 1.0 ? 1.2 : 1.0
      )
    }, 600)
  }
}
