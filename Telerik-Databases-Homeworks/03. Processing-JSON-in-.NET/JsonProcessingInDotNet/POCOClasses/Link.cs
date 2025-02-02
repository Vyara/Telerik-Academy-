﻿namespace JsonProcessingInDotNet.POCOClasses
{
    using Newtonsoft.Json;

    public class Link
    {
        [JsonProperty("@href")]
        public virtual string Href { get; set; }

        public override string ToString()
        {
            return this.Href;
        }
    }
}
