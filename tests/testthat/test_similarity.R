context("Test for similarity_by_set")

test_that("similarity_by_set returns correct values", {
  expect_equal(similarity_by_set(gene_sets1 = list(c(1, 0, 1, 0, 1, 1, 0, 0), c(1, 1, 1, 0, 0, 0), c(1, 1, 1, 1, 1, 1), c(0, 0, 0), c(1, 1, 1), c(1, 1, 1), c(1, 0, 0)), 
                                gene_sets2 = list(c(1, 1, 0, 0, 0, 1, 1, 0), c(0, 0, 0, 1, 1, 1), c(1, 1, 1, 0, 0, 0), c(0, 0, 0), c(0, 0, 0), c(1, 1, 1), c(1, 0, 0))), 
              data.frame(gene_set = c(1:7), index = c(0.5, 0, 0.5, 1, 0, 1, 1), set_size = c(8, 6, 6, 3, 3, 3, 3), in_genome1 = c(4, 3, 6, 0, 3, 3, 1), in_genome2 = c(4, 3, 3, 0, 0, 3, 1)))
})


data("families_Bf")
sets_Bf = set_representation(families = families_Bf, gene_sets = reference_gene_sets)
test_that("similarity returns correct value", {
  expect_equal(similarity(gene_sets1 = list(c(1, 1, 1, 1, 1, 1, 1, 1), c(1, 1, 1, 1, 1, 1)), 
                          gene_sets2 = list(c(0, 0, 0, 0, 0, 0, 0, 0), c(0, 0, 0, 0, 0, 0)), 
                          threshold = 0.05), 0)
  
  expect_equal(similarity(gene_sets1 = list(c(0, 0, 0, 0, 0, 0, 0, 0), c(0, 0, 0, 0, 0, 0)), 
                          gene_sets2 = list(c(1, 1, 1, 1, 1, 1, 1, 1), c(1, 1, 1, 1, 1, 1)), 
                          threshold = 0.05), 0)
  
  expect_equal(similarity(gene_sets1 = list(c(1, 0, 1, 0, 1, 1, 0, 0), c(1, 1, 1, 0, 0, 0), c(1, 1, 1, 1, 1, 1), c(0, 0, 0), c(1, 1, 1), c(1, 1, 1), c(1, 0, 0)), 
                          gene_sets2 = list(c(1, 1, 0, 0, 0, 1, 1, 0), c(0, 0, 0, 1, 1, 1), c(1, 1, 1, 0, 0, 0), c(0, 0, 0), c(0, 0, 0), c(1, 1, 1), c(1, 0, 0)), 
                          threshold = 0.05), 0.5)
  
  expect_equal(similarity(gene_sets1 = sets_Bf, 
                          gene_sets2 = sets_Bf, threshold = 0.05), 1)
})


