﻿Shader "Custom/SurfaceSpecular01" {
	Properties {
		_DiffuseColor ("Diffuse Color", Color) = (1,1,1,1)
		_Specular ("Specular", Range(1.0, 50.0)) = 15.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf MyOriginal

		half _Specular;

		half4 LightingMyOriginal(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
		{
			half diff = max(0, dot(s.Normal, lightDir));
			half spec = max(0, dot(s.Normal, normalize(lightDir + viewDir)));
			spec = pow(spec, _Specular);
			half4 c;
			c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec / 2) * (atten * 2);
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
