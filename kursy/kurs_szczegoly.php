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
            print("<p class='msg error'>Nie można wyświetlić szczegółów kursu, 
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

            // Szczegóły Kursu
            $IdKurs = trim($_GET["IdKurs"]);

            $sql = 
            "EXECUTE dbo.Kurs_Szczegoly
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
            // $szczegolyKursu = sqlsrv_query($polaczenie, $komenda_sql);

            if(!sqlsrv_has_rows($komenda_sql)) {
                print("<p class='msg error'>Nie można wyświetlić szczegółów kursu, 
                ponieważ nie został on poprawnie wybrany.</p>");

                print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");

                require_once("../uklad_koniec.php");
                die();
            } else {
                $wiersz = sqlsrv_fetch_array($komenda_sql, SQLSRV_FETCH_ASSOC);

                $KategoriaSkrot = $wiersz["KategoriaSkrot"];
                $KategoriaNazwa = $wiersz["KategoriaNazwa"];
                $KursantDane = $wiersz["KursantDane"];
                $KursantMiejscowosc = $wiersz["KursantMiejscowosc"];
                $StanKursu = $wiersz["StanKursu"];
                $KursNazwa = $wiersz["KursNazwa"];
                $DataRozpoczecia = $wiersz["DataRozpoczecia"]->format('d.m.Y');
                $DataZakonczenia = $wiersz["DataZakonczenia"]->format('d.m.Y');
                $Cena = number_format($wiersz["Cena"], "2", ",", " ") . "zł";
                $TerminPlatnosci = $wiersz["TerminPlatnosci"]->format('d.m.Y');
                $Zaplacono = number_format($wiersz["Zaplacono"], "2", ",", " ") . "zł";

                // Zabezpieczenie walidacji html (znak mniejszosci)
                $KategoriaNazwa = htmlspecialchars($KategoriaNazwa, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');

                print(
                    "<h2>Szczegóły kursu numer $IdKurs</h2>

                    <p>Kursant: <strong>$KursantDane</strong> ($KursantMiejscowosc)</p>
                    <p>Kategoria: <strong>$KategoriaSkrot</strong> ($KategoriaNazwa)</p>
                    <p>Stan Kursu: <strong>$StanKursu</strong></p>
                    <p>Nazwa Kursu: <strong>$KursNazwa</strong></p>
                    <p>Data Rozpoczęcia: <strong>$DataRozpoczecia</strong></p>
                    <p>Data Zakończenia: <strong>$DataZakonczenia</strong></p>
                    <p>Cena Kursu: <strong>$Cena</strong></p>
                    <p>Termin Płatności: <strong>$TerminPlatnosci</strong></p>
                    <p>Zapłacono: <strong>$Zaplacono</strong></p>
                ");
            }



            // Tabela [Zajecia]
            print("<h2>Zajęcia</h2>");

            print(" 
            <table>
                <thead>
                    <tr>
                        <td>Pojazd</td>
                        <td>Instruktor</td>
                        <td>Rodzaj</td>
                        <td>Temat</td>
                        <td>Data Rozpoczęcia</td>
                        <td>Data Zakończenia</td>
                        
                    </tr>
                </thead>
                <tbody>
            ");
                        
            // Komenda SQL wyświetlająca dane Zajęć
            $sql_zajecia = 
            "EXECUTE dbo.KursZajecia_Szczegoly
            @Par_IdKurs = ?;";

            $dane_zajecia = array($IdKurs);
            $komenda_sql_zajecia = sqlsrv_prepare($polaczenie, $sql_zajecia, $dane_zajecia);

            if (!$komenda_sql_zajecia) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            }

            if (!sqlsrv_execute($komenda_sql_zajecia)) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            } 
            

            // Wykonanie polecenia SQL
            // $zbior_wierszy_zajec = sqlsrv_query($polaczenie, $komenda_sql_zajecia);

            if(!sqlsrv_has_rows($komenda_sql_zajecia))
            {
                // Jeżeli nie ma kursów
                print(
                    "<tr>
                        <td colspan='6'>Jeszcze nie ma żadnych Zajęć</td>
                    </tr>"
                );
            }
            else
            {
                // Jeżel są kursy
                while($wiersz = sqlsrv_fetch_array($komenda_sql_zajecia, SQLSRV_FETCH_ASSOC))
                {
                    $IdZajecia = $wiersz["IdZajecia"];
                    $Pojazd = $wiersz["Pojazd"];
                    $Instruktor = $wiersz["Instruktor"];
                    $Rodzaj = $wiersz["Rodzaj"];
                    $Temat = $wiersz["Temat"];
                    $DataZajecOd = $wiersz["DataZajecOd"]->format('d.m.Y H:i');
                    $DataZajecDo = $wiersz["DataZajecDo"]->format('d.m.Y H:i');
                    
                    print(
                    "<tr>
                        <td>$Pojazd</td>
                        <td>$Instruktor</td>
                        <td>$Rodzaj</td>
                        <td>$Temat</td>
                        <td>$DataZajecOd</td>
                        <td>$DataZajecDo</td>
                    </tr>"
                    );
                } // while(wiersz)

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                // if($zbior_wierszy_zajec != null)
                //     sqlsrv_free_stmt($zbior_wierszy_zajec);

            }
            
            print("     
                </tbody>    
            </table>"
            );

            print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");


            sqlsrv_close($polaczenie);
            
        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>