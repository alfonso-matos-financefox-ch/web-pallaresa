# web-pallaresa

Web oficial de la **Granja La Pallaresa**, xocolateria tradicional al carrer de Petritxol 11 de Barcelona.

- **En línia:** https://www.granjaixocolaterialapallaresa.com
- **Stack:** HTML estàtic pur + CSS, sense build, sense dependències. Hostat a GitHub Pages.
- **Idiomes:** Català (canònic) i castellà (amb sufix `-es`).

---

## Previsualitzar en local

Des de l'arrel del repo:

```bash
python3 -m http.server 8000
```

Obre http://localhost:8000/

Qualsevol canvi als fitxers es veu recarregant el navegador. No cal compilar res.

---

## Estructura

```
web-pallaresa/
├── index.html                 Portada (català)
├── es.html                    Portada (castellà)
├── styles.css                 Tot el CSS en un sol fitxer
├── CNAME                      Domini de GitHub Pages
├── robots.txt                 SEO
├── sitemap.xml                SEO — llista totes les URLs
├── toggle-anniversary.sh      Activa/desactiva la capa dels 80 anys
│
├── historia.html / -es.html   Història de la casa (long-read)
├── petritxol.html / -es.html  Història del carrer
├── 80-anys.html / -es.html    Campanya d'aniversari 2027 (actualment amagada)
│
├── [postres]                  10 pàgines CA + 10 pàgines ES, una per especialitat
│   ├── xocolata-xurros.html         · chocolate-churros-es.html
│   ├── suis-nata.html               · chocolate-suizo-nata-es.html
│   ├── melindros.html               · melindros-es.html
│   ├── ensaimades.html              · ensaimadas-es.html
│   ├── crema-catalana.html          · crema-catalana-es.html
│   ├── menjar-blanc.html            · menjar-blanc-es.html
│   ├── mato-pedralbes.html          · mato-pedralbes-es.html
│   ├── mato-de-montserrat.html      · mato-montserrat-es.html
│   ├── flam.html                    · flan-casero-es.html
│   └── arros-amb-llet.html          · arroz-con-leche-es.html
│
├── [redireccions]             21 fitxers curts que redirigeixen URLs antigues
│                              cap a les noves (p.ex. churros-barcelona.html
│                              redirigeix a /chocolate-churros-es.html).
│                              Importants per SEO — no esborrar.
│
├── blog/
│   ├── index.html             Llista d'entrades (català)
│   ├── es/index.html          Llista d'entrades (castellà)
│   ├── 2026/04/*.html         Entrades en català per mes
│   └── es/2026/04/*.html      Entrades en castellà per mes
│
├── assets/
│   └── svg/                   Crest 80 anys, favicon, fleuron decoratiu
│
└── [imatges].webp             Fotos de la casa, plats i façana (al root)
```

---

## Com afegir una entrada nova al blog

1. Crea un HTML nou a `blog/YYYY/MM/titol-del-post.html` (i el seu germà a `blog/es/YYYY/MM/`).
2. El més fàcil: copia una entrada existent com ara `blog/2026/04/petritxol-1292.html` i canvia el títol, la data, la imatge i el cos.
3. Afegeix l'entrada a les dues llistes: `blog/index.html` i `blog/es/index.html` (a la part superior).
4. Afegeix-la també a `sitemap.xml`.
5. Commit i push.

---

## Com afegir un plat nou

1. Copia una pàgina de postre existent (ex. `melindros.html`) i el seu parell `-es.html`.
2. Canvia nom, slug, text, imatge, enllaços de *Llegir també*.
3. Afegeix una targeta al `menu-grid` de `index.html` i `es.html`.
4. Afegeix les dues URLs a `sitemap.xml`.
5. Commit i push.

**Important:** mantenir sempre la parella CA + ES amb els `hreflang` creuats.

---

## Activar / desactivar la capa dels 80 anys

La web porta tota la maquinària de l'aniversari (franja, crest, badge del cantó, enllaç al menú) ja muntada, però desactivada via CSS fins al 2027.

**Per activar-ho l'1 de gener del 2027:**

```bash
./toggle-anniversary.sh on
git commit -am "Activa aniversari 80 anys"
git push
```

**Per desactivar-ho després del 2027:**

```bash
./toggle-anniversary.sh off
git commit -am "Desactiva aniversari 80 anys"
git push
```

Un sol commit. El que fa el script és canviar `body class="no-anniversary"` per `body class="anniversary"` a tots els HTML. La resta (estil, markup, pàgina dedicada) ja hi és.

---

## Desplegament

El desplegament és automàtic: qualsevol `git push origin main` fa que GitHub Pages reconstrueixi el site en uns 5 minuts. No hi ha cap pipeline de CI, cap build, cap token.

El fitxer `CNAME` apunta al domini `www.granjaixocolaterialapallaresa.com`.

---

## Convencions

- **Codi-font:** un sol fitxer `styles.css` amb el sistema de disseny complet. Les variables CSS (`:root`) defineixen la paleta i la tipografia — canviar-les afecta tot el site.
- **Fonts:** carregades via Google Fonts a dalt del CSS. Si afegeixes pes o família nova, actualitza aquella línia.
- **Imatges:** `.webp` al root per ara. Si alguna s'ha de substituir, mantenir el mateix nom o actualitzar totes les referències.
- **Capçaleres repetides:** cada pàgina té el seu `<head>`, top-bar, header i footer inline. És redundant però és el tradeoff de no tenir un generador. Si fas un canvi global (ex. nova entrada al menú), cal editar a totes les pàgines.

---

## Contacte

Granja La Pallaresa · Carrer de Petritxol, 11 · 08002 Barcelona
