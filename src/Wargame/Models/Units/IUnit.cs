namespace Wargame.Models.Units
{
    public interface IUnit
    {
        public UnitTypes Type { get; }

        public int ResourceCost { get; }
        public ResourceTypes ResourceCostType { get; }

        public int LandCost { get; }
        public int PopCost { get; }
    }
}