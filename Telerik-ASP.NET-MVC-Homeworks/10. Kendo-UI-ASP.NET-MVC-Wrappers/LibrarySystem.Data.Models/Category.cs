﻿namespace LibrarySystem.Data.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Category
    {
        private ICollection<Book> books;

        public Category()
        {
            this.books = new HashSet<Book>();
        }

        [Key]
        public virtual int Id { get; set; }

        [Required]
        public virtual string Name { get; set; }

        public virtual ICollection<Book> Books
        {
            get
            { return this.books; }
            set { this.books = value; }
        }
    }
}