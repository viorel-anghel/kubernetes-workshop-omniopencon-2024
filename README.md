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



