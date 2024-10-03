function performSearch() {
    const searchQuery = document.getElementById('searchInput').value;
    const searchOption = document.getElementById('searchOption').value;

    fetch(`/Dashboard/Search?query=${searchQuery}&filter=${searchOption}`)
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('cardsContainer');
            container.innerHTML = ''; // Clear previous results
            data.forEach(user => {
                const card = `
                    <div class="card__header">
                        <h3>${user.Fullname}</h3>
                        <p><strong>Username:</strong> ${user.Username}</p>
                        <p><strong>Phone:</strong> ${user.PhoneNumber}</p>
                    </div>`;
                container.innerHTML += card;
            });
        })
        .catch(error => console.error('Error:', error));
}

function changePage(pageNumber) {
    // Implement pagination logic if needed
    alert('Changing to page: ' + pageNumber);
}
