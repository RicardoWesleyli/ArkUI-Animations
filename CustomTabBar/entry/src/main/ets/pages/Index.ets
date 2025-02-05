interface TabBarModel {
  id:number
  tabName:string
  tabIcon: Resource
}

@Entry
@Component
struct Index {
  @State tabItems: TabBarModel[] = [
    {id:0,tabName:'首页',tabIcon:$r('sys.symbol.house_fill')},
    {id:1,tabName:'推荐',tabIcon:$r('sys.symbol.heart_fill')},
    {id:2,tabName:'消息',tabIcon:$r('sys.symbol.bell_fill')},
    {id:3,tabName:'我的',tabIcon:$r('sys.symbol.person_2_fill')}
  ]
  @State selectedTab:number  = 0

  build() {
   Column(){
     Grid(){
       ForEach(this.tabItems,(item:TabBarModel)=>{
         GridItem() {
           Column({ space: 5 }) {
             SymbolGlyph(item.tabIcon)
               .fontSize(23)
               .fontColor([this.selectedTab === item.id ? Color.Black : Color.Gray])
             Text(item.tabName)
               .fontSize(14)
               .fontColor(this.selectedTab === item.id ? Color.Black : Color.Gray)
           }
           .onClick(()=>{
             this.selectedTab = item.id
           })
         }
       })
     }
     .columnsTemplate('1fr 1fr 1fr 1fr')
     .height(80)
     .padding(20)
     .backgroundColor(0xF5F5F5)
     .borderRadius(16)
     .margin(10)
    }
    .height('100%')
    .width('100%')
  }
}