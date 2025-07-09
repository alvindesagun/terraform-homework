# Define a locals variable for the list of blackpink and twice users
locals {
  blackpink_users = [
    "jenny",
    "rose",
    "lisa",
    "jisoo"
  ]
  twice_users = [
    "jihyo",
    "sana",
    "momo",
    "dahyun"
  ]
}

# Create blink IAM users using a for_each loop
resource "aws_iam_user" "blackpink" {
  for_each = toset(local.blackpink_users)
  name     = each.key
}

resource "aws_iam_user" "twwice" {
  for_each = toset(local.twice_users)
  name     = each.key
}

# Create twice IAM group blacpink and twice
resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group" "twice" {
  name = "twice"
}

# Add the users to each group
resource "aws_iam_group_membership" "blackpink" {
  name  = "blackpink-group"
  group = aws_iam_group.blackpink.name
  users = local.blackpink_users
}

resource "aws_iam_group_membership" "twice" {
  name  = "twice-group"
  group = aws_iam_group.twice.name
  users = local.twice_users
}