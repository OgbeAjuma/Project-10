resource "aws_ecs_service" "ecs-serv10" {
  name            = "project10"
  cluster         = aws_ecs_cluster.ecs_cluster-project10.id
  task_definition = aws_ecs_task_definition.ecs-taskdefin.arn
  desired_count   = 2
}
