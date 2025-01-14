# ricette

## Plugin usati

- https://github.com/daviddrysdale/mdbook-indexing

## Build locale

Il processo di build prevede la generazione dei file html con mdbook, in pratica:

```bash
mdbook build -o
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

## Youtube

### Embedding di uno short di youtube

```html
<iframe width="315" height="560"
src="https://www.youtube.com/embed/<Shorts_video_code>"
title="YouTube video player"
frameborder="0"
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
allowfullscreen></iframe>
```

## Embedding di un video

```html
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
```


## Indici

`{{hi:Testo}}`
