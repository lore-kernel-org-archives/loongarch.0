Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3931D7F
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 07:17:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX92JKqxirf5HAA--.12068S4;
	Fri, 17 Jun 2022 15:17:35 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	alexs@kernel.org,
	bobwxc@email.cn,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	corbet@lwn.net,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	linux-doc@vger.kernel.org,
	siyanteng01@gmail.com,
	loongarch@lists.linux.dev
Subject: [PATCH 2/2] docs/zh_CN: rewrite all the notes
Date: Fri, 17 Jun 2022 15:19:07 +0800
Message-Id: <151c8e9725b51d8629335a828ab0115705e7696c.1655450200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655450200.git.siyanteng@loongson.cn>
References: <cover.1655450200.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxX92JKqxirf5HAA--.12068S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1kAF1xCF1kuFWxKF1rZwb_yoWrZw1kpa
	s2kr93KF1DA347Jr4kCF1UGa1xGF1xC3W7CFWrK3WkJr17AwnYyr18tF9rXFW3GryayFZY
	vr4rKrs5Zr1Ykw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUb3fQtUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/loongarch/introduction.rst | 14 ++++++++------
 .../zh_CN/loongarch/irq-chip-model.rst            | 15 +++++++++------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
index e31a1a928c48..a8a5aaca7d94 100644
--- a/Documentation/translations/zh_CN/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
@@ -46,10 +46,11 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
 ``$r23``-``$r31`` ``$s0``-``$s8`` 静态寄存器          是
 ================= =============== =================== ==========
 
-注意：``$r21``寄存器在ELF psABI中保留未使用，但是在Linux内核用于保存每CPU
-变量基地址。该寄存器没有ABI命名，不过在内核中称为``$u0``。在一些遗留代码
-中有时可能见到``$v0``和``$v1``，它们是``$a0``和``$a1``的别名，属于已经废弃
-的用法。
+.. note::
+    注意： ``$r21``寄存器在ELF psABI中保留未使用，但是在Linux内核用于保
+    存每CPU变量基地址。该寄存器没有ABI命名，不过在内核中称为``$u0``。在一
+    些遗留代码中有时可能见到``$v0``和``$v1``，它们是``$a0``和``$a1``的
+    别名，属于已经废弃的用法。
 
 浮点寄存器
 ----------
@@ -68,8 +69,9 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
 ``$f24``-``$f31`` ``$fs0``-``$fs7``  静态寄存器          是
 ================= ================== =================== ==========
 
-注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0``
-和 ``$a1`` 的别名，属于已经废弃的用法。
+.. note::
+    注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是
+    ``$a0``和 ``$a1`` 的别名，属于已经废弃的用法。
 
 
 向量寄存器
diff --git a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
index 2a4c3ad38be4..49b7bdb59a4a 100644
--- a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
@@ -147,9 +147,12 @@ PCH-LPC::
 
   https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (英文版)
 
-注：CPUINTC即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其中断
-控制逻辑；LIOINTC即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；EIOINTC
-即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；HTVECINTC即《龙芯3A5000
-处理器使用手册》第14.3节所描述的“HyperTransport中断”；PCH-PIC/PCH-MSI即《龙芯7A1000桥
-片用户手册》第5章所描述的“中断控制器”；PCH-LPC即《龙芯7A1000桥片用户手册》第24.3节所
-描述的“LPC中断”。
+.. note::
+   注：
+    - CPUINTC：即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其
+      中断控制逻辑；
+    - LIOINTC：即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；
+    - EIOINTC：即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；
+    - HTVECINTC：即《龙芯3A5000处理器使用手册》第14.3节所描述的“HyperTransport中断”；
+    - PCH-PIC/PCH-MSI：即《龙芯7A1000桥片用户手册》第5章所描述的“中断控制器”；
+    - PCH-LPC：即《龙芯7A1000桥片用户手册》第24.3节所描述的“LPC中断”。
-- 
2.27.0

