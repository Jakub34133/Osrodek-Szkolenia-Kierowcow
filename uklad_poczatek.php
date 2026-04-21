<header id="naglowek_zew">
    <div id="naglowek_wew">
        <h1>Ośrodek szkolenia kierowców</h1>
    </div>
</header>
<nav>
    <ul>
        <li><a href="/2025/P29_P1/P29_P1_serwis/index.php">O firmie</a></li>
        <li><a href="/2025/P29_P1/P29_P1_serwis/instruktorzy/instruktorzy_tabela.php">Instruktorzy</a></li>
        <li><a href="/2025/P29_P1/P29_P1_serwis/kursy/kurs_tabela.php">Kursy</a></li>
        <li><a href="/2025/P29_P1/P29_P1_serwis/kontakt.php">Kontakt</a></li>
    </ul>
    <ul id="loginBtn">
        <?php
            if((isset($_SESSION["zalogowany"]) && $_SESSION["zalogowany"] == false)
                || !isset($_SESSION["zalogowany"])
                || !isset($_SESSION["uzytkownik"]))
            {
                print("<li><a href='/2025/P29_P1/P29_P1_serwis/logowanie/logowanie_formularz.php'>Zaloguj</a></li>");
            }
            else
            {
                $login = $_SESSION["uzytkownik"];
                print("
                    <li><a href='/2025/P29_P1/P29_P1_serwis/logowanie/logowanie_koniec.php'>
                        &nbsp;Wyloguj
                        <strong style='font-size: small'>&lpar;$login&rpar;</strong>&nbsp;
                    </a></li>
                ");
            }
        ?>
        
    </ul>
</nav>
<main>
    <article>
        