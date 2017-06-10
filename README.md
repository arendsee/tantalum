# Tantalum

There seems to be a pretty high cost to getting into this field. Figuring out
how to do audio processing, for example, will take awhile. I suppose I should
start by trying to open one file WAV file of raw audio.

# Ramble

A little thing that will replace all other little things in the little field of
natural languages. Well, yeah, you know.

Well, ok, so the thing is, well, I mean, so here is the thing: I want to play
with spoken words. I want to change the tempo of a spoken phrase, emphasize
a word, map between accents. I want a linguistic spectrometer to untangle
a recording into phonetic equations. I want to create new languages, randomly
generate them, randomly generate spoken phrases from them. I want to visualize
vowels in F1-vs-F2 space. Write a lexer for Chinese. Extract the modes from
speech, diff files. I want to do everything. I want photoshop for sound. Not
just sound, but grammar and phonetics. Parameterized models of language.

This all seems formless, I know. But I can see dimly the shape of the program
I want to create. I can see where it would be used. I can even see the path to
building it. I can disassemble it into manageable pieces. The pieces I can
further break down. I can see where to start: implementing algorithms. General
Generative grammars. Simple sound libraries. Inference of phonetic metrics from
sound files. Basically, start by building infrastructure. Implement algorithms
and IO. Build standalone modules. Then weave them together.

There is a lot of literature in the field. I will start by implementing really
simple things, just to get a feel for the data structures. Then I'll play with
developing my own techniques. Then I will read.

I'm not sure how far I will go with this. It will have to remain a third or
fourth priority. It may be awhile before I even code anything.

Yada yada yada ...

# Details

## MP3 Format

The first step in this project is simply to get sound data. It might be better
to use raw audio data. But more sound samples are available in MP3 than any
other format, so I'll start there.

A thorough and understandable introducton to the MP3 format is available from
[www.mp3-converter.com](www.mp3-converter.com/mp3codec). The following notes
are mostly distilled from there.

So basics, MP3 is super compressed relative to raw, it accomplishes this
compression by taking advantage of quirks in human hearing (the field of
psychoacoustics). Apparently there are very good mathematical models for
what we can make out.

MP3 uses two levels of compression, one lossful (perceptual encoding) and
one lossless (Huffman encoding).

There are two kinds of psychoacoustic masking: simultaneous masking, where
waves of similar frequency but dissimilar amplitude are filtered; and
temporal masking, where a quiet tone next to a loud tone cannot be heard.

Here are the sections of an MP3 header

Label | Purpose                 | Length
----- | ----------------------- | ------
A     | Frame sync              | 11
B     | MPEG audio version      | 2
C     | MPEG layer (I,II,III)   | 2
D     | Protection (1)          | 1
E     | Bitrate indexa          | 4
F     | Sampling rate frequency | 2
G     | Padding bit             | 1
H     | Private bit             | 1
I     | Channel mode (2)        | 2
J     | Mode extension          | 2
K     | (on or off)             | 1
L     | Original (off if copy)  | 1
M     | Emphasis (obsolete)     | 2

 (1) if 1, checksum follows header

 (2) stereo, joint stereo, dual channel, single channel
