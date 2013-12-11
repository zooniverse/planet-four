module.exports =
  home:
    participants: 'participants worldwide'
    imagesClassified: 'MRO images classified'
    tagline: """
    With the help of Stargazing Live, citizen scientists<br />
    are exploring the surface of Mars like never before.
    """
    explore: 'Start Exploring'

  navigation:
    classify: 'Classify'
    about:
      root: 'About'
      examples: 'Classification Examples'
      faq: 'FAQs'
      education: 'Education'
      scientists: 'The Scientists'
      developers: 'The Developers'
      moderators: 'The Moderators'
    profile:
      root: 'Profile'
      recents: 'Recents'
      favorites: 'Favorites'
    discuss: 'Discuss'
    blog: 'Blog'

  classify:
    tools:
      fan:
        name: 'Fan'
        darker: 'Darker'
        lighter: 'Lighter'
      blotch:
        name: 'Blotch'
    interestTool: 'Interesting feature'
    favorite: 'Mark as favorite'
    notSignedIn: 'Sign in'
    finished: 'Finished'
    next: 'Next'
    discuss: 'Discuss'
    tutorial: 'Tutorial'
    examples: 'Examples'
    outOfSubjects: "'Error fetching subjects. Maybe we\'re out!'"
    signInPrompt: '<button name="sign-in">Sign in</button> now so we can credit you for your work!'

  about:
    index: '''
      <h1>About</h1>

      <p>Welcome to Planet Four, a citizen science project designed to help planetary scientists identify and measure features on the surface of Mars . . . the likes of which don’t exist on Earth. All of the images on this site depict the southern polar region, an area of Mars that we know little about, and the majority of which have never been seen by human eyes before!</p>

      <figure class="right">
        <img src="images/about/spiders-and-fans.jpg" />
        <figcaption>Figure 1. HiRISE image is ~1 km across. Spiders and fans are visible.</figcaption>
      </figure>

      <figure class="right">
        <img src="images/about/fan-1.png" />
        <img src="images/about/fan-2.png" />
        <img src="images/about/fan-3.png" />
        <figcaption>Figure 2</figcaption>
      </figure>

      <h2>What am I looking for?</h2>

      <p>We need your help to find and mark ‘fans’ and ‘blotches’ on the Martian surface.  Scientists believe that these features indicate wind direction and speed.  By tracking ‘fans’ and ‘blotches’ over the course of several Martian years to see how they form, evolve, disappear and reform, we can help planetary scientists better understand Mars’ climate.  We also hope to find out if these features  form in the same spot each year and also learn how they change.</p>

      <h2>So how do these ‘fans’ form?</h2>

      <p>Rather than measuring days or months, the Martian year is indicated by the solar longitude, Ls.  The year begins at Ls = 0, which is the first day of spring in the northern hemisphere and the first day of autumn in the southern hemisphere.</p>

      <p>Planetary scientists don’t know exactly how ‘fans’ and ‘blotches’ occur, but many believe that during the autumn a seasonal layer of carbon dioxide ice, otherwise known as dry ice, forms on the southern pole.  In the winter, (beginning at Ls = 90) this layer transforms into translucent slab ice.  Once spring arrives, (Ls =180) sunlight is able to penetrate and warm the ground below, causing the ice to <em>sublimate</em> (turn directly from ice into gas) from the bottom.</p>

      <p>This <em>sublimation</em> causes gas to become trapped below the ice layer under increasing pressure.  When a crack or a rupture develops, the gas bursts, not unlike a geyser, out of the opening carrying along loose material eroded from the ground.  When the gas and loose materials reach the surface of the ice they are often blown downwind of the vent in fan-shaped deposits, as shown in Figure 2.  If there isn’t any wind the materials aren’t blown, but rather drop straight down forming a ‘blotch.’</p>

      <p>In the summer, (beginning at Ls = 270) the carbon dioxide melts and the ‘fans’ blend back into the surface material and are no longer visible.  This annual process begins again in the following autumn and slowly erodes channels in the ground.  These wide, shallow channels, generally less than 2 meters deep, are known as ‘spiders,’ though their technical name is <em>araneiform</em>.</p>

      <p>‘Spiders’ are visible in the winter when ice is draped over them, but when the terrain is ice-free in the summer, we can see that the ‘spiders’ are actually channels carved into the surface of Mars.  Figure 3 shows the surface of Mars transforming from the spring at Ls = 181.1 to  Ls = 325.4, which is mid-summer.</p>

      <figure>
        <img src="images/about/time-lapse.jpg" />
        <figcaption>Figure 3. Timelapse sequence of a spider initially covered with ~1m of ice (upper left), to ice-free (lower right).</figcaption>
      </figure>

      <h2>Where do the images come from?</h2>

      <p>The images on this site come from the HiRISE (High Resolution Imaging Science Experiment) camera on board the Mars Reconnaissance Orbiter.  HiRISE can image Mars with resolutions of 0.3 m/pixel (about 1 foot), resolving objects below a meter across.</p>

      <h2>Why do you need our help?</h2>

      <p>There are far too many images for a group of scientists to get through alone and computers are just no good at detecting the features we are trying to mark.  The human mind is far superior at analyzing images with the complexity of the Martian surface!</p>

      <p>Your markings will be collected together with the markings made by other volunteers on that same image. Taking an average of these markings, we will produce an extremely reliable map of the ‘fan,’ and ‘blotch’ features on the surface of Mars and the first large scale measurement of wind on the planet!</p>
    '''

    examples: '''
      <h1>Classification Examples</h1>

      <p>Here are some example classifications of some typical images you might see.</p>

      <div class="example columns">
        <div class="one-third column">
          <figure>
            <img src="images/examples/fan-1.jpg" />
            <figcaption>Fan</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/blotch-1.jpg" />
            <figcaption>Blotch</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/fan-2.jpg" />
            <figcaption>Fan</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/blotch-2.jpg" />
            <figcaption>Blotch</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/fans-3.jpg" />
            <figcaption>Six fans from three sources</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/blotch-3.jpg" />
            <figcaption>Blotch</figcaption>
          </figure>
        </div>
        <div class="one-third column">
          <figure>
            <img src="images/examples/fan-plus-interesting.jpg" />
            <figcaption>Fan + interesting</figcaption>
          </figure>
        </div>
      </div>
    '''

    faq: '''
      <h1>Frequently Asked Questions</h1>

      <p class="question">How do I determine if a dark feature is a fan or a blotch?</p>

      <p class="answer">
        If you can see the source from which the dark feature stretches out
        or if you can tell that it stretches in a particular direction (from left to right, for example,) mark it as a fan.
        Otherwise, mark it as a blotch.
      </p>

      <p class="question">What are those wiggly ridges/channels/veins? Are they rivers or river deltas?</p>

      <p class="answer">
        Those wiggly line structures are actually channels in the Martin surface.
        Several channels that converge to one central point are called spiders (or araneiforms).
        Sometimes they randomly cover area (lace terrain) or form something like polygonal terrain.
        The channels are carved by carbon dioxide gas, not liquid water, as you might think given their appearance.
        It is too cold in these areas for liquid water, about -123C.
        More details on their formation can be found on <a href="#/about">the About page</a>.
      </p>

      <p class="question">Why do fans originate from linear dark features? <a href="http://talk.planetfour.org/#/subjects/APF0000hdj">(Example)</a></p>

      <p class="answer">
        The area you are looking at is completely covered by CO2 ice.
        In the spring, this ice layer is subject to stress under which if finally fractures, forming long, often linear cracks.
        Pressured CO2 below the ice layer finds these cracks and escapes through them as jets.
        When these CO2 jets carry dust along they create fans.
      </p>

      <p class="question">What are these bright circular features at the sources of fans? <a href="http://talk.planetfour.org/#/subjects/APF0000j1b">(Example)</a></p>

      <p class="answer">
        The bright circular features are boulders.
        They stick out of the ice layer and warm faster than the ice around them.
        Only the ice that directly touches them starts to sublime,
        this is how fans tend to develop starting at these boulders.
      </p>

      <p class="question">What are these bright red (or green) patches?</p>

      <p class="answer">
        The color images are combinations of 3 color filters,
        so if you see a green stripe, a bright red dot or a strikingly blue smudge,
        that likely means that there is some data missing in the other filters.
        For example, sometimes you'll see half of an image as plain green.
        This means data from the red filter is missing.
        When whole image appears dark red, the blue filter is missing.
        These are tiny technical glitches.
      </p>

      <hr />

      <p>And a tip: If you can see fans this means that the whole area covered by a CO2 ice layer. When there is no CO2 ice, fan material looks just like usual surface.</p>
    '''

    education: '''
      <h1>Education</h1>

      <h2>Can I use Planet Four in the classroom?</h2>

      <p>We would love you to! Planet Four, just like all the <a href="http://zooniverse.org">Zooniverse</a> projects, offers students a unique opportunity to explore real scientific data, while making a contribution to cutting edge research. We would like to stress that as each image is marked by multiple volunteers, it really does not matter if your students don't mark all the features correctly. That being said, the task itself is simple enough that we believe most people can take part and make a worthwhile contribution regardless of age.</p>

      <h2>What resources are there to support use in the classroom?</h2>

      <p><a href="http://mars.jpl.nasa.gov/mro/participate/">NASA Jet Propulsion Laboratory</a> has a great collection of education resources relating the the Mars Reconnaissance Orbiter. It's also worth checking out <a href="http://nasawavelength.org/resource-search?qq=mars" title="NASA's wavelength">NASA's wavelength</a>, this site allows you to search for resources that relate to Mars across a ranges of Martian missions.</p>

      <p>The Zooniverse has also recently launched <a href="http://www.zooteach.org">ZooTeach</a> where educators can share resources relating to Planet Four and the other citizen science projects. Planet Four is a recent addition, so if you have any idea's for how to use the project in the classroom, it would be great if you could share your lesson idea's or resources!</p>

      <h2>How can I keep up to date with education and Planet Four?</h2>

      <p><a href="http://blog.planetfour.org/">The Planet Four Blog</a> is a great place to keep up to date with the latests science results, but there is also a <a href="http://education.zooniverse.org">Zooniverse Education Blog</a> as well as a <a href="https://twitter.com/ZooTeach">@zooteach</a> Twitter feed.</p>
    '''

    scientists:
      heading: 'The Science Team'

      aye:
        name: 'Dr. Klaus-Michael Aye'
        image: 'images/sci-team/michael.jpg'
        description: '''
          <p>In 2005 Dr. Aye joined the group of Prof. Nicolas Thomas in Bern, Switzerland, to build a new laser altimeter for the European BepiColombo mission to Mercury.  In his spare time, he studied high-resolution image data from the HiRISE instrument of the Mars Reconnaissance Orbiter, focusing on understanding the seasonal timelines of the activities at the Martian south pole.</p>
          <p>Recently, Dr. Aye joined the Diviner Lunar Radiometer Experiment team at the University of California, Los Angeles.  He is responsible for recalibrating the science data of the Diviner instrument, mounted on the Lunar Reconnaissance Orbiter. The recalibration is aiming to increase the reliability and absolute precision of the thermal measurements for a better understanding of the thermal environment of the Moon.</p>
        '''

      hansen:
        name: 'Dr. Candice J. Hansen'
        image: 'images/sci-team/candy.jpg'
        description: '''
          <p>Dr. Hansen is the Deputy Principal Investigator for the High Resolution Imaging Science Experiment (HiRISE) on the Mars Reconnaissance Orbiter.  Her area of interest is studying the seasonal CO2 polar cap of Mars.  She continues to pursue that interest as a Co-Investigator on the High resolution Stereo and Color Imager (HiSCI) being built to fly on the Mars Trace Gas Orbiter that will launch in 2016.</p>
          <p>As a Co-Investigator on the Juno mission to Jupiter, launched in 2011, Dr. Hansen is responsible for the development and operation of the JunoCam outreach camera that will engage the public in planning images of Jupiter.  Dr. Hansen retired from JPL in 2010 but continues in all her endeavors under the auspices of the Planetary Science Institute in Tucson.</p>
        '''

      portyankina:
        name: 'Dr. Anya Portyankina'
        image: 'images/sci-team/anya.jpg'
        description: '''
          <p>Dr. Portyankina completed her doctorate work on the evolution of polar areas of Mars using data from the Mars Orbiting Camera (MOC), analyzing hundreds of MOC images searching for clues of seasonal changes and also worked with High Resolution Stereo Camera  (HRSC) on board the European Mars Express and Venus Monitoring Camera (VMC) from Venus Express.  In 2005 she defended her PhD in Göttingen University on the topic “Atmosphere-surface vapor exchange and ices in the Martian polar regions.”  After the thesis defense she carried on with planning scientific operations for VMC, analysis of data from HRSC and started participating in the work of High Resolution Imaging Science Experiment (HiRISE) on board the Mars Reconnaissance Orbiter.</p>
          <p>She uses a combination of computer modeling, data analysis and laboratory experiments to advance her primary scientific interests: studying behavior of ices on planetary bodies, their interactions with atmospheres and how ices are able to shape planetary surfaces into terrains we currently observe.</p>
        '''

      schwamb:
        name: 'Dr. Meg Schwamb'
        image: 'images/sci-team/meg.jpg'
        description: '''
          <p>
            Meg Schwamb is a National Science Foundation Astronomy & Astrophysics Postdoctoral Fellow in the Yale Center for Astronomy & Astrophysics (YCAA) and the Physics Department.
            Meg studies the small bodies of the outer solar system and what they can tell us about how the solar system formed.
            She is currently hunting for dwarf planets residing in the southern skies.
            While not observing, Meg can be found hanging out with her black cat Stella.
            Meg is supported by the NSF Astronomy and Astrophysics Postdoctoral Fellowship under award AST-1003258.
          </p>
        '''

    developers:
      heading: 'The Development Team'

      borden:
        name: 'Kelly Borden'
        image: 'images/dev-team/kelly.jpg'
        description: '''
          Kelly is an archaeologist by training but an educator by passion.
          While working at the Museum of Science and Industry and the Adler Planetarium she became an enthusiastic science educator eager to bring science to the masses.
          When not pondering the wonders of science, Kelly can often be found baking or spending time with her herd of cats – Murray, Ada, & Kepler.
        '''

      carstensen:
        name: 'Brian Carstensen'
        image: 'images/dev-team/brian.jpg'
        description: '''
          Brian is a web developer working on the Zooniverse family of projects at the Adler Planearium.
          Brian has a degree in graphic design from Columbia College in Chicago, and worked in that field for a number of years before finding a niche in web development.
        '''

      lintott:
        name: 'Chris Lintott'
        image: 'images/dev-team/chris.jpg'
        description: '''
          Chris Lintott leads the Zooniverse team, and is his copious spare time is a researcher at the University of Oxford specialising in galaxy formation and evolution.
          A keen popularizer of science, he is best known as co-presenter of the BBC's long running Sky at Night program. He's currently drinking a lot of sherry.
        '''

      miller:
        name: 'David Miller'
        image: 'images/dev-team/david.jpg'
        description: '''
          David is passionate about tellings stories through clear, clean, and effective design.
          Before joining the Zooniverse team as Visual Designer, David worked for the Raindance Film Festival, the News 21 Initiative's Apart From War, and as a freelance designer for his small business, Miller Visual.
          David is a graduate of the S.I. Newhouse School of Public Communications at Syracuse University.
        '''

      parrish:
        name: 'Michael Parrish'
        image: 'images/dev-team/michael.jpg'
        description: '''
          Michael has a degree in Computer Science and has been working with The Zooniverse for the past three years as a Software Developer.
          Aside from web development; new technologies, science, AI, reptiles, and coffee tend to occupy his attention.
        '''

      simpson:
        name: 'Robert Simpson'
        image: 'images/dev-team/rob.jpg'
        description: '''
          Rob is an astrophysicist and web developer working at Oxford University as a member of the Zooniverse Team,
          creating citizen science projects where anyone can contribute to real science online.
          Rob loves astronomy, web geekery, improvisational comedy and listening to Radio 4.
        '''

      smith:
        name: 'Arfon Smith'
        image: 'images/dev-team/arfon.jpg'
        description: '''
          Arfon is responsible for leading the development of the Zooniverse, a platform for online citizen science.
          In August of 2011 he took up the position of Director of Citizen Science at the Adler Planetarium
          where he continues to lead the software and infrastructure development for the Zooniverse.
          He studied Chemistry at the University of Sheffield and completed his PhD in Astrochemistry at The University of Nottingham in 2006.
        '''

      whyte:
        name: 'Laura Whyte'
        image: 'images/dev-team/laura.jpg'
        description: '''
          Laura Whyte completed a PhD in astrophysics at the University of Nottingham in 2004. With a background in
          adult education and software development Laura is the lead of ZooTeach and is very excited about 
          what the future holds for the Zooniverse and formal education.
        '''

    moderators:
      heading: "The Moderators"
      keegan:
        name: "John G Keegan (Kitharode)"
        description: "
          John G Keegan (Kitharode) is a retired musician, astronomer and environmental scientist, living in the hills around Todmorden, West Yorkshire. He loves Beethoven, Bluegrass music, Rugby Union, and his dog (Brandy). He is currently making a study of ancient Greek musical notation. John is very keen on promoting Citizen Science (especially the Planet Four project) and he is developing a number of presentations to take into schools."
      martin:
        name: "Andy Martin (wassock)"
        description: "Andy Martin (wassock) co-owns and runs a campsite near Bude having given up the life corporate for the sea, surf and starry skies of Cornwall.  As a chemist Andy spent many years involved in the assessment of laboratory quality systems and the development of standards. These days he finds he has many more jobs to do and much less free time than when he was a wage slave, but can at least hear the sea through the window whilst viewing Mars on his screen."
      smith:
        name: "Dave Smith (JellyMonster)"
        description: "Dave Smith (JellyMonster) served over twenty years in the printing industry (pre-press).  This probably explains why he has a fascination with images.  He currently lives in Norfolk in the UK.  His interests include one-dimensional binary Cellular Automata (purely for the patterns), chess and logic games.  Also a keen pétanque player.  Found out about the Planet Four site after watching 'Stargazing Live'."

    stargazingLive: '''
      <h1 style="text-align: center;">
        <img src="images/about/stargazing-live-logo.png" alt="Stargazing Live" />
      </h1>

      <p>
        Stargazing Live is the BBC's annual celebration of astronomy, with Professor Brian Cox and Dara O Briain hosting three nights of stargazing and discussion, live from Jodrell Bank.
        As well as asking some of the big questions, there will be hints and tips for getting started in stargazing and advice on navigating your way around the skies.
      </p>

      <p>And with scores of Stargazing LIVE events occurring across the UK throughout January and February 2013, there will be some incredible opportunities for making the most of the night sky.</p>

      <p>A free guide to the night sky, and plenty more resources are available at <a href="http://www.bbc.co.uk/programmes/b019h4g8">the show's website</a>.</p>

      <p>
        Stargazing Live and the Zooniverse first worked together in 2012, whenviewers contributed more than a million classifications and <a href="http://blog.planethunters.org/?s=stargazing">identified a Neptune sized planet candidate</a> in the nation wide quest via <a href="http://www.planethunters.org">planethunters.org</a>. 
        This year, we're exploring a world a little closer to home.
      </p>

      <figure>
        <img src="images/about/planet-hunters.jpg" style="width: 70%;" />
      </figure>
    '''

  profile:
    noRecents: 'Nothing has been marked as a favorite!'
    noFavorites: 'You have no recent classifications!'
    loadMore: 'Load more'
