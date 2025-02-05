@Entry
@Component
struct Index {

  build() {
   Column(){
     Blank()

     Button('Delete', { type: ButtonType.Capsule, stateEffect: true })
       .size({width:120,height:40})
       .backgroundColor(Color.Red)
       .onClick(() => {
         this.showAlertDialog()
       })
    }
    .height('100%')
    .width('100%')
  }

  showAlertDialog(){
    AlertDialog.show(
      {
        title: '⚠️ Alert',
        message: 'Are you sure you want to delete?',
        autoCancel: true,
        alignment: DialogAlignment.Center,
        offset: { dx: 0, dy: -20 },
        width:'90%',
        height:200,
        cornerRadius: 32,
        gridCount: 3,
        confirm: {
          value: 'Confirm',
          action: () => {
            console.info('Button-clicking callback')
          },
          fontColor: Color.White,
          backgroundColor: 0x333333
        },
        cancel: () => {
          console.info('Closed callbacks')
        },
        onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
          console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
          console.log("dialog onWillDismiss")
          if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
            dismissDialogAction.dismiss()
          }
          if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
            dismissDialogAction.dismiss()
          }
        }
      }
    )

  }
}