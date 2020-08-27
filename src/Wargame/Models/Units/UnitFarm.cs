namespace Wargame.Models.Units
{
    public class UnitFarm : IUnit
    {
        public UnitTypes Type => UnitTypes.Farm;
        public int ResourceCost => 10;
        public ResourceTypes ResourceCostType => ResourceTypes.Wood;
        public int LandCost => 1;
        public int PopCost => 0;
    }
}
