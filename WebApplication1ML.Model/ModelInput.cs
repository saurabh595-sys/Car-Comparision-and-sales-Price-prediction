// This file was auto-generated by ML.NET Model Builder. 

using Microsoft.ML.Data;

namespace WebApplication1ML.Model
{
    public class ModelInput
    {
        [ColumnName("name"), LoadColumn(0)]
        public string Name { get; set; }


        [ColumnName("company"), LoadColumn(1)]
        public string Company { get; set; }


        [ColumnName("year"), LoadColumn(2)]
        public float Year { get; set; }


        [ColumnName("Price"), LoadColumn(3)]
        public float Price { get; set; }


        [ColumnName("kms_driven"), LoadColumn(4)]
        public float Kms_driven { get; set; }


        [ColumnName("fuel_type"), LoadColumn(5)]
        public string Fuel_type { get; set; }


    }
}