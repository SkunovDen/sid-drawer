import 'package:latlong2/latlong.dart';
import 'package:sidmap/sid.dart';
import 'package:sidmap/sid_data.dart';
import 'package:sidmap/transition_data.dart';

//URKA TUNOT 1F
// "transitions" : "[
// {\"path\":\"CA\",\"mCourse\":215,\"minAlt\":\"00580\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"KA019_URKA\",\"minAlt\":\"\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"TUNOT_UR\",\"minAlt\":\"FL050\"}]",

//start point
LatLng urkaRw22Thr = const LatLng(44.993783, 37.336617);

TransitionData tunot_1 = TransitionData("CA", "", "", 215, "00580");
TransitionData tunot_2 = TransitionData("DF", "wp", "KA019_URKA", 0, "0");
TransitionData tunot_3 = TransitionData("DF", "wp", "TUNOT_UR", 0, "FL050");

List<TransitionData> tunot1fTransitions = [tunot_1, tunot_2, tunot_3];

SidData tunot1Fdata = SidData(urkaRw22Thr, tunot1fTransitions);
Sid urkaTestSidTunotF1 = Sid(tunot1Fdata);

//URKA DIBAT 1F
// "transitions" : "[
// {\"path\":\"CA\",\"mCourse\":215,\"minAlt\":\"00580\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"KA019_URKA\",\"minAlt\":\"\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DIBAT_UR\",\"minAlt\":\"FL050\"}]",

//start point
// LatLng urkaRw22Thr = const LatLng(44.993783, 37.336617);

TransitionData dibat_1 = TransitionData("CA", "", "", 215, "00580");
TransitionData dibat_2 = TransitionData("DF", "wp", "KA019_URKA", 0, "0");
TransitionData dibat_3 = TransitionData("DF", "wp", "DIBAT_UR", 0, "FL050");

List<TransitionData> dibat1fTransitions = [dibat_1, dibat_2, dibat_3];

SidData dibat1Fdata = SidData(urkaRw22Thr, dibat1fTransitions);
Sid urkaTestSidDibatF1 = Sid(dibat1Fdata);

//URKA NALUD 1F
// "transitions" : "[
// {\"path\":\"CA\",\"mCourse\":215,\"minAlt\":\"00580\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"KA019_URKA\",\"minAlt\":\"\"},
// {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DIBAT_UR\",\"minAlt\":\"FL050\"}]",

//start point
// LatLng urkaRw22Thr = const LatLng(44.993783, 37.336617);

TransitionData nalud_1 = TransitionData("CA", "", "", 215, "00580");
TransitionData nalud_2 = TransitionData("DF", "wp", "KA019_URKA", 0, "0");
TransitionData nalud_3 = TransitionData("DF", "wp", "NALUD_UR", 0, "FL050");

List<TransitionData> nalud1fTransitions = [nalud_1, nalud_2, nalud_3];

SidData nalud1Fdata = SidData(urkaRw22Thr, nalud1fTransitions);
Sid urkaTestSidNaludF1 = Sid(nalud1Fdata);

// {
// "sid": [
// 	{
// 		"obj_id" : "URKA_SORU1E",
// 		"name" : "SORUL 1E",
// 		"airport_id" : "URKA",
// 		"runways" : "[\"04\"]",
// 		"ends" : "[\"SORUL_UR\"]",
// 		"transitions" : "[
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DER04_URKA\",\"minAlt\":\"\"},
//        {\"path\":\"CA\",\"mCourse\":35,\"minAlt\":\"01200\"},
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"SORUL_UR\",\"minAlt\":\"FL060\"}
// ]",
// 	}
// ]}
//start point
LatLng urkaRw04Thr = const LatLng(45.010463888889, 37.357916666667);

TransitionData sorul_1 = TransitionData("DF", "wp", "DER04_URKA", 0, "0");
TransitionData sorul_2 = TransitionData("CA", "", "", 35, "01200");
TransitionData sorul_3 = TransitionData("DF", "wp", "SORUL_UR", 0, "FL060");

List<TransitionData> sorul1fTransitions = [sorul_1, sorul_2, sorul_3];

SidData sorul1Fdata = SidData(urkaRw04Thr, sorul1fTransitions);
Sid urkaTestSidSorulF1 = Sid(sorul1Fdata);


// {
// "sid": [
// 	{
// 		"name" : "TIBET 1E",
// 		"airport_id" : "URKA",
// 		"runways" : "[\"04\"]",
// 		"ends" : "[\"TIBET_UR\"]",
// 		"transitions" : "[
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DER04_URKA\",\"minAlt\":\"\"},
//        {\"path\":\"CA\",\"mCourse\":35,\"minAlt\":\"01200\"},
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"TIBET_UR\",\"minAlt\":\"FL070\"}
// ]",
// 	}
// ]}


// {
// "sid": [
// 	{
// 		"name" : "ARNAD 1E",
// 		"airport_id" : "URKA",
// 		"runways" : "[\"04\"]",
// 		"ends" : "[\"ARNAD_UK\"]",
// 		"transitions" : "[
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DER04_URKA\",\"minAlt\":\"\"},
//        {\"path\":\"CA\",\"mCourse\":35,\"minAlt\":\"01200\"},
//        {\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"KA021_URKA\",\"minAlt\":\"FL060\"},
//        {\"path\":\"TF\",\"fixType\":\"wp\",\"fixId\":\"ARNAD_UK\",\"minAlt\":\"FL100\"}
// ]",
// 	}
// ]}


/// разворот
///
/// {
// "sid": [
// 	{
// 		"id" : 5709,
// 		"obj_id" : "URKA_DIBA1E",
// 		"name" : "DIBAT 1E",
// 		"airport_id" : "URKA",
// 		"runways" : "[\"04\"]",
// 		"ends" : "[\"DIBAT_UR\"]",
// 		"transitions" : "[
// 		{\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"DER04_URKA\",\"minAlt\":\"\"},
// 		{\"path\":\"CA\",\"mCourse\":35,\"minAlt\":\"01200\"},
// 		{\"path\":\"DF\",\"fixType\":\"wp\",\"fixId\":\"KA020_URKA\",\"minAlt\":\"\"},
// 		{\"path\":\"TF\",\"fixType\":\"wp\",\"fixId\":\"DIBAT_UR\",\"minAlt\":\"FL050\"}
// 	]",
// 		"begin_airac" : "2310",
// 		"end_airac" : "2311"
// 	}
// ]}
// {
// "aw_points": [
// {
// "obj_id" : "KA020_URKA",
// "lng" : 37.113333,
// "lat" : 44.919444,
// }
// ]}
//start point
// LatLng urkaRw04Thr = const LatLng(45.010463888889, 37.357916666667);

TransitionData dibat1e_1 = TransitionData("DF", "wp", "DER04_URKA", 0, "0");
TransitionData dibat1e_2 = TransitionData("CA", "", "", 35, "01200");
TransitionData dibat1e_3 = TransitionData("DF", "wp", "KA020_URKA", 0, "FL060");
TransitionData dibat1e_4 = TransitionData("TF", "wp", "DIBAT_UR", 0, "FL060");

List<TransitionData> dibat1eTransitions = [dibat1e_1, dibat1e_2, dibat1e_3, dibat1e_4];

SidData dibat1eFdata = SidData(urkaRw04Thr, dibat1eTransitions);
Sid urkaTestSidDibat1E = Sid(dibat1eFdata);



