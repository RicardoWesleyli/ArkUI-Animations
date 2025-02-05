interface TaskModel {
  id: number
  title: string
  icon: Resource
  color: string
}

@Entry
@Component
struct Index {
  @State tasks: TaskModel[] = [
    { id: 1, title: "需求分析", icon: $r('sys.symbol.bookmark_filled_on_bookmark'),color: "#FFD700"},
    { id: 2, title: "产品设计", icon: $r('sys.symbol.brush_fill'),color: "#FF3333"},
    { id: 3, title: "编程开发", icon: $r('sys.symbol.keyboard_badge_handwritten'),color: "#3357FF"},
    { id: 4, title: "功能测试", icon: $r('sys.symbol.hand_thumbsup_fill'),color: "#33FF57"},
    { id: 5, title: "部署上线", icon: $r('sys.symbol.heart_fill'),color: "#FF5733"},
  ]

  @State isRefreshing:boolean = false
  @State promptText: string = "Refreshing..."

  build() {
    Navigation(){
      Refresh({ refreshing: $$this.isRefreshing,promptText:this.promptText}) {
        List({space: 10}) {
          ForEach(this.tasks, (item: TaskModel) => {
            ListItem() {
              Row({space:10}) {
                SymbolGlyph(item.icon)
                  .fontSize(20)
                  .fontColor([item.color])
                Text(item.title)
              }
              .width('100%')
              .padding(20)
              .backgroundColor(0xF5F5F5)
              .borderRadius(8)
            }
          })
        }
        .padding(10)
        .width('100%')
        .height('100%')
      }
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false
        }, 2000)
      })
    }
    .title('每日待办')
  }
}

