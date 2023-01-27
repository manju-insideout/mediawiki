data "template_file" "dockerfile" {
  template = file("Dockerfile.tpl")
  vars = {
    image_name = var.image_name
  }
}

resource "docker_image" "image" {
  name = "${var.image_name}:${var.image_tag}"
  build {
    context = "."
    args = {
      IMAGE_NAME = var.image_name
    }
    dockerfile = data.template_file.dockerfile.rendered
  }
  push = true
}