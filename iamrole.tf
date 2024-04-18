resource "aws_iam_role" "ec2_rds_role" {
  name = "ec2_rds_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_rds_policy_attachment" {
  role       = aws_iam_role.ec2_rds_role.name
  policy_arn = aws_iam_policy.ec2_rds_access.arn
}