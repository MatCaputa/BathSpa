use STEM_Historical_NoSQL

db.scientists.insertMany([
{
  name: "Ada Lovelace",
  birthYear: 1815,
  deathYear: 1852,
  country: "Britain",
  fields: ["Mathematics", "Computing"],
  notes: "First computer algorithm"
},
{
  name: "Mary Cartwright",
  birthYear: 1900,
  deathYear: 1998,
  country: "Britain",
  fields: ["Mathematics"],
  notes: "Chaos theory"
},
{
  name: "Rosalind Franklin",
  birthYear: 1920,
  deathYear: 1958,
  country: "Britain",
  fields: ["Biology", "Physics"],
  notes: "DNA structure"
},
{
  name: "Emilie du Chatelet",
  birthYear: 1706,
  deathYear: 1749,
  country: "France",
  fields: ["Mathematics", "Physics"]
},
{
  name: "Marie Curie",
  birthYear: 1867,
  deathYear: 1934,
  country: "Poland",
  fields: ["Physics", "Chemistry"]
},
{
  name: "Grace Hopper",
  birthYear: 1906,
  deathYear: 1992,
  country: "USA",
  fields: ["Computing"]
},
{
  name: "Katherine Johnson",
  birthYear: 1918,
  deathYear: 2020,
  country: "USA",
  fields: ["Mathematics"],
  notes: "Worked for NASA"
},
{
  name: "Mary Jackson",
  birthYear: 1921,
  deathYear: 1944,
  country: "USA",
  fields: ["Mathematics", "Engineering"],
  notes: "NASA engineer"
},
{
  name: "Emmy Noether",
  birthYear: 1882,
  deathYear: 1935,
  country: "Germany",
  fields: ["Mathematics", "Physics"],
  notes: "Worked with Einstein"
},
{
  name: "Yvonne Choquet-Bruhat",
  birthYear: 1923,
  deathYear: null,
  country: "France",
  fields: ["Mathematics", "Physics"],
  notes: "Worked with Einstein"
}
])

db.events.insertMany([
{
  name: "Women in Computing",
  date: ISODate("2026-01-10"),
  speakers: ["Dr Smith"],
  scientists: ["Ada Lovelace", "Grace Hopper"],
  room: {
    name: "Lecture Hall A",
    type: "Lecture"
  },
  requiresTicket: true
},
{
  name: "Einstein Collaborators",
  date: ISODate("2026-02-15"),
  speakers: ["Prof Johnson"],
  scientists: ["Emmy Noether", "Yvonne Choquet-Bruhat"],
  room: {
    name: "Main Hall",
    type: "Event"
  },
  requiresTicket: true
}
])

db.scientists.find({ country: "France" })

db.scientists.find({ fields: "Computing" })

db.scientists.find({
  $expr: { $gt: [ { $size: "$fields" }, 1 ] }
})

db.scientists.updateOne(
  { name: "Mary Jackson" },
  { $set: { deathYear: 2005 } }
)

db.scientists.find({
  $expr: { $lt: [ { $subtract: ["$deathYear", "$birthYear"] }, 40 ] }
})

db.scientists.aggregate([
  { $group: { _id: "$country", total: { $sum: 1 } } },
  { $sort: { total: -1 } }
])

db.scientists.find({ deathYear: null })

db.scientists.find({
  notes: { $regex: "NASA", $options: "i" }
})

db.scientists.find({
  notes: { $regex: "Einstein", $options: "i" }
})

db.scientists.aggregate([
  { $unwind: "$fields" },
  {
    $group: {
      _id: "$country",
      uniqueFields: { $addToSet: "$fields" }
    }
  },
  {
    $project: {
      count: { $size: "$uniqueFields" }
    }
  },
  { $sort: { count: -1 } }
])

db.events.insertOne({
  name: "NASA Pioneers",
  date: ISODate("2026-03-10"),
  speakers: ["Dr Williams"],
  scientists: ["Katherine Johnson", "Mary Jackson"],
  room: { name: "Lecture Hall B", type: "Lecture" },
  requiresTicket: false
})

db.events.updateOne(
  { name: "NASA Pioneers" },
  { $set: { date: ISODate("2026-04-01") } }
)

db.scientists.insertOne({
  name: "Chien-Shiung Wu",
  birthYear: 1912,
  deathYear: 1997,
  country: "China",
  fields: ["Physics"],
  notes: "Wu experiment"
})