@Entry
@Component
struct Index {
  @State rating: number = 0

  build() {
    Column() {
      Blank()

      Row({space:12}){
        ForEach(Range(1, 5), (item: number) => {
          SymbolGlyph(this.rating <= item ? $r('sys.symbol.star') : $r('sys.symbol.star_fill'))
            .fontSize(32)
            .fontColor([this.rating <= item ? Color.Gray : Color.Yellow])
            .effectStrategy(1)
            .onClick(()=>{
              this.rating = item + 1
            })
        })
      }

      Blank()
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)
  }
}

// 创建数组
function Range(start: number, end: number): number[] {
  const result: number[] = [];
  for (let i = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}
