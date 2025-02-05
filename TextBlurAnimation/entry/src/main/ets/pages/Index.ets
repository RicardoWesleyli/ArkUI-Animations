@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isVisible: boolean = false

  build() {
    Column(){
      Blank()

      Row(){
        ForEach(this.message.split(''), (item:string,index:number) => {
          Text(item)
            .fontSize(32)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .opacity(this.isVisible ? 1 : 0)
            .offset({ y: this.isVisible ? 0 : -30 })
            .blur(this.isVisible ? 0 : 10)
            .animation({
              duration: 300,
              curve: Curve.EaseOut,
              delay: index * 100,
            });
        })
      }
      .onAppear(() => {
        this.isVisible = true;
      });

      Blank()
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD])
  }
}