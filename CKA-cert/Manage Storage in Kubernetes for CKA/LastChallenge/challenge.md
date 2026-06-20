The Last Challenge
Welcome to the Final Challenge!

This is your last chance to experiment in the environment. Clicking Finish Lab will end this little world that flittered into existence just for you.

Take this opportunity to try new things. Don't be afraid to break anything; be curious!

Here are some things to try out:

Create a PVC (new-pvc) using your hostPath Storage Class. Ensure the CSI automatically provisions the PV.
Using the kubectl -it command, connect to the verify-data-pod and add a new line in the /mnt/data/challenge4.txt file. Delete both the Pod and the restored-pvc PVC. Deploy again the ~/challenges/04/pvc-restored.yml PVC and the ~/challenges/04/pod-read.yml Pod. After the restore, is the new entry you just added in the file? (it will not because you used an old snapshot).
Perform the same steps as before but take a Volume SnapShot before deleting the Pod and PVC. After the restore, is the new entry there now? (it should be there now).
You have unlimited power within this virtual world—take the time you need for unguided learning.

Related Courses and Labs:

Configuring and Managing Kubernetes Storage and Scheduling


