
________________________________________________________
| Aspect             | View           | Separate Table |
| ------------------ | -------------- | -------------- |
| Data storage       | No             | Yes            |
| Data duplication   | None           | Yes            |
| Maintenance        | Low            | High           |
| Real-time accuracy | Always current | Can be stale   |
| Storage cost       | Zero           | Ongoing        |
| Write operations   | Not typical    | Required       |
________________________________________________________

_______________________________________________
| Cost Factor         | View | Separate Table |
| ------------------- | ---- | -------------- |
| Storage             | $0   | $$ ongoing     |
| Compute (writes)    | $0   | $$             |
| Backup size         | $0   | $$             |
| Replication traffic | $0   | $$             |
| Operational jobs    | $0   | $$             |
_______________________________________________



        Senior Rule of Thumb (Teach This)

        If data must be stored, use a table.
        If logic must be reused, use a view.


| Indexes                     | Views                              |
| --------------------------- | ---------------------------------- |
| Over-indexing slows writes  | Over-viewing hides expensive reads |
| Index maintenance cost      | View recomputation cost            |
| Wrong index hurts optimizer | Wrong view hides bad SQL           |
| Index sprawl                | View sprawl                        |

A view is like owning a house that has no rent.
You only pay for electricity and water when people use it.
The more people and the heavier the usage, the higher the bill.

| Real Life         | Database                   |
| ----------------- | -------------------------- |
| House exists      | View definition exists     |
| No one inside     | View unused (zero cost)    |
| People inside     | Queries run on the view    |
| Electricity/water | CPU, memory, I/O           |
| More people       | More concurrent queries    |
| Heavy appliances  | Expensive joins/aggregates |
