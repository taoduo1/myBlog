package com.example.myblog.test.activemq;

import org.apache.activemq.ActiveMQConnectionFactory;
import javax.jms.*;
import java.io.IOException;

public class Consumer {


    //ptp 点对点形式
    public static void receive() throws JMSException {
        //1.创建connectionfacoty
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://47.105.249.25:61616");
        //2.创建connnect,并启动connnect
        Connection connection = connectionFactory.createConnection();
        connection.start();
        //3.创建session,第一个参数是是否使用事务，第二个参数是确认机制
        Session session = connection.createSession(Boolean.TRUE,Session.AUTO_ACKNOWLEDGE);
        //4.创建目的地【消费者与生产者的目的地相同才能进行消息传递】
        Destination destination = session.createQueue("tempQueue");
        //5.创建消费者，第一个参数是目的地，此时创建的消费者要与目的地进行绑定。
        MessageConsumer consumer = session.createConsumer(destination);
        //6.使用消费者接受消息消息
        TextMessage message = (TextMessage) consumer.receive();
        System.out.println(message.getText());
        //8.提交事务
        session.commit();
        //9.关闭资源
        session.close();
        connection.close();
    }

    public static void topicConsumer() throws JMSException, IOException {
        // 第一步：创建一个ConnectionFactory对象。
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://47.105.249.25:61616");
        // 第二步：从ConnectionFactory对象中获得一个Connection对象。
        Connection connection = connectionFactory.createConnection();
        // 第三步：开启连接。调用Connection对象的start方法。
        connection.start();
        // 第四步：使用Connection对象创建一个Session对象。
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        // 第五步：使用Session对象创建一个Destination对象。和发送端保持一致topic，并且话题的名称一致。
        Topic topic = session.createTopic("tempTopic");
        // 第六步：使用Session对象创建一个Consumer对象。
        MessageConsumer consumer = session.createConsumer(topic);
        // 第七步：接收消息。
        consumer.setMessageListener(new MessageListener() {

            @Override
            public void onMessage(Message message) {
                try {
                    TextMessage textMessage = (TextMessage) message;
                    String text = null;
                    // 取消息的内容
                    text = textMessage.getText();
                    // 第八步：打印消息。
                    System.out.println(text);
                } catch (JMSException e) {
                    e.printStackTrace();
                }
            }
        });
        System.out.println("topic的消费端03。。。。。");
        // 等待键盘输入
        System.in.read();
        // 第九步：关闭资源
        consumer.close();
        session.close();
        connection.close();
    }

    public static void main(String[] args) throws IOException, JMSException {
        receive();
    }
}
