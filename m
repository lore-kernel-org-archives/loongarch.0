Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEE03B19B9
	for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527355; cv=none; b=ODndaVRHAGaQaew+Cyef7K80FO6tKRR7TwNqYnOhMkbUmgJJAneUFetXPdyocwdMNgn6y0BNi6KZaIZ7nhXyjPyOuKEPiZcuIb+rmTXC9cU6XDyVS8aocsjK+kk9ovXUAZ+hjt8TAsu/BsXeYDAHoqPRwqdnEDh5rZ4hkcF7gJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527355; c=relaxed/simple;
	bh=Eyd9PsDsQZA1VugOd5TuIuTY6l6LQJIUz+h83OU3cDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVAMGwPVE1VzUHjdwBebkhjbJfp4V5etmTimaZKpsUF59cefFjqZ3mxEIuO5ettX7NhD59faeNhrwKLu12y0nLTKN/B65kh5MNYydwIfjbYAaj72TJgyXFUCxirkPSCboZpe6xzbOO36U9vZfIsRGnB78YU6JkcfNPGMGBrL4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.112])
	by gateway (Coremail) with SMTP id _____8Cxf9M2BapqY3wMAA--.36433S3;
	Wed, 16 Sep 2026 10:55:51 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.112])
	by front1 (Coremail) with SMTP id qMiowJDxxMwwBapqCkUhAA--.44412S2;
	Wed, 16 Sep 2026 10:55:50 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Call cpu_final_simd() with pure_initcall()
Date: Wed, 16 Sep 2026 10:55:36 +0800
Message-ID: <20260916025536.1535237-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxxMwwBapqCkUhAA--.44412S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruF45urWfGryrCFyxCF4Dtrc_yoWDtFc_W3
	WftFWDGr9ak3yq93Z0qanxW3WUZw48tF9ayr1kXr43CFyfJwnxJwsFkw13A3sIgF48urW5
	u3yUZwn5Cr13GosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8SdgUUUUU=

After commit 35ebc4de105989034f12 ("xor: remove macro abuse for XOR
implementation registrations"), using "simd=128" to limit SIMD on a
platform with 256bit SIMD instructions causes a boot failure.

Because cpu_final_simd() is called with arch_initcall() now, which is
after xor_init(), LASX flavors are selected but not workable.

Call cpu_final_simd() with pure_initcall() which is before xor_init().

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/cpu-probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 74d31f260dfd..629c976c33c3 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -93,7 +93,7 @@ static int __init cpu_final_simd(void)
 	return 0;
 }
 
-arch_initcall(cpu_final_simd);
+pure_initcall(cpu_final_simd);
 
 static inline void set_elf_platform(int cpu, const char *plat)
 {
-- 
2.52.0

