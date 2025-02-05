@Entry
@Component
struct Index {
  @State showText:boolean = false

  build() {
    Column({space:20}) {
      Blank()

      Text('🔑API Key')
        .fontSize(23)
        .fontWeight(600)
      Text('1882776992447111212')
        .privacySensitive(false)
        .copyOption(CopyOptions.LocalDevice)
        .fontSize(23)

      Blank()
    }
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}