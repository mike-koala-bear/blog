import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  initialize() {
    console.log('Connected to CommentsController')
  }
  connect() {}
  toggleForm(event) {
    console.log("CommentsController#toggleForm connected")
    event.preventDefault()
    event.stopPropagation()
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const editButtonID = event.params["edit"];

    const form = document.getElementById(formID);
    const commentBody = document.getElementById(commentBodyID);
    const editButton = document.getElementById(editButtonID);

    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    commentBody.classList.toggle("d-none");
    this.toggleEditButton(editButton);
  }

  toggleEditButton(editButton) {
    if (editButton.innerText === "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle("btn-secondary");
    editButton.classList.toggle("btn-warning");
  }
}
