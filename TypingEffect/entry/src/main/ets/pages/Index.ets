@Entry
@Component
struct Index {
  @State fullText: string = 'Hello HarmonyOS'
  @State displayedText: string = ''
  @State showLine: boolean = false
  typingSpeed: number = 150

  build() {
    Column() {
      Blank()
      Row() {
        Text(this.displayedText)
          .fontSize(23)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
        Rect()
          .size({ width: 4, height: 32 })
          .fill(Color.Blue)
          .radius(16)
          .opacity(this.showLine ? 1 : 0)
      }
      .onAppear(() => {

        animateTo({
          duration: 500,
          curve: Curve.Linear,
          iterations: -1,
        }, () => {
          this.showLine = !this.showLine
        })

        setTimeout(() => {
          this.startTyping()
        }, 1500)

      })
      Blank()
    }
    .height('100%')
    .width('100%')
  }

  private startTyping() {
    this.displayedText = "" // 清空文本
    for (let i = 0; i < this.fullText.length; i++) {
      setTimeout(() => {
        this.displayedText += this.fullText[i] // 逐个字符追加
        if (i === this.fullText.length - 1) {
          this.showLine = false // 结束时隐藏光标
        } else {
          this.showLine = !this.showLine // 切换光标闪烁状态
        }
      }, this.typingSpeed * i)
    }
  }

}