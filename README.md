# ricette

## Plugin usati

- https://github.com/daviddrysdale/mdbook-indexing

## Template

```
{{hi:Pomodoro}}

## Ingredienti

| Ingredienti                  | Ingredienti             |
| ---------------------------- | ----------------------- |
| **** -  | **** -  |
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

![](img/.jpg)
```

## Indici

`{{hi:Testo}}`

## CodeBuild docker test image

Base image:

```bash
git clone https://github.com/aws/aws-codebuild-docker-images.git
cd aws-codebuild-docker-images
cd ubuntu/standard/7.0
docker build -t aws/codebuild/standard:7.0 .
```

Local test image

```bash
docker build -t ricette-aws-build .
docker run --rm -ti -v $(pwd):/ricette -v /home/tony/tmp/book-out:/book-out ricette-aws-build build -d /book-out /ricette
```
