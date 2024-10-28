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

## Docker image

Per testare l'immagine docker di build:

```bash
docker build -t ricette-aws-build .

docker run --rm -ti -v $(pwd):/ricette -v $(pwd)/book-out: ricette-aws-build bash
```

### Build dell'immagine docker e push in ECR

```bash
docker build -t ricette-aws-build .
aws ecr get-login-password --region eu-south-1 | docker login --username AWS --password-stdin 820071945992.dkr.ecr.eu-south-1.amazonaws.com
docker tag ricette-aws-build:latest 820071945992.dkr.ecr.eu-south-1.amazonaws.com/ricette-builder:1.0
docker tag ricette-aws-build:latest 820071945992.dkr.ecr.eu-south-1.amazonaws.com/ricette-builder:latest
docker push 820071945992.dkr.ecr.eu-south-1.amazonaws.com/ricette-builder:1.0
docker push 820071945992.dkr.ecr.eu-south-1.amazonaws.com/ricette-builder:latest
```
