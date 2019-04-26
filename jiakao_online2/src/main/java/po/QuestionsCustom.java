package po;

public class QuestionsCustom extends Questions {
	private String lessonName;
	private String taotiName;
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public String getTaotiName() {
		return taotiName;
	}
	public void setTaotiName(String taotiName) {
		this.taotiName = taotiName;
	}

	@Override
	public String toString() {
		return "QuestionsCustom{" +
				"question="+super.toString()+
				"lessonName='" + lessonName + '\'' +
				", taotiName='" + taotiName + '\'' +
				'}';
	}
}
