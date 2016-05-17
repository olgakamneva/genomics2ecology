context("Test functional_association function")

data("families_Bf")
test_that("functional_association returns correct values", {
  expect_equal(functional_association(families1 = as.character(c(8, 4, 1, 5, 6, 7)), families2 = as.character(c(8, 2, 3, 6, 7)), 
                                 network = data.frame(node1 = as.character(c(8, 4, 4, 1, 1, 2, 5, 6)), node2 = as.character(c(4, 1, 2, 2, 5, 5, 3, 7)), weight = rep(1, 8))), 
               4/6)
  expect_equal(functional_association(families1 = families_Bf, families2 = families_Bf, 
                                 network = reference_network), 
               NA_integer_)
  
})

