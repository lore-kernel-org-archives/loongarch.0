Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7903C18C07;
	Wed, 15 Nov 2023 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.22.233.25])
	by gateway (Coremail) with SMTP id _____8AxlPDtxVRlxUY6AA--.49344S3;
	Wed, 15 Nov 2023 21:21:50 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.233.25])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axzy_pxVRlXQNDAA--.16352S2;
	Wed, 15 Nov 2023 21:21:48 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: Explicitly set -fdirect-access-external-data for vmlinux
Date: Wed, 15 Nov 2023 21:21:37 +0800
Message-ID: <20231115132137.178523-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axzy_pxVRlXQNDAA--.16352S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7JrWUtr47Ww47Zr4rGryrZrc_yoW8Jrykpa
	97ur48Gws5ArWIqF9FqFWfXw4qyr4DJr4fZa47Krn8ZFyDZryfZw45Ar4qg3W2y34kAryx
	Wa1xGFy2qFW5JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU

After this llvm commit [1], The -fno-pic does not imply direct access
external data. Explicitly set -fdirect-access-external-data for vmlinux
that can avoids GOT entries.

Link: https://github.com/llvm/llvm-project/commit/47eeee297775347cbdb7624d6a766c2a3eec4a59
Suggested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index c31a62521e6b..1f0d74403419 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -68,6 +68,7 @@ LDFLAGS_vmlinux			+= -static -n -nostdlib
 ifdef CONFIG_AS_HAS_EXPLICIT_RELOCS
 cflags-y			+= $(call cc-option,-mexplicit-relocs)
 KBUILD_CFLAGS_KERNEL		+= $(call cc-option,-mdirect-extern-access)
+KBUILD_CFLAGS_KERNEL		+= $(call cc-option,-fdirect-access-external-data)
 KBUILD_AFLAGS_MODULE		+= $(call cc-option,-fno-direct-access-external-data)
 KBUILD_CFLAGS_MODULE		+= $(call cc-option,-fno-direct-access-external-data)
 KBUILD_AFLAGS_MODULE		+= $(call cc-option,-mno-relax) $(call cc-option,-Wa$(comma)-mno-relax)
-- 
2.42.1

