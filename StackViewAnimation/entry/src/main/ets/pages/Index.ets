interface ToDoModel {
  id:number
  title:string
  isCompleted:boolean
}

@Entry
@Component
struct Index {
  @State tasks: ToDoModel[] = [
    {id:0,title:'Task 001',isCompleted:false},
    {id:1,title:'Task 002',isCompleted:false},
    {id:2,title:'Task 003',isCompleted:false},
    {id:3,title:'Task 004',isCompleted:false},
    {id:4,title:'Task 005',isCompleted:false}
  ]
  @State showTask:boolean = false

  build() {
    Scroll() {
      Column({space:10}){
        ForEach(this.tasks,(item:ToDoModel)=>{
          Row(){
            Text(item.title)
              .fontSize(17)
            Blank()
            SymbolGlyph(item.isCompleted ? $r('sys.symbol.checkmark_circle_fill') : $r('sys.symbol.circle'))
              .fontSize(23)
          }
          .width('90%')
          .padding(20)
          .backgroundColor(0xF5F5F5)
          .borderRadius(16)
          .opacity(item.id === 0 ? 1 : (1.0-item.id*0.2))
          .zIndex(-1*item.id)
          .scale({x:this.showTask ? 1 : (1.0-item.id*0.02)})
          .opacity(this.showTask ? 1 : (1.0-item.id*0.2))
          .offset({y:this.showTask ? 0 : -68*item.id})
        })
      }
      .height('100%')
      .onClick(()=>{
        animateTo({ duration: 300 }, () => {
          this.showTask = !this.showTask
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}