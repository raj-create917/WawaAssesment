variable "name" {
  default     = "Default1"
  type        = string
  description = "Name of the VPC"
}

variable "project" {
  type        = string
  default = "assignment"
  description = "Name of project this VPC is meant to house"
}

variable "environment" {
  type        = string
  default = "prod"
  description = "Name of environment this VPC is targeting"
}

variable "region" {
  default     = "ap-south-1"
  type        = string
  description = "Region of the VPC"
}

variable "key_name" {
  type        = string
  default = "assignment-web"
  description = "EC2 Key pair name for the web"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["ap-south-1a", "ap-south-1b"]
  type        = list
  description = "List of availability zones"
}

variable "web_ami" {
  type        = string
  default = "ami-0cda377a1b884a1bc"  # Official ubuntu image
  description = "Amazon Machine Image (AMI) ID"
}

variable "web_ebs_optimized" {
  default     = true
  type        = bool
  description = "If true, the web instance will be EBS-optimized"
}

variable "web_instance_type" {
  default     = "t3.nano"
  type        = string
  description = "Instance type for web instance"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "web_sg_id" {
  type = string
}
