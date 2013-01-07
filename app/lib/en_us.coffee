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
      <h1>About Planet Four</h1>

      <p>
        We’re asking everyone to help us find ‘fans’ on the Martian surface.
        Your classifications on this site will enable researchers to better understand the climate and surface of Mars.
        The images you see here are taken using a high-resolution camera in orbit around the Red Planet.
        We collect together everybody’s markings of objects on these images and average the result.
        This is a task that computers are not reliable at, but which humans are really good at.
        By crowdsourcing your efforts, we can produce data that will show us what is happening in these images.
      </p>

      <figure class="right">
        <img src="images/about/spiders-and-fans.jpg" />
        <figcaption>Figure 1. HiRISE image is ~1 km across. Spiders and fans are visible.</figcaption>
      </figure>

      <p>
        Every winter Mars’ polar region is blanketed by a layer of frozen carbon dioxide, (dry ice) approximately 0.5 – 1 meter deep.
        In the springtime, this seasonal polar cap sublimates (changes directly from ice to gas).
        A host of unearthly phenomena are associated with this dynamic process, illustrated in Figure 1.
      </p>

      <figure class="right">
        <img src="images/about/wind-model.png" />
        <figcaption>Figure 2.  Model – figure from Piqueux et al., 2003</figcaption>
      </figure>

      <p>
        Over the winter the seasonal ice layer is transformed to translucent slab ice, which allows sunlight to penetrate to the ground below in the spring.
        The ground warms up causing the ice to sublimate from the bottom.
        This results in gas becoming trapped below the ice layer, under increasing pressure.
        When a crack or a rupture develops the gas flows out the opening.
        The escaping gas carries along loose material eroded from the ground.
        The gas and fine material flow up to the top of the ice layer and out into the ambient wind, as shown in Figure 2.
        The material lands on top of the seasonal ice layer, downwind of the vent, in fan-shaped deposits.
        After the seasonal ice layer is gone the fans blend back into the surface material and are no longer visible.
      </p>

      <p>
        This same activity occurs every spring, and slowly erodes channels in the ground.
        Often the channels are radially organized, thus earning the colloquial name “spiders”, and more formally “araneiform.”
        Channels are wide and shallow, generally less than 2 meters deep.
        In the winter the spiders are visible because the ice is draped over them;
        in the summer when the terrain is ice-free we see that the spiders are indeed channels carved into the surface, shown in the time-lapse sequence in Figure 3.
      </p>

      <figure>
        <img src="images/about/time-lapse.jpg" />
        <figcaption>Figure 3. Timelapse sequence of a spider initially covered with ~1m of ice (upper left), to ice-free (lower right).</figcaption>
      </figure>

      <p>
        The fans are markers for the wind direction and speed at the time that the gas was escaping and carrying its load of entrained material.
        Sometimes the vents close and re-open and sometimes the wind changes direction, with the result that we see multiple fans from a single source region.
        This is all raw data that can be compared to predictions of models for Mars’ atmospheric dynamics, known as global circulation models (GCMs).
        Sometimes when the conditions are just right the gas will condense into fresh frost particles and form bright fans.
      </p>

      <h2>Measuring time on Mars</h2>

      <p>
        Rather than having months and days of the year the date on Mars’ yearly calendar is given by the solar longitude, Ls.
        When Ls = 0 it is the first day of spring in the northern hemisphere, and the beginning of fall in the southern hemisphere, known on earth as the vernal equinox.
        Ls = 90 marks the beginning of summer in the northern hemisphere and the beginning of winter in the southern hemisphere.
        At Ls = 180 the sun crosses the equator and it is the beginning of fall in the northern hemisphere, and the beginning of spring in the southern hemisphere.
        At Ls = 270 northern winter starts and southern summer gets underway.
      </p>

      <h2>About HiRISE</h2>

      <p>
        The data on this site comes from HiRISE (the High Resolution Imaging Science Experiment), which is a camera on board the Mars Reconnaissance Orbiter.
        HiRISE can image Mars with resolutions of 0.3 m/pixel (about 1 foot), resolving objects below a meter across.
      </p>
    '''

    scientists:
      heading: 'The science team'

      anya:
        name: 'Dr. Anya Portyankina'
        image: 'images/sci-team/anya.jpg'
        description: '''
          <p>Dr. Portyankina completed her doctorate work on the evolution of polar areas of Mars using data from the Mars Orbiting Camera (MOC), analyzing hundreds of MOC images searching for clues of seasonal changes and also worked with High Resolution Stereo Camera  (HRSC) on board the European Mars Express and Venus Monitoring Camera (VMC) from Venus Express.  In 2005 she defended her PhD in Göttingen University on the topic “Atmosphere-surface vapor exchange and ices in the Martian polar regions.”  After the thesis defense she carried on with planning scientific operations for VMC, analysis of data from HRSC and started participating in the work of High Resolution Imaging Science Experiment (HiRISE) on board the Mars Reconnaissance Orbiter.</p>
          <p>She uses a combination of computer modeling, data analysis and laboratory experiments to advance her primary scientific interests: studying behavior of ices on planetary bodies, their interactions with atmospheres and how ices are able to shape planetary surfaces into terrains we currently observe.</p>
        '''

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

      schwamb:
        name: 'Meg Schwamb, Yale University'
        image: 'images/sci-team/meg.jpg'
        description: '''
          <p>
            Meg Schwamb, Yale University is a National Science Foundation Astronomy & Astrophysics Postdoctoral Fellow in the Yale Center for Astronomy & Astrophysics (YCAA) and the Physics Department.
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
        Stargazing Live and the Zooniverse first worked together in 2012, when viewers contributed more than a million classifications in the quest for a planet via <a href="http://www.planethunters.org/">planethunters.org</a>.
        This year, we're exploring a world a little closer to home.
      </p>

      <figure>
        <img src="images/about/planet-hunters.jpg" style="width: 50%;" />
      </figure>
    '''

  profile:
    noRecents: 'Nothing has been marked as a favorite!'
    noFavorites: 'You have no recent classifications!'
