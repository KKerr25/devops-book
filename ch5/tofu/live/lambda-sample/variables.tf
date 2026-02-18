variable "name" {
  description = "The base name for the function and all other resources"
  type        = string
  default     = "lambda-sample"
}

variable "src_dir" {
  type = string
}

variable "runtime" {
  type = string
}

variable "handler" {
  type = string
}

variable "memory_size" {
  type = number
}

variable "timeout" {
  type = number
}

variable "environment_variables" {
  type = map(string)
}

variable "create_url" {
  type    = bool
  default = false
}