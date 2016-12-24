/*

 *** Introduction ***

  -- What is AI? --

Artificial Intelligence, or "AI" for short, often seems like magic. In computer
games AI is used to create mobs that act on their own. AI provides a way for a
mob to look at its situation and determine what to do next. All AI routines
should consider two things:

	1. What actions am I capable of performing?
	2. Which action should I perform?

Play a computer game with AI and think about these two questions. It doesn't
matter if you're playing a FPS, RTS, or board game, you should be able to see
how these questions relate to AI in that game.

The intelligence usually comes from the second part, but the decision-making
process doesn't have to be complex to be effective. Think about an old
action/platform game for the NES. An enemy's AI routine might look like this:

    Move to the left until I reach a wall or the edge of a platform.
    Move to the right until I reach a wall or the edge of a platform.
    Repeat.

That routine is very simple but it considers both aspects mentioned above.
The mob is capable of moving left and moving right. It moves left until it
cannot move left any more, then it moves right until it can't move any more.

In this tutorial we will look at AI with the goal of creating mobs that can
behave like humans. To get to this goal we start off small, dealing with mobs
that are only capable of performing a single action. Most examples will either
add a new action or improve the mob's decision making process.


 *** Description of Files & Instructions for Use ***

These code files show an incremental approach to creating enemy AI. Each code
file usually builds on the previous one (code-02.dm is a new version of code-01.dm
that contains one new feature). By looking at both examples you can see what is
added at each step to create the new feature. Once you're comfortable with one
feature you can move on to the next.

Each file contains a comment at the top explaining what feature was added and a
high-level description of how it was implemented. There are comments within the
code that show and explain the specific changes that were made from the last demo.

To run an example make sure that _always_include.dm and map-1.dmm are checked.
_always_include.dm contains some code that is necessary for all demos, but I didn't
want to repeat it in all files because it doesn't directly relate to AI. Make sure
that the code file for only one demo is checked otherwise you'll get a lot of
"duplicate definition" errors.

Note: The example in code-15.dm requires map-2.dmm instead of map-1.dmm


Feel free to modify the examples. Depending on your level of comfort with the code
you might want to make small changes and run the demo to see what happens. Or you
might feel comfortable making larger modifications to add new behavior. the more you
work with the code and think about the concepts behind the code, the more comfortable
you'll become with it.


Note: Some demos contain lines or blocks of commented out code that offer an
alternative way to do things. For example, in code-01.dm you can either run the
demo using line 22 or line 27 (press ctrl+G to find out what line you're on or to
jump to a line). If you leave line 22 uncommented and comment out line 27:


		New()
			..()
line 22	-->	spawn(10) ai()

			// All mobs placed on the map will call ai() at the
			// same time. You might want to comment out the first
			// spawn() line and use this one instead:
line 27	-->	// spawn(rand(10,20)) ai()

			// This way the ai-controlled mobs don't all move at the
			// same time. Try using this line instead to see the difference.


This will have all ai cycles start at the same time. If you run it the other way:


		New()
			..()
line 22	--> // spawn(10) ai()

			// All mobs placed on the map will call ai() at the
			// same time. You might want to comment out the first
			// spawn() line and use this one instead:
line 27	-->	spawn(rand(10,20)) ai()

			// This way the ai-controlled mobs don't all move at the
			// same time. Try using this line instead to see the difference.

There will be some randomness added to the start times. You'll see that things look
more natural because the mobs move at different times.


*/