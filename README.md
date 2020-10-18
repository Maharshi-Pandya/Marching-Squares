## Marching Squares Implementation/Visualisation

This is an attempt to implement the Marching Squares algorithm in Processing (java).

This is what Wikipedia has to say:

> **Marching squares** is a [computer graphics](https://en.wikipedia.org/wiki/Computer_graphics) [algorithm](https://en.wikipedia.org/wiki/Algorithm) that generates [contours](https://en.wikipedia.org/wiki/Contour_lines) for a two-dimensional [scalar field](https://en.wikipedia.org/wiki/Scalar_field) (rectangular [array](https://en.wikipedia.org/wiki/Array_data_structure) of individual numerical values). A similar method can be used to contour 2-D [triangle meshes](https://en.wikipedia.org/wiki/Triangulated_irregular_network).

The current Processing implementation generates this...

![Contour Marching Squares](./assets/Marching.gif)

This uses Perlin Noise for generating smoother random values for each of the "dots" and thus it creates smooth contours using the Marching Squares algorithm.

>### Perlin Noise Implementation
>
>[Perlin Noise Implementation in Python and C/C++](https://github.com/Maharshi-Pandya/Perlin-Noise-Implementation)

This result itself tells us that Marching Squares is a great algorithm to generate various types of contours.