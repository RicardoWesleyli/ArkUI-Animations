@Entry
@Component
struct Index {
  @State userName:string = ''
  @State password:string = ''

  build() {
    Column({space:32}) {
      InfoView({text:this.userName,placeholder:'账号'})
      InfoView({text:this.password,placeholder:'密码'})
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct InfoView {
  @Link text:string
  @Prop placeholder:string

  build() {
    Stack({alignContent:Alignment.Start}) {
      TextInput({ text: this.text })
        .width('90%')
        .height(60)
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.placeholder)
        .padding({left:20})
        .offset({y:this.text != '' ? -45 :0})
        .fontColor(this.text != '' ? Color.Black : Color.Gray)
        .animation({duration: 300, curve: Curve.Smooth})
    }
  }
}