class MonthlyRevenueModel {
    MonthlyRevenueModel({
        required this.totalRevenue,
        required this.monthlyRevenue,
    });

    final num? totalRevenue;
    final Map<String, num> monthlyRevenue;

    factory MonthlyRevenueModel.fromJson(Map<String, dynamic> json){ 
        return MonthlyRevenueModel(
            totalRevenue: json["total_revenue"],
            monthlyRevenue: Map.from(json["monthly_revenue"]).map((k, v) => MapEntry<String, num>(k, v)),
        );
    }

}


class QuartlyReportModel {
    QuartlyReportModel({
        required this.revenue,
        required this.activeUsers,
        required this.quarterlyGrowth,
    });

    final ActiveUsers? revenue;
    final ActiveUsers? activeUsers;
    final List<QuarterlyGrowth> quarterlyGrowth;

    factory QuartlyReportModel.fromJson(Map<String, dynamic> json){ 
        return QuartlyReportModel(
            revenue: json["revenue"] == null ? null : ActiveUsers.fromJson(json["revenue"]),
            activeUsers: json["active_users"] == null ? null : ActiveUsers.fromJson(json["active_users"]),
            quarterlyGrowth: json["quarterly_growth"] == null ? [] : List<QuarterlyGrowth>.from(json["quarterly_growth"]!.map((x) => QuarterlyGrowth.fromJson(x))),
        );
    }

}

class ActiveUsers {
    ActiveUsers({
        required this.current,
        required this.last,
        required this.growthPercent,
    });

    final String? current;
    final String? last;
    final num? growthPercent;

    factory ActiveUsers.fromJson(Map<String, dynamic> json){ 
        return ActiveUsers(
            current: json["current"],
            last: json["last"],
            growthPercent: json["growth_percent"],
        );
    }

}

class QuarterlyGrowth {
    QuarterlyGrowth({
        required this.label,
        required this.total,
    });

    final String? label;
    final String? total;

    factory QuarterlyGrowth.fromJson(Map<String, dynamic> json){ 
        return QuarterlyGrowth(
            label: json["label"],
            total: json["total"],
        );
    }

}

