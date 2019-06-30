using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace strakcinema
{
    public class creditcardsController : Controller
    {
        private DataModel db = new DataModel();

        // GET: creditcards
        public ActionResult Index()
        {
            return View(db.creditcards.ToList());
        }

        // GET: creditcards/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            creditcard creditcard = db.creditcards.Find(id);
            if (creditcard == null)
            {
                return HttpNotFound();
            }
            return View(creditcard);
        }

        // GET: creditcards/Create
        public ActionResult Create()
        {
            //List<SelectListItem> cardType = new List<SelectListItem>() {
          
            
            //    new SelectListItem{Text= "Visa" },
            //    new SelectListItem{Text="American Express" },
            //    new SelectListItem{Text="Master Card"},
            //};
            //var credit = new creditcard(); 
            //   credit.cardTypes= (IEnumerable<SelectListItem>)cardType.AsEnumerable();
            //ViewBag.cards = credit.cardTypes;
            return View();
        }
        public ActionResult Confirmation()
        {
            return View();
        }
        // POST: creditcards/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "card_id,card_num,card_type,card_name,card_expiry,card_cvv")] creditcard creditcard,string show_id,string total_tickets,string total_price)
        {
            

            if (ModelState.IsValid)
            {
                db.creditcards.Add(creditcard);
                db.SaveChanges();
                order Order = new order();
                Order.show_id = Convert.ToInt32(show_id);
                Order.user_id = Convert.ToInt32(Session["UserId"]);
                Order.total_tickets = Convert.ToInt32(total_tickets);
                Order.total_cost= Convert.ToInt32(total_price);
                Order.date = DateTime.Today;
                Random rnd = new Random();

                Order.card_id = rnd.Next(1,9);
                db.orders.Add(Order);
                db.SaveChanges();
                return RedirectToAction("Confirmation","Creditcards");
            }

            return View(creditcard);
        }

        // GET: creditcards/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            creditcard creditcard = db.creditcards.Find(id);
            if (creditcard == null)
            {
                return HttpNotFound();
            }
            return View(creditcard);
        }

        // POST: creditcards/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "card_id,card_num,card_type,card_name,card_expiry,card_cvv")] creditcard creditcard)
        {
            if (ModelState.IsValid)
            {
                db.Entry(creditcard).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(creditcard);
        }

        // GET: creditcards/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            creditcard creditcard = db.creditcards.Find(id);
            if (creditcard == null)
            {
                return HttpNotFound();
            }
            return View(creditcard);
        }

        // POST: creditcards/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            creditcard creditcard = db.creditcards.Find(id);
            db.creditcards.Remove(creditcard);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
