# TRM Memory (Codesphere Website)

Tämä tiedosto tallentaa kaikki TRM 10x -sessionien opit ja päätökset. Jokainen sessio dokumentoidaan seuraavassa muodossa:

---

## Session: 2025-12-18 – PNG-käyntikortin design (business-card.png)

**Ongelma**: Luo 1050×600 PNG-käyntikortti Codesphere-teeman mukaisesti. Vasen puoli: iso logo + abstrakti syaani-glow/sheeni (ei avaruus/tähtitausta). Oikea puoli: selkeät yhteystiedot (Timo/Matti) premium-tyylillä.

**Ratkaisu**:
- Hyödynnettiin `business-card.html` -palettia ja typografiaa.
- Toteutettu Pillow-kirjastolla (Python).
- Vasen paneeli: tumma tausta + kaksi radiaalista glowta (accent + primary) + diagonaalinen sheen.
- Logo: keskitetty, syaani-outer-glow.
- Oikea paneeli: tumma alue, selkeä teksti-hierarkia (BRAND → Yhteystiedot → henkilöt → footer).
- Aksentti: syaani (`#00FFFF`), tausta: tumma (`#0A0F1A`).

**Opit**:
- **Ei vaaleita taustoja** – koko PNG on tumma; välttää "valkoiselta paperilta" -fiilistä.
- **Radiaalinen glow** – toimii paremmin kuin tasainen gradient.
- **Typografiahierarkia** – tärkeintä ensin (BRAND → nimi → titteli → yhteystieto).
- **Kontrastisäännöt** – tekstin tulee olla vähintään AA-tasolla (WCAG) tummaa taustaa vasten.
- **Rounded corners** – card-frame tulee maskia samalla pyöristyksellä kuin live-kortissa.

**Hyväksymiskriteerit täyttyneet**:
- ✅ PNG näyttää tummalta ja premium-tyylisenä.
- ✅ Vasen osa: logo + abstrakti glow, ei avaruutta.
- ✅ Oikea osa: teksti selkeä ja brändin mukainen.
- ✅ Aksentti on syaani, ei vihreä.

---



---

## Session: 2025-12-18 – Demo: Testaa TRM-järjestelmän toimivuus

**Ongelma**: Demo: Testaa TRM-järjestelmän toimivuus

**Ratkaisu**: TRM-järjestelmä toimii täysin: Copilot-ohjeet, muistit ja automaatio integroitu. Hyväksymiskriteerit täyttyneet.

**Opit**:

- **Kierros 1**: TRM-järjestelmä asennettu onnistuneesti. Copilot-ohjeet, muistitiedostot ja automaatioskriptit toimivat.

**Hyväksymiskriteerit täyttyneet**:
- ✅ (Täytä hyväksymiskriteerit tähän)

---

## Session: 2025-12-18 – Mobiilisommittelun korjaus (business-card.html)

**Ongelma**: Selain näkyy mobiilissa, mutta `.browser`-elementti ei hyödynnä koko vasemman alueen korkeutta. Sommittelu on "kasaan painunut" – paljon tyhjää tilaa ylä-/alapuolella.

**Ratkaisu**: 
- Muutettu `.inner` grid-rows: `auto auto` → `1fr 1fr` (mobile/tablet)
- Lisätty `.left { display: flex; flex-direction: column; }`
- Lisätty `.browser { flex: 1; min-height: 0; }` → venyy täyttämään tilan
- Päivitetty kaikki media queryt: mobile (<720px), tablet (721-900px), landscape (901-1280px, <900px)

**Opit**:

- **Kierros 1-2 (THINK)**: Grid-rows `auto` vs `1fr` – `auto` ei veny, `1fr` jakaa tilan tasaisesti
- **Kierros 3 (REFINE)**: Mobile (<720px) – `.inner { grid-rows: 1fr 1fr }` + `.left { flex }` + `.browser { flex: 1 }`
- **Kierros 4 (REFINE)**: Tablet (721-900px) – sama flex-layout kuin mobilessa
- **Kierros 5 (REFINE)**: Landscape-tilat (901-1280px, <900px) – flex-layout kaikille
- **Kierros 6 (MASTER)**: UI Smoke Test PASS, testattu kaikki breakpointit

**Tärkeät opit**:
- **`min-height: 0`** on kriittinen flexbox/grid-lapsille → estää sisällön "ylivuodon"
- **Flex-container + `flex: 1` child** → venyy täyttämään jäljellä olevan tilan
- **Testaa AINA kaikki breakpointit** (mobile, tablet, landscape) → johdonmukaisuus

**Hyväksymiskriteerit täyttyneet**:
- ✅ Selain hyödyntää koko vasemman alueen korkeuden kaikilla laitteilla
- ✅ Ei tyhjää tilaa mobiilissa/tabletilla
- ✅ Landscape-tilat toimivat oikein
- ✅ UI Smoke Test: PASS



---

## Session: 2025-12-18 – TRM smoke test (local)

**Ongelma**: TRM smoke test (local)

**Ratkaisu**: TRM smoke test complete

**Opit**:

- **Kierros 1**: Smoke test round 1 insights

**Hyväksymiskriteerit täyttyneet**:
- ✅ (Täytä hyväksymiskriteerit tähän)



---

## Session: 2025-12-18 – TRM automation verification

**Ongelma**: TRM automation verification

**Ratkaisu**: Automation verification complete

**Opit**:

- **Kierros 1**: Automation: round 1

**Hyväksymiskriteerit täyttyneet**:
- ✅ (Täytä hyväksymiskriteerit tähän)



---

## Session: 2025-12-19 – Lisää Codesphere Scan™ + positiointi sivulle (index.html)

**Ongelma**: Lisää Codesphere Scan™ + positiointi sivulle (index.html)

**Ratkaisu**: Lisätty Codesphere Scan™-osio ja 1-sivun positiointi-osio (FI+EN i18n), CTA:t ohjaavat yhteystietoihin ja mailto-subjectit päivitetty; ei uusia sivuja/teemoja.

**Opit**:

- **Kierros 1**: Scope: Scan™ + 1-sivuinen positiointi osaksi index.html. Ei uusia sivuja/teemoja/värejä; käytetään olemassa olevia .section-header + .services-grid + .service-card. CTA ohjaa #yhteystiedot/mailto.
- **Kierros 2**: Sijoittelu: Scan-osio omana sectionina #scan heti #aloitus jälkeen (luonteva 'ensimmäinen askel'), ennen #kumppanuus. Ei uutta nav-linkkiä; CTA painikkeet ohjaa #yhteystiedot ja mailto-subjectit 'Codesphere Scan'.
- **Kierros 3**: Sisältörajat lukittu: Scan (kenelle, sisältää/ei sisällä, lopputulos, kesto, kiinteä hintahaarukka) + Positiointi (mikä Codesphere on, kenelle/ei kenelle, erot muihin 'myy toteutusta' vs 'myy ymmärrystä', palvelumalli: Scan → rajattu rakentaminen → kevyt kumppanuus).
- **Kierros 4**: UI: Lisätään positiointi omana sectionina (#positiointi) Scanin jälkeen. Käytetään nykyisiä primitivejä (.section-header + .services-grid + .service-card + .scan-list). Ei uusia värejä/komponentteja, vain sisältö ja kevyt highlight-box palvelumallille.
- **Kierros 5**: Copy: Scan + positiointi korostaa 'ei myyntikikka', 'rajattu', 'raportti jää' ja 'omistajuus asiakkaalla'. Positiointi tiivistetty 3 korttiin (mikä/kenelle/miten erotumme+palvelumalli) jotta sivu pysyy skaalattavana.
- **Kierros 6**: I18N: Lisättiin pos*-avaimet FI/EN (otsikot, kuvaukset, bulletit, palvelumalli). Päivitettiin myös CTA:n oletus-href ja teksti vastaamaan Scan-subjectia jotta initial render ei näytä vanhaa 'Rajattu kartoitus'.
- **Kierros 7**: Responsiivisuus: Uudet osiot hyödyntää samaa services-grid auto-fit -layoutia (desktop 3 korttia, mobile 1). Ajettu node tools/test_mobile.js: hero/mobile näkyvyys OK; Scan/positiointi on listapohjaista eikä vaadi uusia breakpointteja.
- **Kierros 8**: Saavutettavuus: Otsikkohierarkia säilyy (section h2 + card h3). Listat ovat oikeita `ul`-listoja. CTA-teksti selkeä. ™ käytetty vain nimessä, ei vaikuta ariaan; ikonit ovat emoji/tekstinä eikä vaadi alt-tekstiä.
- **Kierros 9**: QA: ankkurit #scan/#positiointi/#yhteystiedot ok, CTA mailto-subjectit ok; mobiilitesti (portrait+landscape) aiemmin OK.
- **Kierros 10**: Julkaisuvalmis: sulje sessio, aja trm_check idle-tilassa, commit+push (index.html + trm/memory.md).

**Hyväksymiskriteerit täyttyneet**:

- ✅ `index.html` sisältää uudet `#scan` ja `#positiointi` -osiot
- ✅ FI/EN i18n avaimet lisätty ja CTA-hrefit päivitetty oikein
- ✅ Ankkurit `#scan/#positiointi/#yhteystiedot` ja mailto-subjectit tarkistettu
- ✅ `tools/trm_check.py` läpäisee (sessio suljettu, idle)

## (Lisää tulevat sessionit tänne)

**Muistilista**:

- Tallenna jokaisen 10-kierroksen session lopputulos.
- Päivitä `trm/state.json` -tila ennen ja jälkeen session.
- Hyödynnä aikaisempia oppeja seuraavissa tehtävissä.

