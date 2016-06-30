Custom component implementing an imitation of a 3-dimensional cube.
Due to SceneGraph not supporting a legitimate Z-axis, 3D movement is currently not possible.
This component allows for the rendering of a "cube" with 4 distinct sides that can be rotated clockwise and counterclockwise in 2 different axes.

Cube3D is the most basic cube component made up of <Rectangle>s.
Cube3D-2 allows for images to be displayed on the sides of the cube using <Poster> nodes.

Cube3D-(3,4,5) are simply rudimentary ways to allow for multiple cubes with different images on each side to be displayed in one scene - a brute force method used until a parameter is implemented to allow for images to be assigned upon component initialization.

This package is currently working (7.2) and MainScene demonstrates a small portion of what is possible with the 3-D Cube component.

