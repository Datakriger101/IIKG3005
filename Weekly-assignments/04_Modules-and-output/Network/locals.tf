#locals {
#  subnet_count = 2
#  subnet_ids = tomap([for i in range(local.subnet_count) : tostring(i)])
#}