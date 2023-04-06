# resource "google_firestore_document" "sub_document" {
#   project     =var.project_id
#   collection  = "${google_firestore_document.mydoc.path}/subdocs"
#   document_id = "bitcoinkey"
#   fields      = "{\"parameters\":{\"mapValue\":{\"fields\":{\"ayo\":{\"stringValue\":\"val2\"}}}}}"
# }

# resource "google_firestore_document" "sub_sub_document" {
#   project     = var.project_id
#   collection  = "${google_firestore_document.sub_document.path}/subsubdocs"
#   document_id = "asecret"
#   fields      = "{\"parameters\":{\"mapValue\":{\"fields\":{\"secret\":{\"stringValue\":\"hithere\"}}}}}"
# }