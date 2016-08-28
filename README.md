# Particle system for Kha

This is a port of [zame-haxe-particles](https://github.com/restorer/zame-haxe-particles) for Kha. See the original repo for more information.  
## Installation
Add as a git submodule in your project inside the Libraries folder:
```
cd Libraries
git submodule add https://github.com/RafaelOliveira/z-particles
```
Then add in khafile.js:
```
project.addLibrary('z-particles');
```
## How to use
You can see some examples in [z-particles-samples](https://github.com/RafaelOliveira/z-particles-samples).
* [minimal](http://sudoestegames.com/play/z-particles/minimal)
* [showcase](http://sudoestegames.com/play/z-particles/showcase)

## TODO
* Switch ParticleColor and ParticleVector to kha.Color and kha.math.Vector2
* Particle rotation
* Embedded textures
