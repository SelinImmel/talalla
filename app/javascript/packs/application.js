import "bootstrap";



let lessonCells = document.querySelectorAll(".booked_lesson")
if (lessonCells) {lessonCells.forEach((cell) => {
   cell.parentElement.classList.add("calendar_bookings")
  });
}
