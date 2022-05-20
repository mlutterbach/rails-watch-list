import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Bookmark your favorite movies!", "Display them for your friends to see them!"],
      typeSpeed: 90,
      loop: true
    });
  }
}
