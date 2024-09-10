#!/bin/bash


# Variables

RAM=4096

DISK=64000

VM_NAME="Debian1"

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

    echo "Deleting VM: $VM_NAME"

    VBoxManage unregistervm $VM_NAME --delete

    echo "VM $VM_NAME deleted successfully!"

}


list_vms() {

    VBoxManage list vms

}


start_vm() {

    echo "Starting VM: $VM_NAME"

    VBoxManage startvm $VM_NAME --type headless

}


stop_vm() {

    echo "Stopping VM: $VM_NAME"

    VBoxManage controlvm $VM_NAME acpipowerbutton

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
