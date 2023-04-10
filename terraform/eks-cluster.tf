module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "demo-cluster"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true

    tags = {
        environment = "development"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 2
            desired_size = 1

            instance_types = ["t2.small"]
        }
    }
}
