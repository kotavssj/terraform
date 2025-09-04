locals {
  type        = string
  default = "cart"
  final_name = "${var.project}-${var.environment}-${var.component}"
}
