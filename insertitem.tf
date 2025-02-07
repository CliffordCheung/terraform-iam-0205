resource "aws_dynamodb_table_item" "item1" {
    table_name = var.db_table_name
    hash_key = var.primary_key
    range_key = var.secondary_key
  
    for_each = {
        "978-0134685991" = {
            genre = "Technology"
            title = "Effective Java"
            author = "Joshua Bloch"
            stock = "1"
        }
        "978-0134685009" = {
            genre = "Technology"
            title = "Learning Python"
            author = "Mark Lutz"
            stock = "2"
        }
        "974-0134789698" = {
            genre = "Fiction"
            title = "The Hitchhiker"
            author = "Douglas Adams"
            stock = "10"
        }
        "982-01346653457" = {
            genre = "Fiction"
            title = "Dune"
            author = "Frank Herbert"
            stock = "8"
        }
        "978-01346854325" = {
            genre = "Technology"
            title = "System Design"
            author = "Mark Lutz"
            stock = "0"
        }
    }
    item = <<ITEM
     {
        "ISDN": {"S": "${each.key}"},
        "Genre": {"S": "${each.value.genre}"},
        "Title": {"S": "${each.value.title}"},
        "Author": {"S": "${each.value.author}"},
        "Stock": {"N": "${each.value.stock}"}
    }
    ITEM 
    depends_on = [ module.dynamodb_table ]
}
