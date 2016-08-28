package particles.loaders;

import kha.Blob;
import kha.Image;
import particles.ParticleSystem;
import particles.util.MathHelper;
import particles.util.ParticleColor;
import particles.util.ParticleVector;

class PexLapParticleLoader {
    public static function load(configFile : Blob, texture : Image) : ParticleSystem {
        var root = Xml.parse(configFile.toString()).firstElement();

        if (root.nodeName != "particleEmitterConfig" && root.nodeName != "lanicaAnimoParticles") {
            trace('Expecting "particleEmitterConfig" or "lanicaAnimoParticles", but "${root.nodeName}" found');
        }

        var map : Map<String, Xml> = new Map<String, Xml>();

        for (node in root.elements()) {
            map[node.nodeName] = node;
        }

        var ps = new ParticleSystem();

        ps.emitterType = parseIntNode(map["emitterType"]);
        ps.maxParticles = parseIntNode(map["maxParticles"]);
        ps.positionType = 0;
        ps.duration = parseFloatNode(map["duration"]);
        ps.gravity = parseVectorNode(map["gravity"]);
        ps.particleLifespan = parseFloatNode(map["particleLifeSpan"]);
        ps.particleLifespanVariance = parseFloatNode(map["particleLifespanVariance"]);
        ps.speed = parseFloatNode(map["speed"]);
        ps.speedVariance = parseFloatNode(map["speedVariance"]);
        ps.sourcePosition = parseVectorNode(map["sourcePosition"]);
        ps.sourcePositionVariance = parseVectorNode(map["sourcePositionVariance"]);
        ps.angle = MathHelper.deg2rad(parseFloatNode(map["angle"]));
        ps.angleVariance = MathHelper.deg2rad(parseFloatNode(map["angleVariance"]));
        ps.startParticleSize = parseFloatNode(map["startParticleSize"]);
        ps.startParticleSizeVariance = parseFloatNode(map["startParticleSizeVariance"]);
        ps.finishParticleSize = parseFloatNode(map["finishParticleSize"]);
        ps.finishParticleSizeVariance = parseFloatNode(map["finishParticleSizeVariance"]);
        ps.startColor = parseColorNode(map["startColor"]);
        ps.startColorVariance = parseColorNode(map["startColorVariance"]);
        ps.finishColor = parseColorNode(map["finishColor"]);
        ps.finishColorVariance = parseColorNode(map["finishColorVariance"]);
        ps.minRadius = parseFloatNode(map["minRadius"]);
        ps.minRadiusVariance = parseFloatNode(map["minRadiusVariance"]);
        ps.maxRadius = parseFloatNode(map["maxRadius"]);
        ps.maxRadiusVariance = parseFloatNode(map["maxRadiusVariance"]);
        ps.rotationStart = MathHelper.deg2rad(parseFloatNode(map["rotationStart"]));
        ps.rotationStartVariance = MathHelper.deg2rad(parseFloatNode(map["rotationStartVariance"]));
        ps.rotationEnd = MathHelper.deg2rad(parseFloatNode(map["rotationEnd"]));
        ps.rotationEndVariance = MathHelper.deg2rad(parseFloatNode(map["rotationEndVariance"]));
        ps.rotatePerSecond = MathHelper.deg2rad(parseFloatNode(map["rotatePerSecond"]));
        ps.rotatePerSecondVariance = MathHelper.deg2rad(parseFloatNode(map["rotatePerSecondVariance"]));
        ps.radialAcceleration = parseFloatNode(map["radialAcceleration"]);
        ps.radialAccelerationVariance = parseFloatNode(map["radialAccelVariance"]);
        ps.tangentialAcceleration = parseFloatNode(map["tangentialAcceleration"]);
        ps.tangentialAccelerationVariance = parseFloatNode(map["tangentialAccelVariance"]);
        ps.blendFuncSource = ParticleLoader.getBlendingFactor(parseIntNode(map["blendFuncSource"]));
        ps.blendFuncDestination = ParticleLoader.getBlendingFactor(parseIntNode(map["blendFuncDestination"]));
        ps.texture = texture;
        ps.yCoordMultiplier = (parseIntNode(map["yCoordFlipped"]) == 1 ? -1.0 : 1.0);
		
		ps.__initialize();

        return ps;
    }

    private static function parseIntNode(node : Xml) : Int {
        return (node == null ? 0 : parseIntString(node.get("value")));
    }

    private static function parseFloatNode(node : Xml) : Float {
        return (node == null ? 0 : parseFloatString(node.get("value")));
    }

    private static function parseVectorNode(node : Xml) : ParticleVector {
        if (node == null) {
            return {
                x: 0.0,
                y: 0.0,
            };
        }

        return {
            x: parseFloatString(node.get("x")),
            y: parseFloatString(node.get("y")),
        };
    }

    private static function parseColorNode(node : Xml) : ParticleColor {
        if (node == null) {
            return {
                r: 0.0,
                g: 0.0,
                b: 0.0,
                a: 0.0,
            };
        }

        return {
            r: parseFloatString(node.get("red")),
            g: parseFloatString(node.get("green")),
            b: parseFloatString(node.get("blue")),
            a: parseFloatString(node.get("alpha")),
        };
    }

    private static function parseIntString(s : String) : Int {
        if (s == null) {
            return 0;
        }

        var result = Std.parseInt(s);
        return (result == null ? 0 : result);
    }

    private static function parseFloatString(s : String) : Float {
        if (s == null) {
            return 0;
        }

        var result = Std.parseFloat(s);
        return (Math.isNaN(result) ? 0.0 : result);
    }
}
