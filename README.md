# ricette

## Plugin usati

- https://github.com/daviddrysdale/mdbook-indexing
- https://developer.chrome.com/docs/workbox
- https://www.npmjs.com/package/quick-serve

## Build locale

Il processo di build prevede la generazione dei file html con mdbook, l'aggiunta delle librerie per la PWA e per comodita' l'avvio di un server htttp locale per testarlo, in pratica:

```bash
mdbook build
npx workbox injectManifest workbox-config.js
npx quick-serve book
```

### Docker image

Per lanciare il sito localmente con build di tutti i componenti:

```bash
docker build -t ricette .

docker run --rm -ti -v $(pwd):/ricette -p12345:12345 ricette
```

## Template

```
![](img/.webp)

{{hi:Pomodoro}}

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

## Embedding di uno short di youtube

```html
<iframe width="315" height="560"
src="https://www.youtube.com/embed/<Shorts_video_code>"
title="YouTube video player"
frameborder="0"
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
allowfullscreen></iframe>
```

## Indici

`{{hi:Testo}}`
