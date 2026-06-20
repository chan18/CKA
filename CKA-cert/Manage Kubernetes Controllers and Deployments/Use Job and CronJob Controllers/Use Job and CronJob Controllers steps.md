

```bash
pslearner@ip-172-31-24-201:~$ kubectl create ns challenge6
namespace/challenge6 created
pslearner@ip-172-31-24-201:~$ kubectl create ns cha^C
pslearner@ip-172-31-24-201:~$ kubectl config set-context --current --namespace=challenge6
Context "minikube" modified.
pslearner@ip-172-31-24-201:~$ cat ~/challenges/06/job.yml
---
apiVersion: batch/v1
kind: Job
metadata:
  name: hey-ps
spec:
  template:
    spec:
      containers:
      - name: busybox
        image: busybox:1.36
        args:
        - /bin/sh
        - -c
        - echo "$(date) - Hello PluralSight!"
      restartPolicy: Never

pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl get jobs
No resources found in challenge6 namespace.
pslearner@ip-172-31-24-201:~$ kubectl apply -f ~/challenges/06/job.yml 
job.batch/hey-ps created
pslearner@ip-172-31-24-201:~$ kubectl get jobs
NAME     COMPLETIONS   DURATION   AGE
hey-ps   0/1           2s         2s
pslearner@ip-172-31-24-201:~$ kubectl get pods
NAME           READY   STATUS      RESTARTS   AGE
hey-ps-gs92q   0/1     Completed   0          9s
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ cat ~/challenges/06/cronjob.yml 
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hey-ps-cj
spec:
  schedule: "* * * * *"
  successfulJobsHistoryLimit: 10
  failedJobsHistoryLimit: 5
  jobTemplate:
    spec:
      template:
        metadata:
          labels:
            job: hey-ps-cj
        spec:
          containers:
          - name: busybox
            image: busybox:1.36
            args:
            - /bin/sh
            - -c
            - echo "$(date) - Hello PluralSight!"
          restartPolicy: Never

pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ ^C
pslearner@ip-172-31-24-201:~$ kubectl apply -f ~/challenges/06/cronjob.yml

cronjob.batch/hey-ps-cj created
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl get cronjob
NAME        SCHEDULE    SUSPEND   ACTIVE   LAST SCHEDULE   AGE
hey-ps-cj   * * * * *   False     0        <none>          6s
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl get pods -l job=hey-ps-cj
No resources found in challenge6 namespace.
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl logs -l job=hey-ps-cj
No resources found in challenge6 namespace.
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl get pods
NAME                       READY   STATUS      RESTARTS   AGE
hey-ps-cj-29698070-px5nf   0/1     Completed   0          113s
hey-ps-cj-29698071-6xlpb   0/1     Completed   0          53s
hey-ps-gs92q               0/1     Completed   0          3m58s
pslearner@ip-172-31-24-201:~$ kubectl get pods -l job=hey-ps-gs92q
No resources found in challenge6 namespace.
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ kubectl get pods -l job=hey-ps-cj
NAME                       READY   STATUS      RESTARTS   AGE
hey-ps-cj-29698071-6xlpb   0/1     Completed   0          9m14s
hey-ps-cj-29698072-88w55   0/1     Completed   0          8m14s
hey-ps-cj-29698073-zr7l4   0/1     Completed   0          7m14s
hey-ps-cj-29698074-p89b4   0/1     Completed   0          6m14s
hey-ps-cj-29698075-csgfq   0/1     Completed   0          5m14s
hey-ps-cj-29698076-4n6l2   0/1     Completed   0          4m14s
hey-ps-cj-29698077-xmt7f   0/1     Completed   0          3m14s
hey-ps-cj-29698078-8m987   0/1     Completed   0          2m14s
hey-ps-cj-29698079-8957z   0/1     Completed   0          74s
hey-ps-cj-29698080-hmhzj   0/1     Completed   0          14s
pslearner@ip-172-31-24-201:~$ kubectl logs -l job=hey-ps-cj
Fri Jun 19 15:51:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:52:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:55:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:56:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:57:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:58:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 16:00:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:53:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:54:00 UTC 2026 - Hello PluralSight!
Fri Jun 19 15:59:00 UTC 2026 - Hello PluralSight!
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
pslearner@ip-172-31-24-201:~$ 
```


