// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "DreamFaction/Characters/CharactersV3" {
    Properties {
        [MaterialToggle] _Flare ("Flare", Float ) = 0
        _Flarecolor ("Flarecolor", Color) = (0.5,0.32,0.11,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _MatCap ("MatCap (RGB)", 2D) = "white"{}
        _Hue ("Hue", Float) = 0
        _Saturation ("Saturation", Float) = 0
        _Value ("Value", Float) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Cull Off
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            // Dithering function, to use with scene UVs (screen pixel coords)
            // 3x3 Bayer matrix, based on https://en.wikipedia.org/wiki/Ordered_dithering
            float BinaryDither3x3( float value, float2 sceneUVs ) 
            {
                float3x3 mtx = float3x3(
                    float3( 3,  7,  4 )/10.0,
                    float3( 6,  1,  9 )/10.0,
                    float3( 2,  8,  5 )/10.0
                );
                float2 px = floor(_ScreenParams.xy * sceneUVs);
                int xSmp = fmod(px.x,3);
                int ySmp = fmod(px.y,3);
                float3 xVec = 1-saturate(abs(float3(0,1,2) - xSmp));
                float3 yVec = 1-saturate(abs(float3(0,1,2) - ySmp));
                float3 pxMult = float3( dot(mtx[0],yVec), dot(mtx[1],yVec), dot(mtx[2],yVec) );
                return round(value + dot(pxMult, xVec));
            }
            uniform sampler2D _MainTex; 
            uniform float4 _MainTex_ST;
            uniform fixed _Flare;
            uniform float4 _Flarecolor;
            uniform sampler2D _MatCap;
            uniform float _Hue;
            uniform float _Saturation;
            uniform float _Value;

            float3 RGB2HSV( float3 RGB )
            {
            float4 k = float4(0.0, -1.0/3.0, 2.0/3.0, -1.0);
            float4 p = RGB.g < RGB.b ? float4(RGB.b, RGB.g, k.w, k.z) : float4(RGB.gb, k.xy);
            float4 q = RGB.r < p.x   ? float4(p.x, p.y, p.w, RGB.r)   : float4(RGB.r , p.yzx);
            float  d = q.x - min(q.w, q.y);
            float  e = 1.0e-10;
            return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
            
            }
            
            float3 HSV2RGB( float3 HSV )
            {
            
            float4 k = float4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
            float3 p = abs(frac(HSV.xxx + k.xyz) * 6.0 - k.www);
            return HSV.z * lerp(k.xxx, clamp(p - k.xxx, 0.0, 1.0), HSV.y);
            
            }
            

            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };

            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                float2 cap : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {

                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenPos = o.pos;

                half2 capCoord;
                capCoord.x = dot(UNITY_MATRIX_IT_MV[0].xyz,v.normal);
                capCoord.y = dot(UNITY_MATRIX_IT_MV[1].xyz,v.normal);
                o.cap = capCoord * 0.5 + 0.5;

                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_3262 = RGB2HSV( _MainTex_var.rgb ).rgb;
                float3 node_9090 = HSV2RGB( float3(float2((_Hue+node_3262.r),(_Saturation+node_3262.g)),(_Value+node_3262.b)) );
                float node_3209_if_leA = step(_Flare,node_9090);
                float node_3209_if_leB = step(node_9090,_Flare);
                float3 node_3205 = (node_9090+(pow(1.0-max(0,dot(i.normalDir, viewDirection)),2.0)*_Flarecolor.rgb*3.0));
                float3 finalColor = lerp( (node_3209_if_leA*node_9090) + (node_3209_if_leB*node_3205) ,node_3205,node_3209_if_leA*node_3209_if_leB);

                fixed4 mc = tex2D(_MatCap, i.cap);

                return fixed4(finalColor,1) * mc * 1.6;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}