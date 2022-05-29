
# rgstr=$(az vm list --query "[?tags.${{ env.VM_TAG_KEY }} == '${{ env.VM_TAG_VLAUE }}'].{Group:resourceGroup}" -o tsv)
# for vmrg in ${rgstr[@]}; do
#   echo "running command with $vmrg"
#   vmstr=$(az vm list -g $vmrg --query "[?tags.${{ env.VM_TAG_KEY }} == '${{ env.VM_TAG_VLAUE }}'].{Name:name}" -o tsv)
#   for vm in ${vmstr[@]}; do
#     echo "Starting Azure VM $vm"
#     az vm start -g $vmrg -n $vm
#   done  
# done

        krgstr=$(az aks list --query "[?tags.foo == 'bar'].{Group:resourceGroup}" -o tsv)
        for krg in ${krgstr[@]}; do
          echo "running command with ResourceGroup $krg"
          kclusterstr=$(az aks list -g $krg --query "[?tags.foo == 'bar'].{Name:name}" -o tsv)
          echo "cluster found $kclusterstr"
          for kcluster in ${kclusterstr[@]}; do
            echo "Starting Azure AKS $kcluster"
            az aks start -g $krg -n $kcluster
          done  
        done