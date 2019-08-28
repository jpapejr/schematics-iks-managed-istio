resource "null_resource" "addons" {

    provisioner "local-exec" {
        environment = {
            IBMCLOUD_COLOR=false
        }
        command = <<EOT
        ibmcloud login -c ${var.account_id} --apikey ${var.ibm_cloud_api_key} -g ${var.resource_group} -r ${var.region} \
        && ibmcloud ks cluster-addon-enable istio --cluster ${var.cluster_name} \
        && ibmcloud ks cluster-addon-enable istio-extras --cluster ${var.cluster_name} \
        && ibmcloud ks cluster-addon-enable istio-sample-bookinfo --cluster ${var.cluster_name} 
        EOT
    }
  
}
