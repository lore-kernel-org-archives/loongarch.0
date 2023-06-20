Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B77453BD
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 07:49:58 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxAOklWpFkNBsHAA--.12853S3;
	Tue, 20 Jun 2023 15:49:57 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxG8oiWpFkN2chAA--.19346S4;
	Tue, 20 Jun 2023 15:49:57 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	madvenka@linux.microsoft.com
Cc: chenzhongjin@huawei.com,
	WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	tangyouling00@gmail.com,
	youling.tang@outlook.com
Subject: [RFC PATCH v1 07/23] objtool: Introduce STATIC_CHECK
Date: Tue, 20 Jun 2023 15:49:48 +0800
Message-Id: <1687247390-31979-3-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1687247390-31979-1-git-send-email-tangyouling@loongson.cn>
References: <1687247390-31979-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID:AQAAf8CxG8oiWpFkN2chAA--.19346S4
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1kuw4rArykXw1fJr4xAFc_yoW8XFW5pw
	4xC3yxuFZ7XrWIyw18JrWUWayDWr1Igw4jg3Z5W348JrWxXr10qF4akrW8JFs2gw4rW3y7
	G3yagryUJr40vabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx_HUUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>

Objtool currently implements static stack validation. Another method called
dynamic validation can be supported for other architectures.

Define STATIC_CHECK to select the files required for static validation
in objtool build.

Signed-off-by: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
---
 tools/objtool/Build    | 6 +++---
 tools/objtool/Makefile | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/Build b/tools/objtool/Build
index 4e9ec210f134..0eec935b52c9 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -2,13 +2,13 @@ objtool-y += arch/$(SRCARCH)/
 
 objtool-y += weak.o
 
-objtool-y += check.o
-objtool-y += special.o
+objtool-$(STATIC_CHECK) += check.o
+objtool-$(STATIC_CHECK) += special.o
 objtool-y += builtin-check.o
 objtool-y += cfi.o
 objtool-y += insn.o
 objtool-y += decode.o
-objtool-y += unwind_hints.o
+objtool-$(STATIC_CHECK) += unwind_hints.o
 objtool-y += elf.o
 objtool-y += objtool.o
 
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 83b100c1e7f6..2262b49691b8 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -55,9 +55,10 @@ BUILD_ORC := n
 
 ifeq ($(SRCARCH),x86)
 	BUILD_ORC := y
+	STATIC_CHECK := y
 endif
 
-export BUILD_ORC
+export BUILD_ORC STATIC_CHECK
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
 
-- 
2.39.2

