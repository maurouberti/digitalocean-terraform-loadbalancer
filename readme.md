![Static Badge](https://img.shields.io/badge/terraform-v1.8.0-%235c4ee5)
![Static Badge](https://img.shields.io/badge/digitaocean-2.0-blue)

# DigitalOcean

Terraform na DigitalOcean provisionando um loadbalancer com certificado https.

## Criar infra

```
ssh-keygen -t rsa -C "maurouberti@hotmail.com" -f ./tokens/tf-digitalocean-exemplo
terraform init
terraform apply
```

# Excluir infra

```
terraform destroy
rm -f ./tokens/tf-digitalocean-exemplo ./tokens/tf-digitalocean-exemplo.pub
```
