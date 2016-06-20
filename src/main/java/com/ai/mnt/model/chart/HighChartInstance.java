package com.ai.mnt.model.chart;

import java.util.List;

public class HighChartInstance {

    private Chart chart;
    private Title title;
    private XAxis xAxis;
    private YAxis yAxis;
    private Legend legend;
    private List<Series> series;
    
    public Chart getChart() {
        return chart;
    }
    public void setChart(Chart chart) {
        this.chart = chart;
    }
    public Title getTitle() {
        return title;
    }
    public void setTitle(Title title) {
        this.title = title;
    }
    public XAxis getxAxis() {
        return xAxis;
    }
    public void setxAxis(XAxis xAxis) {
        this.xAxis = xAxis;
    }
    public YAxis getyAxis() {
        return yAxis;
    }
    public void setyAxis(YAxis yAxis) {
        this.yAxis = yAxis;
    }
    public List<Series> getSeries() {
        return series;
    }
    public void setSeries(List<Series> series) {
        this.series = series;
    }
    public Legend getLegend() {
        return legend;
    }
    public void setLegend(Legend legend) {
        this.legend = legend;
    }
    
}
