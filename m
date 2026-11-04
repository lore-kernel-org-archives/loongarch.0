Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778372;
	b=yRdoHW9WZEUdXnjUP5vUwOsyEPC+d/m29ABhmvWBd+i2Y+6vMa50LWlEejf84Y/yP2M7
	 Y2ycT1LzJEBfRiVgZyX8bkwk2xBDydiA0ATNEt7i6slx5IZOuqYpgZ1SWAtrpJEwFKPwf
	 qVNqCy1zX9s36ONNuFuMZiD/cHBlnuR9WePAup6145Tit5vPnqJMgmGmchH+F2jZ0oiYb
	 aelRayQefHpmqrF2/bTqOk9yQIxBuAtMq8+whH2LnNw+5h6l9nRU8EdaHS/P2Ag4lbCev
	 aF8OKNfeVLL6S/0dt4dVF2xLTdysYMkLzbBY0/elu27Q64Nf45XKSyU2we7JWluLm0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778372;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=BKtEwN9SjzU3vDDD4SW+5UbctESaNHA3sfD45hV8J9c=;
	b=ZqgEbYDlR5eSsUTRPpe+tHS58vO2FznrVPNMAEQ4lz4eHzCsNiwSRHQaGyiM2JixpGKH
	 AydMMUGFKT/nE3HpbNCg5i2iOLZ42zjj0OctyATmY9zrt1pzW9xvIdkQEimMjB3uIASg7
	 sRhNeRc/Kp6RTBv+otET+95Aa0NW0Kq80NZroQkT3XOPOK6OqIhHVl/D4s0mUB5G8nD+g
	 EQPL5IB2wjUOrd2uiKHh863pxnRc2mzTOpW4uAZjJnjzMTRPHW70BA6ihCgdNur+T/S9H
	 NihaZ1plz3huTarAGXCTGE/NqqvvAMga2uIQqtRUP7iBzfe9fAWERH103XJcgYmLkcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FD0606A329
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FD0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8Bx69G_4upq2DocAA--.15959S3;
	Wed, 04 Nov 2026 15:46:07 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJDxBc294upqZ0YyAA--.10037S2;
	Wed, 04 Nov 2026 15:46:06 +0800 (CST)
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
Subject: [PATCH 0/3] serial: 8250: Add Loongson-2K0300 and Loongson-2K3000 UART support
Date: Wed,  4 Nov 2026 15:45:44 +0800
Message-ID: <cover.1793776192.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
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
X-CM-TRANSID:qMiowJDxBc294upqZ0YyAA--.10037S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEBCGrqknoEBAAAsh
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1xGw4kAw1xGr47AF4UKFX_yoWDXFgE9w
	1SvF18W345CFnFq3yaqrW3Cr4fWFWqkF1qkw1kt3yS9342kryDuryqkryDC3W3XrWDuFn8
	ZrWkGry09w1fGosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU24SoDUUUU

Hi all:

This series adds UART support for two Loongson SoCs.

The Loongson-2K0300 UART is the same as the one found on the
Loongson-2K1500, so it is documented as falling back to
"loongson,ls2k1500-uart" and then "ns16550a". No driver changes are
needed.

The Loongson-2K3000 UART differs from earlier Loongson UARTs in that it
does not require MCR/MSR signal inversion. It also supports a fractional
baud rate divisor. A dedicated compatible and driver data are added so
the driver can distinguish it.

Thanks.
Binbin

Binbin Zhou (3):
  dt-bindings: serial: 8250: Document Loongson-2K0300 UART compatible
  dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART
    compatible
  serial: 8250_loongson: Add Loongson-2K3000 UART support

 Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
 drivers/tty/serial/8250/8250_loongson.c            | 7 +++++++
 2 files changed, 11 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

