﻿Shader "Custom/Fragment01" {
	Properties {
		_DiffuseColor ("Diffuse Color", Color) = (1,1,1)
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 vert (float4 v:POSITION) : SV_POSITION {
				return mul(UNITY_MATRIX_MVP, v);
			}

			fixed4 frag () :COLOR {
				return fixed4(1.0, 0.0, 0.0, 1.0);
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
