@Entry
@Component
struct Index {

  build() {
    Column({space:20}) {
      CustomButton({title:'搜索',icon:$r('sys.symbol.magnifyingglass'),color:Color.Blue,action:()=>{}})
      CustomButton({title:'设置',icon:$r('sys.symbol.gearshape'),color:Color.Blue,action:()=>{}})
      CustomButton({title:'保存',icon:$r('sys.symbol.save'),color:Color.Blue,action:()=>{}})
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct CustomButton {
  title: string = ''
  icon: Resource = $r('sys.symbol.gearshape')
  color: Color = 0x409EFF
  action: () => void = () => {}

  build() {
    Button({ type: ButtonType.Capsule, stateEffect: true }) {
      Row({space:10}) {
        SymbolGlyph(this.icon)
          .fontSize(17)
          .fontColor([this.color])
        Text(this.title)
          .fontSize(17)
          .fontColor(this.color)
      }
    }
    .padding({left:20,right:20,top:10,bottom:10})
    .backgroundColor(0xF5F5F5)
    .onClick(()=>{
      this.action()
    })
  }
}