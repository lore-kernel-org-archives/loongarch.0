Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762442;
	b=m4RcqwZfCn3odco/2y2SZHI8w7FIB9Gj/s9oKmcOUEyNdiaeP+u/JuEb4hbUIieNZdQr
	 dxEuIwQKZog3PmCYQfsF2FMXGHfBJnkE7Yb7y7TrKfNnGX9rqmEnKRKxlfEKmyCRAgJs/
	 54BPcKTTJdIUQDFUGa+1jdf2y5q5JtIGJ11qBlDmfxljMK8JigfE+bYHsSI7Q/3aw9NkF
	 GhI4rMkC+602x/b1AYECQnKWm5fhvnTesJhnPAPINKNZkfzZD3xT/hsCR5jp2tHO5H0zi
	 OlNmzJXIqetFdG+8xSntb794huTAmdZ8jlbZhjTc/B2Aep3IV2BG5/J3SvUe4xmLT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762442;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=ap6iM49OwOfcQZaqrzOGzUzSj0YA0fwnTvoOD/IbYGc=;
	b=WSuHei0YAUm8mGr+RJ6UhH7vAy814UNYQR/l5xLyqzs5kzZVjspW2HKuOzDfHzJgSZUm
	 Kx1y8W9LCBSjhZsp6t8HxZiSf+7BjfATU1KFopsJq13LTSxoVeebraSTNIRIObpdgO//x
	 Cm9PCzsmjc3KNWr3fC5cH+YZBoFkX05QS5l+KKfOff5MeW2WkZ41pU2+b7Fe0oEBtRA2z
	 /QqTLk+wagtZcTR6XSg7LCXI4aXqkm34NnQcdfRR4j7gr0mtGLejkTbFWikewd0mOGY8y
	 62zgy8w0TopNdePYGl34+WcgA/DVDB1/Bu55YnBuq417Zd5/WpfPsGS8Vv8yz74vqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54DC606A324
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 06:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54DC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxytEIKQlrrHojAA--.34516S3;
	Fri, 27 Nov 2026 14:54:00 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJAxFs3_KAlrXbc3AA--.52846S4;
	Fri, 27 Nov 2026 14:53:59 +0800 (CST)
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
Subject: [PATCH v2 2/2] serial: 8250_loongson: Add Loongson-2K3000 UART support
Date: Fri, 27 Nov 2026 14:53:43 +0800
Message-ID: <c97ce251b5fdb58f461bb36f9270cf01969d5a54.1795761142.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1795761142.git.zhoubinbin@loongson.cn>
References: <cover.1795761142.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxFs3_KAlrXbc3AA--.52846S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEECGsI5P0GFQAAsl
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4kZrWDJFWUtrWxXry8CrX_yoW8WF18pF
	sxC3yq9ry0gF17CFs5AFyUAFWF9rZ8GF9rKFsrG348KF98J3yUWr1rKF1jvr42ka4rXryI
	vFyvkrWUGayUWrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

The Loongson-2K3000 UART differs from earlier Loongson UARTs in that it
does not require MCR/MSR signal inversion. It also supports a fractional
baud rate divisor.

Add the corresponding OF match entry for `loongson,ls2k3000-uart` so the
driver can probe with the new driver data.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
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

