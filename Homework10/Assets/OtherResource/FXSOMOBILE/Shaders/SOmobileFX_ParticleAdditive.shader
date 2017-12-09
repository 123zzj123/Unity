// Simple additive particle shader.

Shader "SOmobileFX/Particle additive"
{
Properties
{
	_MainTexture ("Particle Texture (Alpha8)", 2D) = "white" {}
}

Category
{
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	Blend SrcAlpha One
	Cull Off Lighting Off ZWrite Off Fog {Color (0,0,0,0)}
	
	BindChannels
	{
		Bind "Color", color
		Bind "Vertex", vertex
		Bind "TexCoord", texcoord
	}
	
	SubShader
	{
		Pass
		{
			SetTexture [_MainTexture]
			{
				combine primary, texture * primary
			}
		}
	}
}
}