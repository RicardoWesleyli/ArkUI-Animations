interface MoodModel {
  id: number
  image:string
  color:Color
}

@Entry
@Component
struct Index {
  @State moods: MoodModel[] = [
    {id:0,image:'😄',color:Color.Green},
    {id:1,image:'😌',color:Color.Yellow},
    {id:2,image:'😐',color:Color.Brown},
    {id:3,image:'😔',color:Color.Blue},
    {id:4,image:'😭',color:Color.Red},
  ]
  @State selectedMood:number = 0
  @State mood:string = 'Today?'
  @State moodColor: Color = Color.Blue

  build() {
    Column({space:32}) {
     Text('How are you feeling '+this.mood)
       .fontSize(23)
       .fontWeight(FontWeight.Bold)

      Row({space:15}){
       ForEach(this.moods,(mood:MoodModel)=>{
         Stack() {
           Rect()
             .size({width:52,height:52})
             .fill(mood.color)
             .opacity(0.2)
             .radius(8)
           Text(mood.image)
             .fontSize(32)
         }
         .scale({
           x:this.selectedMood === mood.id ? 1 : 0.8,
           y:this.selectedMood === mood.id ? 1 : 0.8,
         })
         .onClick(()=>{
           animateTo({
             duration:300
           }, () => {
             this.selectedMood = mood.id
             this.mood = mood.image
             this.moodColor = mood.color
           })
         })
       })
      }
      .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}