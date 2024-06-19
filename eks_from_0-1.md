## Install kubectl v1.29.0
```
curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
```

The logs:
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    449      0 --:--:-- --:--:-- --:--:--   448
100 47.4M  100 47.4M    0     0   950k      0  0:00:51  0:00:51 --:--:--  951k
```

Install it.
```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Check.
```
kubectl version
```

The output:
```
Client Version: v1.29.0
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

## Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install
```

Check.
```
aws --version
```

The output:
```
aws-cli/2.16.11 Python/3.11.8 Linux/5.8.0-43-generic exe/x86_64.ubuntu.20
```

## Install eksctl
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin
```

Check.
```
eksctl version
```

The output:
```
0.183.0
```

## Create a EKS cluster

We will need to configure our AWS first.
```
aws configure

AWS Access Key ID [None]: <your-aws-access-id>
AWS Secret Access Key [None]: <your-aws-access-key>
Default region name [None]: us-east-2
Default output format [None]: json
```

Check.
```
aws configure list
```

```
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************4ID4 shared-credentials-file    
secret_key     ****************vuBu shared-credentials-file    
    region                us-east-2      config-file    ~/.aws/config
```

Set the AWS session token.
```
aws configure set aws_session_token <your-session-token>
```

```
eksctl create cluster --name my-cluster --nodes=2 --version=1.29 --instance-types=t2.micro --region=us-east-2
```

The output logs:
```
2024-06-19 13:43:31 [ℹ]  eksctl version 0.183.0
2024-06-19 13:43:31 [ℹ]  using region us-east-2
2024-06-19 13:43:32 [ℹ]  setting availability zones to [us-east-2a us-east-2c us-east-2b]
2024-06-19 13:43:32 [ℹ]  subnets for us-east-2a - public:192.168.0.0/19 private:192.168.96.0/19
2024-06-19 13:43:32 [ℹ]  subnets for us-east-2c - public:192.168.32.0/19 private:192.168.128.0/19
2024-06-19 13:43:32 [ℹ]  subnets for us-east-2b - public:192.168.64.0/19 private:192.168.160.0/19
2024-06-19 13:43:32 [ℹ]  nodegroup "ng-26aa0078" will use "" [AmazonLinux2/1.29]
2024-06-19 13:43:32 [ℹ]  using Kubernetes version 1.29
2024-06-19 13:43:32 [ℹ]  creating EKS cluster "my-cluster" in "us-east-2" region with managed nodes
2024-06-19 13:43:32 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2024-06-19 13:43:32 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=my-cluster'
2024-06-19 13:43:32 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "my-cluster" in "us-east-2"
2024-06-19 13:43:32 [ℹ]  CloudWatch logging will not be enabled for cluster "my-cluster" in "us-east-2"
2024-06-19 13:43:32 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-2 --cluster=my-cluster'
2024-06-19 13:43:32 [ℹ]  
2 sequential tasks: { create cluster control plane "my-cluster", 
    2 sequential sub-tasks: { 
        wait for control plane to become ready,
        create managed nodegroup "ng-26aa0078",
    } 
}
2024-06-19 13:43:32 [ℹ]  building cluster stack "eksctl-my-cluster-cluster"
2024-06-19 13:43:33 [ℹ]  deploying stack "eksctl-my-cluster-cluster"
2024-06-19 13:44:03 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:44:34 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:45:35 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:46:36 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:47:37 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:48:37 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:49:38 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:50:39 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:51:40 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:52:41 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-cluster"
2024-06-19 13:54:47 [ℹ]  building managed nodegroup stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:54:48 [ℹ]  deploying stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:54:48 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:55:19 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:56:01 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:57:06 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:58:04 [ℹ]  waiting for CloudFormation stack "eksctl-my-cluster-nodegroup-ng-26aa0078"
2024-06-19 13:58:04 [ℹ]  waiting for the control plane to become ready
2024-06-19 13:58:04 [✔]  saved kubeconfig as "/home/openvino/.kube/config"
2024-06-19 13:58:04 [ℹ]  no tasks
2024-06-19 13:58:04 [✔]  all EKS cluster resources for "my-cluster" have been created
2024-06-19 13:58:04 [✔]  created 0 nodegroup(s) in cluster "my-cluster"
2024-06-19 13:58:05 [ℹ]  nodegroup "ng-26aa0078" has 2 node(s)
2024-06-19 13:58:05 [ℹ]  node "ip-192-168-16-83.us-east-2.compute.internal" is ready
2024-06-19 13:58:05 [ℹ]  node "ip-192-168-83-230.us-east-2.compute.internal" is ready
2024-06-19 13:58:05 [ℹ]  waiting for at least 2 node(s) to become ready in "ng-26aa0078"
2024-06-19 13:58:05 [ℹ]  nodegroup "ng-26aa0078" has 2 node(s)
2024-06-19 13:58:05 [ℹ]  node "ip-192-168-16-83.us-east-2.compute.internal" is ready
2024-06-19 13:58:05 [ℹ]  node "ip-192-168-83-230.us-east-2.compute.internal" is ready
2024-06-19 13:58:05 [✔]  created 1 managed nodegroup(s) in cluster "my-cluster"
2024-06-19 13:58:07 [ℹ]  kubectl command should work with "/home/openvino/.kube/config", try 'kubectl get nodes'
2024-06-19 13:58:07 [✔]  EKS cluster "my-cluster" in "us-east-2" region is ready

```

Confirm it is working.
```
kubectl get node
```

The output.
```
NAME                                           STATUS   ROLES    AGE     VERSION
ip-192-168-16-83.us-east-2.compute.internal    Ready    <none>   3m44s   v1.29.3-eks-ae9a62a
ip-192-168-83-230.us-east-2.compute.internal   Ready    <none>   3m54s   v1.29.3-eks-ae9a62a
```

## Build the project

Clone the repo.
```
git clone https://github.com/jonathanyeh0723/microservices-aws-kubernetes
```

Go to the directory.
```
cd microservices-aws-kubernetes/
```

Apply the DB.
```
kubectl apply -f DB-YAML/
```

The output:
```
deployment.apps/postgresql created
service/postgresql-service created
persistentvolume/manual-pv created
persistentvolumeclaim/postgresql-pvc created
```

Check it.
```
kubectl get pv,pvc
```

```
NAME                         CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                    STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
persistentvolume/manual-pv   1Gi        RWO            Retain           Bound    default/postgresql-pvc   gp2            <unset>                          10s

NAME                                   STATUS   VOLUME      CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
persistentvolumeclaim/postgresql-pvc   Bound    manual-pv   1Gi        RWO            gp2            <unset>                 9s
```

Go ahead to check the service.
```
kubectl get svc
```

The output:
```
NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
kubernetes           ClusterIP   10.100.0.1       <none>        443/TCP    14m
postgresql-service   ClusterIP   10.100.220.184   <none>        5432/TCP   18s
```

Perform port forwarding...
```
kubectl port-forward svc/postgresql-service 5433:5432 &
```

Build the python environment locally using pip.
```
python3 -m venv project-env
source project-env/bin/activate
python3 -m pip install --upgrade pip

python3 -m pip install -r analytics/requirements.txt
```

Note if you encounter below error, you will have to install postgresql client by `sudo apt -y install postgresql-client-12`
```
Error: You must install at least one postgresql-client-<version> package
```

Once it's done, you should be able to seed the database.
```
export DB_PASSWORD=mypassword
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/1_create_tables.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/2_seed_users.sql
PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/3_seed_tokens.sql
```

Note that these steps may take around 15 minutes. Be patient!

## Deploy our service

Before we deploy, make sure the `DB_HOST` key in configmap.yaml matches the `postgresql-service` CLUSTER-IP:
```
cat deployment/configmap.yaml 

apiVersion: v1
kind: ConfigMap
metadata:
  name: postgresql-service-config
data:
  #DB_NAME: "mydatabase"
  #DB_USERNAME: "myuser"
  POSTGRES_USER: myuser
  POSTGRES_DB: mydatabase
  DB_HOST: "10.100.43.98"
  DB_PORT: "5432"

```

And check the `postgresql-service` CLUSTER-IP:
```
kubectl get svc

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
kubernetes           ClusterIP   10.100.0.1       <none>        443/TCP    32m
postgresql-service   ClusterIP   10.100.220.184   <none>        5432/TCP   18m

``` 

So, in this case we need to modify the `configmap.yaml`, `DB_HOST` key value `10.100.43.98` to `10.100.220.184`!

### Docker build and upload
Go to AWS ECR, create a repo.

!

After that view push command:
```
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 884477859804.dkr.ecr.us-east-2.amazonaws.com
```

If login success, you would see:
```
WARNING! Your password will be stored unencrypted in /home/openvino/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

Docker build, tag, and push.

```
docker build -t coworking .

docker tag coworking:latest 884477859804.dkr.ecr.us-east-2.amazonaws.com/coworking:latest

docker push 884477859804.dkr.ecr.us-east-2.amazonaws.com/coworking:latest
```

Once push successfully, you should check the ECR repo URL again to match what we specify in `coworking.yaml`.

This time the repo URL is `884477859804.dkr.ecr.us-east-2.amazonaws.com/coworking:latest`

Now everything seems ok! Keep going to deploy our coworking!
```
kubectl apply -f deployment/

configmap/postgresql-service-config created
service/coworking created
deployment.apps/coworking created
secret/mysecret created
```

Check.
```
kubectl get deploy

NAME         READY   UP-TO-DATE   AVAILABLE   AGE
coworking    1/1     1            1           2m50s
postgresql   1/1     1            1           40m
```

The pod.

```
kubectl get pod

NAME                          READY   STATUS    RESTARTS   AGE
coworking-7769bc6688-gct42    1/1     Running   0          3m39s
postgresql-6889d46b98-m4jmd   1/1     Running   0          40m
```

The pod logs.

```
kubectl logs coworking-7769bc6688-gct42
 * Tip: There are .env or .flaskenv files present. Do "pip install python-dotenv" to use them.
 * Serving Flask app 'config'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5153
 * Running on http://192.168.26.246:5153
Press CTRL+C to quit
192.168.16.83 - - [19/Jun/2024 06:40:36] "GET /health_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:40:36] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:40:46] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:40:46] "GET /health_check HTTP/1.1" 200 -
[2024-06-19 06:40:52,662] INFO in app: {'2023-02-12': 176, '2023-02-13': 196, '2023-02-09': 179, '2023-02-11': 146, '2023-02-14': 142, '2023-02-07': 40, '2023-02-10': 158, '2023-02-08': 202}
192.168.16.83 - - [19/Jun/2024 06:40:56] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:40:56] "GET /health_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:06] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:06] "GET /health_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:16] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:16] "GET /health_check HTTP/1.1" 200 -
[2024-06-19 06:41:22,658] INFO in app: {'2023-02-12': 176, '2023-02-13': 196, '2023-02-09': 179, '2023-02-11': 146, '2023-02-14': 142, '2023-02-07': 40, '2023-02-10': 158, '2023-02-08': 202}
192.168.16.83 - - [19/Jun/2024 06:41:26] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:26] "GET /health_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:36] "GET /health_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:36] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:46] "GET /readiness_check HTTP/1.1" 200 -
192.168.16.83 - - [19/Jun/2024 06:41:46] "GET /health_check HTTP/1.1" 200 -
[2024-06-19 06:41:52,658] INFO in app: {'2023-02-12': 176, '2023-02-13': 196, '2023-02-09': 179, '2023-02-11': 146, '2023-02-14': 142, '2023-02-07': 40, '2023-02-10': 158, '2023-02-08': 202}
192.168.16.83 - - [19/Jun/2024 06:41:56] "GET /readiness_check HTTP/1.1" 200 -

```

## Tear down the EKS
```
eksctl delete cluster --name my-cluster --region us-east-2
```
