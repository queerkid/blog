using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JiFen.Tool
{
    public class SOKN
    {
        private List<int> tmp = new List<int>();
        private List<List<int>> lists = new List<List<int>>();
        private List<int> list = new List<int>();

        public List<int> find(int sum, List<int> list)
        {

            this.list = list;
            int n = list.Count;
            calc(sum, n);
            if (lists.Count == 0)
            {
                return new List<int>();
            }
            List<int> sort = lists[0];
            for (int i = 0; i < lists.Count; i++)
            {
                if (lists[i].Count < sort.Count)
                {
                    sort = lists[i];
                }
            }
            return sort;
        }

        private void calc(int sum, int n)
        {

            if (n <= 0 || sum <= 0)
            {
                return;
            }

            List<int> result = new List<int>();

            if (sum == list[n - 1])
            {
                this.tmp.Reverse();

                foreach (var item in tmp)
                {
                    result.Add(item);
                }
                result.Add(n - 1);
                result.Sort();
                this.lists.Add(result);

                this.tmp.Reverse();
            }

            this.tmp.Insert(0, n - 1);
            this.calc(sum - list[n - 1], n - 1);
            this.tmp.RemoveAt(0);
            this.calc(sum, n - 1);

        }
    }
}




