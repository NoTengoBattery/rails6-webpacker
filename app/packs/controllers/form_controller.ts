import { Controller } from 'stimulus'
import { enableElement } from '@rails/ujs'

export default class extends Controller {
  resetTargets!: Array<Element>
  static targets = ['reset'];

  reset (): void {
    this.resetTargets.forEach((element): void => {
      enableElement(element)
    })
  }
}
