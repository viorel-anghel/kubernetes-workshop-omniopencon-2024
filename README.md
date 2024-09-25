# Kubernetes workshop OmniOpenCon 2024

# How to install stuff in Kubernetes

kubernetes workshop @ https://omniopencon.org

2024-09-25 Viorel Anghel

## Necesar

1. Puteti urmari cum lucrez eu sau puteti incerca unele exemple in paralel cu mine. Tot ce este necesar se va regasi in acest repo: https://github.com/viorel-anghel/kubernetes-workshop-omniopencon-2024
2. Voi folosi un laptop cu Linux (XUbuntu) pe care am deja instalat Rancher Desktop: https://rancherdesktop.io/
Acesta este software free si open-source care permite sa rulati un Kubernetes local si access la comenzile `docker` si `kubectl`. Rancher Desktop este disponibil pentru toate sistemele de operare uzuale.
3. Daca aveti alte optiuni de a rula Kubernetes si Docker local pe laptopul vostru, este ok in principiu, tot ce lucram impreuna ar trebui sa functioneze (ne-testat totusi). De exemplu ati putea avea deja instalate Docker Desktop sau minikube, caz in care puteti alege sa nu instalati Rancher Desktop.
4. Pe scurt, daca puteti rula pe laptopul vostru, in linia de comanda `docker ps` si `kubectl get nodes` suntem all good.

![kubectl get nodes](kubectl-get-nodes.png)

![rancher desktop main window](rancher-desktop-main.png)

![rancher desktop preferences](rancher-desktop-pref1.png)

## WHY?

De ce este Kubernetes atat de popular in industrie? Cum s-a ajuns la el? La ce ajuta?

- 2005-2011 Microservices - https://en.wikipedia.org/wiki/Microservices
- 2013 Docker containers
- 2014 Kubernetes - containers on multiple VMs

## Containers versus VMs

Pros and cons

## Why Kubernetes and not...

- Docker Swarm - too little, too late
- 2014 - 2018 - other players
- 2018 - all major cloud providers adopt Kubernetes

## Avantajele comunitatii

- free and open source
- condus de o fundatie non-profit - Cloud Native Computing Foundation - 2015 - Kubernetes 1.0
- probabil cel mai mare proiect open source dupa Linux Kernel
- popularitate in crestere exponentiala

## Avantaje tehnice

- High Availability - la nivel de control-plane si la nivel de workers
- Scalability - adding nodes to cluster
	- Autoscaling - VPA, HPA, cluster auto-scaling
- It works almost the same in cloud and on-premmise
	- the great eqaulzer! cloud migrations made easy
- Easy to run everywhere (like Docker!) - from laptop to 1 VM to 100 servers

## Cum se acceseaza un cluster de Kubernetes
- asa cum Docker are comanda de baza `docker`, Kubernetes are comanda `kubectl`
- acesta este de fapt un simplu client care se conecteaza la Kubernetes api-server
	- in consecinta au aparut sialte interfete (grafice sau text-mode sau chiar cod)
- se bazeaza pe un fisier de configurare 
	- default location `~/.kube/config`
	- evironment variable KUBECONFIG=~/.kube/my-second-cluster
	- in config sunt definite URL api-server si certificate SSL pentru autentificare/autorizare

## Sa incercam primele comenzi kubectl

```
kubectl get nodes
kubectl get nodes -o wide
kubectl describe node XYX

kubectl get namespaces

kubectl get pods

kubectl -n kube-system get pods

kubectl run --image=nginx my-nginx
```

De discutat:

- namespace default
- namespaced versus cluster-wide objects
- de unde se ia acea imagine `nginx`?

## Forma normala a comenzilor kubectl

`kubectl [-n namespace] VERB OBJECT_TYPE ONJECT_NAME [ -o wide ]`

- VERB: get describe delete create|run
- OBJECVT_TYPES (pana acum): node namespace pod

## Imperative vs declarative

Pentru ca obiectele astea pot sa aibe tone de parametri, comenzile imperative de creare sunt rar folosite
si este preferata forma declarativa, in care se scrie un fisier in format YAML care descrie obiectl de creat. de exemplu, urmatoarele variante creeaza de fapt acelasi obiect:

```
kubectl create namespace demo-ns

kubectl apply -f demo-ns.yaml
```

Un exemplu de YAML *manifest* pentru crearea unui pod cu nginx dar in namespace-ul demo-ns: simple-pod.yaml 

Structura din fisierul `simple-pod.yaml` este similara pentru toate obiectele din Kubernetes: 
- `apiVersion`, 
- `kind` - tipul obiectului, 
- `metadata` (cu `name` obligatoriu si frecvent `namespace`), 
- `spec` cu specificatiile obiectului, aici formatul exact difera in functie de tipul obiectului

Puteti inclusiv obtine respectivul yaml pentru un obiect existent:
```
kubectl get pod nginx -o yaml
```

## Cum sa rulam codul nostru

Va trebui sa ne intoarcem putin la Docker, mai exact la `docker build`. 
Tot ce se ruleaza in Kubernetes este pe baza de containere sau mai exact pe imagini de container.


