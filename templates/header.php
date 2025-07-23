<?php
include("process/conn.php");

$msg = isset($_SESSION["msg"]) ? $_SESSION["msg"] : "";
$status = isset($_SESSION["status"]) ? $_SESSION["status"] : "";

if (!empty($_SESSION["msg"])) {
    $msg = $_SESSION["msg"];
    $status = $_SESSION["status"];
    $_SESSION["msg"] = "";
    $_SESSION["status"] = "";
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projeto Final WDL</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- App CSS -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- Javascript do projeto -->
    <script src="js/scripts.js" defer></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="index.php" class="navbar-brand">
                <img src="img/pizza.svg" alt="Pizzaria do João" id="brand-logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a href="index.php" class="nav-link">Pizzaria do João</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="#" class="nav-link" data-toggle="modal" data-target="#passwordModal">Acesso
                            corporativo <i class="bi bi-lock-fill"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <?php if ($msg != "") : ?>
    <div class="alert alert-<?= $status ?>">
        <p><?= $msg ?></p>
    </div>
    <?php endif; ?>

    <!-- Modal de Senha -->
    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">Digite sua senha corporativa para acessar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="password" class="form-control" id="passwordInput" placeholder="Senha">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="submitPassword">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('submitPassword').addEventListener('click', function() {
        var password = document.getElementById('passwordInput').value;
        // Envia a senha para verificar no servidor
        if (password === "1234") {
            window.location.href = "dashboard.php"; // Redireciona para a página restrita
        } else {
            alert("Senha incorreta. Tente novamente.");
        }
    });
    </script>

    <!-- Bootstrap e jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>