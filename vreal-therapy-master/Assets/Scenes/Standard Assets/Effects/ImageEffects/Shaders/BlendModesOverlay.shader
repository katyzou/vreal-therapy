// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/BlendModesOverlay" {
	Properties {
		_MainTex ("Screen Blended", 2D) = "" {}
		_Overlay ("Color", 2D) = "grey" {}
	}
	
	CGINCLUDE

	#include "UnityCG.cginc"
	
	struct v2f {
		float4 pos : SV_POSITION;
		float2 uv[2] : TEXCOORD0;
	};
			
	sampler2D _Overlay;
<<<<<<< HEAD
	sampler2D _MainTex;
=======
<<<<<<< HEAD
	half4 _Overlay_ST;

	sampler2D _MainTex;
	half4 _MainTex_ST;
=======
	sampler2D _MainTex;
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
	
	half _Intensity;
	half4 _MainTex_TexelSize;
	half4 _UV_Transform = half4(1, 0, 0, 1);
		
	v2f vert( appdata_img v ) { 
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		
<<<<<<< HEAD
=======
<<<<<<< HEAD
		o.uv[0] = UnityStereoScreenSpaceUVAdjust(float2(
			dot(v.texcoord.xy, _UV_Transform.xy),
			dot(v.texcoord.xy, _UV_Transform.zw)
		), _Overlay_ST);
=======
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		o.uv[0] = float2(
			dot(v.texcoord.xy, _UV_Transform.xy),
			dot(v.texcoord.xy, _UV_Transform.zw)
		);
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		
		#if UNITY_UV_STARTS_AT_TOP
		if(_MainTex_TexelSize.y<0.0)
			o.uv[0].y = 1.0-o.uv[0].y;
		#endif
		
<<<<<<< HEAD
		o.uv[1] =  v.texcoord.xy;	
=======
<<<<<<< HEAD
		o.uv[1] = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _MainTex_ST);
=======
		o.uv[1] =  v.texcoord.xy;	
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		return o;
	}
	
	half4 fragAddSub (v2f i) : SV_Target {
		half4 toAdd = tex2D(_Overlay, i.uv[0]) * _Intensity;
		return tex2D(_MainTex, i.uv[1]) + toAdd;
	}

	half4 fragMultiply (v2f i) : SV_Target {
		half4 toBlend = tex2D(_Overlay, i.uv[0]) * _Intensity;
		return tex2D(_MainTex, i.uv[1]) * toBlend;
	}	
			
	half4 fragScreen (v2f i) : SV_Target {
		half4 toBlend =  (tex2D(_Overlay, i.uv[0]) * _Intensity);
		return 1-(1-toBlend)*(1-(tex2D(_MainTex, i.uv[1])));
	}

	half4 fragOverlay (v2f i) : SV_Target {
		half4 m = (tex2D(_Overlay, i.uv[0]));// * 255.0;
		half4 color = (tex2D(_MainTex, i.uv[1]));//* 255.0;

		// overlay blend mode
		//color.rgb = (color.rgb/255.0) * (color.rgb + ((2*m.rgb)/( 255.0 )) * (255.0-color.rgb));
		//color.rgb /= 255.0; 
		 
		/*
if (Target > ½) R = 1 - (1-2x(Target-½)) x (1-Blend)
if (Target <= ½) R = (2xTarget) x Blend		
		*/
		
<<<<<<< HEAD
		float3 check = step(0.5, color.rgb);
=======
<<<<<<< HEAD
		float3 check = step(half3(0.5,0.5,0.5), color.rgb);
=======
		float3 check = step(0.5, color.rgb);
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		float3 result = 0;
		
			result =  check * (half3(1,1,1) - ( (half3(1,1,1) - 2*(color.rgb-0.5)) *  (1-m.rgb))); 
			result += (1-check) * (2*color.rgb) * m.rgb;
		
		return half4(lerp(color.rgb, result.rgb, (_Intensity)), color.a);
	}
	
	half4 fragAlphaBlend (v2f i) : SV_Target {
		half4 toAdd = tex2D(_Overlay, i.uv[0]) ;
		return lerp(tex2D(_MainTex, i.uv[1]), toAdd, toAdd.a * _Intensity);
	}	


	ENDCG 
	
Subshader {
	  ZTest Always Cull Off ZWrite Off
      ColorMask RGB	  
  		  	
 Pass {    

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment fragAddSub
      ENDCG
  }

 Pass {    

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment fragScreen
      ENDCG
  }

 Pass {    

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment fragMultiply
      ENDCG
  }  

 Pass {    

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment fragOverlay
      ENDCG
  }  
  
 Pass {    

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment fragAlphaBlend
      ENDCG
  }   
}

Fallback off
	
} // shader
