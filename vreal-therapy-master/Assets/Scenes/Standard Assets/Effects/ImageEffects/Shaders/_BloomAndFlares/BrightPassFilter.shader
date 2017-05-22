// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/BrightPassFilterForBloom"
{
	Properties 
	{
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	
	CGINCLUDE
	
	#include "UnityCG.cginc"
	
	struct v2f 
	{
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
	};
	
	sampler2D _MainTex;	
<<<<<<< HEAD
	
=======
<<<<<<< HEAD
	half4     _MainTex_ST;

=======
	
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
	half4 threshold;
	half useSrcAlphaAsMask;
		
	v2f vert( appdata_img v ) 
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
<<<<<<< HEAD
		o.uv =  v.texcoord.xy;
=======
<<<<<<< HEAD
		o.uv = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _MainTex_ST);
=======
		o.uv =  v.texcoord.xy;
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		return o;
	} 
	
	half4 frag(v2f i) : SV_Target 
	{
		half4 color = tex2D(_MainTex, i.uv);
		//color = color * saturate((color-threshhold.x) * 75.0); // didn't go well with HDR and din't make sense
		color = color * lerp(1.0, color.a, useSrcAlphaAsMask);
		color = max(half4(0,0,0,0), color-threshold.x);
		return color;
	}

	ENDCG 
	
	Subshader 
	{
		Pass 
 		{
			  ZTest Always Cull Off ZWrite Off
		
		      CGPROGRAM
		      
		      #pragma vertex vert
		      #pragma fragment frag
		
		      ENDCG
		}
	}
	Fallback off
}
