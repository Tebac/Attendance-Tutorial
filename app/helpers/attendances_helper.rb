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
  #   if (0.26..0.75).include?(((finish - start) / 60 / 60.0).to_i)
  # format("%.2f", (((((finish - start) / 60 / 60.0) + 0.24) / 0.25).to_i) * 0.25)
  #   else
      format("%.2f", ((((finish - start) / 60 / 60.0) / 0.25).to_i) * 0.25)
    # end
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
  
  # def round_fm(time)
  # time = (time.strftime("%M")).to_i
  #   format("%10.2d",(((time) / 15).to_i) * 15)
  # end
  
  # def minutes(time)
  #   ((time) /15).to_i * 15
  # end
  
  
  def total_working_times
    @total_working_times = total_working_times.to_f
  end
     
  
end
