resource "aws_iam_policy" "ec2_rds_access" {
  name = "ec2_rds_access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "rds-db:connect",
        ]
        Resource = [
          aws_db_instance.two-tier-db-1.arn,
        ]
      },
    ]
  })
}