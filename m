Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0D82F25
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 10:55:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb062Xaxi1GBIAA--.27263S4;
	Fri, 17 Jun 2022 18:55:54 +0800 (CST)
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
Subject: [PATCH v3 2/2] docs/zh_CN/LoongArch: Fix notes rendering by using reST directives
Date: Fri, 17 Jun 2022 18:57:28 +0800
Message-Id: <8d19ae5a324c7dc6210535348cea557c8832815f.1655463225.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655463225.git.siyanteng@loongson.cn>
References: <cover.1655463225.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9Dxb062Xaxi1GBIAA--.27263S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw48XF4xXFW8Ar1xJw48tFb_yoWruF1fpa
	s2kr93KF1DA347Jr4kCF1UCa1xGF1xuanFkFWrK3WkJrnrZrn5Kr18tF9rXFW3GrySyFZY
	vr4rKw4kZr1YkwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUjE_MDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

"Note" is an admonition, but it doesn't render
correctly, let's fix it by using reST directives.

Fixes: f23b22599f8e ("Documentation/zh_CN: Add basic LoongArch documentations")
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/loongarch/introduction.rst  | 14 ++++++++------
 .../zh_CN/loongarch/irq-chip-model.rst             | 14 ++++++++------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
index e31a1a928c48..11686ee0caeb 100644
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
+    注意： ``$r21`` 寄存器在ELF psABI中保留未使用，但是在Linux内核用于保
+    存每CPU变量基地址。该寄存器没有ABI命名，不过在内核中称为 ``$u0`` 。在
+    一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0`` 和
+    ``$a1`` 的别名，属于已经废弃的用法。
 
 浮点寄存器
 ----------
@@ -68,8 +69,9 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
 ``$f24``-``$f31`` ``$fs0``-``$fs7``  静态寄存器          是
 ================= ================== =================== ==========
 
-注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是 ``$a0``
-和 ``$a1`` 的别名，属于已经废弃的用法。
+.. note::
+    注意：在一些遗留代码中有时可能见到 ``$v0`` 和 ``$v1`` ，它们是
+    ``$a0`` 和 ``$a1`` 的别名，属于已经废弃的用法。
 
 
 向量寄存器
diff --git a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
index 2a4c3ad38be4..fb5d23b49ed5 100644
--- a/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
@@ -147,9 +147,11 @@ PCH-LPC::
 
   https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (英文版)
 
-注：CPUINTC即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其中断
-控制逻辑；LIOINTC即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；EIOINTC
-即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；HTVECINTC即《龙芯3A5000
-处理器使用手册》第14.3节所描述的“HyperTransport中断”；PCH-PIC/PCH-MSI即《龙芯7A1000桥
-片用户手册》第5章所描述的“中断控制器”；PCH-LPC即《龙芯7A1000桥片用户手册》第24.3节所
-描述的“LPC中断”。
+.. note::
+    - CPUINTC：即《龙芯架构参考手册卷一》第7.4节所描述的CSR.ECFG/CSR.ESTAT寄存器及其
+      中断控制逻辑；
+    - LIOINTC：即《龙芯3A5000处理器使用手册》第11.1节所描述的“传统I/O中断”；
+    - EIOINTC：即《龙芯3A5000处理器使用手册》第11.2节所描述的“扩展I/O中断”；
+    - HTVECINTC：即《龙芯3A5000处理器使用手册》第14.3节所描述的“HyperTransport中断”；
+    - PCH-PIC/PCH-MSI：即《龙芯7A1000桥片用户手册》第5章所描述的“中断控制器”；
+    - PCH-LPC：即《龙芯7A1000桥片用户手册》第24.3节所描述的“LPC中断”。
-- 
2.27.0

