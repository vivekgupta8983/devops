variable "users" {
  type = list(string)
  default = [ "user-001", "user-09", "user-05", "user-00", "user-01", "user-02", "user-03", "user-04"]
}

resource "aws_iam_user" "name" {
    for_each = toset(var.users)
    name = each.key
    path = "/"

    tags = {
      Name = each.key
      # Env = "Dev"
    }

    lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}