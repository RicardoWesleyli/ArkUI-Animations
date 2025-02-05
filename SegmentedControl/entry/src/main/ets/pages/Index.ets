@Entry
@Component
struct Index {
  @State currentPage: string = PageOptions.option1
  pageOptionsArray = Object.values(PageOptions)

  build() {
    Column() {
      Blank()

      Row({ space: 10 }) {
        ForEach(this.pageOptionsArray, (item: string) => {
          Text(item)
            .fontColor(this.currentPage === item ? Color.Black : Color.Gray)
            .backgroundColor(this.currentPage === item ? 0xD5D5D5 : 0xF5F5F5)
            .padding({left:20,right:20,top:10,bottom:10})
            .borderRadius(32)
            .onClick(() => {
              animateTo({
                duration: 300,
                curve: Curve.EaseInOut,
              }, () => {
                this.currentPage = item
              })
            })
        })
      }
      .padding(10)
      .backgroundColor(0xF5F5F5)
      .borderRadius(32)
    }
    .size({width:'100%',height:'100%'})
  }
}

enum PageOptions {
  option1 = "首页",
  option2 = "推荐",
  option3 = "收藏",
  option4 = "我的"
}