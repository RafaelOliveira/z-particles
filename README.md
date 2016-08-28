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
Create a instance of ParticleSystem using ParticleLoader.load(). This function will detect the type of the config file automatically. Or use one of the Loaders inside particles/loaders (The specific loaders use less paramaters).  
```
particleSystem = ParticleLoader.load(Assets.blobs.fire_plist, Assets.blobs.fire_plistName, Assets.images.fire);	
// or
particleSystem = PlistParticleLoader.load(Assets.blobs.fire_plist, Assets.images.fire);	
```
Use particleSystem.emit() to start the system in a position, update with particleSystem.update() and render with particleSystem.render().
```
particleSystem.emit(200, 200);

function update():Void {
  particleSystem.update();
}

function render(framebuffer:Framebuffer):Void {
  framebuffer.g2.begin();
  particleSystem.render(framebuffer.g2);
  framebuffer.g2.end();
}
```

You can see some examples in [z-particles-samples](https://github.com/RafaelOliveira/z-particles-samples).
* [minimal](http://sudoestegames.com/play/z-particles/minimal)
* [showcase](http://sudoestegames.com/play/z-particles/showcase)

## TODO
* Switch ParticleColor and ParticleVector to kha.Color and kha.math.Vector2
* Particle rotation
* Embedded textures
