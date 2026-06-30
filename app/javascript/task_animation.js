console.log("task_animation loaded");

document.addEventListener("click", function(event) {

  const button = event.target.closest(".complete-btn");
  if (!button) return;

  event.preventDefault();

  const taskItem = button.closest(".task-item");

  taskItem.classList.add("completing");

  setTimeout(() => {
    button.closest("form").submit();
  }, 450);

});