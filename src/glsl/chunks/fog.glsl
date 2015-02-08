vec4 fogColor = vec4(0.);
float depth = gl_FragCoord.z / gl_FragCoord.w;
float fogFactor = smoothstep( fogNear, fogFar, depth );
gl_FragColor = mix( gl_FragColor, fogColor, fogFactor );