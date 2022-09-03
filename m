Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85845187E
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 09:36:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.237])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXWsgIBNjfGgQAA--.8093S2;
	Sat, 03 Sep 2022 17:36:32 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Alessandro Zummo <a.zummo@towertech.it>,
	linux-rtc@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Qing Zhang <zhangqing@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH 6/7] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Date: Sat,  3 Sep 2022 17:35:56 +0800
Message-Id: <255ac36eed438ca8839a6fb2f4e1a5e8922a4bba.1662190009.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662190009.git.zhoubinbin@loongson.cn>
References: <cover.1662190009.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXWsgIBNjfGgQAA--.8093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4rGw15GFy5Ww4DCryUWrg_yoW8Gw1kpF
	nI9a17Kr4fur1xZwn8GryUGry7ZF95ArsFgF47G3srW3sIq3Wqvr1fAFsYqr4UZFyfJay0
	9r92grWxCFy3CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbgyCJUUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/

From: WANG Xuerui <git@xen0n.name>

The Loongson-2K RTC module is now supported, enable it.

The MMIO address is unclear from the Loongson 2K1000 user manual, I took
it from Loongson's out-of-tree fork of Linux 4.19.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: zhaoxiao <zhaoxiao@uniontech.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 8143a61111e3..811a5ab753a2 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -57,6 +57,11 @@ pm: reset-controller@1fe07000 {
 			reg = <0 0x1fe07000 0 0x422>;
 		};
 
+		rtc0: rtc@1fe07800 {
+			compatible = "loongson,ls2x-rtc";
+			reg = <0 0x1fe07800 0 0x78>;
+		};
+
 		liointc0: interrupt-controller@1fe11400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0 0x1fe11400 0 0x40>,
-- 
2.31.1

