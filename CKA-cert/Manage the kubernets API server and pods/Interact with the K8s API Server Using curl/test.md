```bash
pslearner@ip-172-31-24-55:~$ cat $HOME/.kube/config
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /home/pslearner/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Sat, 20 Jun 2026 02:59:27 UTC
        provider: minikube.sigs.k8s.io
        version: v1.36.0
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Sat, 20 Jun 2026 02:59:27 UTC
        provider: minikube.sigs.k8s.io
        version: v1.36.0
      name: context_info
    namespace: challenge2
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /home/pslearner/.minikube/profiles/minikube/client.crt
    client-key: /home/pslearner/.minikube/profiles/minikube/client.key
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl config get-contexts
CURRENT   NAME       CLUSTER    AUTHINFO   NAMESPACE
*         minikube   minikube   minikube   challenge2
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl get namespaces -v 6
I0620 05:29:18.883652   37621 loader.go:373] Config loaded from file:  /home/pslearner/.kube/config
I0620 05:29:18.888606   37621 cert_rotation.go:137] Starting client certificate rotation controller
I0620 05:29:18.909120   37621 round_trippers.go:553] GET https://192.168.49.2:8443/api/v1/namespaces?limit=500 200 OK in 14 milliseconds
NAME              STATUS   AGE
challenge2        Active   8m40s
default           Active   150m
kube-node-lease   Active   150m
kube-public       Active   150m
kube-system       Active   150m
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ curl -v https://192.168.49.2:8443/api/v1/namespaces?limit=500 --insecure
* Uses proxy env variable NO_PROXY == 'localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24'
*   Trying 192.168.49.2:8443...
* Connected to 192.168.49.2 (192.168.49.2) port 8443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Request CERT (13):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Certificate (11):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: O=system:masters; CN=minikube
*  start date: Jun 19 02:58:40 2026 GMT
*  expire date: Jun 19 02:58:40 2029 GMT
*  issuer: CN=minikubeCA
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x5dceff0989f0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET /api/v1/namespaces?limit=500 HTTP/2
> Host: 192.168.49.2:8443
> user-agent: curl/7.81.0
> accept: */*
> 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 403 
< audit-id: bd84ba2d-2f91-4574-b487-6e1dcea37f5d
< cache-control: no-cache, private
< content-type: application/json
< x-content-type-options: nosniff
< x-kubernetes-pf-flowschema-uid: 2bcc38bc-1fa7-4f49-a213-034059f47210
< x-kubernetes-pf-prioritylevel-uid: 303da4a9-fde2-4e5b-b132-e1f9bc9aec7b
< content-length: 312
< date: Sat, 20 Jun 2026 05:30:01 GMT
< 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "namespaces is forbidden: User \"system:anonymous\" cannot list resource \"namespaces\" in API group \"\" at the cluster scope",
  "reason": "Forbidden",
  "details": {
    "kind": "namespaces"
  },
  "code": 403
* Connection #0 to host 192.168.49.2 left intact
}pslearner@ip-172-31-24-55:~$curl -v https://192.168.49.2:8443/api/v1/namespaces?limit=500 --insecure --cert /home/pslearner/.minikube/profiles/minikube/client.crt --key /home/pslearner/.minikube/profiles/minikube/client.keyy
* Uses proxy env variable NO_PROXY == 'localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24'
*   Trying 192.168.49.2:8443...
* Connected to 192.168.49.2 (192.168.49.2) port 8443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Request CERT (13):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Certificate (11):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, CERT verify (15):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: O=system:masters; CN=minikube
*  start date: Jun 19 02:58:40 2026 GMT
*  expire date: Jun 19 02:58:40 2029 GMT
*  issuer: CN=minikubeCA
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x5a18f743e9f0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> GET /api/v1/namespaces?limit=500 HTTP/2
> Host: 192.168.49.2:8443
> user-agent: curl/7.81.0
> accept: */*
> 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200 
< audit-id: da96e00e-6261-47f7-abb6-13983735cdf4
< cache-control: no-cache, private
< content-type: application/json
< x-kubernetes-pf-flowschema-uid: e36cc184-f551-43c9-9755-0ef4701623dd
< x-kubernetes-pf-prioritylevel-uid: 1971684d-7782-4792-8129-ed2909c430ad
< date: Sat, 20 Jun 2026 05:30:13 GMT
< 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
{
  "kind": "NamespaceList",
  "apiVersion": "v1",
  "metadata": {
    "resourceVersion": "7734"
  },
  "items": [
    {
      "metadata": {
        "name": "challenge2",
        "uid": "b574be68-0c73-4c41-997c-800756ff8b36",
        "resourceVersion": "7229",
        "creationTimestamp": "2026-06-20T05:20:38Z",
        "labels": {
          "kubernetes.io/metadata.name": "challenge2"
        },
        "managedFields": [
          {
            "manager": "kubectl-create",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2026-06-20T05:20:38Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "default",
        "uid": "5e644785-f9dc-40b3-8f22-9e825bc74027",
        "resourceVersion": "41",
        "creationTimestamp": "2026-06-20T02:58:51Z",
        "labels": {
          "kubernetes.io/metadata.name": "default"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2026-06-20T02:58:51Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-node-lease",
        "uid": "a67ccb45-f71d-49ec-8349-ffdc616ee84d",
        "resourceVersion": "39",
        "creationTimestamp": "2026-06-20T02:58:51Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-node-lease"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2026-06-20T02:58:51Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-public",
        "uid": "13724654-547a-48cb-9928-b991a1cc07bf",
        "resourceVersion": "25",
        "creationTimestamp": "2026-06-20T02:58:51Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-public"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2026-06-20T02:58:51Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-system",
        "uid": "6505dbd5-860f-4a91-846e-f47f7688ba50",
        "resourceVersion": "11",
        "creationTimestamp": "2026-06-20T02:58:51Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-system"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2026-06-20T02:58:51Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    }
  ]
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection #0 to host 192.168.49.2 left intact
}pslearner@ip-172-31-24-55:~$ kubectl create ns challenge3
namespace/challenge3 created
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl config set-context --current --namespace=challenge3
Context "minikube" modified.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ cat ~/challenges/03/pod.yml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.24.0-alpine-slim
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ curl -v --insecure --cert /home/pslearner/.minikube/profiles/minikube/client.crt --key /home/pslearner/.minikube/profiles/minikube/client.key -X POST https://192.168.49.2:8443/api/v1/namespaces/challenge3/pods -H 'Content-type: application/yaml' --data-binary '@/home/pslearner/challenges/03/pod.yml'
Note: Unnecessary use of -X or --request, POST is already inferred.
* Uses proxy env variable NO_PROXY == 'localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24'
*   Trying 192.168.49.2:8443...
* Connected to 192.168.49.2 (192.168.49.2) port 8443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Request CERT (13):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Certificate (11):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, CERT verify (15):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: O=system:masters; CN=minikube
*  start date: Jun 19 02:58:40 2026 GMT
*  expire date: Jun 19 02:58:40 2029 GMT
*  issuer: CN=minikubeCA
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x57dc534799f0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> POST /api/v1/namespaces/challenge3/pods HTTP/2
> Host: 192.168.49.2:8443
> user-agent: curl/7.81.0
> accept: */*
> content-type: application/yaml
> content-length: 146
> 
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* We are completely uploaded and fine
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 201 
< audit-id: ddcc2d9b-fcdd-481a-bf63-27d03947050b
< cache-control: no-cache, private
< content-type: application/json
< x-kubernetes-pf-flowschema-uid: e36cc184-f551-43c9-9755-0ef4701623dd
< x-kubernetes-pf-prioritylevel-uid: 1971684d-7782-4792-8129-ed2909c430ad
< content-length: 3515
< date: Sat, 20 Jun 2026 05:30:42 GMT
< 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
{
  "kind": "Pod",
  "apiVersion": "v1",
  "metadata": {
    "name": "nginx",
    "namespace": "challenge3",
    "uid": "e087b3bd-0bdb-48ca-ac72-b84b3b06338c",
    "resourceVersion": "7760",
    "creationTimestamp": "2026-06-20T05:30:42Z",
    "labels": {
      "app": "nginx"
    },
    "managedFields": [
      {
        "manager": "curl",
        "operation": "Update",
        "apiVersion": "v1",
        "time": "2026-06-20T05:30:42Z",
        "fieldsType": "FieldsV1",
        "fieldsV1": {
          "f:metadata": {
            "f:labels": {
              ".": {},
              "f:app": {}
            }
          },
          "f:spec": {
            "f:containers": {
              "k:{\"name\":\"nginx\"}": {
                ".": {},
                "f:image": {},
                "f:imagePullPolicy": {},
                "f:name": {},
                "f:resources": {},
                "f:terminationMessagePath": {},
                "f:terminationMessagePolicy": {}
              }
            },
            "f:dnsPolicy": {},
            "f:enableServiceLinks": {},
            "f:restartPolicy": {},
            "f:schedulerName": {},
            "f:securityContext": {},
            "f:terminationGracePeriodSeconds": {}
          }
        }
      }
    ]
  },
  "spec": {
    "volumes": [
      {
        "name": "kube-api-access-x2z4p",
        "projected": {
          "sources": [
            {
              "serviceAccountToken": {
                "expirationSeconds": 3607,
                "path": "token"
              }
            },
            {
              "configMap": {
                "name": "kube-root-ca.crt",
                "items": [
                  {
                    "key": "ca.crt",
                    "path": "ca.crt"
                  }
                ]
              }
            },
            {
              "downwardAPI": {
                "items": [
                  {
                    "path": "namespace",
                    "fieldRef": {
                      "apiVersion": "v1",
                      "fieldPath": "metadata.namespace"
                    }
                  }
                ]
              }
            }
          ],
          "defaultMode": 420
        }
      }
    ],
    "containers": [
      {
        "name": "nginx",
        "image": "nginx:1.24.0-alpine-slim",
        "resources": {},
        "volumeMounts": [
          {
            "name": "kube-api-access-x2z4p",
            "readOnly": true,
            "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
          }
        ],
        "terminationMessagePath": "/dev/termination-log",
        "terminationMessagePolicy": "File",
        "imagePullPolicy": "IfNotPresent"
      }
    ],
    "restartPolicy": "Always",
    "terminationGracePeriodSeconds": 30,
    "dnsPolicy": "ClusterFirst",
    "serviceAccountName": "default",
    "serviceAccount": "default",
    "securityContext": {},
    "schedulerName": "default-scheduler",
    "tolerations": [
      {
        "key": "node.kubernetes.io/not-ready",
        "operator": "Exists",
        "effect": "NoExecute",
        "tolerationSeconds": 300
      },
      {
        "key": "node.kubernetes.io/unreachable",
        "operator": "Exists",
        "effect": "NoExecute",
        "tolerationSeconds": 300
      }
    ],
    "priority": 0,
    "enableServiceLinks": true,
    "preemptionPolicy": "PreemptLowerPriority"
  },
  "status": {
    "phase": "Pending",
    "qosClass": "BestEffort"
  }
* Connection #0 to host 192.168.49.2 left intact
}pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          5s
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ curl -v --insecure --cert /home/pslearner/.minikube/profiles/minikube/client.crt --key /home/pslearner/.minikube/profiles/minikube/client.key -X DELETE https://192.168.49.2:8443/api/v1/namespaces/challenge3/pods/nginx
* Uses proxy env variable NO_PROXY == 'localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24'
*   Trying 192.168.49.2:8443...
* Connected to 192.168.49.2 (192.168.49.2) port 8443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* TLSv1.0 (OUT), TLS header, Certificate Status (22):
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS header, Certificate Status (22):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS header, Finished (20):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Request CERT (13):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.2 (OUT), TLS header, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Certificate (11):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, CERT verify (15):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: O=system:masters; CN=minikube
*  start date: Jun 19 02:58:40 2026 GMT
*  expire date: Jun 19 02:58:40 2029 GMT
*  issuer: CN=minikubeCA
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
* Using HTTP2, server supports multiplexing
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* Using Stream ID: 1 (easy handle 0x5c80e7b759f0)
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
> DELETE /api/v1/namespaces/challenge3/pods/nginx HTTP/2
> Host: 192.168.49.2:8443
> user-agent: curl/7.81.0
> accept: */*
> 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection state changed (MAX_CONCURRENT_STREAMS == 250)!
* TLSv1.2 (OUT), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* TLSv1.2 (IN), TLS header, Supplemental data (23):
< HTTP/2 200 
< audit-id: 65dc0437-4fac-4257-a0d0-a81aeb2a7ba4
< cache-control: no-cache, private
< content-type: application/json
< x-kubernetes-pf-flowschema-uid: e36cc184-f551-43c9-9755-0ef4701623dd
< x-kubernetes-pf-prioritylevel-uid: 1971684d-7782-4792-8129-ed2909c430ad
< date: Sat, 20 Jun 2026 05:30:53 GMT
< 
* TLSv1.2 (IN), TLS header, Supplemental data (23):
{
  "kind": "Pod",
  "apiVersion": "v1",
  "metadata": {
    "name": "nginx",
    "namespace": "challenge3",
    "uid": "e087b3bd-0bdb-48ca-ac72-b84b3b06338c",
    "resourceVersion": "7777",
    "creationTimestamp": "2026-06-20T05:30:42Z",
    "deletionTimestamp": "2026-06-20T05:31:23Z",
    "deletionGracePeriodSeconds": 30,
    "labels": {
      "app": "nginx"
    },
    "managedFields": [
      {
        "manager": "curl",
        "operation": "Update",
        "apiVersion": "v1",
        "time": "2026-06-20T05:30:42Z",
        "fieldsType": "FieldsV1",
        "fieldsV1": {
          "f:metadata": {
            "f:labels": {
              ".": {},
              "f:app": {}
            }
          },
          "f:spec": {
            "f:containers": {
              "k:{\"name\":\"nginx\"}": {
                ".": {},
                "f:image": {},
                "f:imagePullPolicy": {},
                "f:name": {},
                "f:resources": {},
                "f:terminationMessagePath": {},
                "f:terminationMessagePolicy": {}
              }
            },
            "f:dnsPolicy": {},
            "f:enableServiceLinks": {},
            "f:restartPolicy": {},
            "f:schedulerName": {},
            "f:securityContext": {},
            "f:terminationGracePeriodSeconds": {}
          }
        }
      },
      {
        "manager": "kubelet",
        "operation": "Update",
        "apiVersion": "v1",
        "time": "2026-06-20T05:30:43Z",
        "fieldsType": "FieldsV1",
        "fieldsV1": {
          "f:status": {
            "f:conditions": {
              "k:{\"type\":\"ContainersReady\"}": {
                ".": {},
                "f:lastProbeTime": {},
                "f:lastTransitionTime": {},
                "f:status": {},
                "f:type": {}
              },
              "k:{\"type\":\"Initialized\"}": {
                ".": {},
                "f:lastProbeTime": {},
                "f:lastTransitionTime": {},
                "f:status": {},
                "f:type": {}
              },
              "k:{\"type\":\"Ready\"}": {
                ".": {},
                "f:lastProbeTime": {},
                "f:lastTransitionTime": {},
                "f:status": {},
                "f:type": {}
              }
            },
            "f:containerStatuses": {},
            "f:hostIP": {},
            "f:phase": {},
            "f:podIP": {},
            "f:podIPs": {
              ".": {},
              "k:{\"ip\":\"10.244.0.6\"}": {
                ".": {},
                "f:ip": {}
              }
            },
            "f:startTime": {}
          }
        },
        "subresource": "status"
      }
    ]
  },
  "spec": {
    "volumes": [
      {
        "name": "kube-api-access-x2z4p",
        "projected": {
          "sources": [
            {
              "serviceAccountToken": {
                "expirationSeconds": 3607,
                "path": "token"
              }
            },
            {
              "configMap": {
                "name": "kube-root-ca.crt",
                "items": [
                  {
                    "key": "ca.crt",
                    "path": "ca.crt"
                  }
                ]
              }
            },
            {
              "downwardAPI": {
                "items": [
                  {
                    "path": "namespace",
                    "fieldRef": {
                      "apiVersion": "v1",
                      "fieldPath": "metadata.namespace"
                    }
                  }
                ]
              }
            }
          ],
          "defaultMode": 420
        }
      }
    ],
    "containers": [
      {
        "name": "nginx",
        "image": "nginx:1.24.0-alpine-slim",
        "resources": {},
        "volumeMounts": [
          {
            "name": "kube-api-access-x2z4p",
            "readOnly": true,
            "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
          }
        ],
        "terminationMessagePath": "/dev/termination-log",
        "terminationMessagePolicy": "File",
        "imagePullPolicy": "IfNotPresent"
      }
    ],
    "restartPolicy": "Always",
    "terminationGracePeriodSeconds": 30,
    "dnsPolicy": "ClusterFirst",
    "serviceAccountName": "default",
    "serviceAccount": "default",
    "nodeName": "minikube",
    "securityContext": {},
    "schedulerName": "default-scheduler",
    "tolerations": [
      {
        "key": "node.kubernetes.io/not-ready",
        "operator": "Exists",
        "effect": "NoExecute",
        "tolerationSeconds": 300
      },
      {
        "key": "node.kubernetes.io/unreachable",
        "operator": "Exists",
* TLSv1.2 (IN), TLS header, Supplemental data (23):
        "effect": "NoExecute",
        "tolerationSeconds": 300
      }
    ],
    "priority": 0,
    "enableServiceLinks": true,
    "preemptionPolicy": "PreemptLowerPriority"
  },
  "status": {
    "phase": "Running",
    "conditions": [
      {
        "type": "Initialized",
        "status": "True",
        "lastProbeTime": null,
        "lastTransitionTime": "2026-06-20T05:30:42Z"
      },
      {
        "type": "Ready",
        "status": "True",
        "lastProbeTime": null,
        "lastTransitionTime": "2026-06-20T05:30:43Z"
      },
      {
        "type": "ContainersReady",
        "status": "True",
        "lastProbeTime": null,
        "lastTransitionTime": "2026-06-20T05:30:43Z"
      },
      {
        "type": "PodScheduled",
        "status": "True",
        "lastProbeTime": null,
        "lastTransitionTime": "2026-06-20T05:30:42Z"
      }
    ],
    "hostIP": "192.168.49.2",
    "podIP": "10.244.0.6",
    "podIPs": [
      {
        "ip": "10.244.0.6"
      }
    ],
    "startTime": "2026-06-20T05:30:42Z",
    "containerStatuses": [
      {
        "name": "nginx",
        "state": {
          "running": {
            "startedAt": "2026-06-20T05:30:43Z"
          }
        },
        "lastState": {},
        "ready": true,
        "restartCount": 0,
        "image": "nginx:1.24.0-alpine-slim",
        "imageID": "docker-pullable://nginx@sha256:5893dc08a2cb01e21592ff469346ebaacf49167fbc949f45e1c29111981b0427",
        "containerID": "docker://7129aa7c1578bc05f83ce9dbcd58adf519dc7d808886194a1ca394be19d29975",
        "started": true
      }
    ],
    "qosClass": "BestEffort"
  }
* TLSv1.2 (IN), TLS header, Supplemental data (23):
* Connection #0 to host 192.168.49.2 left intact
}pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl get pods
No resources found in challenge3 namespace.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
```

