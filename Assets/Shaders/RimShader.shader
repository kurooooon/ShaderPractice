Shader "Custom/RimShader" {
	Properties {
		_DiffuseColor ("Color", Color) = (1,1,1)
//		_RimColor ("Color", Color) = (0.0,0.0,0.0)
		_RimWidth("Rim Width", Range(0.5, 0.8)) = 3.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert


		struct Input {
			float3 viewDir;
		};

		float4 _DiffuseColor;
//		float4 _RimColor;
		float _RimWidth;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
			half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
			half rim2 = pow(rim, _RimWidth);
			half rim3;
			if (rim2 < 0.5) rim3 = 1.0; 
			else rim3 = 0.0;
			o.Albedo *= rim3;
//			o.Emission = _RimColor.rgb * pow(rim, _RimWidth);
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
