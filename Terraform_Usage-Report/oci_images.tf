variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = set(string)
  }))

  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaa5isv2ihezburdxcqig6gpamcepaipo4ymq6dyeaghnrlm6rnv3la"
      is_pricing_associated = false
      compatible_shapes = ["VM.Standard2.1","VM.Standard.E2.1","VM.Standard.E2.1.Micro"]
    }
  }
}