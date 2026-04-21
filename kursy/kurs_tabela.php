<?php
    session_name("PSIN");
    session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Ośrodek szkolenia kierowców</title>
    <meta name="keywords" content="szkolenia, kursy, prawo jazdy, licencja, jazdy, egzaminy">
    <meta name="description" content="Strona utworzona w ramach przedmiotu PSIN">
    <meta name="author" content="Jakub J.">

    <link rel="stylesheet" href="../css/uklad.css" type="text/css">
    <link rel="stylesheet" href="css/styl.css" type="text/css">
    <script src="js/skrypt.js"></script>
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
            
            print("<h2>Kursy</h2>");

            print(" 
            <table>
                <thead>
                    <tr>
                        <td>Identyfikator</td>
                        <td>Dane Kursanta</td>
                        <td>Stan Kursu</td>
                        <td>Kategoria</td>
                        <td>Nazwa Kursu</td>
                        <td>Data Rozpoczęcia</td>
                        <td>Data Zakończenia</td>
                        <td>Cena</td>
                        <td>Termin Płatności</td>
                        <td>Zapłacono</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
            ");
                        
            // Komenda SQL wyświetlająca dane w domyślnej kolejności
            $sql = 
            "EXECUTE dbo.Kurs_Pokaz;";
            
            $komenda_sql = sqlsrv_prepare($polaczenie, $sql);

            if (!$komenda_sql) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            }

            if (!sqlsrv_execute($komenda_sql)) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            } 
            
            // Wykonanie polecenia SQL
            // $zbior_wierszy = sqlsrv_query($polaczenie, $komenda_sql);

            if(!sqlsrv_has_rows($komenda_sql))
            {
                // Jeżeli nie ma kursów
                print(
                    "<tr>
                        <td colspan='12'>Jeszcze nie ma żadnych Kursów</td>
                    </tr>"
                );
            }
            else
            {
                // Jeżel są kursy
                while($wiersz = sqlsrv_fetch_array($komenda_sql, SQLSRV_FETCH_ASSOC))
                {
                    $IdKurs = $wiersz["IdKurs"];
                    $KursantDane = $wiersz["KursantDane"]; 
                    $StanKursuNazwa = $wiersz["StanKursuNazwa"]; 
                    $KategoriaSkrot = $wiersz["KategoriaSkrot"]; 
                    $KursNazwa = $wiersz["KursNazwa"]; 
                    $DataRozpoczecia = $wiersz["DataRozpoczecia"]->format('d.m.Y');
                    $DataZakonczenia = $wiersz["DataZakonczenia"]->format('d.m.Y');
                    $Cena = number_format($wiersz["Cena"], "2", ",", " ") . "zł";
                    $TerminPlatnosci = $wiersz["TerminPlatnosci"]->format('d.m.Y');
                    $Zaplacono = number_format($wiersz["Zaplacono"], "2", ",", " ") . "zł";
                    
                    print(
                    "<tr>
                        <td>$IdKurs</td>
                        <td>$KursantDane</td>
                        <td>$StanKursuNazwa</td>
                        <td>$KategoriaSkrot</td>
                        <td>$KursNazwa</td>
                        <td>$DataRozpoczecia</td>
                        <td>$DataZakonczenia</td>
                        <td>$Cena</td>
                        <td>$TerminPlatnosci</td>
                        <td>$Zaplacono</td>
                        <td><a href='kurs_szczegoly.php?IdKurs=$IdKurs' class='btn details'>Szczegóły</a></td>
                        <td><a href='kurs_edytuj.php?IdKurs=$IdKurs' class='btn update'>Edytuj</a></td>
                        <td><a href='kurs_usun.php?IdKurs=$IdKurs' class='btn delete'>Usuń</a></td>
                    </tr>"
                    );
                } // while(wiersz)

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy != null)
                //     sqlsrv_free_stmt($zbior_wierszy);

            }
            
            print("     
                </tbody>    
            </table>"
            );


            
            // Formularz Dodawania nowego kursu
            print("<br><br><input type='button' value='+ Nowy Kurs' onclick='kurs_dodaj()' id='przyciskDodaj'>");

            print("
            <form id='formKursDodaj' method='get' action='kurs_dodaj.php'>
                <h2>Nowy Kurs</h2>
                <fieldset>
                    <legend>Dane kursu</legend>

                    <p class='lbl'>
                        <label for='IdKurs'>Identyfikator*</label>
                        <input type='text' id='IdKurs' name='IdKurs' maxlength='10'>
                    </p>

                    <p class='lbl'>
                        <label for='IdKursant'>Kursant*</label>
                        <select id='IdKursant' name='IdKursant'>
                            <option value='0'>...Nie wybrano...</option>");

            // Wybór Kursantów 
            $komenda_sql_kursant = 
            "EXECUTE dbo.Kursant_PokazSlownik;";
            
            // Wykonanie polecenia SQL
            $zbior_wierszy_kursant = sqlsrv_query($polaczenie, $komenda_sql_kursant);

            while($wiersz_kursant = sqlsrv_fetch_array($zbior_wierszy_kursant, SQLSRV_FETCH_ASSOC))
            {
                $IdKursant = $wiersz_kursant["IdKursant"];
                $KursantDane2 = $wiersz_kursant["KursantDane"];
                
                print(
                        "<option value='$IdKursant'>$KursantDane2</option>"
                );
            }
            // Zwolnienie pamięci zarezerwowanej na wynik zapytania
            if($zbior_wierszy_kursant != null)
                sqlsrv_free_stmt($zbior_wierszy_kursant);
            
    
            print(
                        "</select>
                    </p>");

            print("
            <p class='lbl'>
                        <label for='IdKategoria'>Kategoria*</label>
                        <select id='IdKategoria' name='IdKategoria'>
                            <option value='0'>...Nie wybrano...</option>");

            // Wybór Kategorii
            $komenda_sql_kategoria = 
            "EXECUTE dbo.Kategoria_PokazSlownik;";
            
            // Wykonanie polecenia SQL
            $zbior_wierszy_kategoria = sqlsrv_query($polaczenie, $komenda_sql_kategoria);

            while($wiersz_kategoria = sqlsrv_fetch_array($zbior_wierszy_kategoria, SQLSRV_FETCH_ASSOC))
            {
                $IdKategoria = $wiersz_kategoria["IdKategoria"];
                $Skrot = $wiersz_kategoria["Skrot"];
                
                print(
                        "<option value='$IdKategoria'>$Skrot</option>"
                );
            }
            // Zwolnienie pamięci zarezerwowanej na wynik zapytania
            if($zbior_wierszy_kategoria != null)
                sqlsrv_free_stmt($zbior_wierszy_kategoria);

            print(
                        "</select>
                    </p>");

            print("
            <p class='lbl'>
                        <label for='IdStanKursu'>Stan Kursu*</label>
                        <select id='IdStanKursu' name='IdStanKursu'>
                            <option value='0'>...Nie wybrano...</option>");

            // Wybór Stanu Kursu
            $komenda_sql_stanKursu = 
            "EXECUTE dbo.StanKursu_PokazSlownik;";
            
            // Wykonanie polecenia SQL
            $zbior_wierszy_stanKursu = sqlsrv_query($polaczenie, $komenda_sql_stanKursu);

            while($wiersz_stanKursu = sqlsrv_fetch_array($zbior_wierszy_stanKursu, SQLSRV_FETCH_ASSOC))
            {
                $IdStanKursu = $wiersz_stanKursu["IdStanKursu"];
                $Nazwa = $wiersz_stanKursu["Nazwa"];
                
                print(
                        "<option value='$IdStanKursu'>$Nazwa</option>"
                );
            }
            // Zwolnienie pamięci zarezerwowanej na wynik zapytania
            if($zbior_wierszy_stanKursu != null)
                sqlsrv_free_stmt($zbior_wierszy_stanKursu);
            
            print(
                        "</select>
                    </p>");

            print("
                    <p class='lbl'>
                        <label for='KursNazwa'>Nazwa Kursu*</label>
                        <input type='text' id='KursNazwa' name='KursNazwa' maxlength='50'>
                    </p>

                    <p class='lbl'>
                        <label for='DataRozpoczecia'>Data Rozpoczęcia*</label>
                        <input type='date' id='DataRozpoczecia' name='DataRozpoczecia'>
                    </p>

                    <p class='lbl'>
                        <label for='DataZakonczenia'>Data Zakończenia*</label>
                        <input type='date' id='DataZakonczenia' name='DataZakonczenia'>
                    </p>

                    <p class='lbl'>
                        <label for='Cena'>Cena*</label>
                        <input type='text' id='Cena' name='Cena'>
                    </p>

                    <p class='lbl'>
                        <label for='TerminPlatnosci'>Termin Płatności*</label>
                        <input type='date' id='TerminPlatnosci' name='TerminPlatnosci'>
                    </p>

                    <p class='lbl'>
                        <label for='Zaplacono'>Zapłacono*</label>
                        <input type='text' id='Zaplacono' name='Zaplacono'>
                    </p>

                    
                </fieldset>

                <p>
                    <input type='submit' value='Zapisz'>
                    <input type='reset' value='Wyczyść pola'>
                </p>
            </form>
            ");

            sqlsrv_close($polaczenie);
            
        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>