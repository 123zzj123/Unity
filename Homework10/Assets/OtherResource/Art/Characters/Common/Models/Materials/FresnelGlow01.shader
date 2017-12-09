// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.03 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.03;sub:START;pass:START;ps:flbk:,lico:0,lgpr:1,nrmq:0,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:False,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2874,x:32909,y:32771,varname:node_2874,prsc:2|custl-2877-OUT;n:type:ShaderForge.SFN_Color,id:7589,x:32234,y:32764,ptovrint:False,ptlb:colorout,ptin:_colorout,varname:node_7589,prsc:2,glob:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_NormalVector,id:2663,x:32016,y:32973,prsc:2,pt:False;n:type:ShaderForge.SFN_Fresnel,id:5273,x:32245,y:33038,varname:node_5273,prsc:2|NRM-2663-OUT,EXP-2437-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2437,x:32016,y:33134,ptovrint:False,ptlb:exp,ptin:_exp,varname:node_2437,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:2877,x:32727,y:33009,varname:node_2877,prsc:2|A-3080-OUT,B-5273-OUT,C-1299-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1299,x:32521,y:33092,ptovrint:False,ptlb:strength,ptin:_strength,varname:node_1299,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:8596,x:32234,y:32603,ptovrint:False,ptlb:colorin,ptin:_colorin,varname:node_8596,prsc:2,glob:False,c1:0.03448248,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:3080,x:32521,y:32848,varname:node_3080,prsc:2|A-8596-RGB,B-7589-RGB,T-4643-OUT;n:type:ShaderForge.SFN_Fresnel,id:4643,x:32245,y:32908,varname:node_4643,prsc:2|NRM-2663-OUT,EXP-3054-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3054,x:32016,y:32908,ptovrint:False,ptlb:ramp,ptin:_ramp,varname:node_3054,prsc:2,glob:False,v1:1;proporder:7589-8596-1299-2437-3054;pass:END;sub:END;*/

Shader "DreamFaction/Effects/FresnelGlow01" {
    Properties {
        _colorout ("colorout", Color) = (1,0,0,1)
        _colorin ("colorin", Color) = (0.03448248,0,1,1)
        _strength ("strength", Float ) = 1
        _exp ("exp", Float ) = 1
        _ramp ("ramp", Float ) = 1
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _colorout;
            uniform float _exp;
            uniform float _strength;
            uniform float4 _colorin;
            uniform float _ramp;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float3 finalColor = (lerp(_colorin.rgb,_colorout.rgb,pow(1.0-max(0,dot(i.normalDir, viewDirection)),_ramp))*pow(1.0-max(0,dot(i.normalDir, viewDirection)),_exp)*_strength);
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
