use Employees

db.Employee.insertMany([ { ename: 'Rajiv', city: 'Pune' }, { ename:'Tanmay', city: 'Nagpur' }, { ename: 'Dinesh', city: 'Mumbai' }, { ename:'Aatish', city: 'Pune' }, { ename: 'Priyanka', city: 'Nagpur' }, { ename:'Omkar', city: 'Mumbai' }, {ename: 'Raj', city: 'Pune' }, { ename: 'Sanket',city: 'Mumbai'}, { ename: 'Pragati', city: 'Pune' }, { ename: 'Sanika',city:'Nagpur' } ])

db.Company.insertMany([ { cname: "Google", city: "Pune" }, { cname:"Amazon", city: "Nagpur" }, { cname: "Flipkart",city: "Mumbai" }, { cname: "TCS",city: "Pune" }, { cname: "Wipro", city: "Mumbai" }, { cname: "Meta", city:"Mumbai" }, { cname: "JP Morgan", city: "Pune" }, { cname: "Credit Suisse", city:"Nagpur" }, { cname: "ACC", city: "Pune" }, { cname: "TATA", city: "Mumbai" }, {cname: "BAJAJ", city: "Nagpur" } ])

db.Emp_company.insertMany([ { ename: 'Rajiv', cname:'ACC', salary:6000.00, jdate: ISODate('2023-01-15T00:00:00Z') }, { ename: 'Tanmay', cname:'TATA', salary: 8000.00, jdate: ISODate('2023-02-10T00:00:00Z') }, { ename:'Dinesh', cname: 'ACC',salary: 5500.00, jdate: ISODate('2023-03-20T00:00:00Z') },{ ename: 'Aatish', cname: 'TATA', salary: 7000.00, jdate:ISODate('2023-04-05T00:00:00Z') }, { ename: 'Priyanka', cname: 'BAJAJ', salary:7500.00, jdate: ISODate('2023-01-25T00:00:00Z') }, { ename: 'Omkar', cname:'ACC', salary: 5000.00, jdate: ISODate('2023-03-01T00:00:00Z') }, { ename: 'Raj',cname: 'TATA', salary: 9000.00, jdate: ISODate('2023-05-12T00:00:00Z') }, {ename: 'Sanket',cname: 'BAJAJ', salary: 6500.00, jdate:ISODate('2023-04-18T00:00:00Z') }, { ename: 'Pragati', cname: 'TATA', salary:3000.00, jdate: ISODate('2023-06-08T00:00:00Z') }, { ename: 'Sanika', cname:'BAJAJ', salary: 4500.00, jdate: ISODate('2023-07-03T00:00:00Z') } ])

db.Manager.insertMany([ { name: "Dinesh", company: "ACC" }, { name: "Raj", company: "TATA" } ])

db.Emp_shift.insertMany([ { ename: 'Rajiv', shift: 'Day' }, { ename:'Tanmay', shift: 'Night' }, { ename: 'Dinesh', shift: 'Day' }, { ename: 'Aatish',shift: 'Day' }, { ename: 'Priyanka', shift: 'Night' }, { ename: 'Omkar', shift:'Night' }, { ename: 'Raj', shift: 'Day' }, { ename: 'Sanket', shift: 'Day' },{ename: 'Pragati', shift: 'Night' }, { ename: 'Sanika', shift:'Day' } ])

db.Employee.find()

db.Emp_company.find()

db.Company.find({ city: "Pune" }, { _id: 0, cname: 1})

db.Company.find({ city: "Nagpur" }, { _id: 0, cname:1 })

db.Employee.aggregate([ { $lookup: { from: "Emp_company", localField:"ename", foreignField: "ename", as: "company_info" } }, { $match: {"company_info.cname": "ACC", "company_info.salary": { $gt: 5000 } } }, {$project: { _id: 0, ename: 1 } } ])

db.Emp_company.find({ "cname": "ACC", "salary": { $gt: 5000 } }, {"ename": 1, "_id": 0 })

db.Employee.aggregate([ { $lookup: { from: "Emp_company", localField:"ename", foreignField: "ename", as: "company_info" } }, { $match: { "cname": {$ne: "ACC" } } }, { $project: { _id: 0, ename: 1 } } ])

db.Emp_company.find({ "cname": { $ne: "ACC" } }, { "ename": 1, "_id":0 })

db.Emp_company.find({"cname":{$in:["TATA","BAJAJ"]},salary:{$gte:2000,$lte:6000}},{"ename":1,"_id":0})

db.Emp_Company.createIndex({ "ename": 1 })

db.Company.updateMany({}, { $set: { "state": "Maharashtra" } })

db.Company.find()

db.Manager.deleteMany({})

db.Manager.find()

db.Manager.drop()

db.Manager.find()

db.Employee.find()
