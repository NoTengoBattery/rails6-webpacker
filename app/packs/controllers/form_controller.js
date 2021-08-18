import { Controller } from 'stimulus'
import { enableElement } from '@rails/ujs'

export default class extends Controller {
  static targets = ['reset'];

  reset () {
    this.resetTargets.forEach((element) => {
      enableElement(element)
    })
  }
}
