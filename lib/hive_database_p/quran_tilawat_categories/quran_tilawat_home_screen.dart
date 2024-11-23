import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/item_box.dart';
import '../services/item_model.dart';

class QuranTilawatHomeScreen extends StatefulWidget {
  const QuranTilawatHomeScreen({super.key});

  @override
  State<QuranTilawatHomeScreen> createState() => _QuranTilawatHomeScreenState();
}

class _QuranTilawatHomeScreenState extends State<QuranTilawatHomeScreen> {
  bool isTextFieldDisable = false;
  final hiveBox = HiveBoxManager();
  List<Item> paraList = [];
  String? selectedValue;
  // Surat
  List<Item> suratList = [];
  String? selectedValue1;
  // Ruku
  List<Item> rukuList = [];
  String? selectedValue2;
  // Ayat

  List<Item> ayatList = [];
  String? selectedValue3;

  List<String> ayatDrop = [
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
    "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",
    "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",
    "51", "52", "53", "54", "55", "56", "57", "58", "59", "60",
    "61", "62", "63", "64", "65", "66", "67", "68", "69", "70",
    "71", "72", "73", "74", "75", "76", "77", "78", "79", "80",
    "81", "82", "83", "84", "85", "86", "87", "88", "89", "90",
    "91", "92", "93", "94", "95", "96", "97", "98", "99", "100",
    "101", "102", "103", "104", "105", "106", "107", "108", "109", "110",
    "111", "112", "113", "114", "115", "116", "117", "118", "119", "120",
    "121", "122", "123", "124", "125", "126", "127", "128", "129", "130",
    "131", "132", "133", "134", "135", "136", "137", "138", "139", "140",
    "141", "142", "143", "144", "145", "146", "147", "148", "149", "150",
    "151", "152", "153", "154", "155", "156", "157", "158", "159", "160",
    "161", "162", "163", "164", "165", "166", "167", "168", "169", "170",
    "171", "172", "173", "174", "175", "176", "177", "178", "179", "180",
    "181", "182", "183", "184", "185", "186", "187", "188", "189", "190",
    "191", "192", "193", "194", "195", "196", "197", "198", "199", "200",
    "201", "202", "203", "204", "205", "206", "207", "208", "209", "210",
    "211", "212", "213", "214", "215", "216", "217", "218", "219", "220",
    "221", "222", "223", "224", "225", "226", "227", "228", "229", "230",
    "231", "232", "233", "234", "235", "236", "237", "238", "239", "240",
    "241", "242", "243", "244", "245", "246", "247", "248", "249", "250",
    "251", "252", "253", "254", "255", "256", "257", "258", "259", "260",
    "261", "262", "263", "264", "265", "266", "267", "268", "269", "270",
    "271", "272", "273", "274", "275", "276", "277", "278", "279", "280",
    "281", "282", "283", "284", "285", "286", "287", "288", "289", "290",
    "291", "292", "293", "294", "295", "296", "297", "298", "299", "300",
    "301", "302", "303", "304", "305", "306", "307", "308", "309", "310",
    "311", "312", "313", "314", "315", "316", "317", "318", "319", "320",
    "321", "322", "323", "324", "325", "326", "327", "328", "329", "330",
    "331", "332", "333", "334", "335", "336", "337", "338", "339", "340",
    "341", "342", "343", "344", "345", "346", "347", "348", "349", "350",
    "351", "352", "353", "354", "355", "356", "357", "358", "359", "360",
    "361", "362", "363", "364", "365", "366", "367", "368", "369", "370",
    "371", "372", "373", "374", "375", "376", "377", "378", "379", "380",
    "381", "382", "383", "384", "385", "386", "387", "388", "389", "390",
    "391", "392", "393", "394", "395", "396", "397", "398", "399", "400",
    "401", "402", "403", "404", "405", "406", "407", "408", "409", "410",
    "411", "412", "413", "414", "415", "416", "417", "418", "419", "420",
    "421", "422", "423", "424", "425", "426", "427", "428", "429", "430",
    "431", "432", "433", "434", "435", "436", "437", "438", "439", "440",
    "441", "442", "443", "444", "445", "446", "447", "448", "449", "450",
    "451", "452", "453", "454", "455", "456", "457", "458", "459", "460",
    "461", "462", "463", "464", "465", "466", "467", "468", "469", "470",
    "471", "472", "473", "474", "475", "476", "477", "478", "479", "480",
    "481", "482", "483", "484", "485", "486", "487", "488", "489", "490",
    "491", "492", "493", "494", "495", "496", "497", "498", "499", "500",
    "501", "502", "503", "504", "505", "506", "507", "508", "509", "510",
    "511", "512", "513", "514", "515", "516", "517", "518", "519", "520",
    "521", "522", "523", "524", "525", "526", "527", "528", "529", "530",
    "531", "532", "533", "534", "535", "536", "537", "538", "539", "540",
    "541", "542", "543", "544", "545", "546", "547", "548", "549", "550",
    "551", "552", "553", "554", "555", "556", "557", "558"
  ];


  List<String> rukuDrop = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50"
  ];

  List<String> paraDrop = [
    "1: Alif-laam-meem",
    "2: Sayaqūlu",
    "3: Tilka ’r-Rusulu",
    "4: Lan Tana Loo",
    "5: Wal Mohsanat",
    "6: La Yuhibbullah",
    "7: Wa Iza Samiu",
    "8: Wa Lau Annana",
    "9: Qalal Malao",
    "10: Wa A'lamu",
    "11: Yatazeroon",
    "12: Wa Mamin Da'abat",
    "13: Wa Ma Ubrioo",
    "14: Rubama",
    "15: Subhanallazi",
    "16: Qal Alam",
    "17: Aqtarabo",
    "18: Qadd Aflaha",
    "19: Wa Qalallazina",
    "20: A'man Khalaq",
    "21: Utlu Ma Oohi",
    "22: Wa Manyaqnut",
    "23: Wa Mali",
    "24: Faman Azlam",
    "25: Elahe Yuruddo",
    "26: Ha'a Meem",
    "27: Qala Fama Khatbukum",
    "28: Qadd Sami Allah",
    "29: Tabarakallazi",
    "30: Amma Yatasa'aloon",
  ];

  List<String> suratDrop = [
    "1: Al-Fatiha",
    "2: Al-Baqarah",
    "3: Al-Imran",
    "4: An-Nisa",
    "5: Al-Ma'idah",
    "6: Al-An'am",
    "7: Al-A'raf",
    "8: Al-Anfal",
    "9: At-Tawbah",
    "10: Yunus",
    "11: Hud",
    "12: Yusuf",
    "13: Ar-Ra'd",
    "14: Ibrahim",
    "15: Al-Hijr",
    "16: An-Nahl",
    "17: Al-Isra",
    "18: Al-Kahf",
    "19: Maryam",
    "20: Taha",
    "21: Al-Anbiya",
    "22: Al-Hajj",
    "23: Al-Mu'minun",
    "24: An-Nur",
    "25: Al-Furqan",
    "26: Ash-Shu'ara",
    "27: An-Naml",
    "28: Al-Qasas",
    "29: Al-Ankabut",
    "30: Ar-Rum",
    "31: Luqman",
    "32: As-Sajda",
    "33: Al-Ahzab",
    "34: Saba",
    "35: Fatir",
    "36: Ya-Sin",
    "37: As-Saffat",
    "38: Sad",
    "39: Az-Zumar",
    "40: Ghafir",
    "41: Fussilat",
    "42: Ash-Shura",
    "43: Az-Zukhruf",
    "44: Ad-Dukhan",
    "45: Al-Jathiya",
    "46: Al-Ahqaf",
    "47: Muhammad",
    "48: Al-Fath",
    "49: Al-Hujurat",
    "50: Qaf",
    "51: Adh-Dhariyat",
    "52: At-Tur",
    "53: An-Najm",
    "54: Al-Qamar",
    "55: Ar-Rahman",
    "56: Al-Waqi'a",
    "57: Al-Hadid",
    "58: Al-Mujadila",
    "59: Al-Hashr",
    "60: Al-Mumtahana",
    "61: As-Saff",
    "62: Al-Jumu'a",
    "63: Al-Munafiqun",
    "64: At-Taghabun",
    "65: At-Talaq",
    "66: At-Tahrim",
    "67: Al-Mulk",
    "68: Al-Qalam",
    "69: Al-Haaqqa",
    "70: Al-Ma'arij",
    "71: Nuh",
    "72: Al-Jinn",
    "73: Al-Muzzammil",
    "74: Al-Muddathir",
    "75: Al-Qiyama",
    "76: Al-Insan",
    "77: Al-Mursalat",
    "78: An-Naba",
    "79: An-Nazi'at",
    "80: Abasa",
    "81: At-Takwir",
    "82: Al-Infitar",
    "83: Al-Mutaffifin",
    "84: Al-Inshiqaq",
    "85: Al-Burooj",
    "86: At-Tariq",
    "87: Al-A'la",
    "88: Al-Ghashiya",
    "89: Al-Fajr",
    "90: Al-Balad",
    "91: Ash-Shams",
    "92: Al-Lail",
    "93: Ad-Duhaa",
    "94: Al-Inshirah",
    "95: At-Tin",
    "96: Al-Alaq",
    "97: Al-Qadr",
    "98: Al-Bayyina",
    "99: Az-Zalzala",
    "100: Al-Adiyat",
    "101: Al-Qari'a",
    "102: At-Takathur",
    "103: Al-Asr",
    "104: Al-Humazah",
    "105: Al-Fil",
    "106: Quraish",
    "107: Al-Ma'un",
    "108: Al-Kawthar",
    "109: Al-Kafirun",
    "110: An-Nasr",
    "111: Al-Masad",
    "112: Al-Ikhlas",
    "113: Al-Falaq",
    "114: An-Nas"
  ];



  @override
  void initState() {
    super.initState();
    loadData();
  }
  void loadData(){
    _paraFetch();
    _suratFetch();
    _rukuFetch();
    _ayatFetch();
  }

  // Fetch items from database
  void _paraFetch() async {
    final data = await hiveBox.paraFetch();
    setState(() {
      paraList = data;
      // Optionally, you can automatically select the first item if there's any
      if (paraList.isNotEmpty) {
        selectedValue = paraList.last.title; // Assuming your Item model has a title field
      }
    });
  }

  // Add a new item to the database
  Future<void> _paraAdd(String name) async {
    if (name.isNotEmpty) {
      await hiveBox.paraAdd(name); // Ensure to await here
      print(name);
      _paraFetch(); // Refresh after adding
    }
  }

  // Surat =======
  void _suratFetch() async {
    final data = await hiveBox.suratFetch();
    setState(() {
      suratList = data;
      // Optionally, you can automatically select the first item if there's any
      if (suratList.isNotEmpty) {
        selectedValue1 = suratList.last.title; // Assuming your Item model has a title field
      }
    });
  }
  // add
  Future<void> _suratAdd(String name) async {
    if (name.isNotEmpty) {
      await hiveBox.suratAdd(name); // Ensure to await here
      print(name);
      _suratFetch(); // Refresh after adding
    }
  }

  // Ruku =====================
  Future<void> _rukuAdd(String name) async {
    if (name.isNotEmpty) {
      await hiveBox.rukuAdd(name); // Ensure to await here
      print(name);// Refresh after adding
      _rukuFetch();
    }
  }
  void _rukuFetch() async {
    final data = await hiveBox.rukuFetch();
    setState(() {
      rukuList = data;
      // Optionally, you can automatically select the first item if there's any
      if (rukuList.isNotEmpty) {
        selectedValue2 = rukuList.last.title; // Assuming your Item model has a title field
      }
    });
  }

  // ayat ====================
  Future<void> _ayatAdd(String name) async {
    if (name.isNotEmpty) {
      await hiveBox.ayatAdd(name); // Ensure to await here
      print(name);// Refresh after adding
      _ayatFetch();
    }
  }
  void _ayatFetch() async {
    final data = await hiveBox.ayatFetch();
    setState(() {
      ayatList = data;
      // Optionally, you can automatically select the first item if there's any
      if (ayatList.isNotEmpty) {
        selectedValue3 = ayatList.last.title; // Assuming your Item model has a title field
      }
    });
  }





   // Enable and disable
  void toggleDisable() {
    setState(() {
      isTextFieldDisable = !isTextFieldDisable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quran Tilawat',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Quran Para',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: selectedValue, // Set the selected value here
              items: paraDrop.map((String para) {
                return DropdownMenuItem<String>(
                  value: para,
                  child: Text(para),
                );
              }).toList(),
              onChanged: !isTextFieldDisable
                  ? null
                  : (String? value) async {
                if (value != null) {
                  await _paraAdd(value); // Add the selected value to the database
                  setState(() {
                    selectedValue = value; // Store selected value
                  });
                }
              },
              hint: Text('Select an Option'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Quran Surat',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5,),
            DropdownButtonFormField<String>(
              value: selectedValue1, // Set the selected value here
              items: suratDrop.map((String para) {
                return DropdownMenuItem<String>(
                  value: para,
                  child: Text(para),
                );
              }).toList(),
              onChanged: !isTextFieldDisable
                  ? null
                  : (String? value) async {
                if (value != null) {
                  await _suratAdd(value); // Add the selected value to the database
                  setState(() {
                    selectedValue1 = value; // Store selected value
                  });
                }
              },
              hint: Text('Select an Option'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Quran Ruku',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5,),
            DropdownButtonFormField<String>(
              value: selectedValue2, // Set the selected value here
              items: rukuDrop.map((String para) {
                return DropdownMenuItem<String>(
                  value: para,
                  child: Text(para),
                );
              }).toList(),
              onChanged: !isTextFieldDisable
                  ? null
                  : (String? value) async {
                if (value != null) {
                  await _rukuAdd(value); // Add the selected value to the database
                  setState(() {
                    selectedValue2 = value; // Store selected value
                  });
                }
              },
              hint: Text('Select an Option'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Quran Ayat',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5,),
            DropdownButtonFormField<String>(
              value: selectedValue3, // Set the selected value here
              items: ayatDrop.map((String para) {
                return DropdownMenuItem<String>(
                  value: para,
                  child: Text(para),
                );
              }).toList(),
              onChanged: !isTextFieldDisable
                  ? null
                  : (String? value) async {
                if (value != null) {
                  await _ayatAdd(value); // Add the selected value to the database
                  setState(() {
                    selectedValue3 = value; // Store selected value
                  });
                }
              },
              hint: Text('Select an Option'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                toggleDisable(); // Toggle the enable/disable state
              },
              child: Text(
                isTextFieldDisable ? 'Disable' : 'Enable',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
