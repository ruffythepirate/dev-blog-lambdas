import {createReport, pathToUnixTimestamp} from "./report-service";


describe('report-service', () => {
    it('translates date to number', () => {

        expect(pathToUnixTimestamp('2021-04-06')).toBe(1617667200);

    });

    it('aggregates data', () => {
        const report = createReport({
            dates: {
                "2020-05-01": {
                    paths: {
                        "/": {
                            uniq: 1,
                            tot: 5
                        },
                        "/2020/04/20/index" : {
                            uniq: 4,
                            tot: 8
                        }
                    }
                },
                "2020-05-02": {
                    paths: {
                        "/": {
                            uniq: 1,
                            tot: 5
                        },
                        "/2020/04/21/index" : {
                            uniq: 5,
                            tot: 8
                        },
                        "/2020/04/20/index" : {
                            uniq: 4,
                            tot: 8
                        }
                    }
                }
            }
        });

        expect(report.length).toBe(3);
    });
});
