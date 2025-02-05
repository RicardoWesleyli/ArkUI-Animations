@Entry
@Component
struct Index {
  @State isLoadingIndex: number = 0

  build() {
    Column() {
      Row({ space: 8 }) {
        ForEach(Range(0, 5), (index: number) => {
          Circle({ width: 20, height: 20 })
            .fill(this.isLoadingIndex === index ? 0xa1c4fd : 0xc2e9fb)
            .scale({
              x: this.isLoadingIndex === index ? 1.1 : 0.8,
              y: this.isLoadingIndex === index ? 1.1 : 0.8
            })
            .animation({
              duration: 800,
              curve: Curve.EaseOut,
              iterations: -1,
              playMode: PlayMode.Alternate
            })
        })
      }
      .height('100%')
      .onAppear(() => {
        setInterval(() => {
          this.isLoadingIndex = (this.isLoadingIndex + 1) % 5;
        }, 1000);
      })
    }
    .height('100%')
    .width('100%')
  }
}

// 创建数组
function Range(start: number, end: number): number[] {
  const result: number[] = [];
  for (let i = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}