resource "null_resource" "addons" {

    provisioner "local-exec" {
        environment = {
            IBMCLOUD_COLOR=false
        }
        command = <<EOT
        ibmcloud ks cluster-addon-enable istio --cluster ${var.cluster_name} \
        ibmcloud ks cluster-addon-enable istio-extras --cluster ${var.cluster_name} \
        ibmcloud ks cluster-addon-enable istio-sample-bookinfo --cluster ${var.cluster_name} 
        EOT
    }
  
}
