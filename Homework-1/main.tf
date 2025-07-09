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
resource "aws_iam_user_group_membership" "miyeon" {
  user   = aws_iam_user.miyeon.name
  groups = [aws_iam_group.blackpink.name]
}

resource "aws_iam_user_group_membership" "mina" {
  user   = aws_iam_user.mina.name
  groups = [aws_iam_group.twice.name]
}
