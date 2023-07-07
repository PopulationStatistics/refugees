#' Population figures
#'
#' UNHCR data on displacement at the end of the year.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{refugees}{The number of refugees.}
#'  \item{asylum_seekers}{The number of asylum-seekers.}
#'  \item{returned_refugees}{The number of returned refugees.}
#'  \item{idps}{The number of internally displaced persons.}
#'  \item{returned_idps}{The number of returned internally displaced persons.}
#'  \item{stateless}{The number of stateless persons.}
#'  \item{ooc}{The number of others of concern to UNHCR.}
#'  \item{oip}{The number of other people in need of international protection.}
#'  \item{hst}{The number of host community members.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' population
"population"

#' Demographics
#'
#' Demographic and sub-national data, where such disaggregation is available.
#' UNHCR collects this information for all population types, as well as two durable solutions (returned IDPs and refugees).
#' Demographics are also available for IDMC and UNRWA datasets.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{pop_type}{The three character code specifying the population type (e.g. \code{REF} for refugees, \code{ASY} for asylum-seekers etc).}
#'  \item{location}{The textual description of the location.}
#'  \item{loc_type}{An indication of whether the location is urban or rural. An urban location is classified as a settlement with more than 5,000 inhabitants. It can be one of the following values: \code{C} – Camp. Note that \code{C} was discontinued after 2010, at which point the accommodation type became available, \code{U} – Urban, \code{R} – Rural, \code{V} - Various/unknown}
#'  \item{acc_type}{Accommodation Type became available in 2010 but is only populated from 2012. The code represents one of: \code{I} - Individual accommodation, \code{S} - Self-settled camp, \code{P} - Planned/managed camp, \code{C} - Collective centre, \code{R} - Reception/transit camp, \code{U} - Undefined}
#'  \item{f_0_4}{The number of female children aged 0 to 4 inclusive.}
#'  \item{f_5_11}{The number of female children aged 5 to 11 inclusive.}
#'  \item{f_12_17}{The number of female children aged 12 to 17 inclusive.}
#'  \item{f_18_59}{The number of female adults aged 18 to 59 inclusive.}
#'  \item{f_60}{The number of female adults aged 60 or more.}
#'  \item{f_other}{The number of females for whom age disaggregation is unavailable.}
#'  \item{f_total}{The total number of females (where disaggregation by sex is available).}
#'  \item{m_0_4}{The number of male children aged 0 to 4 inclusive.}
#'  \item{m_5_11}{The number of male children aged 5 to 11 inclusive.}
#'  \item{m_12_17}{The number of male children aged 12 to 17 inclusive.}
#'  \item{m_18_59}{The number of male adults aged 18 to 59 inclusive.}
#'  \item{m_60}{The number of male adults aged 60 or more.}
#'  \item{m_other}{The number of males for whom age disaggregation is unavailable.}
#'  \item{m_total}{The total number of males (where disaggregation by sex is available).}
#'  \item{total}{The total number of persons.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' demographics
"demographics"

#' Asylum Applications
#'
#' Asylum claims submitted by year and countries of asylum and origin.
#' Claims are submitted by asylum applicants and are applications for international protection.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{procedure_type}{The procedure type describes the authority with whom the asylum claim was lodged.
#'  It can be one of: \code{G} – Government, \code{J} - Joint, \code{U} – UNHCR.}
#'  \item{app_type}{The application type describes the stage of the procedure.
#'  Common values are \code{N} (New), \code{R} (Repeat) and \code{A} (Appeal).}
#'  \item{dec_level}{The decision level provides more detail of the stage of the procedure.
#'  Common values are \code{NA} (New applications), \code{RA} (repeat/reopened applications) and
#'  \code{AR} (administrative review).}
#'  \item{app_pc}{The data type describes whether the data provided reflects cases or persons.
#'  The most common situation is for the data on asylum applications lodged to reflect persons,
#'  but in certain situations (e.g USA), the data provided by governments is at the level of cases.
#'  A case can contain information on one or more persons.}
#'  \item{applied}{The total number of asylum claims for the given dataset.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' asylum_applications
"asylum_applications"

#' Asylum Decisions
#'
#' Decisions taken on asylum claims by year and countries of asylum and origin.
#' Asylum claims are applications for international protection and
#' decisions on asylum claims can be positive, negative or otherwise closed.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{procedure_type}{The procedure type describes the authority with whom the asylum claim was lodged.
#'  It can be one of: \code{G} – Government, \code{J} - Joint, \code{U} – UNHCR.}
#'  \item{dec_level}{The decision level provides more detail of the stage of the procedure.
#'  Common values are \code{NA} (New applications), \code{RA} (repeat/reopened applications) and
#'  \code{AR} (administrative review).}
#'  \item{dec_pc}{The data type describes whether the data provided reflects cases or persons.
#'  The most common situation is for the data on asylum applications lodged to reflect persons,
#'  but in certain situations (e.g USA), the data provided by governments is at the level of cases.
#'  A case can contain information on one or more persons.}
#'  \item{dec_recognized}{The number of asylum applicants recognised as refugees under UNHCR’s mandate.}
#'  \item{dec_other}{The number of asylum applicants recognised as refugees under other forms of complementary protection.}
#'  \item{dec_rejected}{The number of asylum applicants whose asylum claims have been rejected.}
#'  \item{dec_closed}{The number of asylum applicants whose asylum claims have been otherwise closed.}
#'  \item{dec_total}{The total number of asylum applicants for which a decision on their asylum claim
#'  has been made in the given reference period.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' asylum_decisions
"asylum_decisions"

#' Solutions
#'
#' Data on solutions record those refugees and IDPs that have availed a durable solution.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{returned_refugees}{The number of refugee returnees.}
#'  \item{resettlement}{The number of resettlement arrivals.}
#'  \item{naturalisation}{The number of refugees that have naturalised.}
#'  \item{returned_idps}{The number of IDP returnees.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' solutions
"solutions"

#' IDMC Data
#'
#' Data on Internally displaced persons due to conflict and violence
#' that is produced by the \href{https://www.internal-displacement.org/}{Internal Displacement Monitoring Centre}.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{total}{The total number of internally displaced persons due to conflict and violence.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' idmc
"idmc"

#' UNRWA data
#'
#' Data on Palestine refugees registered under \href{https://www.unrwa.org/}{UNRWA}’s mandate.
#'
#' See the notes on the data structure in the
#' \href{https://www.unhcr.org/refugee-statistics/methodology/}{methodology pages} for more details.
#'
#' @format A tibble.
#' \describe{
#'  \item{year}{The year (e.g. 2020).}
#'  \item{coo_name}{Country of origin name.}
#'  \item{coo}{Country of origin UNHCR code.}
#'  \item{coo_iso}{Country of origin ISO code.}
#'  \item{coa_name}{Country of asylum name.}
#'  \item{coa}{Country of asylum UNHCR code.}
#'  \item{coa_iso}{Country of asylum ISO code.}
#'  \item{total}{The total number of Palestine refugees registered under UNRWA’s mandate.}
#' }
#' @source \href{https://www.unhcr.org/refugee-statistics/}{UNHCR Refugee Data Finder}.
#' @examples
#' unrwa
"unrwa"
