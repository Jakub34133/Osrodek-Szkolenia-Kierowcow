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

        if(!isset($_GET["IdKurs"])
            || trim($_GET["IdKurs"] == "")
            || !is_numeric($_GET["IdKurs"]))
            {
                print("<p class='msg error'>Nie można edytować danych kursu, 
                ponieważ nie został on wybrany.</p>");

                print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");

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
                                
            $IdKurs = $_GET["IdKurs"];

            // Komenda SQL pobierająca dane kursu, który będzie edytowany
            $sql = 
            "EXECUTE dbo.Kurs_Wybierz 
             @Par_IdKurs = ?;";

            $dane = array($IdKurs);
            $komenda_sql = sqlsrv_prepare($polaczenie, $sql, $dane);
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

            // Pobieranie wierszy
            if(!sqlsrv_has_rows($komenda_sql))
            {
                // Jeżeli nie ma kursu o zadanym Id
                print("<p class='msg error'>W bazie nie ma kursu o podanym Id.</p>");

                print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");
            }
            else
            {
                // IdKategoria, IdKursant, IdStanKursu, Nazwa, DataRozpoczecia, DataZakonczenia, Cena, TerminPlatnosci, Zaplacono
                // Jeżel są instruktorzy
                while($wiersz = sqlsrv_fetch_array($komenda_sql, SQLSRV_FETCH_ASSOC))
                {
                    $Kurs_IdKategoria = $wiersz["IdKategoria"];
                    $Kurs_IdKursant = $wiersz["IdKursant"];
                    $Kurs_IdStanKursu = $wiersz["IdStanKursu"];
                    $Kurs_Nazwa = $wiersz["Nazwa"];
                    $Kurs_DataRozpoczecia = date_format($wiersz["DataRozpoczecia"], "Y-m-d");
                    $Kurs_DataZakonczenia = date_format($wiersz["DataZakonczenia"], "Y-m-d");
                    $Kurs_Cena = number_format($wiersz["Cena"], "2", ",", " ");
                    $Kurs_TerminPlatnosci = date_format($wiersz["TerminPlatnosci"], "Y-m-d");
                    $Kurs_Zaplacono = number_format($wiersz["Zaplacono"], "2", ",", " ");
                    
                } // while(wiersz)

                // Formularz Edytowania nowego Instruktora
                print("
                <form id='formKursEdytuj' method='get' action='kurs_edytuj_potwierdz.php'>
                    <h2>Edytuj Kurs</h2>
                    <fieldset>
                        <legend>Dane kursu</legend>

                        <p class='lbl'>
                            <label for='IdKurs'>Identyfikator*</label>
                            <input type='text' id='IdKurs' name='IdKurs' maxlength='10' value='$IdKurs' readonly>
                        </p>

                        <p class='lbl'>
                            <label for='IdKursant'>Kursant*</label>
                            <select id='IdKursant' name='IdKursant'>
                                <option value='0'>...Nie wybrano...</option>");

                // Wybór Kursantów 
                $sql_kursant = 
                "EXECUTE dbo.Kursant_PokazSlownik;";

                $komenda_sql_kursant = sqlsrv_prepare($polaczenie, $sql_kursant);

                if (!$komenda_sql_kursant) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                }

                if (!sqlsrv_execute($komenda_sql_kursant)) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                }   
                
                // Wykonanie polecenia SQL
                // $zbior_wierszy_kursant = sqlsrv_query($polaczenie, $komenda_sql_kursant);

                // Pobranie wierszy
                while($wiersz_kursant = sqlsrv_fetch_array($komenda_sql_kursant, SQLSRV_FETCH_ASSOC))
                {
                    $IdKursant = $wiersz_kursant["IdKursant"];
                    $KursantDane = $wiersz_kursant["KursantDane"];
                    
                    if($IdKursant == $Kurs_IdKursant) {
                        print(
                                "<option value='$IdKursant' selected>$KursantDane</option>"
                        );
                    } else {
                        print(
                                "<option value='$IdKursant'>$KursantDane</option>"
                        );
                    }

                }
                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy_kursant != null)
                //     sqlsrv_free_stmt($zbior_wierszy_kursant);
                
        
                print(
                            "</select>
                        </p>");

                print("
                <p class='lbl'>
                            <label for='IdKategoria'>Kategoria*</label>
                            <select id='IdKategoria' name='IdKategoria'>
                                <option value='0'>...Nie wybrano...</option>");

                // Wybór Kategorii
                $sql_kategoria = 
                "EXECUTE dbo.Kategoria_PokazSlownik;";

                $komenda_sql_kategoria = sqlsrv_prepare($polaczenie, $sql_kategoria);

                if (!$komenda_sql_kategoria) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                }

                if (!sqlsrv_execute($komenda_sql_kategoria)) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                } 
                
                // Wykonanie polecenia SQL
                // $zbior_wierszy_kategoria = sqlsrv_query($polaczenie, $komenda_sql_kategoria);

                while($wiersz_kategoria = sqlsrv_fetch_array($komenda_sql_kategoria, SQLSRV_FETCH_ASSOC))
                {
                    $IdKategoria = $wiersz_kategoria["IdKategoria"];
                    $Skrot = $wiersz_kategoria["Skrot"];
                    
                    if($IdKategoria == $Kurs_IdKategoria) {
                        print(
                                "<option value='$IdKategoria' selected>$Skrot</option>"
                        );
                    } else {
                        print(
                                "<option value='$IdKategoria'>$Skrot</option>"
                        );
                    }

                }
                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy_kategoria != null)
                //     sqlsrv_free_stmt($zbior_wierszy_kategoria);

                print(
                            "</select>
                        </p>");

                print("
                <p class='lbl'>
                            <label for='IdStanKursu'>Stan Kursu*</label>
                            <select id='IdStanKursu' name='IdStanKursu'>
                                <option value='0'>...Nie wybrano...</option>");

                // Wybór Stanu Kursu
                $sql_stanKursu = 
                "EXECUTE dbo.StanKursu_PokazSlownik;";

                $komenda_sql_stanKursu = sqlsrv_prepare($polaczenie, $sql_stanKursu);

                if (!$komenda_sql_stanKursu) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                }

                if (!sqlsrv_execute($komenda_sql_stanKursu)) {
                    print(print_r(sqlsrv_errors(), true));
                    require_once("../uklad_koniec.php");
                    die();
                } 
                
                // Wykonanie polecenia SQL
                // $zbior_wierszy_stanKursu = sqlsrv_query($polaczenie, $komenda_sql_stanKursu);

                while($wiersz_stanKursu = sqlsrv_fetch_array($komenda_sql_stanKursu, SQLSRV_FETCH_ASSOC))
                {
                    $IdStanKursu = $wiersz_stanKursu["IdStanKursu"];
                    $Nazwa = $wiersz_stanKursu["Nazwa"];
                    
                    if($IdStanKursu == $Kurs_IdStanKursu) {
                        print(
                            "<option value='$IdStanKursu' selected>$Nazwa</option>"
                        );
                    } else {
                        print(
                            "<option value='$IdStanKursu'>$Nazwa</option>"
                        );
                    }
                    
                }
                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy_stanKursu != null)
                //     sqlsrv_free_stmt($zbior_wierszy_stanKursu);
                
                print(
                            "</select>
                        </p>");

                print("
                        <p class='lbl'>
                            <label for='KursNazwa'>Nazwa Kursu*</label>
                            <input type='text' id='KursNazwa' name='KursNazwa' maxlength='50' value='$Kurs_Nazwa'>
                        </p>

                        <p class='lbl'>
                            <label for='DataRozpoczecia'>Data Rozpoczęcia*</label>
                            <input type='date' id='DataRozpoczecia' name='DataRozpoczecia' value='$Kurs_DataRozpoczecia'>
                        </p>

                        <p class='lbl'>
                            <label for='DataZakonczenia'>Data Zakończenia*</label>
                            <input type='date' id='DataZakonczenia' name='DataZakonczenia' value='$Kurs_DataZakonczenia'>
                        </p>

                        <p class='lbl'>
                            <label for='Cena'>Cena*</label>
                            <input type='text' id='Cena' name='Cena' value='$Kurs_Cena'>
                        </p>

                        <p class='lbl'>
                            <label for='TerminPlatnosci'>Termin Płatności*</label>
                            <input type='date' id='TerminPlatnosci' name='TerminPlatnosci' value='$Kurs_TerminPlatnosci'>
                        </p>

                        <p class='lbl'>
                            <label for='Zaplacono'>Zapłacono*</label>
                            <input type='text' id='Zaplacono' name='Zaplacono' value='$Kurs_Zaplacono'>
                        </p>

                        <p class='lbl'>
                            <label for='nowy'>Zapisz jako nowy*</label>
                            <input type='checkbox' id='nowy' name='nowy'>
                        </p>

                        
                    </fieldset>

                    <p>
                        <input type='submit' value='Zapisz'>
                        <input type='reset' value='Przywróć dane'>
                        <a class='btn default' href='kurs_tabela.php'>Anuluj</a>

                    </p>
                </form>
                ");

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy != null)
                //     sqlsrv_free_stmt($zbior_wierszy);

            }

            sqlsrv_close($polaczenie);

            
        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>