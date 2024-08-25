# src\triangle\floats.nim
type
    Float2* = ref object
        x*, y*: float

    Float4* = ref object
        x*, y*, z*, w*: float