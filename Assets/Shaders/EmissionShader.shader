Shader "Custom/EmissionShader" {
	Properties {
		_DiffuseColor("Diffuse Color", Color) = (1.0, 1.0, 1.0)
		_EmissionColor("Emission Color", Color) = (0.0, 0.0, 0.0)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float4 color:Color;
		};

		fixed4 _DiffuseColor;
		fixed4 _EmissionColor;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
			o.Emission = _EmissionColor;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
