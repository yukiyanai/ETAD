## code to prepare `ETAD` dataset
##
## Created: 2023-05-06 Yuki Yanai

library(tidyverse)
library(countrycode)
library(lubridate)

D <- read_csv("data-raw/unprepared/etad_to2022_20230506.csv")

D2 <- D |>
  select(ccode:need2fix) |>
  rename(cowcode = ccode) |>
  mutate(iso3 = countrycode(cowcode,
                            origin = "cown",
                            destination = "iso3c")) |>
  mutate(etype2 = ifelse(etype2 == "president",
                         "presidential",
                         "legislative")) |>
  mutate(etype3 = case_when(
    etype3 == "LH" ~ "lower house",
    etype3 == "UH" ~ "upper house",
    etype3 == "President" ~ "presidential")) |>
  rename(parliamentarism = binary_system_cp) |>
  mutate(parliamentarism = ifelse(parliamentarism == "presidentialism", 0L, 1L)) |>
  mutate(parliamentarism = factor(parliamentarism,
                                  levels = 0 : 1,
                                  labels = c("presidentialism",
                                             "parliamentarism"))) |>
  rename(timing1 = timing,
         timing2 = timing_tri) |>
  mutate(sche_year = year(sche_date),
         sche_month = month(sche_date),
         sche_wday = wday(sche_date, label = TRUE, abbr = FALSE)) |>
  mutate(held_year = year(held_date),
         held_month = month(held_date),
         held_wday = wday(held_date, label = TRUE, abbr = FALSE)) |>
  mutate(sche_date = as.Date(sche_date, format = "%Y-%m-%d"),
         held_date = as.Date(held_date, format = "%Y-%m-%d")) |>
  mutate(dif_days = as.integer(held_date - sche_date)) |>
  mutate(new_reason = case_when(
    reason == 0 ~ 0L,
    reason %in% c(6, 8) ~ 1L,
    reason == 7 ~ 2L,
    reason == 1 ~ 3L,
    reason == 3 ~ 4L,
    reason == 2 ~ 5L,
    reason == 4 ~ 6L,
    reason == 5 ~ 9L)) |>
  select(!reason) |>
  rename(reason = new_reason)

# reasonの元コード
#1. クーデタ
#2. 指導者の暗殺
#3. 指導者の自然死
#4. 内戦
#5. その他
#6. 新国家樹立
#7. 選挙の無効に伴う再選挙
#8. 新憲法下の第1回選挙（6に統合してもいいかもしれません）

# reason の変換後のコード
#0.選挙タイミングの変更なし
#1. 新憲法制定 or 新国家樹立
#2. 選挙の無効に伴う再選挙
#3. クーデタ
#4. 指導者の自然死
#5. 指導者の暗殺
#6. 内戦
#9. その他


D3 <- D2 |>
  group_by(iso3, etype3) |>
  mutate(lag_held_date = lag(held_date)) |>
  mutate(days_fr_last = as.numeric(held_date - lag_held_date))


ETAD <- D3 |>
  select(cowcode, iso3, country,
         etype2, etype3, parliamentarism,
         timing1, timing2, reason,
         held_date, held_year, held_month, held_wday,
         sche_date, sche_year, sche_month, sche_wday,
         dif_days, termlength, days_fr_last)

# Run the following to update the dataset.
usethis::use_data(ETAD, overwrite = TRUE)


# To save the data in other formats


