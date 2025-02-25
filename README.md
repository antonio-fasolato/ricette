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
docker build --load -t ricette .

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


## Indici

`{{hi:Testo}}`



---

https://www.mkdocs.org/getting-started/

python3 -m venv .venv
source .venv/bin/activate
pip install mkdocs
mkdocs new .

mkdocs serve
mkdocs build
