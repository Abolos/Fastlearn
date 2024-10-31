/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function Mychecked() {
    const checkedElement = document.getElementById("checked");
    if (checkedElement.style.left === '100%') {
        checkedElement.style.left = '0';
    } else {
        checkedElement.style.left = '100%';
    }
}

// Biểu đồ vòng tròn
const ctxCircle = document.getElementById('percentageCircle').getContext('2d');
const percentageCircle = new Chart(ctxCircle, {
    type: 'doughnut',
    data: {
        labels: ['Completed', 'Remaining'],
        datasets: [{
            data: [76, 24],
            backgroundColor: ['#4caf50', '#e0e0e0'],
            borderWidth: 0
        }]
    },
    options: {
        responsive: false,
        cutout: '70%', // Vùng giữa
        plugins: {
            legend: {
                display: false
            }
        }
    }
});

// Biểu đồ cột
const ctxChart = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctxChart, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'],
        datasets: [{
            label: 'Data',
            data: [1, 2, 3, 4, 3, 5, 4, 6, 5, 7, 6],
            backgroundColor: 'rgba(76, 175, 80, 0.5)',
            borderColor: '#4caf50',
            borderWidth: 2,
            fill: true,
            tension: 0.4 // Đường cong cho biểu đồ
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 1
                }
            }
        },
        plugins: {
            legend: {
                display: false
            }
        }
    }
});