(function(storyContent) {

    const hoverEntityMap = {
        "rintaro okabe": {
            title: "Rintaro Okabe",
            subtitle: "Protagonist",
            image: "../images/RintaroOkabe.png"
        },
        "okabe": {
            title: "Rintaro Okabe",
            subtitle: "Protagonist",
            image: "../images/RintaroOkabe.png"
        },
        "kurisu": {
            title: "Kurisu Makise",
            subtitle: "Researcher",
            image: "../images/Kurisu_Full_profile.png"
        },
        "makise kurisu": {
            title: "Kurisu Makise",
            subtitle: "Researcher",
            image: "../images/Kurisu_Full_profile.png"
        },
        "daru": {
            title: "Itaru Hashida",
            subtitle: "Systems Engineer",
            image: "../images/Itaru_Hashida.png"
        },
        "itaru hashida": {
            title: "Itaru Hashida",
            subtitle: "Systems Engineer",
            image: "../images/Itaru_Hashida.png"
        },
        "mayuri": {
            title: "Mayuri Shiina",
            subtitle: "Support Staff",
            image: "../images/Mayuri_full.png"
        },
        "mayuri shiina": {
            title: "Mayuri Shiina",
            subtitle: "Support Staff",
            image: "../images/Mayuri_full.png"
        },
        "leskinen": {
            title: "Professor Alexis Leskinen",
            subtitle: "Lead Overseer",
            image: "../images/Alexis_Leskinen_Portrait.png"
        },
        "professor leskinen": {
            title: "Professor Alexis Leskinen",
            subtitle: "Lead Overseer",
            image: "../images/Alexis_Leskinen_Portrait.png"
        },
        "alexis leskinen": {
            title: "Professor Alexis Leskinen",
            subtitle: "Lead Overseer",
            image: "../images/Alexis_Leskinen_Portrait.png"
        },
        "pocket watch": {
            title: "Pocket Watch",
            subtitle: "Okabe's anchor object",
            image: "../images/Pockety.png"
        },
        "watch": {
            title: "Pocket Watch",
            subtitle: "Okabe's anchor object",
            image: "../images/Pockety.png"
        },
        "tablet": {
            title: "Research Tablet",
            subtitle: "Used for projections and trial data",
            image: "../images/tablet.png"
        },
        "id card": {
            title: "ID Card",
            subtitle: "Halcyon access credential",
            image: "../images/idcard.png"
        },
        "core": {
            title: "The Core",
            subtitle: "Temporal machine at Halcyon",
            image: "../images/core machine.png"
        },
        "well": {
            title: "The Well",
            subtitle: "Temporal basin beneath the Core",
            image: "../images/core machine.png"
        }
    };

    const hoverTerms = Object.keys(hoverEntityMap).sort(function(a, b) {
        return b.length - a.length;
    });

    // Create ink story from the content using inkjs
    var story = new inkjs.Story(storyContent);

    var savePoint = "";

    let savedTheme;
    let globalTagTheme;

    // Global tags - those at the top of the ink file
    // We support:
    //  # theme: dark
    //  # author: Your Name
    var globalTags = story.globalTags;
    if( globalTags ) {
        for(var i=0; i<story.globalTags.length; i++) {
            var globalTag = story.globalTags[i];
            var splitTag = splitPropertyTag(globalTag);

            // THEME: dark
            if( splitTag && splitTag.property == "theme" ) {
                globalTagTheme = splitTag.val;
            }

            // author: Your Name
            else if( splitTag && splitTag.property == "author" ) {
                var byline = document.querySelector('.byline');
                byline.innerHTML = "by "+splitTag.val;
            }
        }
    }

    var storyContainer = document.querySelector('#story');
    var outerScrollContainer = document.querySelector('.outerContainer');
    var hoverCard = document.getElementById('hover-card');
    var hoverCardImage = document.getElementById('hover-card-image');
    var hoverCardTitle = document.getElementById('hover-card-title');
    var hoverCardSubtitle = document.getElementById('hover-card-subtitle');
    var hoverEnabled = loadHoverEnabled();
    var trustKurisuEl = document.getElementById('trust-kurisu-value');
    var trustDaruEl = document.getElementById('trust-daru-value');
    var suspicionEl = document.getElementById('suspicion-value');
    var memoryBleedEl = document.getElementById('memory-bleed-value');
    var anchorHintEl = document.getElementById('anchor-hint-value');
    var trustGuidanceEl = document.getElementById('trust-guidance');

    // page features setup
    setupTheme(globalTagTheme);
    var hasSave = loadSavePoint();
    setupButtons(hasSave);

    // Set initial save point
    savePoint = story.state.toJson();
    updateTrustPanel();

    // Kick off the start of the story!
    continueStory(true);

    // Main story processing function. Each time this is called it generates
    // all the next content up as far as the next set of choices.
    function continueStory(firstTime) {

        var paragraphIndex = 0;
        var delay = 0.0;

        // Don't over-scroll past new content
        var previousBottomEdge = firstTime ? 0 : contentBottomEdgeY();

        // Generate story text - loop through available content
        while(story.canContinue) {

            // Get ink to generate the next paragraph
            var paragraphText = story.Continue();
            var tags = story.currentTags;

            // Any special tags included with this line
            var customClasses = [];
            for(var i=0; i<tags.length; i++) {
                var tag = tags[i];

                // Detect tags of the form "X: Y". Currently used for IMAGE and CLASS but could be
                // customised to be used for other things too.
                var splitTag = splitPropertyTag(tag);
                if (splitTag) {
				    splitTag.property = splitTag.property.toUpperCase();
                }

                // AUDIO: src
                if( splitTag && splitTag.property == "AUDIO" ) {
                  if('audio' in this) {
                    this.audio.pause();
                    this.audio.removeAttribute('src');
                    this.audio.load();
                  }
                  this.audio = new Audio(splitTag.val);
                  this.audio.play();
                }

                // AUDIOLOOP: src
                else if( splitTag && splitTag.property == "AUDIOLOOP" ) {
                  if('audioLoop' in this) {
                    this.audioLoop.pause();
                    this.audioLoop.removeAttribute('src');
                    this.audioLoop.load();
                  }
                  this.audioLoop = new Audio(splitTag.val);
                  this.audioLoop.play();
                  this.audioLoop.loop = true;
                }

                // IMAGE: src
                if( splitTag && splitTag.property == "IMAGE" ) {
                    var imageElement = document.createElement('img');
                    imageElement.src = splitTag.val;
                    storyContainer.appendChild(imageElement);

                    imageElement.onload = () => {
                        console.log(`scrollingto ${previousBottomEdge}`)
                        scrollDown(previousBottomEdge)
                    }

                    showAfter(delay, imageElement);
                    delay += 200.0;
                }

                // LINK: url
                else if( splitTag && splitTag.property == "LINK" ) {
                    window.location.href = splitTag.val;
                }

                // LINKOPEN: url
                else if( splitTag && splitTag.property == "LINKOPEN" ) {
                    window.open(splitTag.val);
                }

                // BACKGROUND: src
                else if( splitTag && splitTag.property == "BACKGROUND" ) {
                    outerScrollContainer.style.backgroundImage = 'url('+splitTag.val+')';
                }

                // CLASS: className
                else if( splitTag && splitTag.property == "CLASS" ) {
                    customClasses.push(splitTag.val);
                }

                else if( splitTag && splitTag.property == "BG" ) {
                    setBodyStateClass("bg-", splitTag.val);
                }

                else if( splitTag && splitTag.property == "TEXT" ) {
                    setBodyStateClass("text-", splitTag.val);
                }

                else if( splitTag && splitTag.property == "FX" ) {
                    setBodyStateClass("fx-", splitTag.val);
                }

                // CLEAR - removes all existing content.
                // RESTART - clears everything and restarts the story from the beginning
                else if( tag == "CLEAR" || tag == "RESTART" ) {
                    removeAll("p");
                    removeAll("img");

                    // Comment out this line if you want to leave the header visible when clearing
                    setVisible(".header", false);

                    if( tag == "RESTART" ) {
                        restart();
                        return;
                    }
                }
            }
		
		// Check if paragraphText is empty
		if (paragraphText.trim().length == 0) {
                continue; // Skip empty paragraphs
		}

            var paragraphElement = document.createElement('p');
            paragraphElement.innerHTML = paragraphText;
            enhanceEntityHovers(paragraphElement);
            storyContainer.appendChild(paragraphElement);

            for(var i=0; i<customClasses.length; i++)
                paragraphElement.classList.add(customClasses[i]);

            showAfter(delay, paragraphElement);
            delay += 200.0;
        }

        // Create HTML choices from ink choices
        story.currentChoices.forEach(function(choice) {

            // Create paragraph with anchor element
            var choiceTags = choice.tags;
            var customClasses = [];
            var isClickable = true;
            for(var i=0; i<choiceTags.length; i++) {
                var choiceTag = choiceTags[i];
                var splitTag = splitPropertyTag(choiceTag);
                if (splitTag) {
				    splitTag.property = splitTag.property.toUpperCase();
                }

                if(choiceTag.toUpperCase() == "UNCLICKABLE"){
                    isClickable = false
                }

                if( splitTag && splitTag.property == "CLASS" ) {
                    customClasses.push(splitTag.val);
                }

            }

            var choiceParagraphElement = document.createElement('p');
            choiceParagraphElement.classList.add("choice");

            for(var i=0; i<customClasses.length; i++)
                choiceParagraphElement.classList.add(customClasses[i]);

            if(isClickable){
                choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`;
            }else{
                choiceParagraphElement.innerHTML = `<span class='unclickable'>${choice.text}</span>`;
            }
            enhanceEntityHovers(choiceParagraphElement);
            storyContainer.appendChild(choiceParagraphElement);

            showAfter(delay, choiceParagraphElement);
            delay += 200.0;

            if(isClickable){
                var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
                choiceAnchorEl.addEventListener("click", function(event) {

                    // Don't follow <a> link
                    event.preventDefault();

                    // Extend height to fit
                    // We do this manually so that removing elements and creating new ones doesn't
                    // cause the height (and therefore scroll) to jump backwards temporarily.
                    storyContainer.style.height = contentBottomEdgeY()+"px";

                    // Remove all existing choices
                    removeAll(".choice");

                    // Tell the story where to go next
                    story.ChooseChoiceIndex(choice.index);

                    // This is where the save button will save from
                    savePoint = story.state.toJson();

                    // Aaand loop
                    continueStory();
                });
            }
        });

		// Unset storyContainer's height, allowing it to resize itself
		storyContainer.style.height = "";

        if( !firstTime )
            scrollDown(previousBottomEdge);

        updateTrustPanel();

    }

    function restart() {
        story.ResetState();

        setVisible(".header", true);

        // set save point to here
        savePoint = story.state.toJson();

        continueStory(true);

        outerScrollContainer.scrollTo(0, 0);
    }

    // -----------------------------------
    // Various Helper functions
    // -----------------------------------

    // Detects whether the user accepts animations
    function isAnimationEnabled() {
        return window.matchMedia('(prefers-reduced-motion: no-preference)').matches;
    }

    // Fades in an element after a specified delay
    function showAfter(delay, el) {
        if( isAnimationEnabled() ) {
            el.classList.add("hide");
            setTimeout(function() { el.classList.remove("hide") }, delay);
        } else {
            // If the user doesn't want animations, show immediately
            el.classList.remove("hide");
        }
    }

    // Scrolls the page down, but no further than the bottom edge of what you could
    // see previously, so it doesn't go too far.
    function scrollDown(previousBottomEdge) {
        // If the user doesn't want animations, let them scroll manually
        if ( !isAnimationEnabled() ) {
            return;
        }

        // Line up top of screen with the bottom of where the previous content ended
        var target = previousBottomEdge;

        // Can't go further than the very bottom of the page
        var limit = outerScrollContainer.scrollHeight - outerScrollContainer.clientHeight;
        if( target > limit ) target = limit;

        var start = outerScrollContainer.scrollTop;

        var dist = target - start;
        var duration = 300 + 300*dist/100;
        var startTime = null;
        function step(time) {
            if( startTime == null ) startTime = time;
            var t = (time-startTime) / duration;
            var lerp = 3*t*t - 2*t*t*t; // ease in/out
            outerScrollContainer.scrollTo(0, (1.0-lerp)*start + lerp*target);
            if( t < 1 ) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    // The Y coordinate of the bottom end of all the story content, used
    // for growing the container, and deciding how far to scroll.
    function contentBottomEdgeY() {
        var bottomElement = storyContainer.lastElementChild;
        return bottomElement ? bottomElement.offsetTop + bottomElement.offsetHeight : 0;
    }

    // Remove all elements that match the given selector. Used for removing choices after
    // you've picked one, as well as for the CLEAR and RESTART tags.
    function removeAll(selector)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            el.parentNode.removeChild(el);
        }
    }

    // Used for hiding and showing the header when you CLEAR or RESTART the story respectively.
    function setVisible(selector, visible)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            if( !visible )
                el.classList.add("invisible");
            else
                el.classList.remove("invisible");
        }
    }

    // Helper for parsing out tags of the form:
    //  # PROPERTY: value
    // e.g. IMAGE: source path
    function splitPropertyTag(tag) {
        var propertySplitIdx = tag.indexOf(":");
        if( propertySplitIdx !== -1 ) {
            var property = tag.substr(0, propertySplitIdx).trim();
            var val = tag.substr(propertySplitIdx+1).trim();
            return {
                property: property,
                val: val
            };
        }

        return null;
    }

    function escapeRegExp(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }

    function enhanceEntityHovers(element) {
        if (!element) return;

        var walker = document.createTreeWalker(element, NodeFilter.SHOW_TEXT, null);
        var textNodes = [];

        while (walker.nextNode()) {
            var currentNode = walker.currentNode;
            if (currentNode.nodeValue && currentNode.nodeValue.trim().length > 0) {
                textNodes.push(currentNode);
            }
        }

        textNodes.forEach(function(textNode) {
            replaceTextNodeWithHoverMarkup(textNode);
        });

        bindEntityHoverEvents(element);
    }

    function replaceTextNodeWithHoverMarkup(textNode) {
        var sourceText = textNode.nodeValue;
        var lowerText = sourceText.toLowerCase();
        var matches = [];

        hoverTerms.forEach(function(term) {
            var searchFrom = 0;
            var lowerTerm = term.toLowerCase();

            while (true) {
                var index = lowerText.indexOf(lowerTerm, searchFrom);
                if (index === -1) break;

                var before = index === 0 ? "" : sourceText.charAt(index - 1);
                var after = index + term.length >= sourceText.length ? "" : sourceText.charAt(index + term.length);
                var beforeOk = !/[A-Za-z0-9]/.test(before);
                var afterOk = !/[A-Za-z0-9]/.test(after);

                if (beforeOk && afterOk) {
                    matches.push({
                        start: index,
                        end: index + term.length,
                        term: term
                    });
                }

                searchFrom = index + term.length;
            }
        });

        if (matches.length === 0) return;

        matches.sort(function(a, b) {
            if (a.start !== b.start) return a.start - b.start;
            return (b.end - b.start) - (a.end - a.start);
        });

        var filteredMatches = [];
        var lastEnd = -1;
        matches.forEach(function(match) {
            if (match.start >= lastEnd) {
                filteredMatches.push(match);
                lastEnd = match.end;
            }
        });

        if (filteredMatches.length === 0) return;

        var fragment = document.createDocumentFragment();
        var cursor = 0;

        filteredMatches.forEach(function(match) {
            if (match.start > cursor) {
                fragment.appendChild(document.createTextNode(sourceText.slice(cursor, match.start)));
            }

            var span = document.createElement('span');
            span.className = 'entity-hover';
            span.setAttribute('data-entity', match.term);
            span.textContent = sourceText.slice(match.start, match.end);
            fragment.appendChild(span);
            cursor = match.end;
        });

        if (cursor < sourceText.length) {
            fragment.appendChild(document.createTextNode(sourceText.slice(cursor)));
        }

        textNode.parentNode.replaceChild(fragment, textNode);
    }

    function bindEntityHoverEvents(scope) {
        var entities = scope.querySelectorAll('.entity-hover');
        entities.forEach(function(entity) {
            entity.addEventListener('mouseenter', function() {
                if (!hoverEnabled) return;
                var key = entity.getAttribute('data-entity');
                var entry = hoverEntityMap[key];
                if (!entry) return;

                hoverCardImage.src = entry.image;
                hoverCardImage.alt = entry.title;
                hoverCardTitle.textContent = entry.title;
                hoverCardSubtitle.textContent = entry.subtitle || "";
                hoverCard.classList.remove('hidden');
                hoverCard.setAttribute('aria-hidden', 'false');
            });

            entity.addEventListener('mouseleave', function() {
                hideHoverCard();
            });
        });
    }

    function hideHoverCard() {
        hoverCard.classList.add('hidden');
        hoverCard.setAttribute('aria-hidden', 'true');
    }

    function loadHoverEnabled() {
        try {
            var saved = window.localStorage.getItem('hover-enabled');
            return saved !== 'false';
        } catch (e) {
            return true;
        }
    }

    function saveHoverEnabled() {
        try {
            window.localStorage.setItem('hover-enabled', hoverEnabled ? 'true' : 'false');
        } catch (e) {
            console.debug("Couldn't save hover preference");
        }
    }

    function updateHoverToggleLabel() {
        var hoverToggleEl = document.getElementById("hover-toggle");
        if (!hoverToggleEl) return;
        hoverToggleEl.textContent = hoverEnabled ? "hover on" : "hover off";
    }

    function slugifyTagValue(value) {
        return value
            .toLowerCase()
            .replace(/[^a-z0-9]+/g, "-")
            .replace(/^-+|-+$/g, "");
    }

    function setBodyStateClass(prefix, rawValue) {
        var value = slugifyTagValue(rawValue);
        if (!value) return;

        Array.from(document.body.classList).forEach(function(className) {
            if (className.indexOf(prefix) === 0) {
                document.body.classList.remove(className);
            }
        });

        document.body.classList.add(prefix + value);
    }

    // Loads save state if exists in the browser memory
    function loadSavePoint() {

        try {
            let savedState = window.localStorage.getItem('save-state');
            if (savedState) {
                story.state.LoadJson(savedState);
                updateTrustPanel();
                return true;
            }
        } catch (e) {
            console.debug("Couldn't load save state");
        }
        return false;
    }

    // Detects which theme (light or dark) to use
    function setupTheme(globalTagTheme) {

        // load theme from browser memory
        var savedTheme;
        try {
            savedTheme = window.localStorage.getItem('theme');
        } catch (e) {
            console.debug("Couldn't load saved theme");
        }

        // Check whether the OS/browser is configured for dark mode
        var browserDark = window.matchMedia("(prefers-color-scheme: dark)").matches;

        if (savedTheme === "terminal") {
            document.body.classList.add("terminal-theme");
        } else if (savedTheme === "dark"
            || (savedTheme == undefined && globalTagTheme === "dark")
            || (savedTheme == undefined && globalTagTheme == undefined && browserDark))
            document.body.classList.add("dark");
    }

    // Used to hook up the functionality for global functionality buttons
    function setupButtons(hasSave) {

        let rewindEl = document.getElementById("rewind");
        if (rewindEl) rewindEl.addEventListener("click", function(event) {
            removeAll("p");
            removeAll("img");
            setVisible(".header", false);
            restart();
        });

        let saveEl = document.getElementById("save");
        if (saveEl) saveEl.addEventListener("click", function(event) {
            try {
                window.localStorage.setItem('save-state', savePoint);
                document.getElementById("reload").removeAttribute("disabled");
                if (document.body.classList.contains("terminal-theme")) {
                    window.localStorage.setItem('theme', 'terminal');
                } else if (document.body.classList.contains("dark")) {
                    window.localStorage.setItem('theme', 'dark');
                } else {
                    window.localStorage.setItem('theme', '');
                }
            } catch (e) {
                console.warn("Couldn't save state");
            }

        });

        let reloadEl = document.getElementById("reload");
        if (!hasSave) {
            reloadEl.setAttribute("disabled", "disabled");
        }
        reloadEl.addEventListener("click", function(event) {
            if (reloadEl.getAttribute("disabled"))
                return;

            removeAll("p");
            removeAll("img");
            try {
                let savedState = window.localStorage.getItem('save-state');
                if (savedState) story.state.LoadJson(savedState);
            } catch (e) {
                console.debug("Couldn't load save state");
            }
            continueStory(true);
        });

        let themeSwitchEl = document.getElementById("theme-switch");
        if (themeSwitchEl) themeSwitchEl.addEventListener("click", function(event) {
            document.body.classList.add("switched");
            if (document.body.classList.contains("terminal-theme")) {
                document.body.classList.remove("terminal-theme");
                document.body.classList.remove("dark");
            } else {
                document.body.classList.add("terminal-theme");
                document.body.classList.remove("dark");
            }
        });

        let hoverToggleEl = document.getElementById("hover-toggle");
        updateHoverToggleLabel();
        if (hoverToggleEl) hoverToggleEl.addEventListener("click", function(event) {
            hoverEnabled = !hoverEnabled;
            if (!hoverEnabled) {
                hideHoverCard();
            }
            saveHoverEnabled();
            updateHoverToggleLabel();
        });
    }

    function safeStoryVar(name) {
        try {
            return story.variablesState.$(name) || 0;
        } catch (e) {
            return 0;
        }
    }

    function updateTrustPanel() {
        if (!trustKurisuEl) return;

        var trustKurisu = safeStoryVar('trust_kurisu');
        var trustDaru = safeStoryVar('trust_daru');
        var suspicion = safeStoryVar('suspicion');
        var memoryBleed = safeStoryVar('memory_bleed');
        var anchorHint = safeStoryVar('anchor_hint');

        trustKurisuEl.textContent = trustKurisu;
        trustDaruEl.textContent = trustDaru;
        suspicionEl.textContent = suspicion;
        memoryBleedEl.textContent = memoryBleed;
        anchorHintEl.textContent = anchorHint;

        if (anchorHint >= 1 && trustKurisu >= 2 && trustDaru >= 2) {
            trustGuidanceEl.textContent = "You have enough trust and the anchor clue. Push toward the lower shaft plan.";
        } else if (trustKurisu < trustDaru) {
            trustGuidanceEl.textContent = "Kurisu needs stronger confidence in Okabe. Choose responses that respect evidence and precision.";
        } else if (trustDaru < trustKurisu) {
            trustGuidanceEl.textContent = "Daru needs reassurance and partnership. Lean into technical trust and shared problem-solving.";
        } else if (memoryBleed > suspicion) {
            trustGuidanceEl.textContent = "The loop is leaking emotionally. Follow intuition and witness effects, especially through Mayuri.";
        } else if (suspicion >= 2) {
            trustGuidanceEl.textContent = "You are seeing the hidden structure. Challenge official narratives and follow concealed routes.";
        } else {
            trustGuidanceEl.textContent = "Build trust with Kurisu and Daru before pushing deeper into the loop.";
        }
    }

})(storyContent);
