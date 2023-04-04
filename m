Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17F71845
	for <loongarch@lists.linux.dev>; Tue,  4 Apr 2023 08:42:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxJ_Da4itkTV0WAA--.34489S3;
	Tue, 04 Apr 2023 16:42:02 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxwOTW4itkYRYVAA--.55009S4;
	Tue, 04 Apr 2023 16:42:02 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/6] LoongArch: Fix _CONST64_(x) as unsigned
Date: Tue,  4 Apr 2023 16:41:44 +0800
Message-Id: <20230404084148.744-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230404084148.744-1-zhangqing@loongson.cn>
References: <20230404084148.744-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxwOTW4itkYRYVAA--.55009S4
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF4ktr4UAr4fXr4UJF4xZwb_yoW3WFX_Aa
	97Ja1kur48AFW7Aws0y34rJw1Uu3ykJFn8uFnIqr9xAwn0kw45Jay8Wa4rZryakF4a9rs5
	XFWvqr9Iy34UtjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	C7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
	kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5
	JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jr6p9UUUUU=

Addresses should all be of unsigned type to avoid unnecessary conversions.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/include/asm/addrspace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include/asm/addrspace.h
index 8fb699b4d40a..5c9c03bdf915 100644
--- a/arch/loongarch/include/asm/addrspace.h
+++ b/arch/loongarch/include/asm/addrspace.h
@@ -71,9 +71,9 @@ extern unsigned long vm_map_base;
 #define _ATYPE32_	int
 #define _ATYPE64_	__s64
 #ifdef CONFIG_64BIT
-#define _CONST64_(x)	x ## L
+#define _CONST64_(x)	x ## UL
 #else
-#define _CONST64_(x)	x ## LL
+#define _CONST64_(x)	x ## ULL
 #endif
 #endif
 
-- 
2.20.1

