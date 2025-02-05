@Entry
@Component
struct Index {
  @State spin:boolean = false
  @State start:boolean = false
  @State loading:boolean = false
  @State currentIndex:number = 0
  @State showCheckmark:boolean = false
  @State icons: Resource[] = [
    $r('sys.symbol.hand_thumbsup_fill'),
    $r('sys.symbol.heart_fill'),
    $r('sys.symbol.moon_circle_fill'),
    $r('sys.symbol.star_fill'),
    $r('sys.symbol.checkmark_circle_fill')
  ]

  build() {
    Column() {
      Stack(){
        LoadingProgress()
          .color(Color.White)
          .layoutWeight(1)
          .opacity(this.loading ? 1 : 0)

        if (!this.start) {
          Text('Buy Now')
            .fontSize(17)
            .fontColor(Color.Orange)
            .fontWeight(FontWeight.Bold)
        } else {
          SymbolGlyph(this.showCheckmark ? $r('sys.symbol.checkmark_circle_fill') : this.icons[this.currentIndex])
            .fontSize(this.showCheckmark ? 23 : 17)
            .fontColor([this.showCheckmark ? Color.White : Color.Orange])
            .rotate({
              x: 0, y: 0, z: 1,
              centerX: '50%', centerY: '50%',
              angle: this.spin ? 360 : 0
            })
        }
      }
      .size({width:this.start ? 45: 120,height:45})
      .backgroundColor(Color.Black)
      .borderRadius(32)
      .onClick(() => this.handleClick())
    }
    .height('100%')
    .width('100%')
  }

  // 按钮点击事件
  private handleClick() {
    this.loading = true // 开启加载动画

    animateTo({ duration: 500, curve: Curve.Linear }, () => {
      this.start = !this.start // 切换按钮状态
    })

    if (this.start) {
      // 3 秒后完成加载，显示 ✅
      setTimeout(() => {
        this.loading = false

        animateTo({}, () => {
          this.showCheckmark = true
          this.spin = false
        })
      }, 3000)
    }
  }

  // 处理旋转动画（但 UI 中未使用 rotation 绑定）
  private startSpinAnimation() {
    animateTo({ duration: 2000, curve: Curve.Linear }, () => {
      this.spin = !this.spin
    })
  }

  // 图标轮播动画
  private startIconAnimation() {
    setInterval(() => {
      if (this.start && !this.showCheckmark) {
        animateTo({ duration: 500 }, () => {
          this.currentIndex = (this.currentIndex + 1) % this.icons.length
        })
      }
    }, 800)
  }

  // 生命周期方法：页面加载时执行
  aboutToAppear() {
    this.startSpinAnimation()
    this.startIconAnimation()
  }
}