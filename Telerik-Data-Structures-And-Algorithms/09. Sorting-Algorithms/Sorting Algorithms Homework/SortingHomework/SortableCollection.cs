﻿namespace SortingHomework
{
    using System;
    using System.Collections.Generic;

    public class SortableCollection<T> where T : IComparable<T>
    {
        private readonly IList<T> items;

        public SortableCollection()
        {
            this.items = new List<T>();
        }

        public SortableCollection(IEnumerable<T> items)
        {
            this.items = new List<T>(items);
        }

        public IList<T> Items
        {
            get
            {
                return this.items;
            }
        }

        public void Sort(ISorter<T> sorter)
        {
            sorter.Sort(this.items);
        }

        public bool LinearSearch(T item)
        {
            foreach (var collectionItem in this.items)
            {
                if (item.CompareTo(collectionItem) == 0)
                {
                    return true;
                }
            }

            return false;
        }

        public bool BinarySearch(T item)
        {
            this.Sort(new Quicksorter<T>());

            int startIndex = 0;
            int endIndex = this.items.Count - 1;
            int searchedIndex = -1;
            while (startIndex <= endIndex)
            {
                int middleIndex = (startIndex + endIndex) / 2;
                if (item.CompareTo(this.items[middleIndex]) < 0)
                {
                    endIndex = middleIndex - 1;
                }
                else if (item.CompareTo(this.items[middleIndex]) > 0)
                {
                    startIndex = middleIndex + 1;
                }
                else
                {
                    searchedIndex = middleIndex;
                    break;
                }
            }

            return searchedIndex != -1;
        }

        public void Shuffle()
        {
            Random rng = new Random();

            for (int i = this.items.Count - 1; i >= 0; i--)
            {
                int randomNumber = rng.Next(0, i + 1);
                T temp = this.items[randomNumber];
                this.items[randomNumber] = this.items[i];
                this.items[i] = temp;
            }
        }

        public void PrintAllItemsOnConsole()
        {
            for (int i = 0; i < this.items.Count; i++)
            {
                if (i == 0)
                {
                    Console.Write(this.items[i]);
                }
                else
                {
                    Console.Write(" " + this.items[i]);
                }
            }

            Console.WriteLine();
        }
    }
}
