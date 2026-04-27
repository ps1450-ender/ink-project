// Partial draft for Ink narrative
// Protagonist: Rintaro Okabe
// Steins;Gate cast reimagined inside a temporal research facility
// This draft ends after Okabe realizes the loop and triggers the first key break event.

VAR loop_count = 0
VAR suspicion = 0
VAR trust_kurisu = 0
VAR trust_daru = 0
VAR anchor_hint = 0
VAR memory_bleed = 0
VAR key_event = 0

-> start

=== start ===
~ loop_count = 1
# BG:sterile-white
# TEXT:slate-blue
# FX:none
The first thing Rintaro Okabe notices every morning is the humming.

It lives behind the walls of Halcyon Temporal Research Center like a second circulatory system: fans, coolant pumps, relay clicks, magnetic coils waking in sequence, and somewhere below all of it the giant engine everybody in the institute refers to simply as the Core. The sound is steady enough that most people tune it out after a week. Okabe has been here five months and still hears it like a threat pretending to be infrastructure.

At 05:43, the lights over his bunk shift from dim moon-white to full laboratory brightness. The metal frame of the bed is too narrow, the pillow too flat, and the room too neat to feel lived in. Every surface seems to belong to the building first and to him second. A folded black coat hangs by the door. Three notebooks are stacked on the desk in precise order. His ID card sits beside a half-disassembled pocket watch and a coffee mug with the chipped remains of a cartoon cat near the handle.

He sits up slowly and waits for the speaker in the ceiling.

It clicks on cue.

"Good morning, Research Lead Okabe. Resonance trial schedule remains unchanged. Morning diagnostics begin at 06:20. Core synchronization briefing at 07:00."

Okabe stares at the ceiling. "A bleak opening line for a tragic masterpiece," he mutters.

Nobody hears him, which is ideal. He prefers it that way at this hour.

He swings his feet to the floor and presses a palm to his face until the stiffness leaves. The mirror above the sink gives him the same reflection it always does: sharp eyes, worse hair than he deserves, and the specific look of a man who has not yet decided whether he is underqualified or dangerously correct.

Halcyon recruited him because of his work in temporal cognition and recursive memory structures. Their offer promised unlimited funding, unrestricted access to prototype equipment, and a chance to participate in the first controlled resonance experiment capable of "sustained chronological folding." The phrase had sounded absurd enough to be irresistible.

Now he lives underground with too many secrets and not enough exits.

On the desk, his pocket watch ticks faintly beneath his fingers. It belonged to no one important. He bought it from a street stall years ago because it looked theatrical. Even so, it has become his favorite object in the facility, mostly because it is mechanical and honest. It either runs or it does not. No one in research gets to claim the same.

Today is supposed to be a milestone: Halcyon's longest continuous resonance test, overseen by Professor Leskinen himself and audited by the board upstairs. Kurisu spent most of the week warning that the phase lattice was unstable. Daru spent most of the week pretending to joke about it while secretly working overnight patches. Mayuri, the only person in the building who can make fluorescent lighting feel less hostile, told him last night that the institute felt "too excited in a scary way."

He had laughed that off then.

He is less certain now.

Outside his room, the corridor curves along the inner residential ring. White floor lights guide staff toward the lifts. Reinforced windows reveal lower sectors: diagnostics, archive halls, maintenance tubes, and far beyond them the blue haze that rises from the Core chamber like submerged weather. Researchers in slate uniforms move with practiced purpose. No one is running. No one is panicking. It is the kind of fragile calm that usually means disaster is still dressed as routine.

Breakfast is one floor up. Diagnostics are one floor down. Either way, the day begins with people pretending they understand what this place is doing.

* Go to breakfast and find Kurisu before diagnostics.
    -> cafeteria
* Head straight to diagnostics and deal with everyone later.
    ~ suspicion = suspicion + 1
    -> diagnostics

=== cafeteria ===
# BG:soft-amber
# TEXT:ink-black
# FX:steam
The cafeteria tries very hard not to feel subterranean.

Warm lights. Fake wood tables. Potted herbs under artificial dawn panels. A coffee machine that hisses like it resents its own existence. Someone in administration must have decided morale could be engineered through color temperature.

Makise Kurisu is standing near the beverage station with a tablet in one hand and untouched tea in the other. Her hair is pinned back carelessly. She has the expression of someone already halfway through an argument nobody else has caught up to yet. Several junior researchers give her a wide berth, which is sensible. Kurisu at rest is intimidating enough. Kurisu before a major trial is practically a force field.

She spots him immediately. "You look terrible."

"An excellent start to the day, assistant. Your loyalty remains unimpressive."

"I am not your assistant."

"Then why are you always assisting my genius?"

She gives him the exact look she reserves for statements too ridiculous to deserve full verbal demolition. "Because if I leave the future of temporal cognition to your theatrical instincts and Daru's coding habits, this facility will become a crater."

That gets a laugh out of him. Briefly, the morning becomes normal.

Kurisu sets the tablet flat on the counter between them. "I reran the phase drift projections," she says in a lower voice. "The stabilization claims are wrong. Either the overnight logs are incomplete, or someone is trimming anomalies before they reach the review packets."

"By someone, you mean Leskinen."

"By someone with authority." She pauses. "Yes, I mean Leskinen."

Okabe glances around the cafeteria. Mayuri is near the greenhouse produce cart, cheerfully arranging cut fruit in a way that suggests she has unofficially adopted the breakfast staff. Daru is nowhere visible, which probably means he is still in Diagnostics Bay B drowning in cable nests and energy drinks.

"And yet the great institution marches onward," Okabe says. "How inspiring."

Kurisu folds her arms. "You joke when you're worried."

"I joke when I'm brilliant. Worry is a side effect."

She ignores that. "Say something in the briefing."

* Tell Kurisu you'll challenge the trial if the numbers look wrong.
    ~ trust_kurisu = trust_kurisu + 1
    ~ suspicion = suspicion + 1
    "If Leskinen pushes a broken system into a live resonance window, I'll say it in front of everyone," he says.
    Kurisu exhales through her nose, not quite relieved. "Good. I'd rather not be the only difficult person in the room."
    -> diagnostics
* Tell Kurisu you want harder evidence before you accuse anyone.
    "Suspicion is not a weapon unless it lands with proof," he says.
    Kurisu's shoulders loosen, but only slightly. "Fine. Then get proof quickly."
    -> diagnostics
* Brush the concern aside and keep the conversation light.
    ~ trust_kurisu = trust_kurisu - 1
    "If science wanted safety, it would have chosen a less dramatic field."
    Kurisu's expression hardens. "That line will sound very stupid if something goes wrong today."
    -> diagnostics

=== diagnostics ===
# BG:sterile-white
# TEXT:steel-blue
# FX:monitor-flicker
Diagnostics Bay B smells like antiseptic and overheated processors.

Monitors bloom to life as he enters. The room is built around a circular scan platform ringed by neural readers, biometrics towers, and resonance exposure sensors designed to catch tiny deviations in pulse, cognition, and signal interference. Halcyon treats the human nervous system as both passenger and instrument, which Okabe has always found scientifically fascinating and morally unpleasant.

Daru is hunched over an open control panel with three cables looped around his wrist and a stylus tucked behind one ear. His official badge reads ITARU HASHIDA, SYSTEMS ENGINEER. His unofficial role in the facility is "the man who keeps impossible machines from expressing themselves through fire."

"Okarin!" Daru says, not looking up. "Please tell me you slept. Lie if necessary. I need emotional support."

"A genius never lies about sleep deprivation. It is part of the mystique."

"You look like mystique got hit by a truck."

Okabe steps onto the scan platform. Blue light sweeps over him from head to toe. Daru studies the rolling results and grimaces.

"Okay, wow. Stress markers are up. Cortisol's doing side quests. Also your right hand has a micro tremor."

"The machine is slandering me."

"The machine is probably the least dishonest thing in this room."

That line lands harder than Daru seems to intend. He glances toward the door, lowers his voice, and taps open a hidden window on the side monitor.

"You know the overnight sync packets?" Daru asks.

"The ones Kurisu thinks were cleaned before review."

"Yeah. They were." Daru brings up a sequence of logs, then overlays a second set with red markers. "Main archive copy shows smooth continuity. Shadow cache shows thirteen seconds missing from every cycle verification pass around 02:14."

Okabe narrows his eyes. "Missing how?"

"Not corrupted. Rerouted." Daru swallows. "Permissions channel routes through executive control."

"Leskinen."

"I didn't say that."

"Your face did."

The scan platform beeps. Cleared for reactor access.

Daru taps the screen off too quickly, as if afraid the walls are reading over his shoulder. "Look, I'm not trying to start a rebellion before coffee, but something about today's run feels cursed. If the Core spikes and the override chain is incomplete, we're basically doing live surgery on time with a butter knife."

* Tell Daru to send you the shadow logs after the briefing.
    ~ trust_daru = trust_daru + 1
    ~ suspicion = suspicion + 1
    "Send everything to my terminal," Okabe says. "If someone is editing reality's paperwork, I want copies."
    Daru gives a weak grin. "Now that's the mad scientist energy I know."
    -> briefing
* Tell Daru to stay quiet until you know more.
    "Do not wave this around yet," Okabe says. "If Leskinen is already scrubbing data, we move carefully."
    Daru nods, though he does not look reassured. "Carefully is kind of my panic style anyway."
    -> briefing
* Leave it alone for now and head to the briefing.
    -> briefing

=== briefing ===
# BG:graphite
# TEXT:pale-cyan
# FX:projector-hum
The briefing hall is a semicircle of descending seats aimed at a holographic projection of the Core assembly.

Professor Alexis Leskinen stands at the center with a presenter’s posture and a diplomat’s smile. He has the gift of sounding compassionate while saying things no ethical person should accept at face value. Around him gather department leads, systems staff, board representatives, and enough assistants to create the illusion that procedure and wisdom are close relatives.

The projected model spins above the floor: outer magnetic collar, relay spine, shield lattice, resonance chamber, and below all of it the vertical shaft where the excavation team first discovered the anomaly Halcyon was built around. Officially it is called a temporal basin. Unofficially almost everyone refers to it as the Well.

"Today," Leskinen says, "we extend stable resonance to a duration never before achieved. Twelve uninterrupted minutes. If successful, Halcyon moves from demonstration into reproducible control."

Slides appear behind him. Efficiency curves. Safety margins. Neural tolerance estimates. Executive language pretending to be physics. Not one slide mentions missing log segments. Not one acknowledges the irregular spikes Kurisu has been complaining about for days.

When Leskinen opens the floor for questions, the silence is immediate and strategic.

* Speak up about the missing or altered data.
    ~ suspicion = suspicion + 1
    Okabe rises with enough flourish to irritate half the room before he even speaks.

    "A humble inquiry from the field," he says. "Why are we pretending the overnight continuity logs are complete when Bay B can demonstrate executive-route omissions?"

    Heads turn. Daru goes rigid. Kurisu looks down at the table, which in her case is the closest thing to visible panic.

    Leskinen's smile shifts but does not fall. "Mr. Okabe, engineering discrepancies were reviewed and classified as transient formatting artifacts."

    "Reality rarely formats itself by executive privilege."

    A few people make the mistake of looking amused. Leskinen notices. "Your concern is noted," he says softly. "We proceed."

    The room learns from his tone that discussion is over.
    -> core_ring
* Ask for a short delay and a full systems audit.
    ~ suspicion = suspicion + 1
    "Given current instability projections, we should postpone until the continuity chain is independently verified."

    Leskinen folds his hands. "Delay would cost us an external observation window we may not recover for months. Supplemental audit will proceed in parallel."

    Meaning: no.
    -> core_ring
* Stay silent and watch everyone else instead.
    ~ memory_bleed = memory_bleed + 1
    He keeps his seat and studies the room.

    Kurisu's jaw tightens almost imperceptibly. Daru avoids eye contact with every superior in sight. Mayuri, seated farther back as non-core support staff, looks less confused than she should. Leskinen never glances at the data once the slides begin. He watches people.
    -> core_ring

=== core_ring ===
# BG:ice-blue
# TEXT:white
# FX:low-vibration
The Core ring is part laboratory, part cathedral, part crime scene waiting for its official paperwork.

Catwalks arc around a central shaft descending into blue-white depth. Superconductive coils glow behind shield glass. Coolant lines pulse with pale light through the floor. Every spoken word returns in delayed echoes, as if the chamber is listening before it decides whether to let sound continue.

Okabe's assigned console sits on the western arc with direct telemetry access to cognition feedback and harmonic response. Kurisu works three stations away. Daru moves between the systems bridge and relay board with the look of a man whose soul is held together by keyboard shortcuts. On an upper control dais, Leskinen oversees the trial as though he were conducting a recital rather than gambling with chronology.

At exactly 08:00, the sequence begins.

Minute one: clean harmonic rise.

Minute two: anchor lattice stable.

Minute three: neural feedback within acceptable range.

For a brief and dangerous span of time, it looks like everyone's optimism might survive contact with reality.

Then the details begin.

At 08:03, one of Okabe's monitors flickers and briefly repeats the same timestamp twice.

At 08:05, a low ache blooms behind his eyes, sharp and strange, as if a memory is trying to enter through the wrong door.

At 08:06, Kurisu turns from her station and mouths something at him. He cannot hear it, but he reads enough of it anyway.

_That should not happen._

At 08:07, Daru shouts for a correction on relay drift.

At 08:08, every reflective panel in the chamber seems to hold a second image for half a second too long.

At 08:09, the alarms begin.

Red shutters slam over observation glass. The floor vibrates hard enough to shake a tablet off the console beside him. System warnings bloom across every display. Daru is yelling that the anchor lattice is reflecting signal back into the shaft. Kurisu is already issuing shutdown instructions no one on the executive dais seems interested in following. Leskinen is demanding manual correction with infuriating calm.

The blue-white center of the Well sharpens into something narrower, brighter, more focused than light should be.

Then the entire chamber goes still.

Not quiet. Still.

A droplet of coolant hangs in midair.

A warning stripe remains half-scanned across the floor.

The corner of Daru's sleeve is frozen in motion as he turns.

Inside the center of the Well, a vertical aperture opens with the terrible precision of an eye learning how to imitate machinery.

And it looks directly at Okabe.

-> collapse

=== collapse ===
# BG:warning-red
# TEXT:white
# FX:alarm-strobe
The world snaps like a wire under tension.

Okabe wakes with a violent breath, one hand gripping the blanket so tightly his knuckles ache.

The room is dark for one more second. Then the lights rise.

The ceiling speaker clicks.

"Good morning, Research Lead Okabe. Resonance trial schedule remains unchanged. Morning diagnostics begin at 06:20. Core synchronization briefing at 07:00."

The clock reads 05:43.

He does not move.

For three full seconds, his body understands the situation before his mind agrees to catch up. The bunk. The desk. The coat by the door. The pocket watch. Every object in the same position it occupied before the trial. His chest hurts as if he has been running.

"No," he says aloud, because absurdity deserves witnesses even when none are present.

He crosses to the sink too quickly, splashes cold water onto his face, and looks into the mirror. Same room. Same voice in the speaker. Same morning.

But not the same body.

His pulse remembers impact. His ears remember alarms. His eyes remember that impossible opening in the Well turning toward him with something too specific to be called random.

He grabs the pocket watch from the desk and presses it to his palm.

Tick.

Tick.

Tick.

Mechanical, consistent, insulting.

The corridor outside smells the same. The lift arrives on the same delay. In the cafeteria, Kurisu stands in the same place with the same tablet. She looks up as he enters.

"You look terrible," she says.

The line hits him harder than the alarms did.

He laughs once, too sharp and too early. Kurisu frowns immediately.

There are only two possibilities. Either he is hallucinating with impossible structural consistency, or the day has restarted.

He hates both explanations.

-> second_cycle

=== second_cycle ===
# BG:dim-cyan
# TEXT:white
# FX:subtle-glitch
The second run through the morning is an experiment disguised as panic control.

Okabe says as little as possible and starts testing the edges of repetition. He checks the hallway clock before the lift doors open. Same delay. He bumps into the same junior researcher outside the cafeteria. Same apology. Kurisu says the same first line. Daru delivers the same complaint about sleep in Diagnostics Bay B. Leskinen gives the same polished speech in the briefing hall with the same immaculate confidence.

The world is not merely similar.

It is replaying.

By the time the trial reaches minute eight, his hands are shaking.

He knows when Kurisu will mouth her warning.

He knows when Daru will call for correction.

He knows the exact half second before the alarms hit.

This time he watches the Well instead of the monitors.

The stillness comes.

The eye opens.

And somewhere in the ringing emptiness between terror and recognition, Okabe feels something impossible: familiarity. Not comfort. Worse. The sense that the chamber expects him to be there.

The reset slams into him again.

He wakes at 05:43.

Now there is no denial left to hide inside.

~ loop_count = 2
~ memory_bleed = memory_bleed + 1

-> realization

=== realization ===
# BG:midnight-blue
# TEXT:cool-white
# FX:scanlines
By the third morning, Rintaro Okabe stops thinking in terms of coincidence.

He is in a loop.

The statement is absurd, melodramatic, scientifically offensive, and completely true.

The knowledge changes everything at once. The institute is no longer a normal workplace with one catastrophic experiment. It is a closed system reenacting a single day around the Core event, while at least one human mind, his own, remains continuous across resets. The implications crowd his head so quickly he has to sit on the edge of the bunk before he falls over.

Questions come in waves.

Why him?

Why this day?

Why does the Well look at him like recognition?

And most urgently: what can survive from one loop to the next besides memory?

He starts using the morning like a lab bench.

On one run, he scratches a mark beneath the desk drawer and finds it gone on reset. Matter does not hold.

On another, he deliberately arrives late to the cafeteria. Kurisu's routine changes slightly, but the structure of the day corrects itself and still drives everyone toward the trial.

On a third, he warns Daru that the relay drift will start before it happens. Daru laughs, then stops laughing when it happens exactly on cue. The reset follows before Okabe can capitalize on the reaction.

That part matters.

People do not retain memory cleanly, but they do react to precision. Enough prediction can create trust before the day collapses again.

By loop four, a strategy emerges.

He needs one ally who will believe data over appearances and one ally who can reach hidden systems faster than management can bury them. In other words, he needs Kurisu and Daru. Not eventually. Immediately.

More than that, he needs something actionable. Not just proof of the loop, but the first lever long enough to pry it open.

When the speaker clicks on again and the clock rolls toward another 05:43, he is already moving before it finishes the greeting.

-> first_breakthrough

=== first_breakthrough ===
# BG:electric-indigo
# TEXT:ice-white
# FX:terminal-flicker
This cycle, Okabe finds Daru first.

He intercepts him in Diagnostics Bay B before the scans begin and speaks without preamble.

"There are thirteen seconds missing from the continuity logs at 02:14 every night," he says. "The packets route through executive control, and in seven minutes you're going to complain that my cortisol levels are doing side quests."

Daru blinks. "What."

"Also, in forty-three seconds, Kurisu is going to walk in and say I look like I've been attacked by a vending machine."

"Okarin, if this is a prank, it is way too high-effort for morning."

Forty-three seconds later, the door opens.

Kurisu steps in, sees him, and says, "You look like you've been attacked by a vending machine."

Silence detonates inside the room.

Daru turns so slowly it would be funny in any less horrifying context. "Nope," he says. "Nope. Absolutely not. I reject whatever cursed mechanic this is."

Okabe does not give either of them time to retreat into disbelief. He lays out the loop in clean pieces: repeated mornings, fixed schedule, reactor collapse at 08:09, memory continuity limited to him so far, and the hidden executive-route log gaps that recur every cycle. He predicts minor events in the next five minutes and lets them happen on time. By the second correct prediction, Kurisu's skepticism becomes focus. By the third, Daru looks like he wants to unplug the universe.

"If this is real," Kurisu says finally, "then the system isn't just unstable. It's preserving state."

"A restore point," Daru mutters. "Like some cosmic save scumming nightmare."

Okabe points at the hidden terminal window Daru showed him in the first cycle. "Open the shadow cache."

Daru does. This time, because all three of them are looking with intent instead of routine, they follow the rerouted chain one layer deeper than before. Behind the clipped continuity packets sits a protected directive bundle marked with executive privilege and an internal label none of them have seen in the official documentation:

`ANCHOR CONTINUITY // WITNESS RETENTION`

No one speaks for several seconds.

Kurisu is the first to recover. "Witness retention."

Okabe feels the words like cold metal pressed into his hand. The Well looked at him. The system contains a directive about a witness being retained. The distance between terror and hypothesis suddenly collapses.

"It's not random," he says.

"No," Kurisu replies. "It absolutely isn't."

Daru swallows, then starts typing faster. "There's more. The directive references a lower access branch tied to the Core chamber and a manual key path stored off the public map. I can't pull the whole file before executive monitoring notices, but I can copy the branch address."

He does. A single route string flashes onto the screen before the hidden process forcibly closes:

`LOWER SHAFT / ANCHOR NODE / ACCESS TREE SIGMA-3`

That is it. That is the first real break in the wall.

Not freedom. Not answers. But a direction.

Kurisu looks from the dead terminal to Okabe. "If the loop is being anchored, then this node may be where it can be interrupted."

"Or where it gets us killed faster," Daru says weakly.

"Possibly both," Okabe says.

And despite everything, despite the dread and the fluorescent light and the certainty that minute 08:09 is still waiting for them somewhere ahead, he feels the first clean surge of hope since the morning began repeating.

The loop has structure.

Structure can be attacked.

~ trust_kurisu = trust_kurisu + 1
~ trust_daru = trust_daru + 1
~ anchor_hint = 1
~ key_event = 1

-> draft_pause

=== draft_pause ===
# BG:soft-black
# TEXT:paper-white
# FX:none
The day is still moving toward the trial.

The alarms will still come. The Well will still open. The reset will still try to drag every discovery back into the dark.

But now Okabe is no longer trapped inside confusion alone.

He has Kurisu.

He has Daru.

He has proof that the loop is tied to an "Anchor Continuity" directive and a hidden lower-shaft access path connected to witness retention.

That is enough for one draft to end on and the next to begin from.

The future, for the first time since 05:43, feels less like a wall and more like a lock.

* Follow Kurisu into the modelling room and test the witness theory.
    -> knot_11_scaffold
* Let Daru chase the access tree while you monitor what he finds.
    -> knot_12_scaffold
* Find Mayuri before the cycle tightens and ask what she has been feeling.
    -> knot_13_scaffold

=== knot_11_scaffold ===
# BG:sterile-white
# TEXT:steel-blue
# FX:monitor-flicker
Kurisu commandeers an unused modelling room two corridors away from Diagnostics Bay B. The walls are writable glass. The central table is cluttered with phase maps, coffee rings, and three failed attempts at making executive science look less suspicious than it is.

She does not pace when she is thinking hard. She becomes still.

"Say it again," she tells Okabe. "Not the dramatic version. The precise version."

So he gives her the precise version. The repeated morning. The collapse. The reset. The stare from the Well. The witness-retention directive. The hidden lower-shaft route.

Kurisu listens with the kind of focus that feels sharper than belief. She is not convinced by mood. She is convinced by pattern.

"There are two broad possibilities," she says at last, writing in quick vertical strokes across the glass. "Either the loop preserves you because of where you are in relation to the Core at the collapse point, or it preserves you because something in the system identifies you specifically as the witness."

"Your bedside manner remains in bloom."

"You can complain after you survive causality." She taps the first column. "If proximity matters, we can manipulate location and signal exposure. If recognition matters, then the loop has criteria, and criteria can be reverse engineered."

Okabe folds his arms. "You say reverse engineered. I hear invited into a death mechanism with better vocabulary."

"Both are true."

Even now, even under pressure, he almost laughs.

* Test Kurisu's proximity theory first.
    ~ trust_kurisu = trust_kurisu + 1
    -> knot_15_scaffold
* Test Kurisu's recognition theory first.
    ~ suspicion = suspicion + 1
    -> knot_16_scaffold

=== knot_12_scaffold ===
# BG:graphite
# TEXT:pale-cyan
# FX:terminal-flicker
Daru claims he works better when nobody stands over him, which in practice means Okabe stands three feet away instead of one while Daru attacks the hidden routing branch like it insulted his ancestry.

The side monitor fills with permission trees, ghost directories, and timestamp fragments that flicker too quickly for anyone without Daru's reflexes to trust.

"Okay," Daru says, fingers racing. "The Sigma-3 branch definitely exists. It's being hidden under a maintenance-authentication wrapper that shouldn't even be touching resonance control. Which means either Leskinen built a secret back door, or this place has been cursed by an admin account from hell."

"Compelling dichotomy."

"Thank you, I studied rhetoric." He opens another branch and flinches. "Oh. Oh, that is gross."

He rotates the monitor toward Okabe. Behind the continuity directives is a chain of executive verification keys tied not just to access levels, but to observer-state classifications. The system is not merely locking out staff. It is sorting people by their relationship to the event.

"You were right," Daru says quietly. "The witness thing is part of the architecture. That's... not great."

Okabe stares at the nested branches. "Can you tell whether the route is digital, physical, or both?"

"I can probably tell which one ruins our morning faster."

* Tell Daru to keep chasing the executive permissions trail.
    ~ trust_daru = trust_daru + 1
    -> knot_17_scaffold
* Tell Daru to map the maintenance side and the physical access route.
    ~ anchor_hint = 1
    -> knot_18_scaffold

=== knot_13_scaffold ===
# BG:soft-amber
# TEXT:ink-black
# FX:steam
Mayuri is where she always seems to be when the building starts feeling less human than it should: in one of the soft edges no one important thinks to monitor closely.

Today that soft edge is the cafeteria's side counter, where she is reorganizing wrapped pastries into a shape that probably means something cheerful. She looks up when Okabe approaches and smiles in immediate relief.

"Okarin found me," she says. "That's good."

He stops. "Why would that be good?"

Mayuri's smile fades just slightly. "Because when the scary feeling gets stronger, I keep thinking you might forget where you're supposed to stand."

For half a second he cannot answer.

Mayuri is not speaking like someone who understands the loop. She is speaking like someone who has been brushed by it in dreams or instincts or emotional residue. It is worse, in some ways, because she sounds sincere without knowing why.

"What scary feeling?" he asks, more gently than the question deserves.

"Like everyone is being pushed toward the same moment really hard," she says. "And like after that moment, everything goes blank, but not empty blank. More like... repeat blank."

That lands in his chest with surgical accuracy.

Mayuri tilts her head. "I said something useful, didn't I?"

"Possibly. In an intolerably Mayuri way."

She brightens again. "Tuturu. Then mission success?"

* Ask Mayuri whether the loop is leaking into her dreams.
    ~ memory_bleed = memory_bleed + 1
    -> knot_19_scaffold
* Ask Mayuri to help anchor you with something familiar and real.
    -> knot_20_scaffold

=== knot_14_scaffold ===
# BG:soft-black
# TEXT:paper-white
# FX:none
The institute keeps moving. Announcements continue. Diagnostics still call for attendance. The trial hour continues to loom over everyone like weather disguised as scheduling.

But the shape of the morning is different now because Okabe has done something he had not managed in earlier loops:

he has turned private panic into shared structure.

Kurisu has theory. Daru has technical routes. Mayuri has intuition that should not exist and somehow does. For the first time, the loop no longer feels like a solitary hallucination with excellent timing. It feels like a system under observation.

Observation is dangerous. It is also power.

-> knot_21_scaffold

=== knot_15_scaffold ===
# BG:ice-blue
# TEXT:white
# FX:low-vibration
Kurisu's proximity test is inelegant, which is how Okabe knows she actually trusts it.

She has him stand in progressively more exposed positions relative to the simulated collapse geometry while she compares old telemetry against the remembered event. Distance from the Core ring. Distance from the Well. Distance from the executive dais. She keeps tightening the model and crossing out her own assumptions before he can question them.

"If witness retention were purely spatial," she says, "I should see a cleaner relationship between your remembered position and the continuity spike. I don't."

"Encouraging."

"No. Useful."

She rewrites the final column and underlines it twice. "Proximity matters, but not enough. You were in the wrong place to be the only retained observer if location were the whole story. Something else selected you."

Okabe looks at the model until the bright lines start to resemble accusation.

"So the machine picked me."

"Or the thing beneath the machine did." Kurisu caps the marker. "Which is not better."

~ suspicion = suspicion + 1
~ trust_kurisu = trust_kurisu + 1

-> knot_14_scaffold

=== knot_16_scaffold ===
# BG:maroon
# TEXT:bone-white
# FX:low-bass
Kurisu's recognition test is more disturbing and therefore, in Okabe's opinion, more likely to be correct.

She rebuilds the collapse sequence from memory and logs, then isolates the moment he describes most precisely: the instant the Well appears to focus on him specifically rather than on the room as a whole.

"Look here," she says, enlarging the signal wave. "There is a phase response before full collapse. Not after. Before. That means the system is not passively recording a witness at the end. It is identifying one during the transition."

"Meaning I am not a survivor of the event. I am part of the event."

Kurisu does not answer immediately, which is answer enough.

"If the witness-retention directive exists because of that identification," she says carefully, "then Leskinen may not have created the witness state from nothing. He may have found it and tried to control it."

That distinction should be comforting. It is not.

~ anchor_hint = 1
~ suspicion = suspicion + 1

-> knot_14_scaffold

=== knot_17_scaffold ===
# BG:black
# TEXT:acid-green
# FX:camera-scan
Daru follows the executive permissions trail far enough to become offended on principle.

"This is filth," he says, reverent with disgust. "Look at this. Nested authority checks. Observer-state masks. Shadow verifications routed through a maintenance wrapper so anyone doing normal review sees nothing but housekeeping noise."

He glances up at Okabe. "That isn't paranoia bait. That's active concealment."

At the deepest visible layer sits a permissions label that makes both of them stop talking at once:

`PRIMARY WITNESS / CONTINUITY PRIVILEGED`

"Cool," Daru says after a long silence. "Hate that."

What makes it worse is the time stamp history. The directive is not brand new. It has been updated repeatedly, as though someone has been refining the witness condition over multiple attempts.

Okabe feels the room tilt under that idea.

* Ask Daru whether Leskinen knows the witness remembers.
    ~ suspicion = suspicion + 1
    "If he has been updating the directive," Okabe says, "then he may already know continuity is working."
    Daru looks sick. "Which means your loops might not be a bug from his point of view."
    -> knot_14_scaffold
* Ask Daru whether the system can be tricked with false witness data.
    ~ trust_daru = trust_daru + 1
    "If observer-state is just data, maybe it can be spoofed."
    Daru stares at the screen. "Maybe. Which is the first hopeful thing anyone has said to me in an hour."
    -> knot_14_scaffold

=== knot_18_scaffold ===
# BG:gunmetal
# TEXT:ashen-white
# FX:echo-reverb
Daru abandons the cleaner digital route and dives into the maintenance architecture with the kind of doomed optimism only a true systems engineer can sustain.

"Okay," he says, "good news: Sigma-3 absolutely corresponds to a physical branch. Bad news: whoever documented this route writes like a serial killer with committee oversight."

The map he reconstructs is ugly but readable. Lower shaft. Utility spine. Anchor node. Manual lock. Restricted service partition adjacent to the Core chamber but not part of the public ring access.

"So there is a real place attached to the directive," Okabe says.

"Yep. And because life is suffering, it is probably the exact place executives go when they want to touch causality in private."

Daru highlights one section in red. "There is also a blind interval in the maintenance cameras right before trial stabilization peaks. Eighty-three seconds. Too consistent to be accidental."

That is not enough time to solve the loop. It might be enough time to reach the hidden branch.

~ anchor_hint = 1
~ trust_daru = trust_daru + 1

-> knot_14_scaffold

=== knot_19_scaffold ===
# BG:verdant-green
# TEXT:earth-brown
# FX:dripping-water
Mayuri does not describe loops the way scientists do. She describes them the way someone might describe weather, grief, or music remembered from another room.

"I don't see the same morning exactly," she says, hands folded around a cup she forgot to drink from. "But I feel it. Like everyone is moving toward the same sadness over and over."

Okabe looks away for a second because the line is too accurate to meet directly.

"Do the feelings change?" he asks.

"A little. Sometimes Kurisu-chan feels sharper. Sometimes Daru-kun feels more nervous. Sometimes you feel..." She searches for the word. "Farther away. Like you're already standing in the bad part before you get there."

That frightens him more than any machine log has.

It means the loop may be leaking through emotional channels even when memory does not cross intact. Not enough to explain itself. Enough to shape behavior.

"Mayuri," he says carefully, "if this morning starts feeling wrong again, tell me first."

She smiles with infuriating gentleness. "Okay. But only if Okarin promises not to carry all the scary parts by himself."

~ memory_bleed = memory_bleed + 1

-> knot_14_scaffold

=== knot_20_scaffold ===
# BG:warm-copper
# TEXT:charcoal
# FX:heartbeat
Mayuri listens to the entire explanation with the same expression she uses when repairing something fragile with thread and patience.

When Okabe finishes, she reaches toward the breast pocket of his coat without asking and pulls out the watch he keeps there out of habit.

"This one," she says softly.

"That is my property, hostage-taker."

"Mm-hm." She places it carefully back into his palm and closes his fingers over it. "Then keep holding it when everything starts feeling unreal. Not because it will fix the loop. Because it will help you remember that you're still Okarin inside it."

It is not scientific advice. It is also, infuriatingly, the most stable thing anyone has said all day.

Something in his chest loosens just enough to become usable.

"You continue to be unreasonable," he tells her.

"Tuturu. Then it worked."

~ memory_bleed = memory_bleed + 1

-> knot_14_scaffold

=== knot_21_scaffold ===
# BG:soft-black
# TEXT:paper-white
# FX:none
By the time Okabe regroups with Kurisu and Daru, the three of them are carrying different versions of the same terror.

Kurisu wants structure before action.

Daru wants access before exposure.

Okabe wants both, but what he feels most strongly is urgency. The loop has already taken too much control over the shape of the morning. Waiting may be smart. Waiting may also be exactly how Leskinen keeps winning.

"We have three problems," Kurisu says, counting them off on her fingers. "A witness state we do not understand, a hidden access route we have not physically confirmed, and a trial schedule that will end the cycle before we can brute-force every answer."

"Four problems," Daru says. "The fourth problem is that all of this sucks."

That is, regrettably, fair.

Okabe looks between them. The argument he is about to make feels like the first real leadership choice of the loop.

* Prioritize breaking the loop over understanding every detail.
    ~ suspicion = suspicion + 1
    -> knot_22_scaffold
* Prioritize understanding witness retention before making a move.
    ~ memory_bleed = memory_bleed + 1
    -> knot_22_scaffold
* Prioritize protecting the others, even if it slows the plan down.
    ~ trust_kurisu = trust_kurisu + 1
    ~ trust_daru = trust_daru + 1
    -> knot_22_scaffold

=== knot_22_scaffold ===
# BG:soft-black
# TEXT:paper-white
# FX:none
They settle, if not into agreement, then into something close enough to function.

The provisional plan is ugly, incomplete, and therefore probably real.

Step one: enter the next cycle with roles already assigned.

Step two: let Daru reopen the Sigma-3 branch the moment Diagnostics Bay B is free of observers.

Step three: let Kurisu compare the witness-retention behavior against collapse timing and identify the safest possible approach window.

Step four: use that window to reach the lower shaft before the trial completes and determine whether the anchor node is merely a control point or the true heart of the loop.

No one says the obvious part aloud: if the answer waits there, then the next draft of this story will no longer be about discovering whether the loop is real.

It will be about deciding what to do once there is no excuse left not to act.

Okabe closes his hand around the watch in his pocket and feels, for one brief and dangerous moment, almost synchronized with the future.

-> END
