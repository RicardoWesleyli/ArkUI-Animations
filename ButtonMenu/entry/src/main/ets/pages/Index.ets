interface MenuModel {
  id: number
  icon:Resource
  color:string
}

@Entry
@Component
struct Index {
  @State icons: MenuModel[] = [
    {id:0,icon:$r('sys.symbol.hand_thumbsup_fill'),color: "#FFD700"},
    {id:1,icon: $r('sys.symbol.heart_fill'),color: "#FF3333"},
    {id:2,icon: $r('sys.symbol.bookmark_filled_on_bookmark'),color: "#3357FF"},
    {id:3,icon: $r('sys.symbol.mic_fill'),color: "#33FF57"},
    {id:4,icon: $r('sys.symbol.plus'),color: "#999999"},
  ]
  @State isAnimating: boolean = false

  build() {
    Column() {
      Blank()

      Stack() {
        ForEach(this.icons, (item: MenuModel) => {
          Stack() {
            Circle()
              .fill(item.color)
              .size({ width: 60, height: 60 })
            SymbolGlyph(item.icon)
              .fontSize(32)
              .fontColor([Color.White])
          }
          .offset({ x: this.isAnimating ? item.id * 70 : 0 })
          .animation({
            duration: 300,
            curve: Curve.Smooth,
          })
          .onClick(()=>{
            this.isAnimating = !this.isAnimating
          })
        })
      }
    }
    .margin(10)
    .height('100%')
  }
}