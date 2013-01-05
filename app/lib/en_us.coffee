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
      <h1>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</h1>

      <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>

      <h2>Header Level 2</h2>

      <ol>
        <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
        <li>Aliquam tincidunt mauris eu risus.</li>
      </ol>

      <blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>

      <h3>Header Level 3</h3>

      <ul>
        <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
        <li>Aliquam tincidunt mauris eu risus.</li>
      </ul>

      <pre><code>
      #header h1 a {
        display: block;
        width: 300px;
        height: 80px;
      }
      </code></pre>
    '''

    research: '''
      <h1>The research</h1>

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
    '''

    scientists:
      heading: 'The science team'

      aye:
        name: 'Dr. Klaus-Michael Aye'
        image: 'images/sci-team/michael.jpg'
        description: '''
          <p>Klaus-Michael Aye earned a German Diploma in Physics with specialization in High Energy Physics and Astronomy from University of Heidelberg, Germany, in 1999. The diploma thesis covered the examination and calibration of non-linearities in the read-out chain of the High Energy Gamma-Ray Astrophysics Cherenkov telescope array, located in the mountains of Las Palmas de Gran Canaria.</p>
          <p>In 2000, he went to Durham in the United Kingdom to start a PhD course in Experimental High Energy Gamma Ray Physics. His tasks were first to develop a nano-second pulse width laser-based calibration system for the then upcoming new Cherenkov telescope system to be built in the Namibian deserts. Later he took over the tasks of installing, commissioning and maintaining the atmospheric monitoring system of the telescope site. Data from these instruments are crucial to determine the quality of the data of the telescope system.</p>
          <p>Having earned his PhD at the end of 2004, Dr. Aye developed a  growing interest in the local solar system and space-related activities that led him to join the camera team of the Max-Planck-Institute for Solar System Science in Katlenburg-Lindau, Germany. His main activities were helping to develop the higher level operation software for the camera system to be installed on the Dawn satellite that has since already arrived at, fully mapped, and left the asteroid Vesta. Currently, the Dawn satellite is on its way to the largest asteroid Ceres and will arrive there in 2015.</p>
          <p>It was at this stage that the specific interest in the peculiarities of the Martian poles started, by looking over the shoulders of his work group colleague Ganna Portyankina, who was about to earn her PhD with a thesis about the martian polar areas. Later on, these shared interests became much wider in topic and include since 2008, among many other things, sharing their life.</p>
          <p>In 2005 Dr. Aye joined the group of Prof. Nicolas Thomas in Bern, Switzerland, ] to build a new laser altimeter for the European BepiColombo mission to Mercury. His tasks were mostly project management related, but also included monitoring of the development of the software algorithms for the range finding module of the instrument and other software interfaces within the instrument. In his spare time he studied high resolution image data from the HiRISE instrument of the Mars Reconnaissance Orbiter, focusing on understanding the seasonal timelines of the activities at the Martian south pole.</p>
          <p>These activities led to a joint proposal of Dr. Portyankina and Dr. Aye, under the leadership of Dr. Hansen, for a 3 year project to model the seasonal activities at the Martian poles that are creating the fan-shaped deposits and spider-like erosional features. This proposal is currently under review.</p>
          <p>The most recent development in Dr. Aye's activities is the move across the atlantic to join the Diviner Lunar Radiometer Experiment team at the University of California, Los Angeles (UCLA). He is currently responsible for recalibrating the science data of the Diviner instrument which is mounted on the Lunar Reconnaissance Orbiter, currently observing the moon and delivering data uninterrupted since 2009 until today. The recalibration is aiming to increase the reliability and absolute precision of the thermal measurements for a better understanding of the thermal environment of the Moon.</p>
        '''

      hansen:
        name: 'Dr. Candice J. Hansen'
        image: 'images/sci-team/candy.jpg'
        description: '''
          <p>Candice Hansen earned a Bachelor of Science in Physics from California State University, Fullerton, in 1976.  The next year she began work at JPL, joining the Voyager Imaging Team as assistant experiment representative.  Her task was to design the camera image acquisition sequences for every satellite flyby that occurred during Voyagers' encounters with Jupiter, Saturn, Uranus and Neptune.</p>
          <p>The Voyager encounters provided milestones marking many events in her life.  From 1981 to 1984, the long cruise period between the Saturn and Uranus encounters, she worked at the German Space Operations Center in Oberpfaffenhofen.  She worked on the Ion Release Module, the German portion of the Active Magnetospheric Particle Tracer Explorer, a multinational Earth orbiting mission designed to study the Earth's magnetosphere.</p>
          <p>After Voyager’s Uranus flyby she returned to graduate school at UCLA in 1987.  In 1989, in the midst of preparing for the Neptune encounter, she finished her Master of Science in planetary physics and in 1994 completed her doctorate in Earth and Space Science, also at UCLA.  Her dissertation included a thermal model of Triton's nitrogen frost and atmosphere, based on data acquired by Voyager during the 1989 Neptune encounter.  She has also applied the thermal model to Pluto and other Kuiper Belt Objects.</p>
          <p>In 1990 Dr. Hansen began working on the Cassini mission to Saturn with the Ultraviolet Imaging Spectrograph (UVIS) investigation team, responsible for planning and analyzing icy satellite data.  She is still a UVIS Co-Investigator as the Cassini project executes its extended mission phase.  Her current research activity is studying Enceladus’ water vapor plume.</p>
          <p>Dr. Hansen is also currently the Deputy Principal Investigator for the High Resolution Imaging Science Experiment (HiRISE) on the Mars Reconnaissance Orbiter.  Her area of interest is studying the seasonal CO2 polar cap of Mars.   She continues to pursue that interest as a Co-Investigator on the High resolution Stereo and Color Imager (HiSCI) being built to fly on the Mars Trace Gas Orbiter that will launch in 2016.</p>
          <p>As a Co-Investigator on the Juno mission to Jupiter, launching in 2011, Dr. Hansen is responsible for the development and operation of the JunoCam outreach camera that will engage the public in planning images of Jupiter.</p>
          <p>Dr. Hansen retired from JPL in 2010 but continues in all her endeavors under the auspices of the Planetary Science Institute in Tucson.</p>
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

    citizenScience: '''
      <p>This is Citizen Science.</p>
    '''

    stargazingLive: '''
      <h1>Stargazing Live</h1>
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
    '''

  profile:
    noRecents: 'Nothing has been marked as a favorite!'
    noFavorites: 'You have no recent classifications!'
