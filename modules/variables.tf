variable "ENVIRONMENT" {
  default = "$default"
}

variable "ROLE_ARN_TEST" {
    default = "arn:aws:iam::464254169442:role/centralpoint-cdk-vpcutils-centralpointCdkOnOffGate-IFTGGP5AGZGB"

}
variable "ROLE_ARN_ACCEPTANCE" {
  default = "Arn:aws:iam::825787848197:role/centralpoint-cdk-vpcutils-centralpointCdkOnOffGate-1MPP8VBA13FVG"
}

variable "REGION" {
  default = "us-west-2"
}

variable "name" {
  default = "authorizerPassword"

}