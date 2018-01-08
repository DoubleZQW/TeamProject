package com.qf.vo;

public class ResultMessage {
	private Boolean bool;
	private String message;
	private Object data;

	public ResultMessage() {

	}

	public ResultMessage(Boolean bool, String message, Object data) {
		this.bool = bool;
		this.message = message;
		this.data = data;
	}

	public Boolean getBool() {
		return bool;
	}

	public void setBool(Boolean bool) {
		this.bool = bool;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResultMessage{" +
				"bool=" + bool +
				", message='" + message + '\'' +
				", data=" + data +
				'}';
	}
}
