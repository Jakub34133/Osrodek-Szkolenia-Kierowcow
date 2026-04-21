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

    <link rel="stylesheet" href="../css/uklad.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="js/script.js"></script>
</head>
<body>
    
    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");

        
        if(!isset($_GET["IdInstruktor"])
            || trim($_GET["IdInstruktor"] == "")
            || !is_numeric($_GET["IdInstruktor"]))
            {
                print("<p class='msg error'>Nie można edytować danych instruktora, 
                ponieważ nie został on wybrany.</p>");

                print("<p><a class='btn' href='instruktorzy_tabela.php'>Powrót do wykazu instruktorów</a></p>");

                require_once("../uklad_koniec.php");
                die();
            }


        $serwer = "LAPTOP-MGQT4RCV\SQL1";

        $dane_polaczenia = array("Database" => "OSK", "CharacterSet" => "UTF-8");

        $polaczenie = sqlsrv_connect($serwer, $dane_polaczenia);

        if(!$polaczenie)
        {
            print("<p class='msg error'>Polaczenie z serwerem nie powiodło się.</p>");
            
            print(print_r(sqlsrv_errors(), true));
            require_once("../uklad_koniec.php");
            die();
        }
        else
        {
            // Jeżeli nawiązano połączenie
            // print("<p class='msg success'>Nawiązano połączenie z serwerem $serwer </p>");
                                
            $IdInstruktor = $_GET["IdInstruktor"];

            // Komenda SQL pobierająca dane instruktora, który będzie edytowany
            $komenda_sql = 
            "SELECT Imie, Nazwisko, Email, Telefon, Uwagi
            FROM dbo.Instruktor
            WHERE IdInstruktor = $IdInstruktor;";

            // Wykonanie polecenia
            $zbior_wierszy = sqlsrv_query($polaczenie, $komenda_sql);

            if(!sqlsrv_has_rows($zbior_wierszy))
            {
                // Jeżeli nie ma instruktora o zadanym Id
                print("<p class='msg error'>W bazie nie ma instruktora o podanym Id.</p>");

                print("<p><a class='btn' href='instruktorzy_tabela.php'>Powrót do wykazu instruktorów</a></p>");
            }
            else
            {
                // Jeżel są instruktorzy
                while($wiersz = sqlsrv_fetch_array($zbior_wierszy, SQLSRV_FETCH_ASSOC))
                {
                    $Imie = $wiersz["Imie"]; 
                    $Nazwisko = $wiersz["Nazwisko"]; 
                    $Email = $wiersz["Email"]; 
                    $Telefon = $wiersz["Telefon"]; 
                    $Uwagi = $wiersz["Uwagi"];

                    if($Uwagi == null)
                    {
                        $Uwagi = "";
                    }
                    
                } // while(wiersz)

                // Formularz Dodawania nowego Instruktora
                print("
                <form id='formInstruktorEdytuj' method='get' action='instruktor_edytuj_potwierdz.php'>
                    <h2>Edytuj Instruktora</h2>
                    <fieldset>
                        <legend>Dane instruktora</legend>

                        <p class='lbl'>
                            <label for='IdInstruktor'>Identyfikator*</label>
                            <input type='text' id='IdInstruktor' name='IdInstruktor' maxlength='10' value='$IdInstruktor' readonly>
                        </p>

                        <p class='lbl'>
                            <label for='Imie'>Imie*</label>
                            <input type='text' id='Imie' name='Imie' maxlength='30' value='$Imie'>
                        </p>
                        
                        <p class='lbl'>
                            <label for='Nazwisko'>Nazwisko*</label>
                            <input type='text' id='Nazwisko' name='Nazwisko' maxlength='30' value='$Nazwisko'>
                        </p>

                        <p class='lbl'>
                            <label for='Email'>Adres E-mail*</label>
                            <input type='text' id='Email' name='Email' maxlength='50' value='$Email'>
                        </p>
                        
                        <p class='lbl'>
                            <label for='Telefon'>Numer Telefonu*</label>
                            <input type='text' id='Telefon' name='Telefon' maxlength='20' value='$Telefon'>
                        </p>

                        <p class='lbl'>
                            <label for='Uwagi'>Uwagi</label><br>
                            <textarea id='Uwagi' name='Uwagi' maxlength='200'>$Uwagi</textarea>
                        </p>

                    </fieldset>

                    <p>
                        <input type='submit' value='Zapisz'>
                        <input type='reset' value='Przywróć dane'>
                        <a class='btn default' href='instruktorzy_tabela.php'>Anuluj</a>

                    </p>
                </form>
                ");

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                if($zbior_wierszy != null)
                    sqlsrv_free_stmt($zbior_wierszy);

            }

            sqlsrv_close($polaczenie);

            
        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>