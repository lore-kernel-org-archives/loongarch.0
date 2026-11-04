Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778388;
	b=GBWOOVbQ44YJxG01k/wVXRiH/JATo7MbLCCg9kg1D+MTizSRl9Zi+lVhISdBrBXzMEn3
	 AMj0zEeSFOqz2MqNX6OzlrmRWCwrF8SGg3fqYVArjLQv7qFElBoQ3AdHISnDJHONtLYTu
	 zFWVd9aFCukup6OvkbtdOmcIhADa6reK6T0VI03csau5SJOHSTatXx9CwT1AK32YkkEce
	 pPrih2FauOGJUKqT9inFAb08alDTTqO9viMlQOg8iza+7MCv9xBvv9O0ozPOq3wP3HHxO
	 iss9vL2Sg3XZsGBZmgRs+9Tiu5BPAvS3m+oyHXECWH+WkXRk1tmUkZT4zbC8SlNIBOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778388;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=4pIbHn3JO62FcrsS+gZGn0AqvwVBomE3MFPQ8sYkUfw=;
	b=HY05t9b6lY1FHPCnQ/rakyrbIjHs14b4AZjbqQs9SBb5PZlTB+t1JbCeBGe9eM0hDVyz
	 8iofql9FaIigog49fMaVvcDNwzUUvfHIp4PRcTIkRVbUhNcQk8BrTFZ1zSkgU+Pp9m/PV
	 JncKFEXjdSq20lveEOKAPSYQn7DwQJlHEzXLdJAUjuRwsOsKHl2MstkduP/B1cdJLYWdj
	 9/NdoSF2kisiEOmhCzWi7xJyR5gyACJugo14PJ9b4XVZFR3z4TCZeJbrdLuMZ1WIaArG2
	 z3SipWTx4qCRKBvNk7U0xyI18lIDueJyZF8g/oGvT6hRbdXkWvzkYBvx2nNKpsj27LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D1C606A326
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Bx69HK4upq8DocAA--.15962S3;
	Wed, 04 Nov 2026 15:46:18 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxBc294upqZ0YyAA--.10037S5;
	Wed, 04 Nov 2026 15:46:18 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/3] serial: 8250_loongson: Add Loongson-2K3000 UART support
Date: Wed,  4 Nov 2026 15:45:47 +0800
Message-ID: <de8a92980b5140896ef8bdade1df4d851da9ec0f.1793776192.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1793776192.git.zhoubinbin@loongson.cn>
References: <cover.1793776192.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc294upqZ0YyAA--.10037S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEBCGrqon0C0AAAsH
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4kJF47tF4fWry3WFyfuFX_yoW8Xw4xpF
	nxC3yq9ryjgF17CFn5AFyUAFWF9rWDGF9rKFsrG348KF98J3yUWr1rKF1jvr42ka4rXryI
	vFy0krWUGa4UWrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

The Loongson-2K3000 UART differs from earlier Loongson UARTs in that it
does not require MCR/MSR signal inversion. It also supports a fractional
baud rate divisor.

Add the corresponding OF match entry for `loongson,ls2k3000-uart` so the
driver can probe with the new driver data.

Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/tty/serial/8250/8250_loongson.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_loongson.c b/drivers/tty/serial/8250/8250_loongson.c
index 6d06ed28382d..0458a9f82d86 100644
--- a/drivers/tty/serial/8250/8250_loongson.c
+++ b/drivers/tty/serial/8250/8250_loongson.c
@@ -43,6 +43,12 @@ static const struct loongson_uart_ddata ls2k1500_uart_data = {
 	.msr_invert = 0,
 };
 
+static const struct loongson_uart_ddata ls2k3000_uart_data = {
+	.has_frac = true,
+	.mcr_invert = 0,
+	.msr_invert = 0,
+};
+
 struct loongson_uart_priv {
 	struct uart_8250_port *uport;
 	struct clk *clk;
@@ -216,6 +222,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(loongson_uart_pm_ops, loongson_uart_suspend,
 static const struct of_device_id loongson_uart_of_ids[] = {
 	{ .compatible = "loongson,ls2k0500-uart", .data = &ls2k0500_uart_data },
 	{ .compatible = "loongson,ls2k1500-uart", .data = &ls2k1500_uart_data },
+	{ .compatible = "loongson,ls2k3000-uart", .data = &ls2k3000_uart_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, loongson_uart_of_ids);
-- 
2.52.0

