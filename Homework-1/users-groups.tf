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
resource "aws_iam_user_group_membership" "blackpink" {
  for_each = toset(local.blackpink_users)
  groups   = [aws_iam_group.blackpink.name]
  user     = aws_iam_user.blackpink[each.key].name
}

resource "aws_iam_user_group_membership" "twice" {
  for_each = toset(local.twice_users)
  groups   = [aws_iam_group.twice.name]
  user     = aws_iam_user.twwice[each.key].name
}