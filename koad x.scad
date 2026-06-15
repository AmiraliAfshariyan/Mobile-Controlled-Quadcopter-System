
motor_inner_dia = 7.9;
motor_outer_dia = 11.5; 
arm_width = 4.5;
frame_radius = 50; // شعاع شش‌ضلعی اصلی
thickness = 4;

$fn = 100;

module quad_final() {
    linear_extrude(height = thickness) {
        difference() {
            union() {
                // ۱. فریم اصلی ۶ ضلعی (بیرونی)
                difference() {
                    rotate([0, 0, 30]) circle(r = frame_radius, $fn = 6);
                    rotate([0, 0, 30]) circle(r = frame_radius -5 , $fn = 6);
                }

                // ۲. بازوهای ضربدری اصلی
                for(r = [45, 135]) {
                    rotate([0, 0, r]) square([frame_radius * 2.5, arm_width], center = true);
                }

                // ۳. بدنه مرکزی (بخش منحنی متصل به بازوها)
                difference() {
                    // پایه مرکزی
                    circle(r = frame_radius * 0.45);
                    
                    // ایجاد انحنای مقعر بین بازوها (مانند عکس)
                    for(a = [0, 90, 180, 270]) {
                        rotate([0, 0, a]) 
                            translate([frame_radius * 0.7, 0, 0]) 
                                circle(r = frame_radius * 0.45);
                    }
                }

                // ۴. حلقه‌های موتور در چهار طرف
                for(a = [45, 135, 225, 315]) {
                    rotate([0, 0, a]) translate([frame_radius * 1.36, 0, 0]) {
                        difference() {
                            circle(d = motor_outer_dia);
                            circle(d = motor_inner_dia); // قطر دقیق 7.9
                            // شکاف انتهای حلقه
                            translate([motor_outer_dia/2, 0, 0]) square([4, 1.5], center = true);
                        }
                    }
                }
            }

            // ۵. ایجاد الگوی دقیق شش‌ضلعی در مرکز (صلیبی)
            central_hex_pattern();
        }
    }
}

module central_hex_pattern() {
    h_size = 2.2; // اندازه هر حفره شش‌ضلعی
    spacing = 2.6; 
    
    // چیدمان به شکل مثبت/صلیب مطابق تصویر
    for(x = [-2:2]) {
        for(y = [-2:2]) {
            // فیلتر کردن برای ایجاد شکل لوزی/صلیبی در مرکز
            if (abs(x) + abs(y) <= 2) {
                translate([x * spacing, y * spacing * 1.1, 0])
                    rotate([0, 0, 0]) circle(d = h_size, $fn = 6);
            }
        }
    }
}

// اجرای مدل
quad_final();