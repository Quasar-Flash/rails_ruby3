# Depĺoyment

## AWS EKS

* Log into the Hub from your local terminal:

```bash
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
```

* Build a new version of the image:

```bash
docker build -t rails_ruby3.1 .
```

* Upload to the hub:

```bash
docker tag rails_ruby3.1:latest public.ecr.aws/qflash/rails_ruby3.1:latest
docker tag rails_ruby3.1:latest public.ecr.aws/qflash/rails_ruby3.1:1.2.0
docker push public.ecr.aws/qflash/rails_ruby3.1:latest
docker push public.ecr.aws/qflash/rails_ruby3.1:1.2.0
```
