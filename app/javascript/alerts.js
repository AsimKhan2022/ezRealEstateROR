/*
document.addEventListener('DOMContentLoaded', () => {
  const notice = document.getElementById('noticeAlert').textContent.trim();
  const alertMessage = document.getElementById('alertAlert').textContent.trim();

  if (notice) {
    const noticeAlert = document.getElementById('noticeAlert');
    noticeAlert.classList.remove('d-none');
  }

  if (alertMessage) {
    const alertAlert = document.getElementById('alertAlert');
    alertAlert.classList.remove('d-none');
  }
});
*/

/*
document.addEventListener('DOMContentLoaded', () => {
    const noticeAlert = document.getElementById('noticeAlert');
    const alertAlert = document.getElementById('alertAlert');

    if (noticeAlert.textContent.trim()) {
        noticeAlert.classList.remove('d-none');
    }

    if (alertAlert.textContent.trim()) {
        alertAlert.classList.remove('d-none');
    }
});
*/

document.addEventListener('DOMContentLoaded', function () {
    var notice = document.getElementById('noticeAlert').textContent.trim();
    var alertMessage = document.getElementById('alertAlert').textContent.trim();

    if (notice) {
        var noticeAlert = document.getElementById('noticeAlert');
        noticeAlert.classList.remove('d-none');
    }

    if (alertMessage) {
        var alertAlert = document.getElementById('alertAlert');
        alertAlert.classList.remove('d-none');
    }
});