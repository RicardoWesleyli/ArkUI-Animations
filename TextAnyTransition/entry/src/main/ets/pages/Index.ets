interface ItemModel {
  id: number
  text:string
  color: string
}

@Entry
@Component
struct Index {
  @State items: ItemModel[] = [
    {id:0,text:'iPhone',color:'#000000'},
    {id:1,text:'Android',color:'#3DDC84'},
    {id:2,text:'Harmony',color:'#0A59F7'},
    {id:3,text:'Origin',color:'#7BDCB5'},
    {id:4,text:'Xiaomi Hyper',color:'#FF7E00'},
  ]

  @State currentIndex: number = 0

  build() {
    Column(){
      Blank()

      Row({space:5}){

        Stack(){
          ForEach(this.items, (item: ItemModel) => {
            if (item.id === this.currentIndex) {
              Text(item.text)
                .fontSize(23)
                .fontWeight(FontWeight.Bold)
                .fontColor(item.color)
                .transition(this.customTransition)
            }
          })
        }
        // .size({width:120,height:30})
        .align(Alignment.End)
        .clip(true)

        Text('OS')
          .fontSize(23)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
      }
      .onAppear(()=>{
        this.startTimer()
      })

      Blank()
    }
    .height('100%')
    .width('100%')
  }

  customTransition:TransitionEffect = TransitionEffect.asymmetric(
    TransitionEffect.move(TransitionEdge.BOTTOM),
    TransitionEffect.move(TransitionEdge.TOP)
  )

  startTimer() {
    setInterval(() => {
      animateTo({
        duration: 1000,
        curve: Curve.EaseInOut
      }, () => {
        this.currentIndex = (this.currentIndex + 1) % this.items.length;
      })
    }, 1500);
  }

}