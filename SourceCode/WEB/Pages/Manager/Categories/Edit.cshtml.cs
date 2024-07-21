﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DataAccess.Models;
using DataAccess.Enum;

namespace WEB.Pages.Manager.Categories
{
    public class EditModel : PageModel
    {
        private readonly DataAccess.Models.QuickMarketContext _context;

        public EditModel(DataAccess.Models.QuickMarketContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ProductCategory ProductCategory { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.ProductCategories == null)
            {
                return NotFound();
            }

            var productcategory =  await _context.ProductCategories.FirstOrDefaultAsync(m => m.CategoryId == id);
            if (productcategory == null)
            {
                return NotFound();
            }
            ProductCategory = productcategory;
            List<StatusCommon> statusList = Enum.GetValues(typeof(StatusCommon))
                                           .Cast<StatusCommon>()
                                           .ToList();
            ViewData["StatusId"] = new SelectList(statusList);
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(ProductCategory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductCategoryExists(ProductCategory.CategoryId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ProductCategoryExists(int id)
        {
          return (_context.ProductCategories?.Any(e => e.CategoryId == id)).GetValueOrDefault();
        }
    }
}
