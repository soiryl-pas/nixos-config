# nix-to-kdl :: AttrSet -> String
# Takes an AttrSet that describes a KDL file and outputs
# a string that can be directly written into a file.

# TODO: Enhance to take more complex formats of keybinds into account (look into kdl spec)
{
  kdl-attrset,
  compose,
}:
let
  inherit (builtins) concatStringsSep map isList isAttrs isString isInt isFloat
                     typeOf mapAttrs attrValues;

  list-to-string = compose (concatStringsSep "; ") (map (node-dispatch-func));
  dispatch-single-attrset = name: value:
    if      isString value then toString name + " \"" + value + "\""
    else if isInt value || isFloat value then toString name + " " + toString value
    else    toString name + " {\n" + node-dispatch-func value + "\n} ";
  #dispatch-attrs = mapAttrs (name: value: toString name + " { " + node-dispatch-func value + " } ");
  attrs-to-string = compose (concatStringsSep "\n") (compose attrValues (mapAttrs dispatch-single-attrset));
  node-dispatch-func = node:
    if      isList   node then list-to-string node
    else if isAttrs  node then attrs-to-string node
    else if isString node then node
    else throw "During KDL nix-expression parsing: Unknown type " + (typeOf node);
in
  node-dispatch-func kdl-attrset
