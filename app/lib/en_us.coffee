module.exports =
  navigation:
    classify: 'Classify'
    about:
      root: 'About'
    profile:
      root: 'Profile'
      recents: 'Recents'
      favorites: 'Favorites'
    discuss: 'Discuss'
    blog: 'Blog'

  classify:
    fanTool: 'Fan'
    blotchTool: 'Blotch'
    interestTool: 'Interesting feature'
    favorite: 'Mark as favorite'
    notSignedIn: 'Sign in'
    finished: 'Finished'
    next: 'Next'
    discuss: 'Discuss'

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

    scientists:
      heading: 'The science team'

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
      heading: 'The development team'

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
