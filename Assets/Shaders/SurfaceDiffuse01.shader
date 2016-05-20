Shader "Custom/SurfaceDiffuse01" {
	Properties {
		_DiffuseColor ("Diffuse Color", Color) = (1,1,1,1)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf MyOriginal

		half4 LightingMyOriginal(SurfaceOutput s, half3 lightDir, half atten) {
			half diff = dot(s.Normal, lightDir);
			if (diff < 0)
				diff = 0;
			half4 c;
			c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 2);
			c.a = s.Alpha;
			return c;
		}

		struct Input {
			float2 color:COLOR;
		};

		fixed4 _DiffuseColor;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
