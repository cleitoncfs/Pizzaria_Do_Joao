// Scripts index
function validateForm() {
  var borda = document.getElementById("borda").value;
  var massa = document.getElementById("massa").value;
  var selectedSaborCount = document.querySelectorAll(
    'input[name="sabores[]"]:checked'
  ).length;

  if (borda === "") {
    alert("Você precisa escolher o tipo de borda.");
    return false;
  }
  if (massa === "") {
    alert("Você precisa escolher o tipo de massa.");
    return false;
  }
  if (selectedSaborCount < 1) {
    alert("Para prosseguir, você precisa selecionar pelo menos 1 sabor.");
    return false;
  }

  return true;
}

function calculateTotal() {
  var bordaSelect = document.getElementById("borda");
  var bordaPrice =
    bordaSelect.selectedIndex !== -1 ? parseFloat(bordaSelect.value) : 0;
  var massaPrice = parseFloat(document.getElementById("massa").value);
  var sabores = document.getElementsByName("sabores[]");
  var selectedSaborCount = 0;
  var saboresTotal = 0;

  for (var i = 0; i < sabores.length; i++) {
    if (sabores[i].checked) {
      selectedSaborCount++;
      saboresTotal += parseFloat(sabores[i].getAttribute("data-price"));
    }
  }

  // Calcular o preço médio dos sabores, se mais de um sabor for selecionado
  var saborPrice =
    selectedSaborCount > 1 ? saboresTotal / selectedSaborCount : saboresTotal;

  // Calcular o total do pedido
  var total = bordaPrice + massaPrice + saborPrice;

  // Exibir o total formatado
  document.getElementById("total").innerText = total.toFixed(2) + " €";
}

// Scripts header
document
  .getElementById("submitPassword")
  .addEventListener("click", function () {
    var password = document.getElementById("passwordInput").value;
    // Envia a senha para verificar no servidor
    if (password === "1234") {
      window.location.href = "dashboard.php"; // Redireciona para a página restrita
    } else {
      alert("Senha incorreta. Tente novamente.");
    }
  });
