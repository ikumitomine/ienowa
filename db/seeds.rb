# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
banks =["みずほ銀行","三菱ＵＦＪ銀行","三井住友銀行","りそな銀行","埼玉りそな銀行","ジャパンネット銀行","セブン銀行","ソニー銀行","楽天銀行","住信ＳＢＩネット銀行","ａｕじぶん銀行","イオン銀行","大和ネクスト銀行","ローソン銀行","北海道銀行","青森銀行","みちのく銀行","秋田銀行","北都銀行","荘内銀行","山形銀行","岩手銀行","東北銀行","七十七銀行","東邦銀行","群馬銀行","足利銀行","常陽銀行","筑波銀行","武蔵野銀行","千葉銀行","千葉興業銀行","きらぼし銀行","横浜銀行","第四銀行","北越銀行","山梨中央銀行","八十二銀行","北陸銀行","富山銀行","北國銀行","福井銀行","静岡銀行","スルガ銀行","清水銀行","大垣共立銀行","十六銀行","三重銀行","百五銀行","滋賀銀行","京都銀行","関西みらい銀行","池田泉州銀行","南都銀行","紀陽銀行","但馬銀行","鳥取銀行","山陰合同銀行","中国銀行","広島銀行","山口銀行","阿波銀行","百十四銀行","伊予銀行","四国銀行","福岡銀行","筑邦銀行","佐賀銀行","十八親和銀行","肥後銀行","大分銀行","宮崎銀行","鹿児島銀行","琉球銀行","沖縄銀行","西日本シティ銀行","北九州銀行","三菱ＵＦＪ信託銀行","みずほ信託銀行","三井住友信託銀行","ニューヨークメロン信託銀行","日本マスタートラスト信託銀行","ＳＭＢＣ信託銀行","野村信託銀行","オリックス銀行","ＧＭＯあおぞらネット銀行","農中信託銀行","新生信託銀行","日証金信託銀行","日本カストディ銀行","新生銀行","あおぞら銀行","シティバンク、エヌ・エイ銀行","ＪＰモルガン銀行","バンク・オブ・アメリカ・エヌ・エイ銀行","香港上海銀行","スタンダード　チャータード銀行","バークレイズ銀行","クレディ・アグリコル銀行","ハナ銀行","印度銀行","兆豊國際商業銀行","バンコック銀行","バンクネガラインドネシア銀行","ドイツ銀行","ブラジル銀行","ユナイテッド・オーバーシーズ銀行","ユービーエス・エイ・ジー銀行","ニューヨークメロン銀行","ビー・エヌ・ピー・パリバ銀行","オーバーシー・チャイニーズ銀行","ソシエテ　ジェネラル銀行","ユバフーアラブ・フランス連合銀行","ＤＢＳ銀行","クレディ・スイス銀行","コメルツ銀行","ウニクレディト銀行","インドステイト銀行","カナダロイヤル銀行","ＳＢＪ銀行","ウリィ銀行","アイエヌジー　バンク　エヌ・ヴィ銀行","ナショナル・オーストラリア・バンク・リミテッド銀行","オーストラリア・ニュージーランド銀行","オーストラリア・コモンウェルズ銀行","中國銀行","ステート・ストリート銀行","中小企業銀行","北洋銀行","きらやか銀行","北日本銀行","仙台銀行","福島銀行","大東銀行","東和銀行","栃木銀行","京葉銀行","東日本銀行","東京スター銀行","神奈川銀行","大光銀行","長野銀行","富山第一銀行","福邦銀行","静岡中央銀行","愛知銀行","名古屋銀行","中京銀行","第三銀行","みなと銀行","島根銀行","トマト銀行","もみじ銀行","西京銀行","徳島大正銀行","香川銀行","愛媛銀行","高知銀行","福岡中央銀行","佐賀共栄銀行","長崎銀行","熊本銀行","豊和銀行","宮崎太陽銀行","南日本銀行","沖縄海邦銀行","韓国産業銀行","彰化商業銀行","ウェルズ・ファーゴ銀行","第一商業銀行","台湾銀行","交通銀行","メトロポリタン銀行","フィリピン・ナショナル・バンク銀行","中国工商銀行","中國信託商業銀行","インテーザ・サンパオロ銀行","國民銀行","中国建設銀行","ビルバオ・ビスカヤ・アルヘンタリア銀行","中国農業銀行","台新國際商業銀行","玉山銀行","台湾中小企業銀行","信金中央金庫","北海道信金","室蘭信金","空知信金","苫小牧信金","北門信金","伊達信金","北空知信金","日高信金","渡島信金","道南うみ街信金","旭川信金","稚内信金","留萌信金","北星信金","帯広信金","釧路信金","大地みらい信金","北見信金","網走信金","遠軽信金","東奥信金","青い森信金","秋田信金","羽後信金","山形信金","米沢信金","鶴岡信金","新庄信金","盛岡信金","宮古信金","一関信金","北上信金","花巻信金","水沢信金","杜の都信金","宮城第一信金","石巻信金","仙南信金","気仙沼信金","会津信金","郡山信金","白河信金","須賀川信金","ひまわり信金","あぶくま信金","二本松信金","福島信金","高崎信金","桐生信金","アイオー信金","利根郡信金","館林信金","北群馬信金","しののめ信金","足利小山信金","栃木信金","鹿沼相互信金","佐野信金","大田原信金","烏山信金","水戸信金","結城信金","埼玉縣信金","川口信金","青木信金","飯能信金","千葉信金","銚子信金","東京ベイ信金","館山信金","佐原信金","横浜信金","かながわ信金","湘南信金","川崎信金","平塚信金","さがみ信金","中栄信金","中南信金","朝日信金","興産信金","さわやか信金","東京シティ信金","芝信金","東京東信金","東栄信金","亀有信金","小松川信金","足立成和信金","東京三協信金","西京信金","西武信金","城南信金","昭和信金","目黒信金","世田谷信金","東京信金","城北信金","瀧野川信金","巣鴨信金","青梅信金","多摩信金","新潟信金","長岡信金","三条信金","新発田信金","柏崎信金","上越信金","新井信金","村上信金","加茂信金","甲府信金","山梨信金","長野信金","松本信金","上田信金","諏訪信金","飯田信金","アルプス中央信金","富山信金","高岡信金","新湊信金","にいかわ信金","氷見伏木信金","砺波信金","石動信金","金沢信金","のと共栄信金","はくさん信金","興能信金","福井信金","敦賀信金","小浜信金","越前信金","しずおか焼津信金","静清信金","浜松磐田信金","沼津信金","三島信金","富士宮信金","島田掛川信金","富士信金","遠州信金","岐阜信金","大垣西濃信金","高山信金","東濃信金","関信金","八幡信金","愛知信金","豊橋信金","岡崎信金","いちい信金","瀬戸信金","半田信金","知多信金","豊川信金","豊田信金","碧海信金","西尾信金","蒲郡信金","尾西信金","中日信金","東春信金","津信金","北伊勢上野信金","桑名三重信金","紀北信金","滋賀中央信金","長浜信金","湖東信金","京都信金","京都中央信金","京都北都信金","大阪信金","大阪厚生信金","大阪シティ信金","大阪商工信金","永和信金","北おおさか信金","枚方信金","奈良信金","大和信金","奈良中央信金","新宮信金","きのくに信金","神戸信金","姫路信金","播州信金","兵庫信金","尼崎信金","日新信金","淡路信金","但馬信金","西兵庫信金","中兵庫信金","但陽信金","鳥取信金","米子信金","倉吉信金","しまね信金","日本海信金","島根中央信金","おかやま信金","水島信金","津山信金","玉島信金","備北信金","吉備信金","備前日生信金","広島信金","呉信金","しまなみ信金","広島みどり信金","萩山口信金","西中国信金","東山口信金","徳島信金","阿南信金","高松信金","観音寺信金","愛媛信金","宇和島信金","東予信金","川之江信金","幡多信金","高知信金","福岡信金","福岡ひびき信金","大牟田柳川信金","筑後信金","飯塚信金","田川信金","大川信金","遠賀信金","唐津信金","佐賀信金","伊万里信金","九州ひぜん信金","たちばな信金","熊本信金","熊本第一信金","熊本中央信金","天草信金","大分信金","大分みらい信金","日田信金","宮崎第一信金","延岡信金","高鍋信金","鹿児島信金","鹿児島相互信金","奄美大島信金","コザ信金","商工中金","全信組連","北央信組","札幌中央信組","ウリ信組","函館商工信組","空知商工信組","十勝信組","釧路信組","青森県信組","杜陵信組","岩手県医師信組","あすか信組","石巻商工信組","古川信組","仙北信組","秋田県信組","北郡信組","山形中央信組","山形第一信組","山形県医師信組","福島県商工信組","いわき信組","相双五城信組","会津商工信組","茨城県信組","真岡信組","那須信組","あかぎ信組","群馬県信組","ぐんまみらい信組","群馬県医師信組","埼玉県医師信組","熊谷商工信組","埼玉信組","房総信組","銚子商工信組","君津信組","全東栄信組","東浴信組","文化産業信組","整理回収機構","東京証券信組","東京厚生信組","東信組","江東信組","青和信組","中ノ郷信組","共立信組","七島信組","大東京信組","第一勧業信組","警視庁職員信組","東京消防信組","東京都職員信組","ハナ信組","神奈川県医師信組","神奈川県歯科医師信組","横浜幸銀信組","横浜華銀信組","小田原第一信組","相愛信組","静岡県医師信組","新潟縣信組","新潟鉄道信組","興栄信組","はばたき信組","協栄信組","三條信組","巻信組","新潟大栄信組","塩沢信組","糸魚川信組","山梨県民信組","都留信組","長野県信組","富山県医師信組","富山県信組","金沢中央信組","石川県医師信組","福泉信組","福井県医師信組","丸八信組","愛知商銀信組","愛知県警察信組","名古屋青果物信組","愛知県医療信組","愛知県医師信組","豊橋商工信組","愛知県中央信組","岐阜商工信組","イオ信組","岐阜県医師信組","飛騨信組","益田信組","三重県職員信組","滋賀県民信組","滋賀県信組","京滋信組","大同信組","成協信組","大阪協栄信組","大阪貯蓄信組","のぞみ信組","中央信組","大阪府医師信組","大阪府警察信組","近畿産業信組","朝日新聞信組","毎日信組","ミレ信組","兵庫県警察信組","兵庫県医療信組","兵庫県信組","神戸市職員信組","淡陽信組","兵庫ひまわり信組","和歌山県医師信組","島根益田信組","朝銀西信組","笠岡信組","広島市信組","広島県信組","広島商銀信組","呉市職員信組","両備信組","備後信組","山口県信組","香川県信組","土佐信組","宿毛商銀信組","福岡県庁信組","福岡県医師信組","福岡県信組","佐賀県医師信組","佐賀東信組","佐賀西信組","長崎三菱信組","長崎県医師信組","西海みずき信組","福江信組","熊本県医師信組","熊本県信組","大分県信組","宮崎県南部信組","鹿児島興業信組","鹿児島県医師信組","奄美信組","労金連","北海道労金","東北労金","中央労金","新潟県労金","長野県労金","静岡県労金","北陸労金","東海労金","近畿労金","中国労金","四国労金","九州労金","沖縄県労金","農林中金","北海道信連","岩手県信連","茨城県信連","埼玉県信連","東京都信連","神奈川県信連","山梨県信連","長野県信連","新潟県信連","石川県信連","岐阜県信連","静岡県信連","愛知県信連","三重県信連","福井県信連","滋賀県信連","京都府信連","大阪府信連","兵庫県信連","和歌山県信連","鳥取県信連","広島県信連","山口県信連","徳島県信連","香川県信連","愛媛県信連","高知県信連","福岡県信連","佐賀県信連","大分県信連","宮崎県信連","鹿児島県信連","北檜山町農協","今金町農協","函館市亀田農協","新函館農協","ようてい農協","きょうわ農協","新おたる農協","余市町農協","とうや湖農協","伊達市農協","とまこまい広域農協","鵡川農協","びらとり農協","門別町農協","みついし農協","札幌市農協","道央農協","石狩市農協","北石狩農協","新篠津村農協","サツラク農協","いわみざわ農協","南幌町農協","美唄市農協","峰延農協","月形町農協","ながぬま農協","そらち南農協","夕張市農協","新砂川農協","たきかわ農協","ピンネ農協","北いぶき農協","きたそらち農協","南るもい農協","苫前町農協","オロロン農協","天塩町農協","幌延町農協","あさひかわ農協","たいせつ農協","東神楽農協","東旭川農協","当麻農協","比布町農協","上川中央農協","東川町農協","美瑛町農協","ふらの農協","北ひびき農協","道北なよろ農協","北はるか農協","稚内農協","北宗谷農協","東宗谷農協","中頓別町農協","宗谷南農協","帯広市川西農協","帯広大正農協","中札内村農協","更別村農協","忠類農協","大樹町農協","広尾町農協","芽室町農協","十勝清水町農協","新得町農協","鹿追町農協","木野農協","音更町農協","士幌町農協","上士幌町農協","札内農協","幕別町農協","十勝池田町農協","十勝高島農協","豊頃町農協","浦幌町農協","本別町農協","足寄町農協","陸別町農協","北オホーツク農協","オホーツクはまなす農協","佐呂間町農協","湧別町農協","えんゆう農協","きたみらい農協","津別町農協","美幌町農協","女満別町農協","常呂町農協","オホーツク網走農協","小清水町農協","斜里町農協","清里町農協","釧路太田農協","浜中町農協","標茶町農協","摩周湖農協","阿寒農協","釧路丹頂農協","標津町農協","中標津町農協","計根別農協","道東あさひ農協","中春別農協","青森農協","つがる弘前農協","相馬村農協","津軽みらい農協","つがるにしきた農協","ごしょつがる農協","十和田おいらせ農協","ゆうき青森農協","おいらせ農協","八戸農協","新岩手農協","岩手中央農協","花巻農協","岩手ふるさと農協","岩手江刺農協","いわて平泉農協","大船渡市農協","仙台農協","岩沼市農協","名取岩沼農協","みやぎ亘理農協","みやぎ登米農協","古川農協","加美よつば農協","新みやぎ農協","いしのまき農協","みやぎ仙南農協","かづの農協","あきた北農協","秋田たかのす","あきた白神農協","秋田やまもと農協","あきた湖東農協","秋田なまはげ農協","秋田しんせい農協","秋田おばこ農協","秋田ふるさと農協","こまち農協","うご農協","大潟村農協","山形市農協","山形農協","天童市農協","さがえ西村山農協","みちのく村山農協","東根市農協","新庄市農協","もがみ中央農協","金山農協","山形おきたま農協","鶴岡市農協","庄内たがわ農協","余目町農協","庄内みどり農協","酒田市袖浦農協","ふくしま未来農協","夢みなみ農協","東西しらかわ農協","会津よつば農協","福島さくら農協","水戸農協","常陸農協","日立市多賀農協","茨城旭村農協","ほこた農協","なめがたしおさい農協","稲敷農協","水郷つくば農協","つくば市農協","つくば市谷田部農協","茨城みなみ農協","やさと農協","新ひたち野農協","北つくば農協","常総ひかり農協","茨城むつみ農協","岩井農協","宇都宮農協","上都賀農協","はが野農協","下野農協","小山農協","塩野谷農協","那須野農協","那須南農協","佐野農協","足利市農協","赤城橘農協","前橋市農協","高崎市農協","はぐくみ農協","北群渋川農協","多野藤岡農協","甘楽富岡農協","碓氷安中農協","あがつま農協","嬬恋村農協","利根沼田農協","佐波伊勢崎農協","新田みどり農協","太田市農協","邑楽館林農協","さいたま農協","あさか野農協","いるま野農協","埼玉中央農協","ちちぶ農協","埼玉ひびきの農協","くまがや農協","埼玉岡部農協","花園農協","ほくさい農協","越谷市農協","南彩農協","埼玉みずほ農協","さいかつ農協","ふかや農協","安房農協","いすみ農協","木更津市農協","君津市農協","長生農協","山武郡市農協","市原市農協","千葉みらい農協","八千代市農協","市川市農協","とうかつ中央農協","ちば東葛農協","成田市農協","富里市農協","西印旛農協","かとり農協","ちばみどり農協","西東京農協","西多摩農協","秋川農協","八王子市農協","東京南農協","町田市農協","マインズ農協","東京みどり農協","東京みらい農協","東京むさし農協","東京中央農協","世田谷目黒農協","東京あおば農協","東京スマイル農協","横浜農協","セレサ川崎農協","よこすか葉山農協","三浦市農協","さがみ農協","湘南農協","秦野市農協","かながわ西湘農協","厚木市農協","県央愛川農協","相模原市農協","神奈川つくい農協","フルーツ山梨農協","笛吹農協","山梨みらい農協","南アルプス市農協","梨北農協","クレイン農協","北富士農協","鳴沢村農協","長野八ヶ岳農協","川上物産農協","佐久浅間農協","信州うえだ農協","信州諏訪農協","上伊那農協","みなみ信州農協","下伊那園芸農協","木曽農協","松本市農協","松本ハイランド農協","塩尻市農協","洗馬農協","あづみ農協","大北農協","グリーン長野農協","中野市農協","ながの農協","北蒲みなみ農協","ささかみ農協","北越後農協","胎内市農協","新潟みらい農協","新津さつき農協","越後中央農協","にいがた南蒲農協","越後ながおか農協","越後さんとう農協","越後おぢや農協","北魚沼農協","みなみ魚沼農協","十日町農協","津南町農協","柏崎農協","えちご上越農協","ひすい農協","かみはやし農協","にいがた岩船農協","佐渡農協","羽茂農協","新潟市農協","みな穂農協","黒部市農協","魚津市農協","アルプス農協","あおば農協","富山市農協","なのはな農協","山田村農協","いみず野農協","高岡市農協","氷見市農協","となみ野農協","なんと農協","いなば農協","福光農協","加賀農協","小松市農協","根上農協","能美農協","松任市農協","野々市農協","白山農協","金沢中央農協","金沢市農協","石川かほく農協","はくい農協","志賀農協","能登わかば農協","おおぞら農協","内浦町農協","珠洲市農協","ぎふ農協","西美濃農協","いび川農協","めぐみの農協","陶都信用農協","東美濃農協","飛騨農協","伊豆太陽農協","三島函南農協","伊豆の国農協","あいら伊豆農協","南駿農協","御殿場農協","富士市農協","富士宮農協","清水農協","静岡市農協","大井川農協","ハイナン農協","掛川市農協","遠州夢咲農協","遠州中央農協","とぴあ浜松農協","三ケ日町農協","なごや農協","天白信用農協","緑信用農協","尾張中央農協","西春日井農協","あいち尾東農協","愛知北農協","愛知西農協","海部東農協","あいち海部農協","あいち知多農協","あいち中央農協","西三河農協","あいち三河農協","あいち豊田農協","愛知東農協","蒲郡市農協","ひまわり農協","愛知みなみ農協","豊橋農協","三重北農協","鈴鹿農協","津安芸農協","三重中央農協","一志東部農協","松阪農協","多気郡農協","伊勢農協","伊賀ふるさと農協","福井県農協","越前たけふ農協","レーク大津農協","草津市農協","栗東市農協","おうみ冨士農協","甲賀農協","グリーン近江農協","滋賀蒲生町農協","東能登川農協","湖東農協","東びわこ農協","レーク伊吹農協","北びわこ農協","マキノ町農協","今津町農協","新旭町農協","西びわこ農協","京都市農協","京都中央農協","京都やましろ農協","京都農協","京都丹の国農協","北大阪農協","高槻市農協","茨木市農協","大阪北部農協","大阪泉州農協","いずみの農協","堺市農協","大阪南農協","グリーン大阪農協","大阪中河内農協","大阪東部農協","九個荘農協","北河内農協","大阪市農協","兵庫六甲農協","あかし農協","兵庫南農協","みのり農協","兵庫みらい農協","加古川市南農協","兵庫西農協","相生市農協","ハリマ農協","たじま農協","丹波ひかみ農協","丹波ささやま農協","淡路日の出農協","あわじ島農協","奈良県農協","わかやま農協","ながみね農協","紀の里農協","紀北川上農協","ありだ農協","紀州農協","紀南農協","みくまの農協","鳥取いなば農協","鳥取中央農協","鳥取西部農協","島根県農協","岡山市農協","晴れの国岡山農協","広島市農協","呉農協","安芸農協","佐伯中央農協","広島北部農協","広島中央農協","芸南農協","広島ゆたか農協","三原農協","尾道市農協","福山市農協","三次農協","庄原農協","山口県農協","徳島市農協","東とくしま農協","名西郡農協","板野郡農協","徳島北農協","大津松茂農協","里浦農協","阿南農協","かいふ農協","阿波町農協","市場町農協","阿波郡東部農協","麻植郡農協","美馬農協","阿波みよし農協","香川県農協","うま農協","西条市農協","新居浜市農協","周桑農協","越智今治農協","今治立花農協","松山市農協","愛媛たいき農協","西宇和農協","東宇和農協","えひめ南農協","えひめ中央農協","高知市農協","高知県農協","土佐くろしお農協","宗像農協","粕屋農協","福岡市東部農協","福岡市農協","糸島農協","筑紫農協","筑前あさくら農協","にじ農協","みい農協","久留米市農協","三潴町農協","福岡大城農協","福岡八女農協","柳川農協","南筑後農協","北九州農協","直鞍農協","福岡嘉穂農協","田川農協","福岡京築農協","佐賀市中央農協","佐賀県農協","唐津農協","伊万里市農協","長崎西彼農協","長崎県央農協","島原雲仙農協","ながさき西海農協","ごとう農協","壱岐市農協","対馬農協","熊本市農協","玉名農協","鹿本農協","菊池地域農協","阿蘇農協","上益城農協","熊本宇城農協","八代地域農協","あしきた農協","球磨地域農協","本渡五和農協","あまくさ農協","苓北町農協","べっぷ日出農協","大分県農協","玖珠九重農協","九重町飯田農協","大分大山町農協","宮崎中央農協","綾町農協","はまゆう農協","串間市大束農協","都城農協","こばやし農協","えびの市農協","児湯農協","尾鈴農協","西都農協","延岡農協","日向農協","高千穂地区農協","鹿児島みらい農協","いぶすき農協","南さつま農協","さつま日置農協","北さつま農協","鹿児島いずみ農協","あいら農協","そお鹿児島農協","あおぞら農協","鹿児島きもつき農協","肝付吾平町農協","種子屋久農協","あまみ農協","沖縄県農協","北海道信漁連","青森県信漁連","岩手県信漁連","宮城県漁協","福島県信漁連","茨城県信漁連","千葉県信漁連","東京都信漁連","神奈川県信漁連","新潟県信漁連","富山県信漁連","石川県信漁連","静岡県信漁連","愛知県信漁連","三重県信漁連","福井県信漁連","京都府信漁連","なぎさ信漁連","鳥取県信漁連","ＪＦしまね漁協","広島県信漁連","山口県漁協","徳島県信漁連","香川県信漁連","愛媛県信漁連","高知県信漁連","福岡県信漁連","佐賀県信漁連","長崎県信漁連","大分県漁協","宮崎県信漁連","鹿児島県信漁連","沖縄県信漁連","ゆうちょ銀行"]

banks.each do |bank|
	Bank.create(name:bank)
end