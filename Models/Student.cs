using System;
using System.Collections.Generic;

namespace WebApp5ByShweta.Models;

public partial class Student
{
    public int StudentId { get; set; }

    public string Name { get; set; } = null!;

    public int? Age { get; set; }

    public string? Email { get; set; }
}
