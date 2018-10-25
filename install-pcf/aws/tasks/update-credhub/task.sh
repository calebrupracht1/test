#!/bin/bash
echo "Untarring credhub cli"
tar -zxvf credhub-cli-tarball/*.tgz

echo $'Targeting concourse credhub\n'
export CREDHUB_SERVER="https://concourse.vi2e.io:8844"
export CREDHUB_CLIENT=concourse_to_credhub
export CREDHUB_SECRET="$CONCOURSE_CREDHUB_SECRET"
export CREDHUB_CA_CERT="$CONCOURSE_CREDHUB_CA_CERT"

./credhub login




echo $'Updating credhub values for BBR\n'

aws_access_key_id=`terraform state show -state terraform-state/terraform.tfstate aws_iam_access_key.pcf_iam_user_access_key | grep ^id | awk '{print $3}'`
access_key_id_name="/concourse/$FOUNDATION_NAME/bbr_access_key_id"

if [ `./credhub find | grep $access_key_id_name | awk '{print $3}'` == $access_key_id_name ]; then
  #statements
  echo "Deleting existing access key id"
  ./credhub delete -n $access_key_id_name
fi
echo $'Setting access key id\n'
./credhub set --type value --name $access_key_id_name --value $aws_access_key_id




aws_secret_access_key=`terraform state show -state terraform-state/terraform.tfstate aws_iam_access_key.pcf_iam_user_access_key | grep ^secret | awk '{print $3}'`
secret_access_key_name="/concourse/$FOUNDATION_NAME/bbr_secret_access_key"
if [ `./credhub find | grep $secret_access_key_name | awk '{print $3}'` == $secret_access_key_name ]; then
  #statements
  echo "Deleting existing secret access key"
  ./credhub delete -n $secret_access_key_name
fi
echo "Setting secret access key"
./credhub set --type value --name $secret_access_key_name --value $aws_secret_access_key
