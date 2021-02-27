import ApplicationController from '../../../javascript/controllers/application_controller'

export default class extends ApplicationController {
  connect() {
    var player_id = document.getElementById("user_id").innerHTML
    document.getElementById(`leave-button-${player_id}`).classList.remove("hidden")
  }
}
