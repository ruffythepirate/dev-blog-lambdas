import {Metric, MetricKey} from "ts-s3-metrics";
import {Resolution} from "ts-s3-metrics/dist/metric/resolution";

export interface MetricGroup {
    key: MetricKey,
    values: Metric[]
}

export function createReport(input: any): MetricGroup[] {

    const dates = input["dates"];

    const pathDict = {};

    for(let key in dates) {
        createReportForDate(key, dates[key]["paths"], pathDict)
    }

    return convertDictToMetricGroups(pathDict);
}

function convertDictToMetricGroups(pathDict: any): MetricGroup[] {
    const result = [];
    for(let key in pathDict) {
        result.push({
            key: new MetricKey('tot', key, Resolution.Raw),
            values: pathDict[key]
        });
    }

    return result;
}

function createReportForDate(date: string, datePaths: any, allPaths: any) {
    for(let key in datePaths) {
        let path = allPaths[key];
        if(path === undefined) {
            allPaths[key] = [];
        }
        (allPaths[key] as Metric[]).push({
            startTimeAsUnixTimestamp: pathToUnixTimestamp(path),
            value: datePaths[key].tot
        });
    }

}

export function pathToUnixTimestamp(path: string): number {
    return new Date(path).getTime() / 1e3;
}
