package admin;

public class CategoryDTO {
    private int id;
    private String name;
    private String url;

    // 기본 생성자
    public CategoryDTO() {}

    // 매개변수가 있는 생성자
    public CategoryDTO(int id, String name, String url) {
        this.id = id;
        this.name = name;
        this.url = url;
    }

    // Getter와 Setter 메서드
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
