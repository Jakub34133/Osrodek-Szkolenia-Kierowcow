<?php
    session_name("PSIN");
    session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Programowanie serwisów internetowych - lista C1.</title>
    <meta name="keywords" content="serwisy, internetowe, programowanie">
    <meta name="description" content="Strona utworzona w ramach listy C1.">
    <meta name="author" content="Jan Kowalski">

    <link rel="stylesheet" href="css/uklad.css" type="text/css">
    <script src="js/script.js"></script>
</head>
<body>
    <?php
        require_once("uklad_poczatek.php");
    ?>

    <h2>Kontakt</h2>
    <p>Telefon: <strong>+48 101 102 103</strong></p>
    <p>Adres E-mail: <strong>szkoleniakierowcow@osk.pl</strong></p>

    <?php
        require_once("uklad_koniec.php");
    ?>
</body>
</html>
        