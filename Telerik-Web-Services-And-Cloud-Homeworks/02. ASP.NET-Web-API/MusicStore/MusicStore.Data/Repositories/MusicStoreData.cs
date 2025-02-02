﻿namespace MusicStore.Data.Repositories
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using Models;

    public class MusicStoreData : IMusicStoreData
    {
        private readonly DbContext context;
        private readonly IDictionary<Type, object> repositories;

        public MusicStoreData()
        {
            this.context = new MusicStoreDbContext();
            this.repositories = new Dictionary<Type, object>();
        }

        public IRepository<Album> Albums
        {
            get
            {
                return this.GetRepository<Album>();
            }
        }

        public IRepository<Artist> Artists
        {
            get
            {
              return this.GetRepository<Artist>();
            }
        }

        public IRepository<Country> Countries
        {
            get
            {
                return this.GetRepository<Country>();
            }
        }

        public IRepository<Genre> Genres
        {
            get
            {
                return this.GetRepository<Genre>();
            }
        }

        public IRepository<Producer> Producers
        {
            get
            {
                return this.GetRepository<Producer>();
            }
        }

        public IRepository<Song> Songs
        {
            get
            {
                return this.GetRepository<Song>();
            }
        }

        public int Savechanges()
        {
            return this.context.SaveChanges();
        }

        private IRepository<T> GetRepository<T>() where T : class
        {
            var repositoryType = typeof(T);

            if (!this.repositories.ContainsKey(repositoryType))
            {
                var newRepository = Activator.CreateInstance(typeof(EfGenericRepository<T>), this.context);
                this.repositories.Add(repositoryType, newRepository);
            }

            return (IRepository<T>)this.repositories[repositoryType];
        }
    }
}
