Shader "Custom/FragmentAlphaChannel01" {
	Properties {
		_DiffuseColor ("Diffuse Color", Color) = (0.5, 0.5, 0.5, 1.0)
	}
	SubShader {
		Tags {
			"Queue" = "Transparent"
			"RenderType" = "Transparent"
		}
		Pass {
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			float4 _lightColor0;
			float4 _DiffuseColor;

			struct vertout {
				float4 pos : SV_POSITION;
				float3 viewDir : TEXCOORD1;
				float3 normal : TEXCOORD2;
			};

			vertout vert (appdata_full v) {
				vertout OUT;
				OUT.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				OUT.viewDir = normalize(ObjSpaceViewDir(v.vertex));
				OUT.normal = v.normal;
				return OUT;
			}

			fixed4 frag (vertout In) :COLOR {
				float alpha = pow(max(0, dot(In.viewDir, In.normal)), 3);
				float4 color = _DiffuseColor;
				color.a = alpha;
				return color;
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
