#' ETAD data
#'
#' Election Timing across Autocracy and Democracy:
#' A dataset of national election dates since 1946
#'
#' @format ## `ETAD`
#' A data frame with 3,099 rows and 19 columns:
#' \describe{
#'   \item{cowcode}{COW ([Correlates of War](https://correlatesofwar.org/)) country code}
#'   \item{iso3}{3 letter ISO country code}
#'   \item{country}{Country name}
#'   \item{etype2}{Binary variable indicating the election type: "presidential" or "legislative"}
#'   \item{etype3}{Trichotomous variable indicating the election type: "presidential", "lower house", or "upper house. The current version does not contain "upper house" elections.}
#'   \item{parliamentarism}{Dummy indicating the parliamentary system. This is a "factor" variable where `0` is labeled as "presidentialism" and `1` as "parliamentarism". }
#'   \item{timing1}{Trichotomous variable showing election timing. `1` = held as scheduled, `2` = early or delayed election, and `3` = cannot tell if an election was held as scheduled or not.}
#'   \item{timing2}{Trichotomous variable showing election timing. `-1` = an early election, `0` = on-schedule election, and `1` = delayed election. `NA` if `timing1` == 3.}
#'   \item{reason}{Categorical variable showing the reasons for the election-timing change. `0` = no change, `1` = the first election under the new constitution or for the new state, `2` = re-election due to an invalid election, `3` = coup, `4` = natural death of the leader, `5` = the leader was assassinated, `6` = civil war, `7` = no-confidence, `9` = other.}
#'   \item{held_date}{Date when the election was held.}
#'   \item{held_year}{Year when the election was held.}
#'   \item{held_month}{Month when the election was held.}
#'   \item{held_wday}{Day of the week when the election was held.}
#'   \item{sche_date}{Date when the election was originally scheduled.}
#'   \item{sche_year}{Year when the election was originally scheduled.}
#'   \item{sche_month}{Month when the election was originally scheduled.}
#'   \item{sche_wday}{Day of the week when the election was originally scheduled.}
#'   \item{dif_days}{Difference in days between `held_date` and `sche_date`. A negative value means the election was held earlier than scheduled, and a positive means it was delayed.}
#'   \item{termlength}{Term length in year.}
#'   \item{days_fr_last}{Number of days elapsed since the last election.}
#'   \item{concurrent}{Dummy variable indicating that the legislative and presidential elections were held on the same day.}
#' }
#' @source Created by Masaaki Higashijima, Naoki Shimizu, Hidekuni Washida, and Yuki Yanai.
#'
#' @examples
#' data(ETAD)
#'
"ETAD"
