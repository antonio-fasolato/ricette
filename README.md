# ricette

## Plugin usati

- https://github.com/daviddrysdale/mdbook-indexing

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

## AWS

### ElasticContainerRegistry

Le permission policies del registry devono essere impostate come segue:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::820071945992:root"
      },
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ]
    }
  ]
}
```

![](src/img/01.webp)

### CodeBuild

La policy del progetto di compilazione deve avere una policy collegata fatta come segue (ovviamente l'ARN dipende dal repo ECR):

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:BatchGetImage",
                "ecr:GetDownloadUrlForLayer"
            ],
            "Resource": [
                "arn:aws:ecr:eu-south-1:820071945992:repository/ricette-builder"
            ]
        },
        {
            "Sid": "Statement2",
            "Action": [
                "codecommit:GitPull"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
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



```bash
mdbook build
npx workbox injectManifest workbox-config.js
npx quick-serve book
```