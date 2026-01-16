---
title: Java学习笔记
date: 2026-01-16 17:01:21
tags: [Java, 学习笔记]
categories: [学习笔记]
cover: /images/tushuguan2.png 
description: "目前在自学Java，简单记录一下"
---

<p align="center">
  <img src="/images/avatar.jpg" style="width: 130px; border-radius: 50%; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
</p>

> 博主本人是cpp选手，之前没太接触过Java，但是之后听入职的技术栈主要是Java所以想着自学一下，目前初步的计划是Java + 数据库 + 中间件 + Java web 然后最后做一个项目结束。
>
> 目前的进度是Java基础简单过了一遍，让AI帮忙总结了一下学习笔记。

## 📚 学习路径概览

| Day | 学习内容 | 核心知识点 |
|-----|----------|------------|
| Day1 | Java基础入门 | 程序结构、main方法、变量定义、输出语句 |
| Day2 | 包装类型与数组 | 包装类型比较、String常量池、数组操作 |
| Day3 | 面向对象编程 | 接口、多态、类定义、toString方法 |
| Day4 | 异常处理 | try-catch-finally、异常传播机制 |
| Day5 | Stream API | Stream操作链、方法引用、函数式编程 |
| Day6 | 综合项目实践 | 自定义异常、Optional类、用户交互 |
| Day7 | 集合框架 | List、Set、TreeSet的区别与应用 |
| Day8 | HashMap应用 | Map遍历、词频统计、Entry使用 |

---

## 📖 Day1: HelloWorld.java - Java基础入门

### 🎯 学习目标
- 理解Java程序的基本结构
- 掌握main方法的语法和含义
- 学会变量定义和基本输出

### 📝 核心知识点

#### 1. 程序基本结构
```java
// 1. 类名必须与文件名完全一致（区分大小写）
public class HelloWorld {
    
    // 2. main方法是程序的唯一入口
    public static void main(String[] args) {
        // 程序执行从这里开始
        System.out.println("Hello, Meituan!");
    }
}
```

#### 2. main方法详解
- **public**: 访问修饰符，表示该方法可以被JVM调用
- **static**: 静态方法，不需要创建对象即可调用
- **void**: 返回类型，表示该方法没有返回值
- **String[] args**: 命令行参数数组

#### 3. 输出语句详解
```java
System.out.println("Hello, zmh!");  // 输出并换行
System.out.print("Hello");             // 输出不换行
System.out.printf("格式化输出: %s", name); // 格式化输出
```

#### 4. 变量定义与类型
```java
// 基本数据类型
int number = 10;           // 整型
double price = 19.99;      // 双精度浮点型
boolean isTrue = true;     // 布尔型
char letter = 'A';         // 字符型

// 引用数据类型
String message = "My number is ";  // String是对象，不是基本类型
```

#### 5. 字符串拼接
```java
int number = 10;
String message = "My number is ";
System.out.println(message + number);  // 自动类型转换
// 输出: My number is 10
```

### 🔍 技术细节
- **编译过程**: `.java` → 编译器 → `.class` → JVM执行
- **包管理**: 如果没有package声明，默认在默认包中
- **编码规范**: 类名使用大驼峰命名法（PascalCase）

### ❓ 常见问题
1. **Q**: 为什么main方法必须是public static void？
   **A**: public让JVM可以访问，static让方法无需实例化即可调用，void表示无返回值

2. **Q**: String是基本类型吗？
   **A**: 不是，String是Java提供的类，属于引用类型

---

## 📖 Day2: day2.java - 包装类型与数组操作

### 🎯 学习目标
- 理解包装类型与基本类型的区别
- 掌握String常量池机制
- 学会数组的基本操作

### 📝 核心知识点

#### 1. 包装类型比较
```java
Integer a = 200;
Integer b = 200;

System.out.println(a == b);        // false - 比较对象地址
System.out.println(a.equals(b));   // true - 比较对象内容

// 注意：-128到127之间的整数会缓存，所以==比较可能为true
Integer c = 100;
Integer d = 100;
System.out.println(c == d);        // true - 缓存机制
```

#### 2. String常量池机制
```java
String str1 = "zmh";      // 存放在字符串常量池
String str2 = "zmh";      // 复用常量池中的字符串
String str3 = new String("zmh");  // 在堆中创建新对象

System.out.println(str1 == str2);    // true - 同一地址
System.out.println(str1 == str3);    // false - 不同地址
System.out.println(str1.equals(str3)); // true - 内容相同
```

#### 3. 数组操作详解
```java
// 数组声明和初始化
int[] arr = new int[5];           // 创建长度为5的数组
int[] arr2 = {1, 2, 3, 4, 5};     // 直接初始化

// 数组遍历
for (int i = 0; i < arr.length; i++) {
    arr[i] = i * 2;
}

// 使用Arrays工具类
System.out.println(Arrays.toString(arr));  // 格式化输出数组
```

### 🔍 技术细节
- **包装类型**: 将基本类型包装成对象，方便在集合中使用
- **自动装箱/拆箱**: Java自动在基本类型和包装类型间转换
- **数组长度**: 数组创建后长度固定，不可改变

### ❓ 常见问题
1. **Q**: 什么时候使用==，什么时候使用equals？
   **A**: ==比较引用地址，equals比较内容。基本类型用==，对象用equals

2. **Q**: 数组和ArrayList有什么区别？
   **A**: 数组长度固定，ArrayList长度可变；数组可以存储基本类型，ArrayList只能存储对象

---

## 📖 Day3: day3.java - 面向对象编程基础

### 🎯 学习目标
- 理解接口的概念和用法
- 掌握多态性的实现
- 学会类的定义和toString方法

### 📝 核心知识点

#### 1. 接口定义与实现
```java
// 接口定义 - 只有方法声明，没有实现
interface Delivery {
    void deliver(String address);  // 抽象方法
}

// 类实现接口
class MeituanDelivery implements Delivery {
    @Override  // 注解，表示重写父类/接口方法
    public void deliver(String address) {
        System.out.println("骑手正在配送至: " + address);
    }
}
```

#### 2. 多态性（Polymorphism）
```java
Delivery delivery = new MeituanDelivery();  // 向上转型
Delivery delivery2 = new SellerDelivery();  // 同一接口，不同实现

delivery.deliver("北京市海淀区");  // 调用MeituanDelivery的实现
delivery2.deliver("河北邯郸");    // 调用SellerDelivery的实现
```

#### 3. 类定义规范
```java
class Food {
    // 字段（属性）
    String name;
    double price;
    
    // 构造方法（可选）
    public Food(String name, double price) {
        this.name = name;
        this.price = price;
    }
    
    // toString方法 - 对象字符串表示
    @Override
    public String toString() {
        return "Food{name='" + name + "', price=" + price + "}";
    }
}
```

### 🔍 技术细节
- **接口vs抽象类**: 接口只有方法声明，抽象类可以有方法实现
- **@Override注解**: 编译器检查是否正确重写，提高代码安全性
- **this关键字**: 指代当前对象实例

### ❓ 常见问题
1. **Q**: 接口和抽象类有什么区别？
   **A**: 接口只能有抽象方法，抽象类可以有具体方法；类可以实现多个接口，但只能继承一个类

2. **Q**: 为什么要重写toString方法？
   **A**: 默认的toString方法返回类名和哈希码，重写后可以返回更有意义的信息

---

## 📖 Day4: day4_exception_handling.java - 异常处理机制

### 🎯 学习目标
- 理解异常处理的基本概念
- 掌握try-catch-finally的使用
- 了解异常传播机制

### 📝 核心知识点

#### 1. 异常处理基本结构
```java
public static double divide(int a, int b) {
    return a / b;  // 可能抛出ArithmeticException
}

public static void main(String str[]) {
    try {
        // 可能抛出异常的代码
        double result = divide(10, 0);
        System.out.println(result);
    } catch (ArithmeticException e) {
        // 捕获特定异常
        System.out.println("除数不能为0");
    } finally {
        // 无论是否发生异常都会执行
        System.out.println("程序结束");
    }
}
```

#### 2. 异常类型层次结构
```
Throwable (可抛出)
├── Error (错误，通常不可恢复)
└── Exception (异常)
    ├── RuntimeException (运行时异常)
    │   └── ArithmeticException (算术异常)
    └── 其他检查异常
```

#### 3. 异常传播机制
```java
// 错误示例：异常在try-catch之外发生
double result = divide(10, 0);  // 这里抛出异常，程序终止
// 下面的try-catch不会被执行
try {
    // 这里的代码不会执行
} catch (Exception e) {
    // 这里的代码不会执行
}
```

### 🔍 技术细节
- **检查异常 vs 非检查异常**: 检查异常必须处理，非检查异常可选处理
- **异常链**: 可以通过异常构造函数传递原始异常
- **资源管理**: try-with-resources可以自动关闭资源

### ❓ 常见问题
1. **Q**: 什么时候用try-catch，什么时候用throws？
   **A**: 在当前方法中能处理就用try-catch，想让调用者处理就用throws

2. **Q**: finally块一定会执行吗？
   **A**: 除了System.exit()或JVM崩溃，finally块都会执行

---

## 📖 Day5: day5_stream.java - Stream API应用

### 🎯 学习目标
- 理解函数式编程思想
- 掌握Stream操作的三要素
- 学会方法引用和Lambda表达式

### 📝 核心知识点

#### 1. Stream操作三要素
```java
List<String> expensiveFood = productList.stream()
    .filter(p -> p.getPrice() > 50)      // 1. 筛选（中间操作）
    .map(Product::getName)               // 2. 转换（中间操作）
    .collect(Collectors.toList());       // 3. 收集（终止操作）
```

#### 2. 类定义规范
```java
class Product {
    String name;
    int price;
    String category;
    
    // 必须显式定义构造函数
    public Product(String name, int price, String category) {
        this.name = name;
        this.price = price;
        this.category = category;
    }
    
    // Getter方法（Stream操作通常需要）
    public String getName() { return name; }
    public int getPrice() { return price; }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "菜品{名='" + name + "', 价=" + price + ", 类='" + category + "'}";
    }
}
```

#### 3. 方法引用和Lambda表达式
```java
// 方法引用
productList.forEach(System.out::println);  // 等价于 x -> System.out.println(x)

// Lambda表达式
.filter(p -> p.getPrice() > 50)           // 参数 -> 表达式
.map(Product::getName)                    // 类::方法名
```

举个例子：

```java
public static void main(String[] args) {
        // 【建议】Java 变量名习惯用驼峰：productList
        List<Product> productList = new ArrayList<>();

        // 你的数据（为了演示 Stream，我加了不同种类的）
        productList.add(new Product("鱼香肉丝", 25, "热菜"));
        productList.add(new Product("红烧肉", 60, "热菜"));
        productList.add(new Product("拍黄瓜", 12, "凉菜"));
        productList.add(new Product("可乐", 5, "饮料"));
        productList.add(new Product("茅台", 3000, "饮料"));

        System.out.println("--- 原始列表 ---");
        productList.forEach(System.out::println);


        System.out.println("\n--- 任务A：找出所有 '热菜' ---");
        productList.stream()
                .filter(p -> "热菜".equals(p.getCategory())) // 筛选
                .forEach(System.out::println);

        System.out.println("\n--- 任务B：找出价格 > 50 的菜名 ---");
        List<String> expensiveFood = productList.stream()
                .filter(p -> p.getPrice() > 50)       // 1. 筛选
                .map(Product::getName)                // 2. 转换 (只取名字)
                .collect(Collectors.toList());        // 3. 收集成新 List 终端操作

        System.out.println(expensiveFood);
    }
```

### 🔍 技术细节

- **惰性求值**: 中间操作不会立即执行，只有终止操作才会触发计算
- **并行流**: 使用parallelStream()可以并行处理数据
- **不可变性**: Stream操作不会修改原始数据源

### ❓ 常见问题
1. **Q**: Stream和传统的for循环有什么区别？
   **A**: Stream更声明式，代码更简洁；for循环更命令式，控制更灵活

2. **Q**: 什么时候该用Stream？
   **A**: 数据处理、过滤、转换、聚合等场景适合用Stream

---

## 📖 Day6: day6.java - 综合项目实践（订单管理系统）

### 🎯 学习目标
- 掌握自定义异常的使用
- 理解Optional类的应用
- 学会用户交互和异常处理结合

### 📝 核心知识点

#### 1. 自定义异常
```java
class OrderNotFoundException extends Exception {
    public OrderNotFoundException(String message) {
        super(message);  // 调用父类构造函数
    }
}
```

#### 2. Optional类使用
```java
public Order getOrderById(String id) throws OrderNotFoundException {
    Optional<Order> result = memoryDb.stream()
        .filter(order -> order.getId().equals(id))
        .findFirst();
    
    // orElseThrow: 有值返回值，无值抛异常
    return result.orElseThrow(() -> new OrderNotFoundException("找不到订单"));
}
```

#### 3. Stream计算
```java
public double getTotalRevenue() {
    return memoryDb.stream()
        .mapToDouble(Order::getAmount)  // 转换为double流
        .sum();                         // 求和
}
```

#### 4. 用户交互与异常处理
```java
try {
    // 业务逻辑
    Order order = service.getOrderById(queryId);
    System.out.println("查询结果: " + order);
} catch (OrderNotFoundException e) {
    // 自定义异常处理
    System.err.println(e.getMessage());
} catch (Exception e) {
    // 通用异常处理
    System.err.println("系统发生了未知错误: " + e.getMessage());
    scanner.nextLine(); // 清空错误输入
}
```

### 🔍 技术细节
- **业务异常 vs 系统异常**: 业务异常需要用户处理，系统异常需要程序员处理
- **Optional最佳实践**: 避免使用get()方法，优先使用orElse()等安全方法
- **资源清理**: 使用try-with-resources确保资源正确释放

### ❓ 常见问题
1. **Q**: 为什么要自定义异常？
   **A**: 自定义异常可以更精确地描述业务错误，提高代码可读性

2. **Q**: Optional有什么好处？
   **A**: 避免空指针异常，明确表示可能为空的返回值

---

## 📖 Day7: day7_collection.java - 集合框架基础

### 🎯 学习目标
- 理解不同集合类型的特点
- 掌握List、Set、TreeSet的使用场景
- 学会集合的遍历操作

### 📝 核心知识点

#### 1. List集合（ArrayList）
```java
List<String> list = new ArrayList<>();
list.add("zmh");
list.add("wxj");
list.add("zmh");  // 允许重复元素

// 有序性：保持插入顺序
System.out.println("原始名单" + list);  // [zmh, wxj, zmh]
```

#### 2. Set集合（HashSet）
```java
Set<String> list_set = new HashSet<>();
list_set.add("zmh");
list_set.add("wxj");
list_set.add("zmh");  // 重复元素不会被添加

// 无序性：不保证顺序
System.out.println("去重名单" + list_set);  // [wxj, zmh] 或 [zmh, wxj]
```

#### 3. Sorted Set集合（TreeSet）
```java
TreeSet<String> list_treeset = new TreeSet<>();
list_treeset.add("zmh");
list_treeset.add("wxj");
list_treeset.add("abc");

// 有序性：自动排序（字典序）
System.out.println("排序名单" + list_treeset);  // [abc, wxj, zmh]
```

#### 4. 集合遍历
```java
// 增强for循环
for (String s : list) {
    System.out.println(s);
}

// 迭代器
Iterator<String> iterator = list.iterator();
while (iterator.hasNext()) {
    System.out.println(iterator.next());
}
```

### 🔍 技术细节
- **时间复杂度**: ArrayList查询O(1)，插入删除O(n)；HashSet操作平均O(1)
- **哈希冲突**: HashSet使用哈希表，可能发生冲突
- **比较器**: TreeSet可以自定义Comparator实现自定义排序

### ❓ 常见问题
1. **Q**: ArrayList和LinkedList有什么区别？
   **A**: ArrayList基于数组，查询快插入慢；LinkedList基于链表，插入快查询慢

2. **Q**: HashSet如何保证元素唯一性？
   **A**: 通过hashCode()和equals()方法判断元素是否相等

---

## 📖 Day8: day8_hashmap.java - HashMap应用

### 🎯 学习目标
- 掌握HashMap的基本操作
- 学会Map的遍历方式
- 理解词频统计的实现原理

### 📝 核心知识点

#### 1. HashMap基本操作
```java
Map<String, Integer> countMap = new HashMap<>();

// 统计单词出现次数
for (String word : words) {
    if (!countMap.containsKey(word)) {
        countMap.put(word, 1);           // 首次出现
    } else {
        Integer oldcount = countMap.get(word);
        countMap.put(word, oldcount + 1); // 计数加1
    }
}

// 使用getOrDefault简化代码
countMap.put(word, countMap.getOrDefault(word, 0) + 1);
```

#### 2. Map遍历方式
```java
// 1. 遍历EntrySet（推荐）
for (Map.Entry<String, Integer> entry : countMap.entrySet()) {
    System.out.println(entry.getKey() + " 出现了 " + entry.getValue() + " 次");
}

// 2. 遍历KeySet
for (String key : countMap.keySet()) {
    System.out.println(key + " 出现了 " + countMap.get(key) + " 次");
}

// 3. 遍历Values
for (Integer value : countMap.values()) {
    System.out.println("出现次数: " + value);
}
```

#### 3. 词频统计实现
```java
String[] words = {"apple", "banana", "apple", "orange", "banana", "apple"};
Map<String, Integer> wordCount = new HashMap<>();

for (String word : words) {
    wordCount.merge(word, 1, Integer::sum);  // Java 8+ 简洁写法
}
```

### 🔍 技术细节
- **哈希函数**: HashMap使用hashCode()决定存储位置
- **负载因子**: 默认0.75，当元素数量达到容量*负载因子时扩容
- **线程安全**: HashMap非线程安全，ConcurrentHashMap线程安全

### ❓ 常见问题
1. **Q**: HashMap和Hashtable有什么区别？
   **A**: HashMap允许null键值，非线程安全；Hashtable不允许null，线程安全

2. **Q**: 为什么遍历EntrySet比KeySet效率高？
   **A**: EntrySet直接获取键值对，KeySet需要额外调用get()方法
