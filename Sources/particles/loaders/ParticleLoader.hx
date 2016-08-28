package particles.loaders;

import kha.Image;
import kha.Blob;
import kha.graphics4.BlendingFactor;

class ParticleLoader {
    public static function load(configFile : Blob, name : String, texture : Image) : ParticleSystem {
        var partsName = name.split("_");
		var ext = partsName[partsName.length - 1];

        switch (ext) {
            case "plist":
                return PlistParticleLoader.load(configFile, texture);

            case "json":
                return JsonParticleLoader.load(configFile, texture);

            case "pex" | "lap":
                return PexLapParticleLoader.load(configFile, texture);

            default:
                trace('Unsupported extension "${ext}"');
				return null;
        }
    }
	
	public static function getBlendingFactor(code:Int):BlendingFactor {
		switch(code) {
			case 0: 		return BlendingFactor.BlendZero;
			case 1:			return BlendingFactor.BlendOne;
			case 0x0300:	return BlendingFactor.SourceColor;
			case 0x0301:	return BlendingFactor.InverseSourceColor;
			case 0x0302:	return BlendingFactor.SourceAlpha;
			case 0x0303:	return BlendingFactor.InverseSourceAlpha;
			case 0x0304:	return BlendingFactor.DestinationAlpha;
			case 0x0305:	return BlendingFactor.InverseDestinationAlpha;
			case 0x0306:	return BlendingFactor.DestinationColor;
			case 0x0307:	return BlendingFactor.InverseDestinationColor;
			default:
				trace("BlendingFactor not found");
				return null;
		}
	}    
}
