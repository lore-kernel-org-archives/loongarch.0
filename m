Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604D2171D9
	for <loongarch@lists.linux.dev>; Tue, 11 Jul 2023 07:32:05 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxpPBzBa1kuWsDAA--.9855S3;
	Tue, 11 Jul 2023 15:32:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c5wBa1k_1QoAA--.48833S3;
	Tue, 11 Jul 2023 15:32:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 1/2] Documentation/features: Check ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Date: Tue, 11 Jul 2023 15:31:59 +0800
Message-Id: <1689060720-4628-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1689060720-4628-1-git-send-email-yangtiezhu@loongson.cn>
References: <1689060720-4628-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Cx_c5wBa1k_1QoAA--.48833S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw4kWr1kCFyrKr43Jw4fJFc_yoWDKFXEqa
	y3GFnxWw1kArs29wnrta15CryUJ3y8ur1kW34UZr45ZanFvanxGF9Fy39ru3W5Z3yDur1r
	ZwsIqryxCr9rXosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwMKuUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT selects ARCH_HAS_ELF_RANDOMIZE,
so add ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT as another Kconfig check
for ELF-ASLR feature, then the refresh script can be used to handle
this case for all archs.

Co-developed-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/features/vm/ELF-ASLR/arch-support.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
index 15164f3..8d6ded2 100644
--- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
+++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
@@ -1,6 +1,7 @@
 #
 # Feature name:          ELF-ASLR
 #         Kconfig:       ARCH_HAS_ELF_RANDOMIZE
+#         Kconfig:       ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 #         description:   arch randomizes the stack, heap and binary images of ELF binaries
 #
     -----------------------
-- 
2.1.0

