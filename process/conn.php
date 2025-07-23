<?php
session_start();

// Credenciais
$user = "root";
$pass = "";
$db = "pizzaria";
$host = "localhost";

// Conexão segura com PDO
try {
    $conn = new PDO("mysql:host={$host};dbname={$db}", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
} catch (PDOException $e) {
    // Log de erro interno
    error_log("Erro na conexão com o banco: " . $e->getMessage());

    // Mensagem genérica para o usuário
    die("Ocorreu um erro ao conectar com o banco de dados. Por favor, tente novamente mais tarde.");
}
?>
