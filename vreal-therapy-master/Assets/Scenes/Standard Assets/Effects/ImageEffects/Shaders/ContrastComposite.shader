// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/ContrastComposite" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_MainTexBlurred ("Base Blurred (RGB)", 2D) = "" {}
	}
	
	// Shader code pasted into all further CGPROGRAM blocks	
	CGINCLUDE
	
	#include "UnityCG.cginc"
	
	struct v2f {
		float4 pos : SV_POSITION;
		float2 uv[2] : TEXCOORD0;
	};
	
	sampler2D _MainTex;
	sampler2D _MainTexBlurred;
	
	float4 _MainTex_TexelSize;
<<<<<<< HEAD
=======
<<<<<<< HEAD
	half4 _MainTex_ST;

	half4 _MainTexBlurred_ST;
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
	
	float intensity;
	float threshold;
		
	v2f vert( appdata_img v ) {
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		
<<<<<<< HEAD
		o.uv[0] = v.texcoord.xy;
		o.uv[1] = v.texcoord.xy;
=======
<<<<<<< HEAD
		o.uv[0] = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _MainTexBlurred_ST);
		o.uv[1] = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _MainTex_ST);
=======
		o.uv[0] = v.texcoord.xy;
		o.uv[1] = v.texcoord.xy;
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		#if UNITY_UV_STARTS_AT_TOP
		if (_MainTex_TexelSize.y < 0)
			o.uv[0].y = 1-o.uv[0].y;
		#endif			
		return o;
	}
	
	half4 frag(v2f i) : SV_Target 
	{
		half4 color = tex2D (_MainTex, i.uv[1]);
		half4 blurred = tex2D (_MainTexBlurred, (i.uv[0]));
		
		half4 difference = color - blurred;
		half4 signs = sign (difference);
		
		half4 enhancement = saturate (abs(difference) - threshold) * signs * 1.0/(1.0-threshold);
		color += enhancement * intensity;
		
		return color;
	}

	ENDCG
	
Subshader {
 Pass {
	  ZTest Always Cull Off ZWrite Off

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      ENDCG
  }
}

Fallback off
	
} // shader
