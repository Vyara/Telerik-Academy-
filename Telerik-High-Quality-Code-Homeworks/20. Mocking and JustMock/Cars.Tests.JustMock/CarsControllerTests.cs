﻿namespace Cars.Tests.JustMock
{
    using System;
    using System.Collections.Generic;

    using Microsoft.VisualStudio.TestTools.UnitTesting;

    using Cars.Contracts;
    using Cars.Tests.JustMock.Mocks;
    using Cars.Controllers;
    using Cars.Models;
    using Moq;

    [TestClass]
    public class CarsControllerTests
    {
        private readonly ICarsRepository carsData;
        private CarsController controller;

        public CarsControllerTests()
            : this(new JustMockCarsRepository())
            // : this(new MoqCarsRepository())
        {
        }

        private CarsControllerTests(ICarsRepositoryMock carsDataMock)
        {
            this.carsData = carsDataMock.CarsData;
        }

        [TestInitialize]
        public void CreateController()
        {
            this.controller = new CarsController(this.carsData);
        }

        [TestMethod]
        public void IndexShouldReturnAllCars()
        {
            var model = (ICollection<Car>)this.GetModel(() => this.controller.Index());

            Assert.AreEqual(4, model.Count);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void AddingCarShouldThrowArgumentNullExceptionIfCarIsNull()
        {
            var model = (Car)this.GetModel(() => this.controller.Add(null));
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void AddingCarShouldThrowArgumentNullExceptionIfCarMakeIsNull()
        {
            var car = new Car
            {
                Id = 15,
                Make = "",
                Model = "330d",
                Year = 2014
            };

            var model = (Car)this.GetModel(() => this.controller.Add(car));
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void AddingCarShouldThrowArgumentNullExceptionIfCarModelIsNull()
        {
            var car = new Car
            {
                Id = 15,
                Make = "BMW",
                Model = "",
                Year = 2014
            };

            var model = (Car)this.GetModel(() => this.controller.Add(car));
        }

        [TestMethod]
        public void AddingCarShouldReturnADetail()
        {
            var car = new Car
            {
                Id = 15,
                Make = "BMW",
                Model = "330d",
                Year = 2014
            };

            var model = (Car)this.GetModel(() => this.controller.Add(car));

            Assert.AreEqual(1, model.Id);
            Assert.AreEqual("Audi", model.Make);
            Assert.AreEqual("A5", model.Model);
            Assert.AreEqual(2005, model.Year);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void GetCarDetailsShouldThrowAnArgumentNullExceptionIfCarObjectIsNull()
        {
            var carRepoMock = new Mock<ICarsRepository>();
            carRepoMock.Setup(x => x.GetById(It.IsAny<int>())).Returns((Car)null);
            var testController = new CarsController(carRepoMock.Object);
            testController.Details(10);
        }

        [TestMethod]
        public void SearchingByCarManufacturerShouldReturnManufacturersNameAccordingly()
        {
            var carModel = "BMW";
            var searchResult = this.GetModel(() => this.controller.Search(carModel));
            foreach (var car in (searchResult as List<Car>))
            {
                Assert.AreEqual(carModel, car.Make);
            }

        }

        [TestMethod]
        public void SortingShouldReturnCorrectResult_Make()
        {
            var sortingByMake = "make";
            var sortedByMake = this.GetModel(() => this.controller.Sort(sortingByMake));
            var isSorted = true;
            for (int i = 1; i < (sortedByMake as List<Car>).Count; i++)
            {
                if ((sortedByMake as List<Car>)[i].Make.CompareTo((sortedByMake as List<Car>)[i - 1].Make) < 0)
                {
                    isSorted = false;
                }
            }

            Assert.IsTrue(isSorted);
        }

        [TestMethod]
        public void SortingShouldReturnCorrectResult_Year()
        {
            var sortingByYear = "year";
            var sortedByMake = this.GetModel(() => this.controller.Sort(sortingByYear));
            var isSorted = true;
            for (int i = 1; i < (sortedByMake as List<Car>).Count; i++)
            {
                if ((sortedByMake as List<Car>)[i].Year < (sortedByMake as List<Car>)[i - 1].Year)
                {
                    isSorted = false;
                }
            }

            Assert.IsTrue(isSorted);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void SortingShouldThrowAnArgumentExceptionWhenCalledWithAnInvalidArgument()
        {
            var invalid = "invalid";
            var sortedByMake = this.GetModel(() => this.controller.Sort(invalid));
        }

        private object GetModel(Func<IView> funcView)
        {
            var view = funcView();
            return view.Model;
        }
    }
}
