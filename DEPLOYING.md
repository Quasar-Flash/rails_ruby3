# Depĺoyment

## AWS EKS

* Log into the Hub from your local terminal:

```bash
aws ecr-public get-login-password --region us-east-1 --profile old-cluster | docker login --username AWS --password-stdin public.ecr.aws
```

* Build a new version of the image:

```bash
docker build -t rails_ruby3 .
```

* Upload to the hub:

```bash
docker tag rails_ruby3:latest public.ecr.aws/qflash/rails_ruby3:latest
docker tag rails_ruby3:latest public.ecr.aws/qflash/rails_ruby3:3.2.2
docker push public.ecr.aws/qflash/rails_ruby3:latest
docker push public.ecr.aws/qflash/rails_ruby3:3.2.2
```
