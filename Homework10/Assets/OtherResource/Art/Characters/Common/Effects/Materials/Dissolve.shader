// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:2,dpts:2,wrdp:False,dith:2,ufog:True,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:37240,y:32712,varname:node_1,prsc:2|emission-2476-OUT;n:type:ShaderForge.SFN_Multiply,id:890,x:36609,y:32726,varname:node_890,prsc:2|A-1876-RGB,B-1665-OUT;n:type:ShaderForge.SFN_Add,id:892,x:34390,y:33293,varname:node_892,prsc:2|A-1805-OUT,B-1771-OUT;n:type:ShaderForge.SFN_Fresnel,id:893,x:33924,y:33164,varname:node_893,prsc:2|EXP-1173-OUT;n:type:ShaderForge.SFN_Multiply,id:895,x:35296,y:32816,varname:node_895,prsc:2|A-1316-R,B-892-OUT;n:type:ShaderForge.SFN_Tex2d,id:896,x:34129,y:32379,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_3021,prsc:2,ntxv:0,isnm:False|UVIN-923-UVOUT;n:type:ShaderForge.SFN_Panner,id:923,x:33801,y:32381,varname:node_923,prsc:2,spu:0,spv:0.1|DIST-2436-OUT;n:type:ShaderForge.SFN_Add,id:974,x:35704,y:32793,varname:node_974,prsc:2|A-1898-OUT,B-1771-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1173,x:33764,y:33182,ptovrint:False,ptlb:Fresnel_Exponent,ptin:_Fresnel_Exponent,varname:node_9152,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:1316,x:35035,y:32767,ptovrint:False,ptlb:Gradient_Texture_Decay,ptin:_Gradient_Texture_Decay,varname:node_4430,prsc:2,ntxv:0,isnm:False|UVIN-1319-OUT;n:type:ShaderForge.SFN_Append,id:1319,x:34858,y:32767,varname:node_1319,prsc:2|A-1948-OUT,B-1359-OUT;n:type:ShaderForge.SFN_TexCoord,id:1336,x:33812,y:32669,varname:node_1336,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:1340,x:33990,y:32755,varname:node_1340,prsc:2|A-1336-V,B-1342-OUT;n:type:ShaderForge.SFN_Vector1,id:1342,x:33812,y:32817,varname:node_1342,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:1359,x:34164,y:32857,varname:node_1359,prsc:2|A-1340-OUT,B-2056-OUT;n:type:ShaderForge.SFN_Add,id:1497,x:34415,y:32767,varname:node_1497,prsc:2|A-896-R,B-1805-OUT;n:type:ShaderForge.SFN_TexCoord,id:1618,x:33749,y:33504,varname:node_1618,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:1620,x:33909,y:33504,ptovrint:False,ptlb:Gradient_Edge_Fake,ptin:_Gradient_Edge_Fake,varname:node_7887,prsc:2,tex:dd02884263250074096b0d1643f90f41,ntxv:0,isnm:False|UVIN-1618-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1652,x:36253,y:32948,varname:node_1652,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:1654,x:36434,y:32888,varname:node_1654,prsc:2|A-1665-OUT,B-1652-V;n:type:ShaderForge.SFN_Tex2d,id:1656,x:36615,y:32888,ptovrint:False,ptlb:Gradient_Color,ptin:_Gradient_Color,varname:node_6310,prsc:2,ntxv:0,isnm:False|UVIN-1654-OUT;n:type:ShaderForge.SFN_Clamp,id:1665,x:36239,y:32784,varname:node_1665,prsc:2|IN-2450-OUT,MIN-1667-OUT,MAX-1666-OUT;n:type:ShaderForge.SFN_Vector1,id:1666,x:36043,y:32754,varname:node_1666,prsc:2,v1:0.95;n:type:ShaderForge.SFN_Vector1,id:1667,x:36043,y:32700,varname:node_1667,prsc:2,v1:0.05;n:type:ShaderForge.SFN_SwitchProperty,id:1771,x:34072,y:33504,ptovrint:False,ptlb:Edge_Detection_Fake,ptin:_Edge_Detection_Fake,varname:node_3502,prsc:2,on:True|A-1772-OUT,B-1620-R;n:type:ShaderForge.SFN_Vector1,id:1772,x:33868,y:33384,varname:node_1772,prsc:2,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:1805,x:34081,y:33146,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_1789,prsc:2,on:True|A-1772-OUT,B-893-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1858,x:36795,y:32811,ptovrint:False,ptlb:Gradient_Or_Solid_Color,ptin:_Gradient_Or_Solid_Color,varname:node_5037,prsc:2,on:True|A-890-OUT,B-1656-RGB;n:type:ShaderForge.SFN_Color,id:1876,x:36402,y:32660,ptovrint:False,ptlb:Solid_Color,ptin:_Solid_Color,varname:node_9931,prsc:2,glob:False,c1:0.1764706,c2:0.5229208,c3:1,c4:1;n:type:ShaderForge.SFN_SwitchProperty,id:1898,x:35520,y:32793,ptovrint:False,ptlb:Make_Same_As_Fresnel,ptin:_Make_Same_As_Fresnel,varname:node_3053,prsc:2,on:True|A-1316-R,B-895-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1948,x:34651,y:32767,ptovrint:False,ptlb:Soft_Texture,ptin:_Soft_Texture,varname:node_6242,prsc:2,on:False|A-1497-OUT,B-896-R;n:type:ShaderForge.SFN_Slider,id:2056,x:33833,y:32939,ptovrint:False,ptlb:Decay,ptin:_Decay,varname:node_4247,prsc:2,min:0.05,cur:0.3,max:0.95;n:type:ShaderForge.SFN_Time,id:2434,x:33472,y:32378,varname:node_2434,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2436,x:33643,y:32402,varname:node_2436,prsc:2|A-2434-T,B-2438-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2438,x:33472,y:32526,ptovrint:False,ptlb:Pan_Speed,ptin:_Pan_Speed,varname:node_3202,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:2450,x:35931,y:32835,varname:node_2450,prsc:2|A-974-OUT,B-2452-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2452,x:35704,y:32952,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9881,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:2476,x:36981,y:32811,varname:node_2476,prsc:2|A-1858-OUT,B-2477-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2477,x:36795,y:32955,ptovrint:False,ptlb:Brightness,ptin:_Brightness,varname:node_8026,prsc:2,glob:False,v1:1;proporder:2477-2452-2438-1858-1656-1876-896-1316-2056-1805-1898-1173-1771-1620-1948;pass:END;sub:END;*/

Shader "Effect/Dissolve" {
    Properties {
        _Brightness ("Brightness", Float ) = 1
        _Intensity ("Intensity", Float ) = 1
        _Pan_Speed ("Pan_Speed", Float ) = 1
        [MaterialToggle] _Gradient_Or_Solid_Color ("Gradient_Or_Solid_Color", Float ) = 1
        _Gradient_Color ("Gradient_Color", 2D) = "white" {}
        _Solid_Color ("Solid_Color", Color) = (0.1764706,0.5229208,1,1)
        _Texture ("Texture", 2D) = "white" {}
        _Gradient_Texture_Decay ("Gradient_Texture_Decay", 2D) = "white" {}
        _Decay ("Decay", Range(0.05, 0.95)) = 0.3
        [MaterialToggle] _Fresnel ("Fresnel", Float ) = 1
        [MaterialToggle] _Make_Same_As_Fresnel ("Make_Same_As_Fresnel", Float ) = 0
        _Fresnel_Exponent ("Fresnel_Exponent", Float ) = 1
        [MaterialToggle] _Edge_Detection_Fake ("Edge_Detection_Fake", Float ) = 0.2901961
        _Gradient_Edge_Fake ("Gradient_Edge_Fake", 2D) = "white" {}
        [MaterialToggle] _Soft_Texture ("Soft_Texture", Float ) = 2
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Fresnel_Exponent;
            uniform sampler2D _Gradient_Texture_Decay; uniform float4 _Gradient_Texture_Decay_ST;
            uniform sampler2D _Gradient_Edge_Fake; uniform float4 _Gradient_Edge_Fake_ST;
            uniform sampler2D _Gradient_Color; uniform float4 _Gradient_Color_ST;
            uniform fixed _Edge_Detection_Fake;
            uniform fixed _Fresnel;
            uniform fixed _Gradient_Or_Solid_Color;
            uniform float4 _Solid_Color;
            uniform fixed _Make_Same_As_Fresnel;
            uniform fixed _Soft_Texture;
            uniform float _Decay;
            uniform float _Pan_Speed;
            uniform float _Intensity;
            uniform float _Brightness;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
////// Lighting:
////// Emissive:
                float4 node_2434 = _Time + _TimeEditor;
                float2 node_923 = (i.uv0+(node_2434.g*_Pan_Speed)*float2(0,0.1));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_923, _Texture));
                float node_1772 = 0.0;
                float _Fresnel_var = lerp( node_1772, pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel_Exponent), _Fresnel );
                float2 node_1319 = float2(lerp( (_Texture_var.r+_Fresnel_var), _Texture_var.r, _Soft_Texture ),((i.uv0.g*0.0)+_Decay));
                float4 _Gradient_Texture_Decay_var = tex2D(_Gradient_Texture_Decay,TRANSFORM_TEX(node_1319, _Gradient_Texture_Decay));
                float4 _Gradient_Edge_Fake_var = tex2D(_Gradient_Edge_Fake,TRANSFORM_TEX(i.uv0, _Gradient_Edge_Fake));
                float _Edge_Detection_Fake_var = lerp( node_1772, _Gradient_Edge_Fake_var.r, _Edge_Detection_Fake );
                float node_1665 = clamp(((lerp( _Gradient_Texture_Decay_var.r, (_Gradient_Texture_Decay_var.r*(_Fresnel_var+_Edge_Detection_Fake_var)), _Make_Same_As_Fresnel )+_Edge_Detection_Fake_var)*_Intensity),0.05,0.95);
                float2 node_1654 = float2(node_1665,i.uv0.g);
                float4 _Gradient_Color_var = tex2D(_Gradient_Color,TRANSFORM_TEX(node_1654, _Gradient_Color));
                float3 emissive = (lerp( (_Solid_Color.rgb*node_1665), _Gradient_Color_var.rgb, _Gradient_Or_Solid_Color )*_Brightness);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
