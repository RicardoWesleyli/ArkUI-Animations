@Entry
@Component
struct Index {
  @State accumulateTime: number = 0
  controller: TextClockController = new TextClockController()

  build() {
    Column({space:32}){
      Blank()
      this.textClockView(TimeFormat.DATE)
      this.textClockView(TimeFormat.TIME)
      this.textClockView(TimeFormat.SECOND)
      this.textClockView(TimeFormat.DATETIME)
      this.textClockView(TimeFormat.TIME)
      Blank()
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  textClockView(style:string){
    TextClock({ timeZoneOffset: -8, controller: this.controller })
      .format(style)
      .fontSize(24)
      .fontWeight(600)
      .onDateChange((value: number) => {
        this.accumulateTime = value
      })
  }
}

enum TimeFormat {
  DATE = 'yyyy年MM月dd日', // 日期格式
  TIME = 'HH:mm',         // 时间格式
  SECOND = 'ss秒',        // 秒格式
  DATETIME = 'yyyy年MM月dd日 HH:mm:ss', // 日期时间格式
  TIME_AM_PM = 'aa hh:mm:ss' // 上午/下午
}
