# ricette

https://www.mkdocs.org/getting-started/

## Build locale

Si attiva il virtual env, si aggiornano le dipendenze e si lancia il server di sviluppo

```Bash
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

### Build da deployare

Il comando e' simile al server di sviluppo

```Bash
source .venv/bin/activate
pip install -r requirements.txt
mkdocs build
```

Il sito viene generato nella cartella `site`

### Docker image

Per lanciare il sito localmente con build di tutti i componenti:

```bash
docker build --load -t ricette .
docker run --rm -ti -p12345:12345 ricette
```

## Template

```
---
tags:
  - abc
---

![](../img/.webp)

## Ingredienti

| Ingredienti                  | Ingredienti             |
| ---------------------------- | ----------------------- |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |
| **** - | **** - |

## Procedimento

1. 

```

## Youtube

### Embedding di uno short di youtube

```html
<p style="text-align:center;">
<iframe width="315" height="560"
src="https://www.youtube.com/embed/<Shorts_video_code>"
title="YouTube video player"
frameborder="0"
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
allowfullscreen></iframe>
<p style="text-align:center;">
```

## Embedding di un video

```html
<p style="text-align:center;">
<iframe
  width="560"
  height="315"
  src="https://www.youtube.com/embed/<video_code>"
  title="YouTube video player"
  frameborder="0"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
  referrerpolicy="strict-origin-when-cross-origin"
  allowfullscreen
></iframe>
</p>
```
