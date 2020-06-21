#TODO

Java, nodejs, javascript, en een paar packets

## pre-requirements

install gcloud, terraform and ansible for your laptop (or you could try to convince me to make a docker image with these tools inside of it)

## How to create an account.json

```
gcloud iam service-accounts create terraform  
gcloud projects list  
gcloud projects add-iam-policy-binding kube-fun --member --member "serviceAccount:terraform@kube-fun.iam.gserviceaccount.com" --role "roles/owner"  
gcloud projects add-iam-policy-binding kube-fun --member "serviceAccount:terraform@kube-fun.iam.gserviceaccount.com" --role "roles/owner"  
gcloud projects add-iam-policy-binding kube-fun --member "serviceAccount:terraform@kube-fun-271414.iam.gserviceaccount.com" --role "roles/owner"  
gcloud projects add-iam-policy-binding kube-fun-271414 --member "serviceAccount:terraform@kube-fun-271414.iam.gserviceaccount.com" --role "roles/owner"  
gcloud iam service-accounts keys create terraform_gcp_account.json --iam-account terraform@kube-fun-271414.iam.gserviceaccount.com   
cat terraform_gcp_account.json  

```

## check if all the variables are correct 

## run terraform

```
terraform init  #only first time
terraform plan
terraform apply
# to destroy your server
terraform destroy -auto-approve
```

## if you want to rerun ansible-playbook

You should see this command when the terraform script is running

```
ansible-playbook -i some_ip main.yml
```

