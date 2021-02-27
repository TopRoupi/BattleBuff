import ApplicationController from '../../../../javascript/controllers/application_controller'

export default class extends ApplicationController {
  static targets = ['comments_box']

  connect() {
    console.log("a")
    this.comments_boxTarget.scrollTop = this.comments_boxTarget.scrollHeight;
  }
}
