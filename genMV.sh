#!/bin/bash

# Variables
RAM=4096
DISK=64000

# Demander à l'utilisateur de spécifier le nombre de VM à créer
read -p "Entrez le nombre de VM : " num_vms

# Préfixe du nom des VM
prefix="Debian"

# Boucle pour créer les VM
for i in $(seq 1 $num_vms); do
    VM_NAME="${prefix}${i}"

    OS_TYPE="Debian_64"
    NIC_TYPE="nat"

    # Fonctions

    create_vm() {
        echo "Creating VM: $VM_NAME"
        VBoxManage createvm --name $VM_NAME --ostype $OS_TYPE --register
        VBoxManage modifyvm $VM_NAME --memory $RAM --nic1 $NIC_TYPE --boot1 net
        VBoxManage createhd --filename "$VM_NAME.vdi" --size $DISK
        VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
        VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"
        echo "VM $VM_NAME created successfully!"
    }

    delete_vm() {
        read -p "Entrez le nom de la VM a supprimer : " VM_Delete
        echo "Deleting VM: $VM_Delete"
        VBoxManage unregistervm $VM_Delete --delete
        echo "VM $VM_Delete deleted successfully!"
    }

    list_vms() {
        VBoxManage list vms
    }

    start_vm() {
        read -p "Entrez le nom de la VM a démarrer : " VM_Start
        echo "Starting VM: $VM_Start"
        VBoxManage startvm $VM_Start --type headless
    }

    stop_vm() {
        read -p "Entrez le nom de la VM a stopper : " VM_Stop
        echo "Stopping VM: $VM_Stop"
        VBoxManage controlvm $VM_Stop acpipowerbutton
    }

    # Main Script
    case $1 in
        N) create_vm ;;
        S) delete_vm ;;
        L) list_vms ;;
        D) start_vm ;;
        A) stop_vm ;;
        *) echo "Invalid option. Use N (New), S (Delete), L (List), D (Start), A (Stop)" ;;
    esac

done
