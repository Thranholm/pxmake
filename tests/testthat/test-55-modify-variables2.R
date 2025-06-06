test_that('variables 2 is modified', {
  x <-
    'BEXSTA' %>%
    get_data_path() %>%
    readRDS() %>%
    px()

  expect_identical(px_domain(x), NULL)
  expect_identical(px_elimination(x), NULL)
  expect_identical(px_map(x), NULL)

  domain_str <- "aggregation list"

  x2 <- px_domain(x, domain_str)

  domain_df1 <- tibble::tribble(~`variable-code`,            ~domain,
                                "place of birth", "aggregation list",
                                "gender",         "aggregation list",
                                "time",           "aggregation list"
                                )

  expect_identical(px_domain(x2), domain_df1)

  x3 <- px_languages(x, c('da', 'en'))
  expect_identical(px_domain(x3), NULL)

  x4 <- px_domain(x3, domain_str)
  expect_identical(px_domain(x4) %>% dplyr::arrange(`variable-code`),
                   tidyr::crossing(domain_df1, language = c("en", "da")) %>%
                     dplyr::relocate(domain, .after = last_col())
                   )

  domain_df2 <- dplyr::tibble(`variable-code` = "time",
                              language = c("da", "en"),
                              domain = c("aggregation list1",
                                         "aggregation list2"
                                         )
                              )

  x5 <- px_domain(x3, domain_df2)
  expect_identical(px_domain(x5), domain_df2)

  domain_df2 <- dplyr::tibble(`variable-code` = "gender",
                              language = c("en"),
                              domain = c("aggregation list1")
                              )

  x6 <- px_domain(x3, domain_df2)
  expect_identical(px_domain(x6), domain_df2)

  x7 <- px_domain(x5, NULL)
  expect_identical(px_domain(x7), NULL)


  variable_label_df <- dplyr::tribble(~`variable-code`,  ~`variable-label`,
                                      "place of birth",       "birthplace",
                                      "gender",                      "sex",
                                      "time",                       "year",
                                      "persons",                   "count"
                                      )

  x8 <- px_variable_label(x, variable_label_df)

  expect_identical(px_variable_label(x8), variable_label_df)

  map_df <- dplyr::tribble(~`variable-code`, ~`map`,
                           "time",            "not really a map, just an example"
                           )

  x9 <- px_map(x, map_df)

  expect_identical(px_map(x9), map_df)

  # px_elimination only sets for STUB/HEADING, not figures
  x10 <- px_elimination(x, "T")

  expect_identical(px_elimination(x10),
                   dplyr::tribble(~`variable-code`, ~elimination,
                                  "place of birth",          "T",
                                  "gender",                  "T",
                                  "time",                    "T"
                                  )
                   )
})
