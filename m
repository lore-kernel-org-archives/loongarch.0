Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05CA4C3D0
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536772; cv=none; b=BZ4XfR22BFoYokLAuybEl/RJ4ax6PBFmkiM1AIsmaHjEPBn4kdAWCM5oYDSSHoGE2tQofcULg7wOtRpk7Yi7FnpX17Ooen4zrHmQae6iVKWl5kEq4rzmYGUKq9+VkhvNf7bpcC7SKNKJUyDgsU5RLojlk/E7jvBjxW0IHsZbKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536772; c=relaxed/simple;
	bh=ZtOhJE1cTY/xHXj1EAXPWLuV43L7x8hjDPN8Z46WR28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETRXn8uCCarSAyylI3m0GNmCBYPfmYxAYmxfWcgII4EDJJ8Oit9snCp6UX+2h8xgJn5Q4ClUiK+Y32AUJo/2mRTqJcSLY5ECTN+b8b2G2jZ2HKqlW6ErncDxQzVnUFPx978gCRT4bH3eR/ptsv6v/C1gd9CSa9UauBy/otex/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxyuAArFNnOq1SAA--.28670S3;
	Sat, 07 Dec 2024 09:59:28 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S11;
	Sat, 07 Dec 2024 09:59:28 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/10] LoongArch: Convert unreachable() to BUG()
Date: Sat,  7 Dec 2024 09:59:14 +0800
Message-ID: <20241207015915.1159-10-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241207015915.1159-1-yangtiezhu@loongson.cn>
References: <20241207015915.1159-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S11
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr4rZFW3JF13tryfWryrKrX_yoWkCwcEyr
	yxJw1UGrWrZFZrAw1Utr4rWryFq3WrKFWY9wn7Zay5A3W5t348t3y5tas8Ar1ktFWkGrZ5
	t39YvFZYkw1xKosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jT-e5UUUUU=

When compiling on LoongArch, there exists the following objtool
warning in arch/loongarch/kernel/machine_kexec.o:

  kexec_reboot() falls through to next function crash_shutdown_secondary()

Avoid unreachable() as it can (and will in the absence of UBSAN)
generate fallthrough code. Use BUG() so we get a "break	BRK_BUG"
trap (with unreachable annotation).

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 8ae641dc53bb..f9381800e291 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -126,14 +126,14 @@ void kexec_reboot(void)
 	/* All secondary cpus go to kexec_smp_wait */
 	if (smp_processor_id() > 0) {
 		relocated_kexec_smp_wait(NULL);
-		unreachable();
+		BUG();
 	}
 #endif
 
 	do_kexec = (void *)reboot_code_buffer;
 	do_kexec(efi_boot, cmdline_ptr, systable_ptr, start_addr, first_ind_entry);
 
-	unreachable();
+	BUG();
 }
 
 
-- 
2.42.0

