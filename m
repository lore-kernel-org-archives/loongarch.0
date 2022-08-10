Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35E35CA3
	for <loongarch@lists.linux.dev>; Wed, 10 Aug 2022 06:03:46 +0000 (UTC)
Received: from linux.localdomain (unknown [113.200.148.30])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxsM8_SvNiggAMAA--.34722S2;
	Wed, 10 Aug 2022 14:03:44 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] LoongArch: Add I14 description in documentation
Date: Wed, 10 Aug 2022 14:03:43 +0800
Message-Id: <1660111423-24633-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9BxsM8_SvNiggAMAA--.34722S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYL7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
	6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY
	62kv0487M2AExVAIFx02aVAFz4v204v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4kE6I8I3I0E14AKx2xKxVC2ax8xMxkIecxEwVAFwVW8AwCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r1j6r18MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0nL05UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/

I14 is also immediate operand, like I8/I12/I16/I21/I26.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: Modify the Chinese documentation.

 Documentation/loongarch/introduction.rst                    | 2 +-
 Documentation/translations/zh_CN/loongarch/introduction.rst | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
index 216b3f3..6c9160c 100644
--- a/Documentation/loongarch/introduction.rst
+++ b/Documentation/loongarch/introduction.rst
@@ -221,7 +221,7 @@ I26         Opcode + I26L + I26H
 =========== ==========================
 
 Rd is the destination register operand, while Rj, Rk and Ra ("a" stands for
-"additional") are the source register operands. I8/I12/I16/I21/I26 are
+"additional") are the source register operands. I8/I12/I14/I16/I21/I26 are
 immediate operands of respective width. The longer I21 and I26 are stored
 in separate higher and lower parts in the instruction word, denoted by the "L"
 and "H" suffixes.
diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
index 11686ee..128878f 100644
--- a/Documentation/translations/zh_CN/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
@@ -190,8 +190,8 @@ I26         Opcode + I26L + I26H
 =========== ==========================
 
 Opcode是指令操作码，Rj和Rk是源操作数（寄存器），Rd是目标操作数（寄存器），Ra是
-4R-type格式特有的附加操作数（寄存器）。I8/I12/I16/I21/I26分别是8位/12位/16位/
-21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
+4R-type格式特有的附加操作数（寄存器）。I8/I12/I14/I16/I21/I26分别是8位/12位/14位/
+16位/21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
 部分，所以你们在这里的格式描述中能够看到I21L/I21H和I26L/I26H这样带后缀的表述。
 
 指令列表
-- 
2.1.0

