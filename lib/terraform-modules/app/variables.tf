variable "namespace" {
  type = string
  validation {
    condition     = can(regex("^[a-z-]+$", var.namespace))
    error_message = "Namespace name must be a word."
  }
}
