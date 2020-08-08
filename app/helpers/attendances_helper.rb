module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退出' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
       format("%.2f", ((((finish - start) / 60 / 60.0) / 0.25).to_i) * 0.25)
  end
  
  def working_times_ed(start, finish)
   format("%.2f", (finish - start) / 60 / 60.0)
  end
  
  def round_s(start)
    start.floor_to(15.minutes)
  end
  
  def round_f(finish)
    finish.floor_to(15.minutes)
  end
  
  def total_working_times
    @total_working_times = total_working_times.to_f
  end
  
end
