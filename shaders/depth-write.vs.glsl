
    attribute vec3 aVertexPosition;

    uniform mat4 uWorldMatrix;
    uniform mat4 uViewMatrix;
    uniform mat4 uProjectionMatrix;

    varying float vDepth;

    void main(void) {
        gl_Position = uProjectionMatrix * uViewMatrix * uWorldMatrix * vec4(aVertexPosition, 1.0);
        vec3 ndc = gl_Position.xyz / gl_Position.w;
        // todo convert clip space depth into NDC and rescale from [-1, 1] to [0, 1]
        vDepth = ndc.z * 0.5 + 0.5;
    }