variable "vpc-cidr01" {
  description = "vpc cidr block 1"
  type        = string
  default     = "10.0.0.0/16"
}

variable "publsub001" {
  description = "public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "publsub002" {
  description = "public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "publsub003" {
  description = "public subnet 3"
  type        = string
  default     = "10.0.3.0/24"
}

variable "privasub001" {
  description = "private subnet 1"
  type        = string
  default     = "10.0.4.0/24"
}

variable "privasub002" {
  description = "private subnet 2"
  type        = string
  default     = "10.0.5.0/24"
}

variable "privasub003" {
  description = "private subnet 3"
  type        = string
  default     = "10.0.6.0/24"
}

variable "Ami-id1" {
  description = "Ami id 1"
  type        = string
  default     = "ami-0fc15d50d39e4503c"
}




