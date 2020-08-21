String getStringValue<T>(T enumEntry) => enumEntry.toString().split('.')[1];

enum ItemActionTypes {
  SETAMOUNT,
  USE,
  EQUIP,
  UNEQUIP,
  DESTROY,
  SACRIFICE,
}

enum ItemTypes {
  CONSUMABLEITEM,
  FLASK,
  PERMANENTITEM,
  SPELLS,
  GEAR,
  SHIELD,
  WEAPON,
  ITEM,
}

enum StatTypes {
  HP,
  ARM,
  STR,
  DEX,
  CON,
  INT,
  WIS,
  CHA,
  BSC,
  WPN,
  MGC,
  ULT,
}
