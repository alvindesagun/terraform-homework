# import manually created users to terraform state 
import {
  to = aws_iam_user.miyeon
  id = "miyeon"
}

import {
  to = aws_iam_user.mina
  id = "mina"
}

# create mina and miyeon resources
resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}

resource "aws_iam_user" "mina" {
  name = "mina"
}

# add the users to each group
resource "aws_iam_group_membership" "miyeon" {
  name  = "blackpink"
  group = aws_iam_group.blackpink.name
  users = [aws_iam_user.miyeon.name]
}

resource "aws_iam_group_membership" "mina" {
  name  = "twice"
  group = aws_iam_group.twice.name
  users = [aws_iam_user.mina.name]
}
