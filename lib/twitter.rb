require "pry"
require "dotenv"
require "twitter"

def login_twitter
  Dotenv.load(__dir__ + "/../.env")
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  client
end

def display_tweet(tweet, verbosity = 1)
  puts "%d [%s]  %-35.35s > %-80.80s" % [tweet.id, tweet.created_at, tweet.user.screen_name, tweet.text.tr("\n", " | ")]
end

def tweet_hello_basic
  client = login_twitter
  client.update("Hello Twitter from Ruby #bonjour_monde")
end

def tweet_journalists
  client = login_twitter
  journalists = ["@jcunniet", "@Aziliz31", "@ssoumier", "@marionsouzeau", "@gaellombart", "@bendarag", "@AurelieLebelle", "@julienduffe", "@thomaspoupeau", "@LilyRossignol", "@ClairGuedon", "@stephanieauguy", "@claw_prolongeau", "@_JulieMenard", "@LColcomb", "@Zlauwereys", "@MeLonguet", "@DorotheeLN", "@NolwennCosson", "@ADaboval", "@Remibaldy", "@bderveaux", "@amandechap", "@ELODIESOULIE", "@nbongarcon", "@HeloAb", "@gregplou", "@BenoitBerthe", "@LauraBruneau89", "@Anthony_Lieures", "@Sharonwaj", "@mcsonkin", "@pverduzier", "@emiliel3", "@Julien_MARION", "@SophiFay", "@bdelombre", "@annalecerf", "@AdriaBudry", "@DejNikolic", "@iJaffre", "@CyrusleVirus", "@GPardigon", "@e_vallerey", "@IsabelleSouquet", "@AudeDavidRossi", "@Yoann_Pa", "@CeliaPenavaire", "@perraultvincent", "@cboulate", "@JustineWeyl", "@Paulinejacot", "@juliechab", "@aslechevallier", "@phnou", "@Seb_Pommier", "@Alex_Bensaid", "@GuillaumeGaven", "@annelaurechouin", "@Oliviader", "@guerricp", "@JMMarchaut", "@cyceron", "@gregory_raymond", "@vhunsinger", "@l_peillon", "@fannyguinochet", "@EAssayag", "@YvonHerry", "@JohanGarciajg", "@saidlabidi", "@lauranneprov", "@LeaDavy", "@francois_remy", "@CGuicheteau", "@FloMaillet", "@m_perroud", "@oBrunet_TSMF", "@MoonVdc", "@jc2taille", "@NellyMoussu", "@VirginK", "@b_misa", "@FabriceCouste", "@barbara_prose", "@lelia2m", "@brunoaskenazi", "@laurenechamp", "@ysisbox", "@juliengagliardi", "@PierreLel", "@kdeniau", "@_TerraInc", "@DominicArpin", "@antoinfonteneau", "@nanotousch", "@jb_roch", "@YaniKhezzar", "@Anne_Bechet", "@NCapart", "@SamyBenNaceur", "@Joumany", "@Julietteraynal", "@TGiraudet", "@SaraTanit", "@HappeFrederic", "@antoinellorca", "@michelpicot", "@Sev_Ryne", "@bobdobolino", "@murdever", "@YGrandmontagne", "@Mnyo", "@EdKOSCIANSKI", "@tnoisette", "@jankari", "@delbello_rom", "@rflechaux", "@NadiaSorelli", "@IT_Digital", "@abarbaux", "@PhilippeLeroy", "@schaptal", "@marionspee", "@lisavignoli", "@ChloeAeberhardt", "@MartineJacot", "@JuliaPascualita", "@curieusedetout", "@sgraveleau", "@bif_o", "@zinebdryef", "@apiquard", "@pierrehaski", "@StephanieDelmas", "@Blandine_Garot", "@vergara_i", "@evan_lebastard", "@SophieVclt", "@OlivierLevrault", "@alicedorgeval", "@LouiseMalnoy", "@alix_fx", "@pierre_baudis", "@LucMagoutier", "@AgatheMuller", "@SGianninelli", "@PaulineBoyer33", "@NaomiHalll", "@romaindlx", "@marionbr", "@Burtschy", "@JacobEtienne", "@as_lizzani", "@marie_simon", "@LaureDaussy", "@FabriceAmedeo", "@LoubnaChlaikhy", "@PlummerWilliam", "@OlivierMarin1", "@alaurefremont", "@mwesfreid", "@ChBaDe", "@pmathon", "@theobaldmarie", "@Lnpagesy", "@marclandre", "@paoliniesther", "@Feertchak", "@JBLitzler", "@GuillaumeErrard", "@quentinperinel", "@TristanQM", "@mlbo", "@constancejamet", "@LoraTerrazas", "@emiliegeffray", "@Mathilde_Sd", "@CaroPiquet", "@DCanivez", "@TIM_7375", "@blandinelc", "@ivanrioufol", "@arthurberdah", "@SarahLecoeuvre", "@guillaume_gui", "@DamienMercereau", "@W_Chloe", "@Assma_MD", "@EugenieBastie", "@HiTech_lexpress", "@bcondominas", "@Laurie_Z_", "@jeanfrancgerard", "@MathieuPagura", "@BGUYF", "@AlainPiffaretti", "@AudreyKucinskas", "@julienhory", "@Pierrefalga", "@TiphThuillier", "@cdaniez", "@LigerBaptiste", "@D_Peras", "@julie_dlb", "@julian2lamancha", "@GaetaneDeljurie", "@JulianMattei", "@M_Vicuna", "@DeBruynOlivier", "@Nehed_Jendoubi", "@antoine_grenapi", "@ColonnaGen", "@VictoriaGairin", "@Clement_Lacombe", "@TVigoureux", "@MargauxObriot", "@solinedelos", "@RocheSabine", "@dangerkens", "@EdouardDutour", "@MDondeyne", "@DupuisNathalie1", "@bouscarel", "@Mathieu2jean", "@Sophie_T_J", "@laurentcalixte", "@patrockwilliams", "@PascaleKremer", "@AlexJaquin", "@LauraIsaaz", "@cath_robin", "@Del_Gautherin", "@Isaduriez", "@lucietuile", "@AugeyBastien", "@mcastagnet", "@AminaKalache", "@mvaudano", "@CParrot", "@ombelinetips", "@_JoinLion", "@BarbolosiRose", "@ToiBruno1", "@FloraClodic", "@xjbdx", "@AlexiaEy", "@Emjy_STARK", "@elcoco01", "@rabilebon", "@pflovens_", "@FabriceFrossard", "@MorganeSERRES", "@MarjolaineKoch", "@edgarsnow", "@SRNLF", "@CChassigneux", "@NassiraELM", "@NewsRicard", "@Sandreene", "@Emilezrt", "@Pierre_Do", "@Micode", "@CColumelli", "@DavidAbiker", "@ClementBergantz", "@benjaminrabier", "@celinekallmann", "@edwyplenel", "@C_Barbier", "@JJBourdin_RMC", "@LaurenceFerrari", "@aslapix", "@IsaMillet", "@MaximeSwitek", "@tomjoubert", "@jszanchi", "@roqueeva", "@XavierBiseul", "@florencesantrot", "@AntoineCrochet", "@freeman59", "@MaudeML", "@philippe_gulpi", "@mathieum76", "@kiouari", "@imanemoustakir", "@BenedicteMallet", "@Emilie_Brouze", "@antoinebarret", "@_nicolasbocquet", "@remibuhagiar", "@CourretB", "@AymericRobert", "@miraelmartins", "@pmaniere", "@jesuisraphk", "@David_Ingram", "@pcelerier", "@technomedia", "@Geraldinedauver", "@ThierryLabro", "@Newsdusud", "@nrauline", "@gbregeras", "@SCouasnonBFM", "@actualites_nrv", "@dimitrimoulins", "@oli_aura", "@FabieChiche", "@Vincent_Raimblt", "@ChristophGreuet", "@PAlbuchay", "@MarrauddesGrot", "@vtalmon", "@cedric", "@olivierfrigara", "@Julien_Jay", "@LydiaBerroyer", "@Shuua", "@datisdaz", "@Steuph", "@ameliecharnay", "@Bruno_LesNums", "@LelloucheNico", "@CciliaDiQuinzio", "@Elodie_C", "@SylvRolland", "@Kocobe", "@FL_Debes", "@jdupontcalbo", "@GarciaVictor_", "@NicoRichaud", "@RHoueix", "@simottel", "@DamienLicata", "@annabelle_L", "@Lea_Lejeune", "@axel_deb", "@marin_eben", "@ptiberry", "@MatthieuDelach", "@sandrinecassini", "@benjaminferran", "@ppgarcia75", "@NotPatrick", "@ivalerio", "@FabienneSchmitt", "@alexgoude", "@JeromeColombain", "@manhack", "@Capucine_Cousin", "@Fsorel", "@oliviertesquet", "@marjoriepaillon", "@ginades", "@PierreTran", "@DelphineCuny", "@reesmarc", "@lauratenoudji", "@ldupin", "@carolinedescham", "@Lucile_Quillet", "@cgabizon", "@Allocab", "@epenser", "@JAGventeprivee", "@frwrds", "@Laure__Bourdon", "@Xavier75", "@maximeverner", "@s_jourdain"]
  journalists.shuffle[0..4].each do |handle|
    client.update ("Hello #{handle}, thank you for your work and #bonjour_monde. I'm a bot from @The_Hacking_Pro")
  end
end

def like_bonjour_monde
  client = login_twitter
  client.search("#bonjour_monde", since: "2020-01-01").take(50).each_with_index do |tweet, i|
    client.user.favorite(tweet)
    display_tweet(tweet)
    puts ">> LIKED"
  end
end

def like_THP
  client = login_twitter
  client.search("@The_Hacking_Pro", since: "2020-01-01").take(50).each_with_index do |tweet, i|
    client.favorite(tweet)
    display_tweet(tweet)
    puts ">> LIKED"
  end
end

def follow_bonjour
  client = login_twitter
  client.search("#bonjour_monde", since: "2020-01-01").take(50).each_with_index do |tweet, i|
    puts "--"
    display_tweet(tweet)
    if tweet.user.name != "Mathieu Voland"
      client.follow(tweet.user)
      puts ">> Following: #{tweet.user.name}"
    end
  end
end

def follow_THP
  client = login_twitter
  client.search("@The_Hacking_Pro", since: "2020-01-01").take(50).each_with_index do |tweet, i|
    puts "--"
    display_tweet(tweet)
    if tweet.user.name != "Mathieu Voland"
      if client.friendship?(client.user, tweet.user)
        puts ">> Already following"
      else
        client.follow(tweet.user)
        puts ">> NOW FOLLOWING: #{tweet.user.name}"
      end
    end
  end
end

def test
  client = login_twitter
  client.search("#bonjour_monde @The_Hacking_Pro", since: "2020-01-01").take(50).each_with_index do |tweet, i|
    display_tweet(tweet)
  end
end

def stream_bonjour_monde
  Dotenv.load(__dir__ + "/../.env")
  streamer = Twitter::Streaming::Client.new do |config|
    config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  client = login_twitter
  loop do
    begin
      streamer.filter({ track: "#bonjour_monde, @The_Hacking_Pro" }) do |tweet|
        if tweet.is_a?(Twitter::Tweet)
          display_tweet(tweet)
          if client.friendship?(client.user, tweet.user) || tweet.user.name == "Mathieu Voland"
            print "."
          else
            client.follow(tweet.user)
            print " NOW FOLLOWING: #{tweet.user.name}"
          end
          client.retweet(tweet)
          print " RT"
          client.favorite(tweet)
          puts " LIKED"
        end
      end
    rescue => exception
      puts "=" * 80
      puts "DISCONNECTED #{exception.message}"
      puts "=" * 80
    end
  end
end

def perform
  menu = [
    ["TEST", method(:test)],
    ["Bonjour Monde !", method(:tweet_hello_basic)],
    ["5 journalistes !", method(:tweet_journalists)],
    ["Liker #bonjour_monde svp", method(:like_bonjour_monde)],
    ["Liker @The_Hacking_Pro aussi bien sur", method(:like_THP)],
    ["Follow ceux qui tweet #bonjour_monde", method(:follow_bonjour)],
    ["Follow ceux qui tweet @The_Hacking_Pro", method(:follow_THP)],
    ["Streaming: #bonjour_monde", method(:stream_bonjour_monde)],
  ]

  puts "Merci de faire un choix :"
  menu.size.times { |num| puts "#{num + 1})  #{menu[num][0]}" }
  print "Choix > "
  choice = gets.chomp.to_i

  if choice <= 0 || choice > menu.size
    puts "Please enter a valid number :)"
  else
    menu[choice - 1][1].call
  end
end

if __FILE__ == $0
  perform
end
