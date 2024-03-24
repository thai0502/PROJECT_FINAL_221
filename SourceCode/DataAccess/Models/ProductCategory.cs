﻿using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
            Products = new HashSet<Product>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public string? Description { get; set; }
        public int? StatusId { get; set; }

        public virtual Status? Status { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
