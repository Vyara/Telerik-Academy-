﻿namespace StudentSystem.Web.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class HomeworkDataModel
    {
        [Required]
        public string FileUrl { get; set; }

        [Required]
        public DateTime TimeSent { get; set; }

        [Required]
        public int StudentIdentification { get; set; }

        [Required]
        public Guid CourseId { get; set; }
    }
}