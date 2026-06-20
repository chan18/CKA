```bash
pslearner@ip-172-31-24-55:~$ status

SYSTEM COMPLETE
pslearner@ip-172-31-24-55:~$ kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS       AGE
kube-system   coredns-5d78c9869d-hmzz7           1/1     Running   0              134m
kube-system   etcd-minikube                      1/1     Running   1 (135m ago)   135m
kube-system   kube-apiserver-minikube            1/1     Running   1 (135m ago)   135m
kube-system   kube-controller-manager-minikube   1/1     Running   1 (135m ago)   135m
kube-system   kube-proxy-t44zk                   1/1     Running   0              134m
kube-system   kube-scheduler-minikube            1/1     Running   1 (135m ago)   135m
kube-system   storage-provisioner                1/1     Running   1 (134m ago)   135m
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
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
    namespace: default
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
pslearner@ip-172-31-24-55:~$ ^C
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
pslearner@ip-172-31-24-55:~$ kubectl api-resources
NAME                              SHORTNAMES   APIVERSION                             NAMESPACED   KIND
bindings                                       v1                                     true         Binding
componentstatuses                 cs           v1                                     false        ComponentStatus
configmaps                        cm           v1                                     true         ConfigMap
endpoints                         ep           v1                                     true         Endpoints
events                            ev           v1                                     true         Event
limitranges                       limits       v1                                     true         LimitRange
namespaces                        ns           v1                                     false        Namespace
nodes                             no           v1                                     false        Node
persistentvolumeclaims            pvc          v1                                     true         PersistentVolumeClaim
persistentvolumes                 pv           v1                                     false        PersistentVolume
pods                              po           v1                                     true         Pod
podtemplates                                   v1                                     true         PodTemplate
replicationcontrollers            rc           v1                                     true         ReplicationController
resourcequotas                    quota        v1                                     true         ResourceQuota
secrets                                        v1                                     true         Secret
serviceaccounts                   sa           v1                                     true         ServiceAccount
services                          svc          v1                                     true         Service
mutatingwebhookconfigurations                  admissionregistration.k8s.io/v1        false        MutatingWebhookConfiguration
validatingwebhookconfigurations                admissionregistration.k8s.io/v1        false        ValidatingWebhookConfiguration
customresourcedefinitions         crd,crds     apiextensions.k8s.io/v1                false        CustomResourceDefinition
apiservices                                    apiregistration.k8s.io/v1              false        APIService
controllerrevisions                            apps/v1                                true         ControllerRevision
daemonsets                        ds           apps/v1                                true         DaemonSet
deployments                       deploy       apps/v1                                true         Deployment
replicasets                       rs           apps/v1                                true         ReplicaSet
statefulsets                      sts          apps/v1                                true         StatefulSet
tokenreviews                                   authentication.k8s.io/v1               false        TokenReview
localsubjectaccessreviews                      authorization.k8s.io/v1                true         LocalSubjectAccessReview
selfsubjectaccessreviews                       authorization.k8s.io/v1                false        SelfSubjectAccessReview
selfsubjectrulesreviews                        authorization.k8s.io/v1                false        SelfSubjectRulesReview
subjectaccessreviews                           authorization.k8s.io/v1                false        SubjectAccessReview
horizontalpodautoscalers          hpa          autoscaling/v2                         true         HorizontalPodAutoscaler
cronjobs                          cj           batch/v1                               true         CronJob
jobs                                           batch/v1                               true         Job
certificatesigningrequests        csr          certificates.k8s.io/v1                 false        CertificateSigningRequest
leases                                         coordination.k8s.io/v1                 true         Lease
endpointslices                                 discovery.k8s.io/v1                    true         EndpointSlice
events                            ev           events.k8s.io/v1                       true         Event
flowschemas                                    flowcontrol.apiserver.k8s.io/v1beta3   false        FlowSchema
prioritylevelconfigurations                    flowcontrol.apiserver.k8s.io/v1beta3   false        PriorityLevelConfiguration
ingressclasses                                 networking.k8s.io/v1                   false        IngressClass
ingresses                         ing          networking.k8s.io/v1                   true         Ingress
networkpolicies                   netpol       networking.k8s.io/v1                   true         NetworkPolicy
runtimeclasses                                 node.k8s.io/v1                         false        RuntimeClass
poddisruptionbudgets              pdb          policy/v1                              true         PodDisruptionBudget
clusterrolebindings                            rbac.authorization.k8s.io/v1           false        ClusterRoleBinding
clusterroles                                   rbac.authorization.k8s.io/v1           false        ClusterRole
rolebindings                                   rbac.authorization.k8s.io/v1           true         RoleBinding
roles                                          rbac.authorization.k8s.io/v1           true         Role
priorityclasses                   pc           scheduling.k8s.io/v1                   false        PriorityClass
csidrivers                                     storage.k8s.io/v1                      false        CSIDriver
csinodes                                       storage.k8s.io/v1                      false        CSINode
csistoragecapacities                           storage.k8s.io/v1                      true         CSIStorageCapacity
storageclasses                    sc           storage.k8s.io/v1                      false        StorageClass
volumeattachments                              storage.k8s.io/v1                      false        VolumeAttachment
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl explain leases

GROUP:      coordination.k8s.io
KIND:       Lease
VERSION:    v1

DESCRIPTION:
    Lease defines a lease concept.
    
FIELDS:
  apiVersion	<string>
    APIVersion defines the versioned schema of this representation of an object.
    Servers should convert recognized schemas to the latest internal value, and
    may reject unrecognized values. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources

  kind	<string>
    Kind is a string value representing the REST resource this object
    represents. Servers may infer this from the endpoint the client submits
    requests to. Cannot be updated. In CamelCase. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

  metadata	<ObjectMeta>
    More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

  spec	<LeaseSpec>
    spec contains the specification of the Lease. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status


pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl create ns challenge2
namespace/challenge2 created
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl config set-context --current --namespace=challenge2
Context "minikube" modified.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl config set-context --current --namespace=default
Context "minikube" modified.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl explain pods.spec
KIND:       Pod
VERSION:    v1

FIELD: spec <PodSpec>

DESCRIPTION:
    Specification of the desired behavior of the pod. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    PodSpec is a description of a pod.
    
FIELDS:
  activeDeadlineSeconds	<integer>
    Optional duration in seconds the pod may be active on the node relative to
    StartTime before the system will actively try to mark it failed and kill
    associated containers. Value must be a positive integer.

  affinity	<Affinity>
    If specified, the pod's scheduling constraints

  automountServiceAccountToken	<boolean>
    AutomountServiceAccountToken indicates whether a service account token
    should be automatically mounted.

  containers	<[]Container> -required-
    List of containers belonging to the pod. Containers cannot currently be
    added or removed. There must be at least one container in a Pod. Cannot be
    updated.

  dnsConfig	<PodDNSConfig>
    Specifies the DNS parameters of a pod. Parameters specified here will be
    merged to the generated DNS configuration based on DNSPolicy.

  dnsPolicy	<string>
    Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are
    'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS
    parameters given in DNSConfig will be merged with the policy selected with
    DNSPolicy. To have DNS options set along with hostNetwork, you have to
    specify DNS policy explicitly to 'ClusterFirstWithHostNet'.
    
    Possible enum values:
     - `"ClusterFirst"` indicates that the pod should use cluster DNS first
    unless hostNetwork is true, if it is available, then fall back on the
    default (as determined by kubelet) DNS settings.
     - `"ClusterFirstWithHostNet"` indicates that the pod should use cluster DNS
    first, if it is available, then fall back on the default (as determined by
    kubelet) DNS settings.
     - `"Default"` indicates that the pod should use the default (as determined
    by kubelet) DNS settings.
     - `"None"` indicates that the pod should use empty DNS settings. DNS
    parameters such as nameservers and search paths should be defined via
    DNSConfig.

  enableServiceLinks	<boolean>
    EnableServiceLinks indicates whether information about services should be
    injected into pod's environment variables, matching the syntax of Docker
    links. Optional: Defaults to true.

  ephemeralContainers	<[]EphemeralContainer>
    List of ephemeral containers run in this pod. Ephemeral containers may be
    run in an existing pod to perform user-initiated actions such as debugging.
    This list cannot be specified when creating a pod, and it cannot be modified
    by updating the pod spec. In order to add an ephemeral container to an
    existing pod, use the pod's ephemeralcontainers subresource.

  hostAliases	<[]HostAlias>
    HostAliases is an optional list of hosts and IPs that will be injected into
    the pod's hosts file if specified. This is only valid for non-hostNetwork
    pods.

  hostIPC	<boolean>
    Use the host's ipc namespace. Optional: Default to false.

  hostNetwork	<boolean>
    Host networking requested for this pod. Use the host's network namespace. If
    this option is set, the ports that will be used must be specified. Default
    to false.

  hostPID	<boolean>
    Use the host's pid namespace. Optional: Default to false.

  hostUsers	<boolean>
    Use the host's user namespace. Optional: Default to true. If set to true or
    not present, the pod will be run in the host user namespace, useful for when
    the pod needs a feature only available to the host user namespace, such as
    loading a kernel module with CAP_SYS_MODULE. When set to false, a new userns
    is created for the pod. Setting false is useful for mitigating container
    breakout vulnerabilities even allowing users to run their containers as root
    without actually having root privileges on the host. This field is
    alpha-level and is only honored by servers that enable the
    UserNamespacesSupport feature.

  hostname	<string>
    Specifies the hostname of the Pod If not specified, the pod's hostname will
    be set to a system-defined value.

  imagePullSecrets	<[]LocalObjectReference>
    ImagePullSecrets is an optional list of references to secrets in the same
    namespace to use for pulling any of the images used by this PodSpec. If
    specified, these secrets will be passed to individual puller implementations
    for them to use. More info:
    https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod

  initContainers	<[]Container>
    List of initialization containers belonging to the pod. Init containers are
    executed in order prior to containers being started. If any init container
    fails, the pod is considered to have failed and is handled according to its
    restartPolicy. The name for an init container or normal container must be
    unique among all containers. Init containers may not have Lifecycle actions,
    Readiness probes, Liveness probes, or Startup probes. The
    resourceRequirements of an init container are taken into account during
    scheduling by finding the highest request/limit for each resource type, and
    then using the max of of that value or the sum of the normal containers.
    Limits are applied to init containers in a similar fashion. Init containers
    cannot currently be added or removed. Cannot be updated. More info:
    https://kubernetes.io/docs/concepts/workloads/pods/init-containers/

  nodeName	<string>
    NodeName is a request to schedule this pod onto a specific node. If it is
    non-empty, the scheduler simply schedules this pod onto that node, assuming
    that it fits resource requirements.

  nodeSelector	<map[string]string>
    NodeSelector is a selector which must be true for the pod to fit on a node.
    Selector which must match a node's labels for the pod to be scheduled on
    that node. More info:
    https://kubernetes.io/docs/concepts/configuration/assign-pod-node/

  os	<PodOS>
    Specifies the OS of the containers in the pod. Some pod and container fields
    are restricted if this is set.
    
    If the OS field is set to linux, the following fields must be unset:
    -securityContext.windowsOptions
    
    If the OS field is set to windows, following fields must be unset: -
    spec.hostPID - spec.hostIPC - spec.hostUsers -
    spec.securityContext.seLinuxOptions - spec.securityContext.seccompProfile -
    spec.securityContext.fsGroup - spec.securityContext.fsGroupChangePolicy -
    spec.securityContext.sysctls - spec.shareProcessNamespace -
    spec.securityContext.runAsUser - spec.securityContext.runAsGroup -
    spec.securityContext.supplementalGroups -
    spec.containers[*].securityContext.seLinuxOptions -
    spec.containers[*].securityContext.seccompProfile -
    spec.containers[*].securityContext.capabilities -
    spec.containers[*].securityContext.readOnlyRootFilesystem -
    spec.containers[*].securityContext.privileged -
    spec.containers[*].securityContext.allowPrivilegeEscalation -
    spec.containers[*].securityContext.procMount -
    spec.containers[*].securityContext.runAsUser -
    spec.containers[*].securityContext.runAsGroup

  overhead	<map[string]Quantity>
    Overhead represents the resource overhead associated with running a pod for
    a given RuntimeClass. This field will be autopopulated at admission time by
    the RuntimeClass admission controller. If the RuntimeClass admission
    controller is enabled, overhead must not be set in Pod create requests. The
    RuntimeClass admission controller will reject Pod create requests which have
    the overhead already set. If RuntimeClass is configured and selected in the
    PodSpec, Overhead will be set to the value defined in the corresponding
    RuntimeClass, otherwise it will remain unset and treated as zero. More info:
    https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md

  preemptionPolicy	<string>
    PreemptionPolicy is the Policy for preempting pods with lower priority. One
    of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
    
    Possible enum values:
     - `"Never"` means that pod never preempts other pods with lower priority.
     - `"PreemptLowerPriority"` means that pod can preempt other pods with lower
    priority.

  priority	<integer>
    The priority value. Various system components use this field to find the
    priority of the pod. When Priority Admission Controller is enabled, it
    prevents users from setting this field. The admission controller populates
    this field from PriorityClassName. The higher the value, the higher the
    priority.

  priorityClassName	<string>
    If specified, indicates the pod's priority. "system-node-critical" and
    "system-cluster-critical" are two special keywords which indicate the
    highest priorities with the former being the highest priority. Any other
    name must be defined by creating a PriorityClass object with that name. If
    not specified, the pod priority will be default or zero if there is no
    default.

  readinessGates	<[]PodReadinessGate>
    If specified, all readiness gates will be evaluated for pod readiness. A pod
    is ready when all its containers are ready AND all conditions specified in
    the readiness gates have status equal to "True" More info:
    https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates

  resourceClaims	<[]PodResourceClaim>
    ResourceClaims defines which ResourceClaims must be allocated and reserved
    before the Pod is allowed to start. The resources will be made available to
    those containers which consume them by name.
    
    This is an alpha field and requires enabling the DynamicResourceAllocation
    feature gate.
    
    This field is immutable.

  restartPolicy	<string>
    Restart policy for all containers within the pod. One of Always, OnFailure,
    Never. In some contexts, only a subset of those values may be permitted.
    Default to Always. More info:
    https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
    
    Possible enum values:
     - `"Always"`
     - `"Never"`
     - `"OnFailure"`

  runtimeClassName	<string>
    RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group,
    which should be used to run this pod.  If no RuntimeClass resource matches
    the named class, the pod will not be run. If unset or empty, the "legacy"
    RuntimeClass will be used, which is an implicit class with an empty
    definition that uses the default runtime handler. More info:
    https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class

  schedulerName	<string>
    If specified, the pod will be dispatched by specified scheduler. If not
    specified, the pod will be dispatched by default scheduler.

  schedulingGates	<[]PodSchedulingGate>
    SchedulingGates is an opaque list of values that if specified will block
    scheduling the pod. If schedulingGates is not empty, the pod will stay in
    the SchedulingGated state and the scheduler will not attempt to schedule the
    pod.
    
    SchedulingGates can only be set at pod creation time, and be removed only
    afterwards.
    
    This is a beta feature enabled by the PodSchedulingReadiness feature gate.

  securityContext	<PodSecurityContext>
    SecurityContext holds pod-level security attributes and common container
    settings. Optional: Defaults to empty.  See type description for default
    values of each field.

  serviceAccount	<string>
    DeprecatedServiceAccount is a depreciated alias for ServiceAccountName.
    Deprecated: Use serviceAccountName instead.

  serviceAccountName	<string>
    ServiceAccountName is the name of the ServiceAccount to use to run this pod.
    More info:
    https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/

  setHostnameAsFQDN	<boolean>
    If true the pod's hostname will be configured as the pod's FQDN, rather than
    the leaf name (the default). In Linux containers, this means setting the
    FQDN in the hostname field of the kernel (the nodename field of struct
    utsname). In Windows containers, this means setting the registry value of
    hostname for the registry key
    HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters to
    FQDN. If a pod does not have FQDN, this has no effect. Default to false.

  shareProcessNamespace	<boolean>
    Share a single process namespace between all of the containers in a pod.
    When this is set containers will be able to view and signal processes from
    other containers in the same pod, and the first process in each container
    will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be
    set. Optional: Default to false.

  subdomain	<string>
    If specified, the fully qualified Pod hostname will be
    "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>". If not
    specified, the pod will not have a domainname at all.

  terminationGracePeriodSeconds	<integer>
    Optional duration in seconds the pod needs to terminate gracefully. May be
    decreased in delete request. Value must be non-negative integer. The value
    zero indicates stop immediately via the kill signal (no opportunity to shut
    down). If this value is nil, the default grace period will be used instead.
    The grace period is the duration in seconds after the processes running in
    the pod are sent a termination signal and the time when the processes are
    forcibly halted with a kill signal. Set this value longer than the expected
    cleanup time for your process. Defaults to 30 seconds.

  tolerations	<[]Toleration>
    If specified, the pod's tolerations.

  topologySpreadConstraints	<[]TopologySpreadConstraint>
    TopologySpreadConstraints describes how a group of pods ought to spread
    across topology domains. Scheduler will schedule pods in a way which abides
    by the constraints. All topologySpreadConstraints are ANDed.

  volumes	<[]Volume>
    List of volumes that can be mounted by containers belonging to the pod. More
    info: https://kubernetes.io/docs/concepts/storage/volumes


pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl explain pods.spec.containers


KIND:       Pod
VERSION:    v1

FIELD: containers <[]Container>

DESCRIPTION:
    List of containers belonging to the pod. Containers cannot currently be
    added or removed. There must be at least one container in a Pod. Cannot be
    updated.
    A single application container that you want to run within a pod.
    
FIELDS:
  args	<[]string>
    Arguments to the entrypoint. The container image's CMD is used if this is
    not provided. Variable references $(VAR_NAME) are expanded using the
    container's environment. If a variable cannot be resolved, the reference in
    the input string will be unchanged. Double $$ are reduced to a single $,
    which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will
    produce the string literal "$(VAR_NAME)". Escaped references will never be
    expanded, regardless of whether the variable exists or not. Cannot be
    updated. More info:
    https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell

  command	<[]string>
    Entrypoint array. Not executed within a shell. The container image's
    ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME)
    are expanded using the container's environment. If a variable cannot be
    resolved, the reference in the input string will be unchanged. Double $$ are
    reduced to a single $, which allows for escaping the $(VAR_NAME) syntax:
    i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped
    references will never be expanded, regardless of whether the variable exists
    or not. Cannot be updated. More info:
    https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell

  env	<[]EnvVar>
    List of environment variables to set in the container. Cannot be updated.

  envFrom	<[]EnvFromSource>
    List of sources to populate environment variables in the container. The keys
    defined within a source must be a C_IDENTIFIER. All invalid keys will be
    reported as an event when the container is starting. When a key exists in
    multiple sources, the value associated with the last source will take
    precedence. Values defined by an Env with a duplicate key will take
    precedence. Cannot be updated.

  image	<string>
    Container image name. More info:
    https://kubernetes.io/docs/concepts/containers/images This field is optional
    to allow higher level config management to default or override container
    images in workload controllers like Deployments and StatefulSets.

  imagePullPolicy	<string>
    Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if
    :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More
    info: https://kubernetes.io/docs/concepts/containers/images#updating-images
    
    Possible enum values:
     - `"Always"` means that kubelet always attempts to pull the latest image.
    Container will fail If the pull fails.
     - `"IfNotPresent"` means that kubelet pulls if the image isn't present on
    disk. Container will fail if the image isn't present and the pull fails.
     - `"Never"` means that kubelet never pulls an image, but only uses a local
    image. Container will fail if the image isn't present

  lifecycle	<Lifecycle>
    Actions that the management system should take in response to container
    lifecycle events. Cannot be updated.

  livenessProbe	<Probe>
    Periodic probe of container liveness. Container will be restarted if the
    probe fails. Cannot be updated. More info:
    https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

  name	<string> -required-
    Name of the container specified as a DNS_LABEL. Each container in a pod must
    have a unique name (DNS_LABEL). Cannot be updated.

  ports	<[]ContainerPort>
    List of ports to expose from the container. Not specifying a port here DOES
    NOT prevent that port from being exposed. Any port which is listening on the
    default "0.0.0.0" address inside a container will be accessible from the
    network. Modifying this array with strategic merge patch may corrupt the
    data. For more information See
    https://github.com/kubernetes/kubernetes/issues/108255. Cannot be updated.

  readinessProbe	<Probe>
    Periodic probe of container service readiness. Container will be removed
    from service endpoints if the probe fails. Cannot be updated. More info:
    https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

  resizePolicy	<[]ContainerResizePolicy>
    Resources resize policy for the container.

  resources	<ResourceRequirements>
    Compute Resources required by this container. Cannot be updated. More info:
    https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/

  securityContext	<SecurityContext>
    SecurityContext defines the security options the container should be run
    with. If set, the fields of SecurityContext override the equivalent fields
    of PodSecurityContext. More info:
    https://kubernetes.io/docs/tasks/configure-pod-container/security-context/

  startupProbe	<Probe>
    StartupProbe indicates that the Pod has successfully initialized. If
    specified, no other probes are executed until this completes successfully.
    If this probe fails, the Pod will be restarted, just as if the livenessProbe
    failed. This can be used to provide different probe parameters at the
    beginning of a Pod's lifecycle, when it might take a long time to load data
    or warm a cache, than during steady-state operation. This cannot be updated.
    More info:
    https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

  stdin	<boolean>
    Whether this container should allocate a buffer for stdin in the container
    runtime. If this is not set, reads from stdin in the container will always
    result in EOF. Default is false.

  stdinOnce	<boolean>
    Whether the container runtime should close the stdin channel after it has
    been opened by a single attach. When stdin is true the stdin stream will
    remain open across multiple attach sessions. If stdinOnce is set to true,
    stdin is opened on container start, is empty until the first client attaches
    to stdin, and then remains open and accepts data until the client
    disconnects, at which time stdin is closed and remains closed until the
    container is restarted. If this flag is false, a container processes that
    reads from stdin will never receive an EOF. Default is false

  terminationMessagePath	<string>
    Optional: Path at which the file to which the container's termination
    message will be written is mounted into the container's filesystem. Message
    written is intended to be brief final status, such as an assertion failure
    message. Will be truncated by the node if greater than 4096 bytes. The total
    message length across all containers will be limited to 12kb. Defaults to
    /dev/termination-log. Cannot be updated.

  terminationMessagePolicy	<string>
    Indicate how the termination message should be populated. File will use the
    contents of terminationMessagePath to populate the container status message
    on both success and failure. FallbackToLogsOnError will use the last chunk
    of container log output if the termination message file is empty and the
    container exited with an error. The log output is limited to 2048 bytes or
    80 lines, whichever is smaller. Defaults to File. Cannot be updated.
    
    Possible enum values:
     - `"FallbackToLogsOnError"` will read the most recent contents of the
    container logs for the container status message when the container exits
    with an error and the terminationMessagePath has no contents.
     - `"File"` is the default behavior and will set the container status
    message to the contents of the container's terminationMessagePath when the
    container exits.

  tty	<boolean>
    Whether this container should allocate a TTY for itself, also requires
    'stdin' to be true. Default is false.

  volumeDevices	<[]VolumeDevice>
    volumeDevices is the list of block devices to be used by the container.

  volumeMounts	<[]VolumeMount>
    Pod volumes to mount into the container's filesystem. Cannot be updated.

  workingDir	<string>
    Container's working directory. If not specified, the container runtime's
    default will be used, which might be configured in the container image.
    Cannot be updated.


pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl config set-context --current --namespace=challenge2
Context "minikube" modified.
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl apply -f ~/challenges/02/deployment.yml

deployment.apps/nginx-deployment created
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 

pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ cat ~/challenges/02/deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.24.0-alpine-slim
        ports:
        - containerPort: 80
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl get deployment
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           48s
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl apply -f ~/challenges/02/deployment.yml --dry-run=client

deployment.apps/nginx-deployment configured (dry run)
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl apply -f ~/challenges/02/deployment.yml --dry-run=server

deployment.apps/nginx-deployment unchanged (server dry run)
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl apply -f ~/challenges/02/deployment-error.yml --dry-run=server

The request is invalid: patch: Invalid value: "map[metadata:map[annotations:map[kubectl.kubernetes.io/last-applied-configuration:{\"apiVersion\":\"apps/v1\",\"kind\":\"Deployment\",\"metadata\":{\"annotations\":{},\"labels\":{\"app\":\"nginx\"},\"name\":\"nginx-deployment\",\"namespace\":\"challenge2\"},\"spec\":{\"replicas\":3,\"selector\":{\"matchLabels\":{\"app\":\"nginx\"}},\"template\":{\"metadata\":{\"labels\":{\"app\":\"nginx\"}},\"spec\":{\"containers\":[{\"image\":\"nginx:1.24.0-alpine-slim\",\"name\":\"nginx\",\"port\":[{\"containerPort\":80}]}]}}}}\n]] spec:map[template:map[spec:map[]]]]": strict decoding error: unknown field "spec.template.spec.containers[0].port"
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ kubectl diff -f ~/challenges/02/deployment-v2.yml

diff -u -N /tmp/LIVE-4073963260/apps.v1.Deployment.challenge2.nginx-deployment /tmp/MERGED-2351616738/apps.v1.Deployment.challenge2.nginx-deployment
--- /tmp/LIVE-4073963260/apps.v1.Deployment.challenge2.nginx-deployment	2026-06-20 05:24:14.919797841 +0000
+++ /tmp/MERGED-2351616738/apps.v1.Deployment.challenge2.nginx-deployment	2026-06-20 05:24:14.920797845 +0000
@@ -6,7 +6,7 @@
     kubectl.kubernetes.io/last-applied-configuration: |
       {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{},"labels":{"app":"nginx"},"name":"nginx-deployment","namespace":"challenge2"},"spec":{"replicas":3,"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"image":"nginx:1.24.0-alpine-slim","name":"nginx","ports":[{"containerPort":80}]}]}}}}
   creationTimestamp: "2026-06-20T05:22:22Z"
-  generation: 1
+  generation: 2
   labels:
     app: nginx
   name: nginx-deployment
@@ -15,7 +15,7 @@
   uid: d1d35bd6-e2bd-49b6-9686-0938b6b0a548
 spec:
   progressDeadlineSeconds: 600
-  replicas: 3
+  replicas: 2
   revisionHistoryLimit: 10
   selector:
     matchLabels:
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
pslearner@ip-172-31-24-55:~$ 
```


