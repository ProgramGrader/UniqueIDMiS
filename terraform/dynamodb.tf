resource "aws_dynamodb_table" "UniqueIDMS" {

  name     = "UniqueIDMS"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "ms-name"
    type = "S"
  }

  attribute {
    name = "ULID"
    type = "S"
  }

  hash_key = "ms-name"
  range_key = "ULID"
}


// TODO need to create custom tests with fake values in these tables in tftests
// Test all dynamo functions in tftest
#resource "aws_dynamodb_table_item" "ms_list" {
#  hash_key   = aws_dynamodb_table.UniqueIDMS.hash_key
#  range_key = aws_dynamodb_table.UniqueIDMS.range_key
#  table_name = aws_dynamodb_table.UniqueIDMS.name
#  item = <<ITEM
#    {
#      "ms-name": {"S": "list"},
#      "ULID": {"S": "list"},
#      "expiredTime": {"S": "list"},
#      "list": {"L": [{"S":"Microservice1"},{"S":"Microservice2"}]}
#    }
#    ITEM
#}

resource "aws_dynamodb_table_item" "ms_list" {
  hash_key   = aws_dynamodb_table.UniqueIDMS.hash_key
  range_key = aws_dynamodb_table.UniqueIDMS.range_key
  table_name = aws_dynamodb_table.UniqueIDMS.name
  item = <<ITEM
    {
       "ms-name": {"S": "list"},
       "ULID": {"S": "list"},
       "expirationDate": {"S": "list"},
       "list": {"L": []}
    }
    ITEM
}

