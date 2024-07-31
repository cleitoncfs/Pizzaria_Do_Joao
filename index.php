<?php
include_once("templates/header.php");
include_once("process/pizza.php");
?>
<div id="main-banner">
    <h1>Faça seu Pedido</h1>
</div>

<!-- css interno -->
<style>
.sabor-item {
    clear: both;
    overflow: hidden;
    padding-bottom: 5px;
    /* Adicionando algum espaçamento entre os itens */
    border-bottom: 1px solid #ccc;
    /* Linha divisória entre os itens */
}

.sabor-item input[type="checkbox"] {
    float: left;
    /* Mova a checkbox para a esquerda */
    margin-right: 10px;
    /* Adicione um pequeno espaçamento entre a checkbox e o nome do sabor */
}

.sabor-item label {
    float: left;
}

.preco-sabor {
    float: right;
}

#total-container {
    text-align: right;
    /* Alinhar o texto à direita */
    font-weight: bold;
    /* Deixar o texto em negrito */
}

#total {
    color: green;
    /* Definir a cor do valor do total como verde */
}
</style>

<div id="main-container">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Monte a pizza como desejar:</h2>
                <form action="process/pizza.php" method="POST" id="pizza-form" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="borda">Borda:</label>
                        <select name="borda" id="borda" class="form-control" onchange="calculateTotal()">
                            <option value="">Selecione a borda</option>
                            <?php foreach ($bordas as $borda) : ?>
                            <option value="<?= $borda["preco"] ?>"><?= $borda["tipo"] ?> - <?= $borda["preco"] ?> €
                            </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="massa">Massa:</label>
                        <select name="massa" id="massa" class="form-control" onchange="calculateTotal()">
                            <option value="">Selecione a massa</option>
                            <?php foreach ($massas as $massa) : ?>
                            <option value="<?= $massa["preco"] ?>"><?= $massa["tipo"] ?> - <?= $massa["preco"] ?> €
                            </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sabores">Escolha até 3 sabores por pizza:</label><br>
                        <?php foreach ($sabores as $sabor) : ?>
                        <div class="sabor-item">
                            <input type="checkbox" name="sabores[]" value="<?= $sabor["id"] ?>"
                                data-price="<?= $sabor["preco"] ?>" onchange="calculateTotal()">
                            <label><?= $sabor["nome"] ?></label>
                            <span class="preco-sabor"><?= $sabor["preco"] ?> €</span>
                        </div>
                        <?php endforeach; ?>
                    </div>
                    <div id="total-container">
                        Total do Pedido: <span id="total">0.00 €</span>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Fazer Pedido!">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php
include_once("templates/footer.php");
?>