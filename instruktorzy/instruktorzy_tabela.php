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

    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="../css/uklad.css" type="text/css">
    <script src="js/script.js"></script>
</head>
<body>

    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");


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

            /*
            SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
            FROM dbo.Instruktor
            ORDER BY Nazwisko ASC, Imie ASC;
            GO
            */
            
            print("<h2>Instruktorzy</h2>");
            print("
            <form name='formSzukaj' action='instruktorzy_tabela.php' method='get'>
                <input type='text' name='inputSzukaj' id='inputSzukaj' placeholder='Podaj Imie/Nazwisko do wyszukania'>
                <input type='submit' value='Szukaj' id='btnSzukaj'>
            </form><br>"
            );

            if(isset($_GET["inputSzukaj"]) && trim($_GET["inputSzukaj"]) != "") {
                $szukaj = $_GET["inputSzukaj"];
            } else {
                $szukaj = null;
            }

            print(" 
            <table>
                <thead>
                    <tr>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=IdInstruktor&inputSzukaj=$szukaj'>Identyfikator</a></td>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=Imie&inputSzukaj=$szukaj'>Imie</a></td>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=Nazwisko&inputSzukaj=$szukaj'>Nazwisko</a></td>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=Email&inputSzukaj=$szukaj'>Adres E-mail</a></td>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=Telefon&inputSzukaj=$szukaj'>Numer Telefonu</a></td>
                        <td><a href='instruktorzy_tabela.php?KolejnoscWedlug=Uwagi&inputSzukaj=$szukaj'>Uwagi</a></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
            ");
                        
            // Komenda SQL wyświetlająca dane w domyślnej kolejności
            $komenda_sql = 
            "SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
            FROM dbo.Instruktor
            ORDER BY Nazwisko ASC, Imie ASC;";
            
            $szukajKolejnosc = true;
            // Szukajnie według imion/nazwisk
            if(isset($_GET["inputSzukaj"]) && trim($_GET["inputSzukaj"]) != "")
            {
                $szukaj = trim($_GET["inputSzukaj"]);
                $komenda_sql = 
                "SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
                FROM dbo.Instruktor
                WHERE Imie LIKE '%$szukaj%' OR Nazwisko LIKE '%$szukaj%'
                ORDER BY Nazwisko ASC, Imie ASC;";
            } 
            else
            {
                $szukajKolejnosc = false;
            }
            // Komenda SQL jeśli jest wybrana inna kolejność
            if(isset($_GET["KolejnoscWedlug"]) && trim($_GET["KolejnoscWedlug"]))
            {
                $kolejnosc = $_GET["KolejnoscWedlug"];

                if($kolejnosc == "IdInstruktor"
                    || $kolejnosc == "Imie"
                    || $kolejnosc == "Nazwisko"
                    || $kolejnosc == "Email"
                    || $kolejnosc == "Telefon"
                    || $kolejnosc == "Uwagi")
                {
                    $komenda_sql = 
                    "SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
                    FROM dbo.Instruktor
                    ORDER BY $kolejnosc ASC;";
                }
                else
                {
                    $szukajKolejnosc = false;
                }
            } 
            else
            {
                $szukajKolejnosc = false;
            }

            // Szukanie według kolejności 
            if($szukajKolejnosc)
            {
            $komenda_sql = 
                "SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
                FROM dbo.Instruktor
                WHERE Imie LIKE '%$szukaj%' OR Nazwisko LIKE '%$szukaj%'
                ORDER BY $kolejnosc ASC;";
            }

            // Wykonanie polecenia
            $zbior_wierszy = sqlsrv_query($polaczenie, $komenda_sql);

            if(!sqlsrv_has_rows($zbior_wierszy))
            {
                // Jeżeli nie ma instruktorów
                print(
                    "<tr>
                        <td colspan='8'>Jeszcze nie ma żadnych Instruktorów</td>
                    </tr>"
                );
            }
            else
            {
                // Jeżel są instruktorzy
                while($wiersz = sqlsrv_fetch_array($zbior_wierszy, SQLSRV_FETCH_ASSOC))
                {
                    $IdInstruktor = $wiersz["IdInstruktor"];
                    $Imie = $wiersz["Imie"]; 
                    $Nazwisko = $wiersz["Nazwisko"]; 
                    $Email = $wiersz["Email"]; 
                    $Telefon = $wiersz["Telefon"]; 
                    $Uwagi = $wiersz["Uwagi"];

                    if(trim($Uwagi) == "" || $Uwagi == null)
                    {
                        $Uwagi = "-";
                    }
                    
                    print(
                    "<tr>
                        <td>$IdInstruktor</td>
                        <td>$Imie</td>
                        <td>$Nazwisko</td>
                        <td>$Email</td>
                        <td>$Telefon</td>
                        <td>$Uwagi</td>
                        <td><a href='instruktor_edytuj.php?IdInstruktor=$IdInstruktor' class='btn update'>Edytuj</a></td>
                        <td><a href='instruktor_usun.php?IdInstruktor=$IdInstruktor' class='btn delete'>Usuń</a></td>
                    </tr>"
                    );
                } // while(wiersz)

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                if($zbior_wierszy != null)
                    sqlsrv_free_stmt($zbior_wierszy);

            }
            
            print("     
                </tbody>    
            </table>"
            );

            sqlsrv_close($polaczenie);

            // Formularz Dodawania nowego Instruktora
            print("<br><br><input type='button' value='+ Nowy Instruktor' onclick='instruktor_dodaj()' id='przyciskDodaj'>");

            print("
            <form id='formInstruktorDodaj' method='get' action='instruktor_dodaj.php'>
                <h2>Nowy Instruktor</h2>
                <fieldset>
                    <legend>Dane instruktora</legend>

                    <p class='lbl'>
                        <label for='IdInstruktor'>Identyfikator*</label>
                        <input type='text' id='IdInstruktor' name='IdInstruktor' maxlength='10'>
                    </p>

                    <p class='lbl'>
                        <label for='Imie'>Imie*</label>
                        <input type='text' id='Imie' name='Imie' maxlength='30'>
                    </p>
                    
                    <p class='lbl'>
                        <label for='Nazwisko'>Nazwisko*</label>
                        <input type='text' id='Nazwisko' name='Nazwisko' maxlength='30'>
                    </p>

                    <p class='lbl'>
                        <label for='Email'>Adres E-mail*</label>
                        <input type='text' id='Email' name='Email' maxlength='50'>
                    </p>
                    
                    <p class='lbl'>
                        <label for='Telefon'>Numer Telefonu*</label>
                        <input type='text' id='Telefon' name='Telefon' maxlength='20'>
                    </p>

                    <p class='lbl'>
                        <label for='Uwagi'>Uwagi</label><br>
                        <textarea id='Uwagi' name='Uwagi' maxlength='200'></textarea>
                    </p>

                </fieldset>

                <p>
                    <input type='submit' value='Zapisz'>
                    <input type='reset' value='Wyczyść pola'>
                </p>
            </form>
            ");
        } // Nawiązano połączenie

        require_once("../uklad_koniec.php");
    ?>
   
</body>
</html>