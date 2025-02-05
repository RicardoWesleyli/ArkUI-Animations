interface TextModel {
  title:string
  color:Color
}

@Entry
@Component
struct Index {
  @State items: TextModel[] = [
    {title:'NEON',color:Color.Pink},
    {title:'GLOW',color:Color.Grey},
    {title:'LIGHT',color:Color.Blue},
    {title:'SHINE',color:Color.Orange},
    {title:'BRIGHT',color:Color.Red},
  ]

  @State index: number = 0

  build() {
    Stack() {
      Text(this.items[this.index].title)
        .fontSize(48)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .padding(10)
        .backgroundColor(this.items[this.index].color)
        .borderRadius(16)
        .shadow({ radius: 5, color: this.items[this.index].color})
        .shadow({ radius: 10, color: this.items[this.index].color})
        .shadow({ radius: 50, color: this.items[this.index].color})
        .shadow({ radius: 100, color: this.items[this.index].color})
        .shadow({ radius: 200, color: this.items[this.index].color})
        .animation({ duration: 1000, curve: Curve.Linear })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .onAppear(()=>{
      setInterval(() => {
        animateTo({ duration: 300 }, () => {
          this.index = (this.index + 1) % this.items.length
        })
      }, 3000)
    })
  }
}
