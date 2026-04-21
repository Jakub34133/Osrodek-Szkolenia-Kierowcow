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
    <h2>O firmie</h2>
    <p>
        Ośrodek szkolenia kierowców obejmuje edukacje kursantów z zakresu wiedzy
        prowadzenia pojazdów oraz poruszania się w ruchu drogowym. Ośrodek oferuje zakup
        różnych kursów nauki jazdy, które mogą obejmować różne kategorie (np. motorower,
        samochód osobowy, pojazd ciężarowy). Możliwe jest również wykupienie egzaminu
        wewnętrznego, aby sprawdzić swoje umiejętności i przygotowanie do jazdy po drodze
        publicznej.
    </p>
    <p>
        Sprzedaż zarówno kursów jak i egzaminów odbywa się za pomocą strony internetowej, na
        której należy wypełnić odpowiedni formularz zgłoszeniowy podając swoje dane osobowe, a
        także dokonać wpłaty w ustalonej wcześnej cenie. Każdy zarejestrowany kursant posiada
        wgląd do szczegółowych danych takich jak data rozpoczęcia, zakończenia, stan swojego
        kursu itp. Instruktorzy zapewniają odpowiednie warunki oraz wiedze podczas odbywania
        się organizowanych zajęć praktycznych i teoretycznych.
    </p>
    <p>
        Po zakończnym kursie, uczestnicy są przygotowani aby przystąpić do egzaminów na prawo
        jazdy a później swobodnego poruszania się w ruchu drogowym.
    </p>

    <?php
        require_once("uklad_koniec.php");
    ?>
</body>
</html>
        