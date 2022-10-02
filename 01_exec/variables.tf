variable "prefix" {
  type        = string
  default     = "miyohide"
  description = "全てのリソースにつける接頭辞"
}

variable "location" {
  type        = string
  default     = "japaneast"
  description = "リソースのリージョン"
}

variable "filesharename" {
  type        = string
  default     = "sftpfileshare"
  description = "FileShareの名前"
}

variable "sftpuser" {
  type        = string
  default     = "sftpuser001"
  description = "SFTPのユーザ"
}

variable "sftppassword" {
  type        = string
  description = "SFTPのパスワード"
}
