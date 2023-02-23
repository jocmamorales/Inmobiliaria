namespace Inmobiliaria.Models
{
    public class EmpleadoViewModel
    {
        public int ID { get; set; }
        public int idPerfil { get; set; }
        public string? Nombres { get; set; }
        public string? Apellidos { get; set; }
        public string? NroDocumento { get; set; }
        public DateTime FechaAlta { get; set; }
        public int idJornada { get; set; }
        public bool Estado { get; set; }
    }
}
