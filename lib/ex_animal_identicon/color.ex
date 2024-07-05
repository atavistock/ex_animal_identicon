defmodule ExAnimalIdenticon.Color do

  @type t :: %__MODULE__{}

  defstruct [:name, :value]

  @colors [
    {"#FF0000", "Red"},
    {"#FFA500", "Orange"},
    {"#FFFF00", "Yellow"},
    {"#FFC0CB", "Pink"},
    {"#ADD8E6", "Light Blue"},
    {"#0000FF", "Blue"},
    {"#00FFFF", "Cyan"},
    {"#008000", "Green"},
    {"#00008B", "Dark Blue"},
    {"#800080", "Purple"},
    {"#7FFFD4", "Aquamarine"},
    {"#FF00FF", "Magenta"},
    {"#00FF00", "Lime"},
    {"#800000", "Maroon"},
    {"#93917C", "Jade"},
    {"#FFCE44", "Chrome Gold"},
    {"#4863A0", "Azure"},
    {"#660000", "Bloodred"},
    {"#A52A2A", "Brown"},
    {"#966F33", "Wood"},
    {"#728FCE", "Light Purple"},
    {"#22CE83", "Island Green"},
    {"#1589FF", "Neon Blue"},
    {"#FBE7A1", "Blonde"},
    {"#FFFF33", "Neon Yellow"},
    {"#36013F", "Deep Purple"},
    {"#95B9C7", "Baby Blue"},
    {"#87CEEB", "Sky Blue"},
    {"#2B65EC", "Ocean Blue"},
    {"#FFD700", "Gold"},
    {"#006400", "Dark Green"},
    {"#368BC1", "Blue Ice"},
    {"#151B54", "Night Blue"},
    {"#EB5406", "Red Gold"},
    {"#1E90FF", "Dodger Blue"},
    {"#0041C2", "Blueberry"},
    {"#357EC7", "Windows Blue"},
    {"#E799A3", "Pink Daisy"},
    {"#583759", "Plum"},
    {"#F98B88", "Peach Pink"},
    {"#F535AA", "Neon Pink"},
    {"#90EE90", "Light Green"},
    {"#254117", "Forest Green"},
    {"#835C3B", "Fuzzy Brown"},
    {"#AA6C39", "Dark Gold"},
    {"#E42217", "Lava Red"},
    {"#EE82EE", "Violet"},
    {"#C48189", "Pink Brown"},
    {"#6F4E37", "Coffee"},
    {"#FDD7E4", "Pinky"},
    {"#E8ADAA", "Rose"},
    {"#000080", "Navy"},
    {"#848B79", "Sage"},
    {"#14A3C7", "Cyan Blue"},
    {"#9D00FF", "Neon Purple"},
    {"#4B0082", "Indigo"},
    {"#FDD017", "Bright Gold"},
    {"#2F539B", "Bright Blue"},
    {"#FDBD01", "Neon Gold"},
    {"#0000A0", "Midnight Blue"},
    {"#C19A6B", "Camel Brown"},
    {"#FFDB58", "Mustard"},
    {"#85BB65", "Money Green"},
    {"#6495ED", "Cornflower"}
  ]

  @spec get(non_neg_integer()) :: t()
  def get(idx) do
    {value, name} = Enum.at(@colors, idx)
    %__MODULE__{name: name, value: value}
  end

end
