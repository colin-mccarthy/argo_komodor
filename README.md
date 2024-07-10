

# Argo

## Accessing the Web UI

The Helm chart doesn't install an Ingress by default. To access the Web UI we have to port-forward to the argocd-server service on port 443:

``
kubectl port-forward svc/argo-cd-argocd-server 8080:443
``

We can then visit http://localhost:8080 to access it, which will show as a login form. The default username is admin. The password is auto-generated, we can get it with:

``
kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
``

Note that some shells (like Zsh) display a percentage sign at the end. It's not part of the password.
