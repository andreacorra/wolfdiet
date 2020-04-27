#' wolfdiet view
#'
#' @source this table compiles wolf diet from around the world - currently Eurasia.
#' @format A data frame with columns:
#' \describe{
#'  \item{diet_analysis_id}{Database identifier of the analysis used to calculate the diet}
#'  \item{world_country_description}{Country name}
#'  \item{wolf_population_code}{Wolf population code}
#'  \item{wolf_subspecies_code}{Wolf subspecies code}
#'  \item{study_area}{Location name of the study area}
#'  \item{pack}{Name of the wolf pack}
#'  \item{latitude}{Latitude of the study area centroid (SRID=4326)}
#'  \item{longitude}{Longitude of the study area centroid (SRID=4326)}
#'  \item{source_code}{Code for the type of samples used in the analyses}
#'  \item{analytical_method_code}Code for the analytical method}
#'  \item{identification_method_code}{Code for the identification method}
#'  \item{temporal_scale_code}{Code for the temporal scale}
#'  \item{derived_diet}{if TRUE, diet calculated using raw data in the article}
#'  \item{sample_size}{Total number of samples analysed in the diet analysis}
#'  \item{surface_area}{Surface of the study area (in squared km)}
#'  \item{sampling_period}{Sampling duration as text}
#'  \item{time_series}{Number of intervals (seasons or years) in the diet analysis}
#'  \item{spatial_effort}{Density of samples collected in the study area}
#'  \item{temporal_effort}{Average number of samples per interval}
#'  \item{total_effort}{Number of months in which the sampling was carried out}
#'  \item{"moose_alces alces"}{Frequency of the diet item}
#'  \item{"blackbuck_antilope cervicapra"}{Frequency of the diet item}
#'  \item{"american bison_bison bison"}{Frequency of the diet item}
#'  \item{"european bison_bison bonasus"}{Frequency of the diet item}
#'  \item{"yak_bos grunniens"}{Frequency of the diet item}
#'  \item{"cattle_bos taurus"}{Frequency of the diet item}
#'  \item{"nilgai_boselaphus tragocamelus"}{Frequency of the diet item}
#'  \item{"buffalo_bubalus bubalis"}{Frequency of the diet item}
#'  \item{"camel_camelus ferus"}{Frequency of the diet item}
#'  \item{"dog_canis familiaris"}{Frequency of the diet item}
#'  \item{"wolf_canis lupus"}{Frequency of the diet item}
#'  \item{"wild goat_capra aegagrus"}{Frequency of the diet item}
#'  \item{"goat_capra aegagrus hircus"}{Frequency of the diet item}
#'  \item{"markhor_capra falconeri"}{Frequency of the diet item}
#'  \item{"alpine ibex_capra ibex"}{Frequency of the diet item}
#'  \item{"siberian ibex_capra sibirica"}{Frequency of the diet item}
#'  \item{"roe deer_capreolus capreolus"}{Frequency of the diet item}
#'  \item{carnivorae_carnivorae}{Frequency of the diet item}
#'  \item{"elk_cervus elaphus canadensis"}{Frequency of the diet item}
#'  \item{"red deer_cervus elaphus elaphus"}{Frequency of the diet item}
#'  \item{"sika deer_cervus nippon"}{Frequency of the diet item}
#'  \item{"fallow deer_dama dama"}{Frequency of the diet item}
#'  \item{"donkey_equus africanus asinus"}{Frequency of the diet item}
#'  \item{"horse_equus ferus caballus"}{Frequency of the diet item}
#'  \item{"przewalski horse_equus ferus przewalskii"}{Frequency of the diet item}
#'  \item{"onager_equus hemionus"}{Frequency of the diet item}
#'  \item{"cat_felis catus"}{Frequency of the diet item}
#'  \item{"chinkara_gazella bennettii"}{Frequency of the diet item}
#'  \item{"goitered gazelle_gazella subgutturosa"}{Frequency of the diet item}
#'  \item{"crested porcupine_hystrix cristata"}{Frequency of the diet item}
#'  \item{"badger_meles meles"}{Frequency of the diet item}
#'  \item{"musk deer_moschus sp"}{Frequency of the diet item}
#'  \item{"raccoon dog_nyctereutes procyonoides"}{Frequency of the diet item}
#'  \item{"mule deer_odocoileus hemionus"}{Frequency of the diet item}
#'  \item{"black tailed deer_odocoileus hemionus columbianus"}{Frequency of the diet item}
#'  \item{"white tailed deer_odocoileus virginianus"}{Frequency of the diet item}
#'  \item{"mountain goat_oreamnos americanus"}{Frequency of the diet item}
#'  \item{"muskox_ovibos moschatus"}{Frequency of the diet item}
#'  \item{"argali_ovis ammon"}{Frequency of the diet item}
#'  \item{"sheep_ovis aries"}{Frequency of the diet item}
#'  \item{"bighorn_ovis canadensis"}{Frequency of the diet item}
#'  \item{"dall sheep_ovis dalli"}{Frequency of the diet item}
#'  \item{"snow sheep_ovis nivicola"}{Frequency of the diet item}
#'  \item{"mouflon_ovis orientalis"}{Frequency of the diet item}
#'  \item{"urial_ovis orientalis vignei"}{Frequency of the diet item}
#'  \item{"mongolian gazelle_procapra gutturosa"}{Frequency of the diet item}
#'  \item{"przewalski gazelle_procapra przewalskii"}{Frequency of the diet item}
#'  \item{"blue sheep_pseudois nayaur"}{Frequency of the diet item}
#'  \item{"wild reindeer_rangifer tarandus"}{Frequency of the diet item}
#'  \item{"chamois_rupicapra rupicapra"}{Frequency of the diet item}
#'  \item{"saiga_saiga tatarica"}{Frequency of the diet item}
#'  \item{"wild boar_sus scrofa"}{Frequency of the diet item}
#'  \item{"pig_sus scrofa domesticus"}{Frequency of the diet item}
#'  \item{"brown bear_ursus arctos"}{Frequency of the diet item}
#'  \item{"red fox_vulpes vulpes"}{Frequency of the diet item}
#'  \item{"wild artiodactyla_wild artiodactyla"}{Frequency of the diet item}
#'  \item{"wild bovidae_wild bovidae"}{Frequency of the diet item}
#'  \item{bird_bird}{Frequency of the diet item}
#'  \item{"castor sp_castor sp"}{Frequency of the diet item}
#'  \item{cervidae_cervidae}{Frequency of the diet item}
#'  \item{"domestic ungulata_domestic ungulata"}{Frequency of the diet item}
#'  \item{fish_fish}{Frequency of the diet item}
#'  \item{garbage_garbage}{Frequency of the diet item}
#'  \item{lagomorpha_lagomorpha}{Frequency of the diet item}
#'  \item{"marmota sp_marmota sp"}{Frequency of the diet item}
#'  \item{mesomammals_mesomammals}{Frequency of the diet item}
#'  \item{micromammals_micromammals}{Frequency of the diet item}
#'  \item{microrodents_microrodents}{Frequency of the diet item}
#'  \item{other_other}{Frequency of the diet item}
#'  \item{"other domestic ungulata_other domestic ungulata"}{Frequency of the diet item}
#'  \item{"semiaquatic rodentia_semiaquatic rodentia"}{Frequency of the diet item}
#'  \item{"undefined item_undefined item"}{Frequency of the diet item}
#'  \item{"vegetable fruit_vegetable fruit"}{Frequency of the diet item}
#'  \item{"responsible"}{responsible for collecting the information}
#'
#' }
#' @examples
#' \dontrun{
#'  wolfdiet
#' }
"wolfdiet"


#' lookup tables
#'
#' @source this table includes the full description of the codes used in the wolfdiet table.
#' @format A data frame with columns:
#' \describe{
#'  \item{lookup}{lookup table name}
#'  \item{code}{code}
#'  \item{description}{description of the code}
#'
#' }
#' @examples
#' \dontrun{
#'  lookup
#' }
"lookup"
