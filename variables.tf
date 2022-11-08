variable "ec2_type_app" {
  type        = string
  default     = null
  description = "Define the instance type to use"
}

variable "count_app_instances" {
  description = "Set the number of app instances to create"
  type        = number
  default     = 1
}

variable "asg_app_min_size" {
  description = "Set the minimum number of app instances to create in autoscaling group"
  type        = number
  default     = 1
}

variable "asg_app_max_size" {
  description = "Set the maximum number of app instances to create in autoscaling group"
  type        = number
  default     = 1
}

variable "asg_app_desired_cappacity" {
  description = "Set the desired number of app instances to create in autoscaling group"
  type        = number
  default     = 1
}

variable "app_name" {
  description = "Set the application name"
  type        = string
}

variable "environment" {
  description = "Define which environment to use"
  type        = string
}

variable "external_ip" {
  description = "Set your external IP, use default 0.0.0.0/0 for access from everywhere"
  type        = string
  default     = "0.0.0.0/0"
}

variable "override_cluster_resources" {
  description = "Defines if cluster resources should be created"
  type        = bool
  default     = false
}
