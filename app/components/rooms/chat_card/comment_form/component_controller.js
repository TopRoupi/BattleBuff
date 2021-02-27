import ApplicationController from '../../../../javascript/controllers/application_controller'

export default class extends ApplicationController {
  static targets = ['input']

  connect() {
    super.connect()

    var input = this.inputTarget

    // xD

    var a = this

    input.addEventListener("keyup", (event) => {
      if(event.keyCode === 13) {
        event.preventDefault();
        if(input.value == "") {
          return
        }
        a.stimulate(
          'Rooms::ChatCard::CommentForm::ComponentReflex#comment',
          a.element.dataset.room,
          a.inputTarget.value
        )
        a.inputTarget.value = ""
      }
    })
  }

  post() {
    if(this.inputTarget.value == "") {
      return
    }
    this.stimulate(
      'Rooms::ChatCard::CommentForm::ComponentReflex#comment',
      this.element.dataset.room,
      this.inputTarget.value
    )
    this.inputTarget.value = ""
  }
}
