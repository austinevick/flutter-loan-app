class Loan {
  final String? title;
  final String? status;
  final String? amount;
  final String? date;
  Loan({
    this.title,
    this.amount,
    this.status,
    this.date,
  });
}

List<Loan> loans = [
  Loan(
      title: 'Personal loan',
      status: 'Approved',
      date: 'June 19th, 2021',
      amount: '50,000'),
  Loan(
      title: 'Car loan',
      status: 'Pending',
      date: 'June 19th, 2021',
      amount: '400,000'),
  Loan(
      title: 'House loan',
      status: 'Declined',
      date: 'June 19th, 2021',
      amount: '300,000'),
  Loan(
      title: 'Land loan',
      status: 'Processing',
      date: 'June 19th, 2021',
      amount: '1,000,000'),
  Loan(
      title: 'School loan',
      status: 'Declined',
      date: 'January 12th, 2020',
      amount: '100,000'),
  Loan(
      title: 'Business loan',
      status: 'Approved',
      date: 'June 19th, 2021',
      amount: '600,000'),
  Loan(
      title: 'Car loan',
      status: 'Pending',
      date: 'May 10th, 2021',
      amount: '500,000'),
  Loan(
      title: 'School loan',
      status: 'Approved',
      date: 'August 25th, 2020',
      amount: '100,000'),
];
